#property copyright "Copyright © 2011"
#property link      "http://www.metaquotes.net"
#property show_inputs

//#include <stdlib.mqh>
#import "stdlib.ex4"
   string ErrorDescription(int a0);
#import

extern int Magic = D'21.04.2010 04:00:03';
extern double Min_Lots = 0.001;
extern double Max_Lots = 1000.0;
extern double Risk = 1.5;
extern int Slippage = 3;
extern bool Smart_Exit = TRUE;
extern bool SupportECN = TRUE;
extern bool SupportNFA = TRUE;
int searchEntryChannels = 1;
extern double Trailing_Pips = 5.0;
extern bool Sound_Alert = FALSE;
double gd_140 = 0.0;
bool hardStopTrailingEnabled = TRUE;
bool useStopOrdersEnabled = TRUE;
int maxOrders = 2;
// Order comment should not contain any special character or identifier like [sl], [tp] or 'partial close'"
string orderComment = "NewSystem_EURUSD_1.1.6";
// "================ Configuration";
bool enableDebug = FALSE;
bool printInfo = FALSE;
bool searchChannel_1 = TRUE;
bool searchChannel_2 = TRUE;
bool searchChannel_3 = TRUE;
bool searchChannel_4 = TRUE;
bool searchChannel_5 = TRUE;
//"---------------- Scalping Factors";
double gd_236 = 15.0;
double gd_244 = 40.0;
double gd_252 = 230.0;
double gd_260 = 350.0;
double gd_268 = 0.4;
double gd_276 = 0.5;
double gd_284 = 0.0;
double gd_292 = 250.0;
double gd_300 = 370.0;
double gd_308 = 0.4;
double gd_316 = 0.5;
double gd_324 = 0.0;
double gd_332 = 280.0;
double gd_340 = 400.0;
double gd_348 = 0.4;
double gd_356 = 0.5;
double gd_364 = 0.0;
double gd_372 = 290.0;
double gd_380 = 410.0;
double gd_388 = 0.4;
double gd_396 = 0.5;
double gd_404 = 0.0;
double gd_412 = 320.0;
double gd_420 = 440.0;
double gd_428 = 0.4;
double gd_436 = 0.5;
double gd_444 = 0.0;
double gd_452 = 20.0;
double minStopLevel = 20.0;
double gd_468 = 40.0;
double gd_476 = 45.0;
double gd_484 = 45.0;
double gd_492 = 75.0;
double gd_500 = 80.0;
double gd_508 = 1.0;
double gd_516;
bool gi_524 = TRUE;
//"---------------- Indicators";
int currentPeriod = PERIOD_M1;
int channel1_p2 = 1;
int gi_544 = 10;
double gd_548 = 2.0;
int channel2_p1 = 1;
int channel2_p2 = 1;
int gi_564 = 30;
double gd_568 = 2.0;
int channel3_p1 = 1;
int channel3_p2 = 5;
int gi_584 = 30;
double gd_588 = 2.0;
int channel4_p1 = 5;
int channel4_p2 = 5;
int gi_604 = 10;
double gd_608 = 2.0;
int channel5_p1 = 5;
int channel5_p2 = 5;
int gi_624 = 30;
double gd_628 = 2.0;
int gi_636 = 1;
int gi_640 = 5;
double gd_644 = 2.0;
string gs_652;
double gda_660[2];
double gda_664[2];
int gia_668[2];
double gd_672 = 1.0;
double gd_680;
bool gi_688;
double gd_692;
bool gi_700 = FALSE;
bool gi_704 = FALSE;
double gd_708 = 1.0;
double gd_716 = 0.0;
int gi_724 = 0;
double gda_728[100];
double gd_732 = 0.0;
int gi_740 = 0;
double gda_744[100];
double gd_748 = 0.0;
int gi_756 = 0;
double gda_760[100];
double gd_764 = 0.0;
int gi_772 = 0;
int gi_776 = 0;
double gda_780[100];
double gd_784;
double gda_792[100];
double gd_796;
double gd_804;
int gi_812 = 0;
double gda_816[100];
double gd_820;
double gd_828;
int gi_836 = 0;
double gda_840[10] = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
double gda_844[5000];
double gda_848[5000];
double gda_852[5000];
double gda_856[5000];
double gda_860[5000];
int gt_864 = 0;
int gi_868 = 0;
double gda_872[200];
int gi_876 = 0;
bool gi_880 = TRUE;
int gi_884 = 0;
double gd_888 = 0.0;
double gd_896 = 0.0;
int gi_904 = 0;
int gi_908 = 0;
int gi_912 = 0/* NO_ERROR */;
//"---------------- Special";
double gd_924 = 60.0;
double gd_932 = 10.0;
double gd_940 = 0.35;
double gd_948 = 0.5;
double gd_956 = 5.0;
double gd_964 = 40.0;
double gd_972 = 20.0;
double gd_980 = 0.25;
double gd_988 = 0.4;
double gd_996 = 3.5;
double gd_1004 = 40.0;
double gd_1012 = 20.0;
double gd_1020 = 0.6;
double gd_1028 = 0.15;
double gd_1036 = 4.5;
double gd_1044 = 50.0;
double gd_1052 = 10.0;
double gd_1060 = 0.7;
double gd_1068 = 0.4;
double gd_1076 = 5.0;
double gd_1084 = 40.0;
double gd_1092 = 20.0;
double gd_1100 = 0.6;
double gd_1108 = 0.2;
double gd_1116 = 5.0;
double gd_1124 = 5.0;
double gd_1132 = 1.0;
bool gi_1140 = TRUE;
bool gi_1144 = TRUE;
bool gi_1148 = TRUE;
int gi_1152 = 80;
string gs_1156 = "12345678901234567890123456789012345678901234567890ABCDEFGHIJKLMNOP";
string gs_1164;
int gia_1172[] = {0};
bool tradingPossible = FALSE;
double gda_1180[10] = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
string gs_1184 = "";
double gd_1192;
double gd_1200;
double gd_1208;
double gd_1216;
double gd_1224;
double gd_1232;
double gd_1240;
double gd_1248;
double gd_1256;
double gd_1264;
double gd_1272;
double gd_1280;
double gd_1288;
double gd_1296;
double gd_1304;
double gd_1312;
double gd_1320;
double gd_1328;
double gd_1336;
double gd_1344;
double gd_1352;
double gd_1360;
double gd_1368;
double gd_1376;
double gd_1384;
double gd_1392;
double gd_1400;
double gd_1408;
int gi_1416;
int gi_1420 = 0;
int gi_1424 = 0;
int gi_1428 = 0;
int gi_1432 = -1;
int gi_1436 = 0;
string debugMessage;
int gi_1448;
int bandsShift;
int hlshift;
int gi_1460;
int gi_1464;
int gi_1468;
int gi_1472;
int gi_1476 = 0;
int gi_1480 = 0;
int gi_1484;
int gi_1488 = 0;
bool initialized;
bool started;
bool gi_1500;
int gi_1504;
bool gi_1508;
bool gi_1512 = FALSE;

int EURUSD_IMPORT(int ai_0, int ai_4, int ai_8, int ai_12, double ad_16, double ad_24, double ad_32, double ad_40, double ad_48, double ad_56, double ad_64, double ad_72, double ad_80, double ad_88, double ad_96, double ad_104, double ad_112, double ad_120, double ad_128, int ai_136, double ad_140, double ad_148, double ad_156, double ad_164, double ad_172, double ad_180, double ad_188, double ad_196, double ad_204, double &ada_212[], double &ada_216[]) {
   int li_220;
   int li_224;
   int li_228;
   int li_232;
   int li_236;
   int li_240;
   int li_244;
   int li_248;
   int li_252;
   int li_256;
   int li_260;
   double ld_268;
   double ld_276;
   double ld_284;
   double ld_292;
   double ld_300;
   double ld_356;
   double ld_364;
   double ld_372;
   double ld_380;
   double ld_388;
   double ld_396;
   double ld_404;
   double ld_412;
   double ld_420;
   double ld_428;
   double ld_436;
   double ld_444;
   double ld_452;
   double ld_460;
   double ld_468;
   double ld_476;
   double ld_484;
   double ld_492;
   int li_508;
   double ld_528;
   int li_544;
   int li_548;
   double ld_552;
   int li_560;
   bool li_264 = TRUE;
   if (li_264 == TRUE) {
      if (ai_136 != -2) li_220 = ai_136;
      else li_220 = -2;
      if (li_220 < 2) li_224 = li_220;
      else li_224 = 2;
      li_228 = li_224;
      li_260 = li_224;
      ld_268 = ada_216[9];
      li_232 = ld_268;
      li_248 = li_232;
      ld_380 = 2;
      ld_388 = ad_180 / ad_188;
      ld_396 = ld_388 - ad_40;
      ld_404 = ad_48 - ad_40;
      ld_412 = ld_396 / ld_404;
      if (ai_12 == 0) {
         ld_420 = ad_32 - ad_24;
         ld_428 = ld_412 * ld_420;
         ld_436 = ad_24 + ld_428;
         switch (li_228 + 2) {
         case 4:
            ld_452 = ld_436 - ad_96 * ld_380;
            break;
         case 3:
            ld_452 = ld_436 - ad_96;
            break;
         case 1:
            ld_452 = ld_436 + ad_80;
            break;
         case 0:
            ld_444 = ad_80 * ld_380;
            ld_452 = ld_436 + ld_444;
            break;
         default:
            ld_452 = ld_436;
         }
         ld_460 = ld_452 * ad_188;
         ld_284 = ld_460;
         li_256 = 0;
         if (ld_460 > 0.0) {
            ld_468 = ad_196 - ad_204 * ad_16;
            ld_476 = ad_140 - ld_460;
            if (ld_476 < ld_468) {
               ld_484 = ad_148 + ld_460;
               if (ld_484 < ad_196 + ad_204 * ad_16) li_256 = 1;
            } else li_256 = -1;
            if (ad_72 != 0.0) ld_292 = ad_188 * ad_72;
            else ld_292 = ad_56 * ld_460;
         } else ld_292 = 0;
         ld_300 = ada_216[7] - ad_148 + ad_204 * ad_16;
         ld_276 = ad_140 - ada_216[8] + ad_204 * ad_16;
         if (ada_216[7] != ada_216[8] || ada_216[7] != 0.0) {
            if (ada_216[7] != 0.0) {
               ld_528 = 0.333333333 * ad_24 * ad_188;
               if (ld_528 < ld_300) {
                  for (int li_536 = 0; li_536 < 80; li_536++)
                     if (ada_212[li_536] == 0.0) break;
                  if (li_536 < 80) {
                     for (int li_540 = li_536; li_540 >= 0; li_540--) ada_212[li_540] = ada_212[li_540 - 1];
                     ada_212[0] = ld_300;
                  } else {
                     for (li_540 = 79; li_540 >= 0; li_540--) ada_212[li_540] = ada_212[li_540 - 1];
                     ada_212[0] = ld_300;
                  }
                  ada_216[0] = ad_24;
                  ada_216[1] = ld_284;
                  ada_216[2] = li_256;
                  ada_216[3] = ld_292;
                  ada_216[4] = ad_156;
                  ada_216[5] = ad_164;
                  ada_216[6] = ad_172;
                  ada_216[7] = ld_300;
                  ada_216[8] = ld_276;
                  return (1);
               }
            }
            if (ada_216[8] != 0.0) {
               ld_492 = 0.333333333 * ad_24 * ad_188;
               if (ld_276 > ld_492) {
                  for (li_536 = 0; li_536 < 80; li_536++)
                     if (ada_212[li_536] == 0.0) break;
                  if (li_536 < 80) {
                     for (li_540 = li_536; li_540 >= 0; li_540--) ada_212[li_540] = ada_212[li_540 - 1];
                     ada_212[0] = -ld_276;
                  } else {
                     for (li_540 = 79; li_540 >= 0; li_540--) ada_212[li_540] = ada_212[li_540 - 1];
                     ada_212[0] = -ld_276;
                  }
               }
               ada_216[0] = ad_24;
               ada_216[1] = ld_284;
               ada_216[2] = li_256;
               ada_216[3] = ld_292;
               ada_216[4] = ad_156;
               ada_216[5] = ad_164;
               ada_216[6] = ad_172;
               ada_216[7] = ld_300;
               ada_216[8] = ld_276;
               return (1);
            }
         }
         ada_216[0] = ad_24;
         ada_216[1] = ld_284;
         ada_216[2] = li_256;
         ada_216[3] = ld_292;
         ada_216[4] = ad_156;
         ada_216[5] = ad_164;
         ada_216[6] = ad_172;
         ada_216[7] = ld_300;
         ada_216[8] = ld_276;
         return (1);
      }
      if (li_228 != 2 || li_228 == 1 || li_228 == 2) {
         if (li_228 == 1) li_232 = (ad_56 * ld_380 + li_228) * ada_216[9] / 3.0;
         if (li_228 == 2) li_232 = ad_56 * ada_216[9];
         li_236 = 0;
         li_252 = 0;
         li_544 = 0;
         li_548 = 0;
         if (li_232 >= 4) {
            li_240 = (li_232 - 4) >> 2 + 1;
            li_548 = li_240 * 4;
            ld_356 = 0;
            while (li_240 > 0) {
               if (ada_212[li_544] != 0.0) {
                  li_236++;
                  ld_356 += MathAbs(ada_212[li_544]);
               }
               if (ada_212[li_544 + 1] != 0.0) {
                  li_236++;
                  ld_356 += MathAbs(ada_212[li_544 + 1]);
               }
               if (ada_212[li_544 + 2] != 0.0) {
                  li_236++;
                  ld_356 += MathAbs(ada_212[li_544 + 2]);
               }
               if (ada_212[li_544 + 3] != 0.0) {
                  li_236++;
                  ld_356 += MathAbs(ada_212[li_544 + 3]);
               }
               li_544 += 4;
               li_240--;
            }
            li_252 = li_236;
         }
         ld_364 = 0;
         if (li_548 >= li_232) li_544 = 0;
         else {
            ld_364 = 0;
            while (li_548 < li_232) {
               li_544 = 0;
               if (ada_212[li_548] != 0.0) {
                  li_236++;
                  ld_364 += MathAbs(ada_212[li_548]);
               }
               li_548++;
            }
            li_252 = li_236;
         }
         if (li_236 != 0) {
            li_508 = 0;
            if (ld_268 > 0.0) ld_284 = ld_356 / ld_268;
            ld_552 = 0;
            ld_372 = 0;
            if (li_232 >= 4) {
               li_560 = 0;
               li_244 = (li_232 - 4) >> 2 + 1;
               for (li_508 = li_244 * 4; li_244 > 0; li_244--) {
                  if (ada_212[li_560] != ld_364) ld_372 = ld_372 + (MathAbs(ada_212[li_560]) - ld_356 / 80.0) * (MathAbs(ada_212[li_560]) - ld_356 / 80.0) + ld_364;
                  if (ada_212[li_560 + 1] != ld_364) ld_372 += (MathAbs(ada_212[li_560 + 1]) - ld_356 / 80.0) * (MathAbs(ada_212[li_560 + 1]) - ld_356 / 80.0);
                  if (ada_212[li_560 + 2] != ld_364) ld_372 += (MathAbs(ada_212[li_560 + 2]) - ld_356 / 80.0) * (MathAbs(ada_212[li_560 + 2]) - ld_356 / 80.0);
                  if (ada_212[li_560 + 3] != ld_364) ld_372 += (MathAbs(ada_212[li_560 + 3]) - ld_356 / 80.0) * (MathAbs(ada_212[li_560 + 3]) - ld_356 / 80.0);
                  li_560 += 4;
               }
            }
            ld_268 = ld_412 / 2.0 + ad_120;
            if (li_260 == -2) ld_268 += ad_104 * ld_380;
            else
               if (li_260 == -1) ld_268 = ld_372 + ad_104;
            ld_268 *= MathSqrt(ld_372 / ada_216[9]);
            ld_492 = (ld_268 + ld_284) / ad_188;
            if (ad_32 > ld_492) ld_452 = ld_492;
            else ld_452 = ad_32;
         } else ld_452 = 0;
         ld_460 = ld_452 * ad_188;
         ld_284 = ld_460;
         li_256 = 0;
         if (ld_460 > 0.0) {
            ld_468 = ad_196 - ad_204 * ad_16;
            ld_476 = ad_140 - ld_460;
            if (ld_476 < ld_468) {
               ld_484 = ad_148 + ld_460;
               if (ld_484 < ad_196 + ad_204 * ad_16) li_256 = 1;
            } else li_256 = -1;
            if (ad_72 != 0.0) ld_292 = ad_188 * ad_72;
            else ld_292 = ad_56 * ld_460;
         } else ld_292 = 0;
         ld_300 = ada_216[7] - ad_148 + ad_204 * ad_16;
         ld_276 = ad_140 - ada_216[8] + ad_204 * ad_16;
         if (ada_216[7] != ada_216[8] || ada_216[7] != 0.0) {
            if (ada_216[7] != 0.0) {
               ld_528 = 0.333333333 * ad_24 * ad_188;
               if (ld_528 < ld_300) {
                  for (li_536 = 0; li_536 < 80; li_536++)
                     if (ada_212[li_536] == 0.0) break;
                  if (li_536 < 80) {
                     for (li_540 = li_536; li_540 >= 0; li_540--) ada_212[li_540] = ada_212[li_540 - 1];
                     ada_212[0] = ld_300;
                  } else {
                     for (li_540 = 79; li_540 >= 0; li_540--) ada_212[li_540] = ada_212[li_540 - 1];
                     ada_212[0] = ld_300;
                  }
                  ada_216[0] = ad_24;
                  ada_216[1] = ld_284;
                  ada_216[2] = li_256;
                  ada_216[3] = ld_292;
                  ada_216[4] = ad_156;
                  ada_216[5] = ad_164;
                  ada_216[6] = ad_172;
                  ada_216[7] = ld_300;
                  ada_216[8] = ld_276;
                  return (1);
               }
            }
            if (ada_216[8] != 0.0) {
               ld_492 = 0.333333333 * ad_24 * ad_188;
               if (ld_276 > ld_492) {
                  for (li_536 = 0; li_536 < 80; li_536++)
                     if (ada_212[li_536] == 0.0) break;
                  if (li_536 < 80) {
                     for (li_540 = li_536; li_540 >= 0; li_540--) ada_212[li_540] = ada_212[li_540 - 1];
                     ada_212[0] = -ld_276;
                  } else {
                     for (li_540 = 79; li_540 >= 0; li_540--) ada_212[li_540] = ada_212[li_540 - 1];
                     ada_212[0] = -ld_276;
                  }
               }
               ada_216[0] = ad_24;
               ada_216[1] = ld_284;
               ada_216[2] = li_256;
               ada_216[3] = ld_292;
               ada_216[4] = ad_156;
               ada_216[5] = ad_164;
               ada_216[6] = ad_172;
               ada_216[7] = ld_300;
               ada_216[8] = ld_276;
               return (1);
            }
         }
         ada_216[0] = ad_24;
         ada_216[1] = ld_284;
         ada_216[2] = li_256;
         ada_216[3] = ld_292;
         ada_216[4] = ad_156;
         ada_216[5] = ad_164;
         ada_216[6] = ad_172;
         ada_216[7] = ld_300;
         ada_216[8] = ld_276;
         return (1);
      }
   }
   ada_216[0] = 0;
   ada_216[1] = 0;
   ada_216[2] = 0;
   ada_216[3] = 0;
   ada_216[4] = 0;
   ada_216[5] = 0;
   ada_216[6] = 0;
   return (0);
}

void f0_0(double &ada_0[]) {
   double ld_4 = ada_0[0];
   double ld_12 = ada_0[1];
   if (Year() == 2009) {
      if (Month() <= 5) {
         ld_4 = 2.5 * ld_4;
         ld_12 /= 2.5;
      } else {
         if (Month() == 6 || Month() == 7) {
            ld_4 = 3.5 * ld_4;
            ld_12 /= 3.5;
         } else {
            ld_4 = 1.5 * ld_4;
            ld_12 /= 1.5;
         }
      }
   }
   if (Year() == 2010) {
      if (Month() == 5) {
         ld_4 = 4.0 * ld_4;
         ld_12 /= 4.0;
      } else {
         ld_4 = 1.5 * ld_4;
         ld_12 /= 1.5;
      }
   }
   ada_0[0] = ld_4;
   ada_0[1] = ld_12;
}

int init() {
   initialized = FALSE;
   started = FALSE;
   gi_1500 = FALSE;
   gi_704 = FALSE;
   ArrayInitialize(gda_872, 0);
   ArrayInitialize(gda_844, 0);
   ArrayInitialize(gda_848, 0);
   ArrayInitialize(gda_852, 0);
   ArrayInitialize(gda_856, 0);
   ArrayInitialize(gda_860, 0);
   if (Digits < 5) Slippage = 0;
   else gi_724 = -1;
   gi_876 = 0;
   // searchEntryChannels = MathMax(searchEntryChannels, 0);
   // searchEntryChannels = MathMin(searchEntryChannels, 8);
   switch (searchEntryChannels) {
   //   case 0:
   //      gi_1484 = 1;
   //      gd_516 = 0;
   //      break;
   // Always it comes to this.
   case 1:
      gi_1484 = 2;
      gd_516 = 20;
      break;
   //   case 2:
   //      gi_1484 = 2;
   //      gd_516 = 7;
   //      break;
   //   case 3:
   //      gi_1484 = 3;
   //      gd_516 = 5;
   //      break;
   //   case 4:
   //      gi_1484 = 4;
   //      gd_516 = 4;
   //      break;
   //   case 5:
   //      gi_1484 = 5;
   //      gd_516 = 3;
   //      break;
   //   case 6:
   //      gi_1484 = 6;
   //      gd_516 = 2;
   //      break;
   //   case 7:
   //   case 8:
   //      gi_1484 = 7;
   //      gd_516 = 1;
   }
   if (!IsTesting()) reInitGlobalVariables();
   checkOrdersForClose();
   if (Period() != PERIOD_M1 && Period() != PERIOD_M5) {
      Print("ERROR --  " + "NewSystem_EURUSD_1.1.6" + " should be attached to The 1/5 Minute Chart Window");
      Comment("ERROR --  " + "NewSystem_EURUSD_1.1.6" + " should be attached to The 1/5 Minute Chart Window");
   } else {
      if (useStopOrdersEnabled && (!SupportECN) && MarketInfo(Symbol(), MODE_STOPLEVEL) * Point > 0.00001 * minStopLevel) {
         Print("ERROR --  " + "NewSystem_EURUSD_1.1.6" + " - Use_Stop_Orders is not valid, stop level (" + getDoubleString(MarketInfo(Symbol(), MODE_STOPLEVEL) * Point) + ") should not be greater than " +
            getDoubleString(0.00001 * minStopLevel));
         Comment("ERROR --  " + "NewSystem_EURUSD_1.1.6" + " - Use_Stop_Orders is not valid, stop level (" + getDoubleString(MarketInfo(Symbol(), MODE_STOPLEVEL) * Point) + ") should not be greater than " +
            getDoubleString(0.00001 * minStopLevel));
      } else {
         if (maxOrders <= 1 && SupportNFA) {
            Print("ERROR --  " + "NewSystem_EURUSD_1.1.6" + " - SupportNFA is not valid unless setting Max_Simultaneous_Orders >= 2");
            Comment("ERROR --  " + "NewSystem_EURUSD_1.1.6" + " - SupportNFA is not valid unless setting Max_Simultaneous_Orders >= 2");
         } else {
            if (hardStopTrailingEnabled && (!SupportECN) && SupportNFA) {
               Print("ERROR --  " + "NewSystem_EURUSD_1.1.6" + " - Hard_Stop_Trailing is not valid in conjunction with SupportNFA");
               Comment("ERROR --  " + "NewSystem_EURUSD_1.1.6" + " - Hard_Stop_Trailing is not valid in conjunction with SupportNFA");
            } else {
               if (Risk < 0.001 || Risk > 1000.0) {
                  Comment("ERROR -- Invalid Risk Value.");
                  Print("ERROR -- Invalid Risk Value.");
               } else {
                  tradingPossible == TRUE;
               }
            }
         }
      }
   }
   if (Period() == PERIOD_M1) {
      currentPeriod = 1;
   }
   if (Period() == PERIOD_M5) {
      currentPeriod = 5;
   }
   initialized = TRUE;
   return (0);
}

int start() {
   if (!tradingPossible) {
     return(0);
   }

   if (AccountBalance() <= 0.0) {
      Comment("ERROR -- Account Balance is " + DoubleToStr(MathRound(AccountBalance()), 0));
      Print("ERROR -- Account Balance is " + DoubleToStr(MathRound(AccountBalance()), 0));
      return(0);
   }

   if (searchChannel_1 || searchChannel_2 || searchChannel_3 || searchChannel_4 || searchChannel_5) {
      if (initialized && (!started)) {
         if (IsTesting()) Print("Starting test...");
         started = TRUE;
         f0_1(-1);
      }
      f0_25(gda_660, gda_664, gia_668, gd_672);
      debugMessage = "";
      f0_3();
      if (SupportNFA) {
         if (searchChannel_1) {
            if (enableDebug) debugMessage = debugMessage + " CHANNEL 1:\n";
            f0_4(currentPeriod, channel1_p2, 0, 1, 2, searchEntryChannels >= 8, gd_252, gd_260, gd_268, gd_276, gd_284, gd_924, gd_940, gd_932, gd_948, gd_956, gd_468, gi_544, gd_548, gda_844);
         }
         if (searchChannel_2) {
            if (enableDebug) debugMessage = debugMessage + " CHANNEL 2:\n";
            f0_4(channel2_p1, channel2_p2, 3, 4, 5, searchEntryChannels >= 8, gd_292, gd_300, gd_308, gd_316, gd_324, gd_964, gd_980, gd_972, gd_988, gd_996, gd_476, gi_564, gd_568, gda_848);
         }
         if (searchChannel_3) {
            if (enableDebug) debugMessage = debugMessage + " CHANNEL 3:\n";
            f0_4(channel3_p1, channel3_p2, 6, 7, 8, searchEntryChannels >= 8, gd_332, gd_340, gd_348, gd_356, gd_364, gd_1004, gd_1020, gd_1012, gd_1028, gd_1036, gd_484, gi_584, gd_588, gda_852);
         }
         if (searchChannel_4) {
            if (enableDebug) debugMessage = debugMessage + " CHANNEL 4:\n";
            f0_4(channel4_p1, channel4_p2, 9, 10, 11, searchEntryChannels >= 8, gd_372, gd_380, gd_388, gd_396, gd_404, gd_1044, gd_1060, gd_1052, gd_1068, gd_1076, gd_492, gi_604, gd_608, gda_856);
         }
         if (searchChannel_5) {
            if (enableDebug) debugMessage = debugMessage + " CHANNEL 5:\n";
            f0_4(channel5_p1, channel5_p2, 12, 13, 14, searchEntryChannels >= 8, gd_412, gd_420, gd_428, gd_436, gd_444, gd_1084, gd_1100, gd_1092, gd_1108, gd_1116, gd_500, gi_624, gd_628, gda_860);
         }
      } else {
         if (searchChannel_5) {
            if (enableDebug) debugMessage = debugMessage + " CHANNEL 5:\n";
            f0_4(channel5_p1, channel5_p2, 12, 13, 14, searchEntryChannels >= 8, gd_412, gd_420, gd_428, gd_436, gd_444, gd_1084, gd_1100, gd_1092, gd_1108, gd_1116, gd_500, gi_624, gd_628, gda_860);
         }
         if (searchChannel_4) {
            if (enableDebug) debugMessage = debugMessage + " CHANNEL 4:\n";
            f0_4(channel4_p1, channel4_p2, 9, 10, 11, searchEntryChannels >= 8, gd_372, gd_380, gd_388, gd_396, gd_404, gd_1044, gd_1060, gd_1052, gd_1068, gd_1076, gd_492, gi_604, gd_608, gda_856);
         }
         if (searchChannel_2) {
            if (enableDebug) debugMessage = debugMessage + " CHANNEL 2:\n";
            f0_4(channel2_p1, channel2_p2, 3, 4, 5, searchEntryChannels >= 8, gd_292, gd_300, gd_308, gd_316, gd_324, gd_964, gd_980, gd_972, gd_988, gd_996, gd_476, gi_564, gd_568, gda_848);
         }
         if (searchChannel_1) {
            if (enableDebug) debugMessage = debugMessage + " CHANNEL 1:\n";
            f0_4(currentPeriod, channel1_p2, 0, 1, 2, searchEntryChannels >= 8, gd_252, gd_260, gd_268, gd_276, gd_284, gd_924, gd_940, gd_932, gd_948, gd_956, gd_468, gi_544, gd_548, gda_844);
         }
         if (searchChannel_3) {
            if (enableDebug) debugMessage = debugMessage + " CHANNEL 3:\n";
            f0_4(channel3_p1, channel3_p2, 6, 7, 8, searchEntryChannels >= 8, gd_332, gd_340, gd_348, gd_356, gd_364, gd_1004, gd_1020, gd_1012, gd_1028, gd_1036, gd_484, gi_584, gd_588, gda_852);
         }
      }
      Comment("Searching for An Entry...");
   } else Comment("");
   return (0);
}

void f0_1(int ai_0) {
   int li_4;
   int li_8;
   string ls_12;
   if (searchChannel_1) {
      bandsShift = 1;
      hlshift = 1;
      gi_1460 = 0;
      gi_1464 = 0;
      if (Period() == PERIOD_M1) {
         currentPeriod = 1;
         channel1_p2 = 1;
      }
      if (Period() == PERIOD_M5) {
         currentPeriod = 5;
         channel1_p2 = 5;
      }
      for (int li_20 = 0; li_20 < ai_0 || gda_844[gi_1152 - 1] == 0.0; li_20++) {
         li_8 = f0_2(currentPeriod, channel1_p2, gd_252, gd_260, gd_268, gd_276, gd_284, gd_924, gd_940, gd_932, gd_948, gd_956, gd_468, gi_544, gd_548, gda_844);
         if (!(li_8)) break;
      }
      if (ai_0 == -1) {
         li_4 = getNonZeroValueBackwards(gda_844, gi_1152);
         swapFirstHalfElements(gda_844, li_4 + 1);
      }
   }
   if (searchChannel_2) {
      bandsShift = 1;
      hlshift = 1;
      gi_1460 = 0;
      gi_1464 = 0;
      if (Period() == PERIOD_M1) {
         channel2_p1 = 1;
         channel2_p2 = 1;
      }
      if (Period() == PERIOD_M5) {
         channel2_p1 = 5;
         channel2_p2 = 5;
      }
      for (li_20 = 0; li_20 < ai_0 || gda_848[gi_1152 - 1] == 0.0; li_20++) {
         li_8 = f0_2(channel2_p1, channel2_p2, gd_292, gd_300, gd_308, gd_316, gd_324, gd_964, gd_980, gd_972, gd_988, gd_996, gd_476, gi_564, gd_568, gda_848);
         if (!(li_8)) break;
      }
      if (ai_0 == -1) {
         li_4 = getNonZeroValueBackwards(gda_848, gi_1152);
         swapFirstHalfElements(gda_848, li_4 + 1);
      }
   }
   if (searchChannel_3) {
      if (Period() == PERIOD_M1) {
         channel3_p1 = 1;
         channel3_p2 = 5;
         bandsShift = Minute() % 5 + 1;
      }
      if (Period() == PERIOD_M5) {
         channel3_p1 = 5;
         channel3_p2 = 15;
         bandsShift = Minute() % 15 + 1;
      }
      hlshift = 1;
      gi_1460 = 0;
      gi_1464 = 0;
      for (li_20 = 0; li_20 < ai_0 || gda_852[gi_1152 - 1] == 0.0; li_20++) {
         li_8 = f0_2(channel3_p1, channel3_p2, gd_332, gd_340, gd_348, gd_356, gd_364, gd_1004, gd_1020, gd_1012, gd_1028, gd_1036, gd_484, gi_584, gd_588, gda_852);
         if (!(li_8)) break;
      }
      if (ai_0 == -1) {
         li_4 = getNonZeroValueBackwards(gda_852, gi_1152);
         swapFirstHalfElements(gda_852, li_4 + 1);
      }
   }
   if (searchChannel_4) {
      bandsShift = 1;
      hlshift = 1;
      gi_1460 = 0;
      gi_1464 = 0;
      if (Period() == PERIOD_M1) {
         channel4_p1 = 5;
         channel4_p2 = 5;
      }
      if (Period() == PERIOD_M5) {
         channel4_p1 = 15;
         channel4_p2 = 15;
      }
      for (li_20 = 0; li_20 < ai_0 || gda_856[gi_1152 - 1] == 0.0; li_20++) {
         li_8 = f0_2(channel4_p1, channel4_p2, gd_372, gd_380, gd_388, gd_396, gd_404, gd_1044, gd_1060, gd_1052, gd_1068, gd_1076, gd_492, gi_604, gd_608, gda_856);
         if (!(li_8)) break;
      }
      if (ai_0 == -1) {
         li_4 = getNonZeroValueBackwards(gda_856, gi_1152);
         swapFirstHalfElements(gda_856, li_4 + 1);
      }
   }
   if (searchChannel_5) {
      bandsShift = 1;
      hlshift = 1;
      gi_1460 = 0;
      gi_1464 = 0;
      if (Period() == PERIOD_M1) {
         channel5_p1 = 5;
         channel5_p2 = 5;
      }
      if (Period() == PERIOD_M5) {
         channel5_p1 = 15;
         channel5_p2 = 15;
      }
      for (li_20 = 0; li_20 < ai_0 || gda_860[gi_1152 - 1] == 0.0; li_20++) {
         li_8 = f0_2(channel5_p1, channel5_p2, gd_412, gd_420, gd_428, gd_436, gd_444, gd_1084, gd_1100, gd_1092, gd_1108, gd_1116, gd_500, gi_624, gd_628, gda_860);
         if (!(li_8)) break;
      }
      if (ai_0 == -1) {
         li_4 = getNonZeroValueBackwards(gda_860, gi_1152);
         swapFirstHalfElements(gda_860, li_4 + 1);
      }
   }
}

int f0_2(int period, int hlperiod, double ad_8, double ad_16, double ad_24, double ad_32, double ad_40, double ad_48, double ad_56, double ad_64, double ad_72, double ad_80, double ad_88, int ai_96, double ad_100, double ada_108[5000]) {
   if (hlperiod % period != 0 && period % hlperiod != 0) {
      Print("ERROR hlperiod%period!=0 && period%hlperiod!=0   hlperiod:" + hlperiod + "  period:" + period);
      return (0);
   }
   double ld_112 = gd_508;
   double ld_120 = 0.00001 * ad_88;
   double ld_128 = 0.00001 * gd_452;
   double ld_136 = 0.00001 * Trailing_Pips;
   double hl_high = iHigh(Symbol(), hlperiod, hlshift);
   double hl_low = iLow(Symbol(), hlperiod, hlshift);
   double hl_diff = hl_high - hl_low;
   double upperBand = iBands(Symbol(), period, ai_96, ad_100, 0, PRICE_OPEN, MODE_UPPER, bandsShift);
   double lowerBand = iBands(Symbol(), period, ai_96, ad_100, 0, PRICE_OPEN, MODE_LOWER, bandsShift);
   if (upperBand == 0.0) {
      Print("offset overflow:" + bandsShift + " period:" + period);
      gi_1468++;
      if (gi_1468 > 5) return (0);
   } else gi_1468 = 0;
   if (hl_high == 0.0) {
      Print("hloffset overflow:" + hlshift + " hlperiod:" + hlperiod);
      gi_1472++;
      if (gi_1472 > 5) return (0);
   } else gi_1472 = 0;
   gda_1180[7] = hl_high;
   gda_1180[8] = 0;
   gda_1180[9] = gi_1152;
   EURUSD_IMPORT(period, hlperiod, 0, 0, ad_24, ad_8, ad_16, gd_236, gd_244, ad_32, gd_508, ad_40, ad_48, ad_56, ad_64, ad_72, gd_1124, ad_80, gd_1132, - 2, lowerBand,
      upperBand, ld_112, ld_128, ld_136, 0.00015, 0.00001, hl_high, hl_diff, ada_108, gda_1180);
   gda_1180[7] = 0;
   gda_1180[8] = hl_low;
   gda_1180[9] = gi_1152;
   EURUSD_IMPORT(period, hlperiod, 0, 0, ad_24, ad_8, ad_16, gd_236, gd_244, ad_32, gd_508, ad_40, ad_48, ad_56, ad_64, ad_72, gd_1124, ad_80, gd_1132, - 2, lowerBand,
      upperBand, ld_112, ld_128, ld_136, 0.00015, 0.00001, hl_low, hl_diff, ada_108, gda_1180);
   if (period < hlperiod) {
      gi_1452++;
      gi_1460++;
      if (gi_1460 % (hlperiod / period) == FALSE) {
         gi_1456++;
         gi_1464++;
      }
   } else {
      if (period > hlperiod) {
         gi_1456++;
         gi_1464++;
         if (gi_1464 % (period / hlperiod) == FALSE) {
            gi_1452++;
            gi_1460++;
         }
      } else {
         gi_1452++;
         gi_1460++;
         gi_1456++;
         gi_1464++;
      }
   }
   return (1);
}

void f0_3() {
   int li_0;
   string ls_4;
   int li_12;
   string ls_16;
   int li_24;
   int li_28;
   bool li_32;
   string ls_36;
   double ld_44;
   string ls_52;
   double ld_60;
   double ld_68;
   double ld_76;
   int li_84;
   int lia_88[];
   int li_92;
   int li_96;
   int li_100;
   int lia_104[];
   string ls_108;
   if (GlobalVariableGet(getGlobalPrefix() + "Reset") != 0.0) {
      reset();
      reInitGlobalVariables();
   }
   if (!IsTesting()) checkOrdersForClose();
   if (gt_864 < Time[0]) {
      gt_864 = Time[0];
      gi_868 = 0;
      if (gi_1500) f0_1(1);
      else gi_1500 = TRUE;
      if (!IsTesting()) setGlobalVars();
   } else gi_868++;
   if (printInfo) f0_17();
   string ls_116 = "";
   if (AccountFreeMargin() != AccountBalance() && AccountBalance() != 0.0) {
      li_12 = AccountStopoutLevel();
      ls_16 = "Leverage:" + AccountLeverage();
      if (AccountStopoutMode() == 0) ls_16 = ls_16 + "  StopOut level:" + li_12 + "%";
      else ls_16 = ls_16 + "  StopOut level:" + li_12 + AccountCurrency();
      ls_116 = ls_16 + "   free margin:" + getDoubleString(AccountFreeMargin() * AccountLeverage(), 2) + " balance:" + getDoubleString(AccountBalance(), 2) + " margin%:" + getDoubleString(100.0 * (AccountFreeMargin() * AccountLeverage()) / AccountBalance(),
         2) + "%";
      ls_116 = ls_116 
      + "\n";
   }
   gs_1184 = "";
   gi_1504 = gi_1508;
   gi_1508 = FALSE;
   gi_912 = FALSE;
   gd_1352 = MarketInfo(Symbol(), MODE_STOPLEVEL) * Point;
   gd_1360 = Ask - Bid;
   if (MarketInfo(Symbol(), MODE_LOTSTEP) == 0.0) gi_1416 = 5;
   else gi_1416 = f0_44(0.1, MarketInfo(Symbol(), MODE_LOTSTEP));
   if (Period() == PERIOD_M1) {
      gd_1216 = iHigh(Symbol(), PERIOD_M5, 0);
      gd_1224 = iLow(Symbol(), PERIOD_M5, 0);
      gd_1232 = gd_1216 - gd_1224;
      gd_1192 = iHigh(Symbol(), PERIOD_M1, 0);
      gd_1200 = iLow(Symbol(), PERIOD_M1, 0);
      gd_1208 = gd_1192 - gd_1200;
   }
   if (Period() == PERIOD_M5) {
      gd_1216 = iHigh(Symbol(), PERIOD_M15, 0);
      gd_1224 = iLow(Symbol(), PERIOD_M15, 0);
      gd_1232 = gd_1216 - gd_1224;
      gd_1192 = iHigh(Symbol(), PERIOD_M5, 0);
      gd_1200 = iLow(Symbol(), PERIOD_M5, 0);
      gd_1208 = gd_1192 - gd_1200;
   }
   if (gi_868 == 0) {
      gd_1240 = iBands(Symbol(), currentPeriod, gi_544, gd_548, 0, PRICE_OPEN, MODE_UPPER, 0);
      gd_1248 = iBands(Symbol(), currentPeriod, gi_544, gd_548, 0, PRICE_OPEN, MODE_LOWER, 0);
      gd_1256 = iBands(Symbol(), currentPeriod, gi_564, gd_568, 0, PRICE_OPEN, MODE_UPPER, 0);
      gd_1264 = iBands(Symbol(), currentPeriod, gi_564, gd_568, 0, PRICE_OPEN, MODE_LOWER, 0);
      gd_1272 = iBands(Symbol(), currentPeriod, gi_584, gd_588, 0, PRICE_OPEN, MODE_UPPER, 0);
      gd_1280 = iBands(Symbol(), currentPeriod, gi_584, gd_588, 0, PRICE_OPEN, MODE_LOWER, 0);
      gd_1288 = iBands(Symbol(), currentPeriod, gi_604, gd_608, 0, PRICE_OPEN, MODE_UPPER, 0);
      gd_1296 = iBands(Symbol(), currentPeriod, gi_604, gd_608, 0, PRICE_OPEN, MODE_LOWER, 0);
      gd_1304 = iBands(Symbol(), currentPeriod, gi_624, gd_628, 0, PRICE_OPEN, MODE_UPPER, 0);
      gd_1312 = iBands(Symbol(), currentPeriod, gi_624, gd_628, 0, PRICE_OPEN, MODE_LOWER, 0);
      gd_1320 = iBands(Symbol(), currentPeriod, gi_640, gd_644, 0, PRICE_OPEN, MODE_UPPER, 0);
      gd_1328 = iBands(Symbol(), currentPeriod, gi_640, gd_644, 0, PRICE_OPEN, MODE_LOWER, 0);
      gd_1336 = gd_1320 - gd_1328;
      gd_1344 = gd_1328 + gd_1336 / 2.0;
   }
   if (!gi_700) {
      for (int li_124 = OrdersTotal() - 1; li_124 >= 0 && !gi_700; li_124--) {
         OrderSelect(li_124, SELECT_BY_POS, MODE_TRADES);
         f0_19();
      }
   }
   if (!gi_700) {
      for (li_124 = OrdersHistoryTotal() - 1; li_124 >= 0 && !gi_700; li_124--) {
         OrderSelect(li_124, SELECT_BY_POS, MODE_HISTORY);
         f0_19();
      }
   }
   if (!gi_704) {
      for (li_124 = OrdersTotal() - 1; li_124 >= 0 && gi_836 < 100; li_124--) {
         OrderSelect(li_124, SELECT_BY_POS, MODE_TRADES);
         if (OrderSymbol() == Symbol() && StringFind(OrderComment(), "NewSystem") >= 0 || OrderComment() == orderComment || OrderMagicNumber() == Magic) f0_20();
      }
      for (li_124 = OrdersHistoryTotal() - 1; li_124 >= 0 && gi_836 < 100; li_124--) {
         OrderSelect(li_124, SELECT_BY_POS, MODE_HISTORY);
         if (OrderSymbol() == Symbol() && StringFind(OrderComment(), "NewSystem") >= 0 || OrderComment() == orderComment || OrderMagicNumber() == Magic) f0_20();
      }
      for (li_124 = OrdersTotal() - 1; li_124 >= 0 && gi_836 < 100; li_124--) {
         OrderSelect(li_124, SELECT_BY_POS, MODE_TRADES);
         if (OrderSymbol() == Symbol()) f0_20();
      }
      for (li_124 = OrdersHistoryTotal() - 1; li_124 >= 0 && gi_836 < 100; li_124--) {
         OrderSelect(li_124, SELECT_BY_POS, MODE_HISTORY);
         if (OrderSymbol() == Symbol()) f0_20();
      }
      gi_704 = TRUE;
   }
   if (gi_724 >= 0 || gi_724 == -2) {
      li_24 = NormalizeDouble(Bid / 0.00001, 0);
      li_28 = NormalizeDouble(Ask / 0.00001, 0);
      if (li_24 % 10 != 0 || li_28 % 10 != 0) gi_724 = -1;
      else {
         if (gi_724 >= 0 && gi_724 < 10) gi_724++;
         else gi_724 = -2;
      }
   }
   double ld_128 = gda_872[0];
   ArrayCopy(gda_872, gda_872, 0, 1, 199);
   gda_872[199] = gd_1360;
   if (gi_876 < 200) gi_876++;
   double ld_136 = 0;
   double ld_144 = 0;
   int li_152 = MathMin(gi_876, 5);
   li_124 = 199;
   for (int li_156 = 0; li_156 < gi_876; li_156++) {
      ld_136 += gda_872[li_124];
      li_124--;
   }
   li_124 = 199;
   for (li_156 = 0; li_156 < li_152; li_156++) {
      ld_144 += gda_872[li_124];
      li_124--;
   }
   gd_1368 = ld_136 / gi_876;
   gd_1376 = ld_144 / li_152;
   gd_796 = 0;
   gd_804 = 0;
   gd_820 = 0;
   gd_828 = 0;
   gd_732 = 0;
   gd_748 = 0;
   gd_764 = 0;
   gd_784 = 0;
   for (li_124 = 0; li_124 < 100; li_124++) {
      gd_796 += gda_792[li_124];
      gd_804 += MathAbs(gda_792[li_124]);
      gd_820 += gda_816[li_124];
      gd_828 += MathAbs(gda_816[li_124]);
      gd_732 += gda_728[li_124];
      gd_748 += gda_744[li_124];
      gd_764 += gda_760[li_124];
      gd_784 += gda_780[li_124];
   }
   if (!gi_700 && gd_1368 < 0.00015) gd_716 = 0.00015 - gd_1368;
   gd_1384 = normalizeDouble(Ask + gd_716);
   gd_1392 = normalizeDouble(Bid - gd_716);
   gd_1400 = gd_1368 + gd_716;
   gd_1408 = gd_1376 + gd_716;
   string ls_160 = "";
   string ls_168 = "";
   string ls_176 = "";
   string ls_184 = "";
   string ls_192 = "";
   int li_200 = 0;
   if (!IsTesting()) {
      if (gi_812 > 0 || gd_1352 > 0.00001 * minStopLevel) {
         li_32 = FALSE;
         if (gi_812 > 0) {
            if (gd_796 / gi_812 <= 10.0 && gd_1352 <= 0.00001 * minStopLevel) {
               ls_160 = ls_160 + " ECN Entry Conditions met";
               if (SupportECN) {
                  useStopOrdersEnabled = 1;
                  ls_160 = ls_160 + " (Use_Stop_Orders adjusted)";
               } else
                  if (!useStopOrdersEnabled) ls_160 = ls_160 + ", Use_Stop_Orders is recommended";
               ls_160 = ls_160 + " :  Open Slip <= 10    stop level (" + getDoubleString(gd_1352) + ") <= " + getDoubleString(0.00001 * minStopLevel);
               ls_160 = ls_160 
               + "\n";
            } else li_32 = TRUE;
         } else li_32 = TRUE;
         if (li_32) {
            li_200 = 1;
            ls_160 = ls_160 + "!ECN Entry Conditions failed";
            if (SupportECN && gd_1352 > 0.00001 * minStopLevel || gi_812 >= 15) {
               useStopOrdersEnabled = 0;
               ls_160 = ls_160 + " (Use_Stop_Orders adjusted)";
            } else {
               if (useStopOrdersEnabled) {
                  ls_160 = ls_160 + ", Use_Stop_Orders is NOT recommended";
                  if (SupportECN) ls_160 = ls_160 + " (auto-adjusted in " + ((15 - gi_812)) + ")";
               }
            }
            ls_160 = ls_160 + " : ";
            if (gi_812 > 0) {
               if (gd_796 / gi_812 > 10.0) {
                  ls_160 = ls_160 + " Open Slip > 10";
                  ls_160 = ls_160 + "    ";
               }
            }
            if (gd_1352 > 0.00001 * minStopLevel) ls_160 = ls_160 + "stop level (" + getDoubleString(gd_1352) + ") > " + getDoubleString(0.00001 * minStopLevel);
            ls_160 = ls_160 
            + "\n";
         }
      }
      if (gi_836 > 0 || SupportNFA) {
         li_32 = FALSE;
         if (gi_836 > 0) {
            if (gd_820 / gi_836 <= 10.0 && (!SupportNFA)) {
               ls_168 = ls_168 + " ECN Exit Conditions met";
               if (SupportECN) {
                  hardStopTrailingEnabled = 1;
                  ls_168 = ls_168 + " (Hard_Stop_Trailing adjusted)";
               } else
                  if (!hardStopTrailingEnabled) ls_168 = ls_168 + ", Hard_Stop_Trailing is recommended";
               ls_168 = ls_168 + " : Close Slip <= 10    SupportNFA = false";
               ls_168 = ls_168 
               + "\n";
            } else li_32 = TRUE;
         } else li_32 = TRUE;
         if (li_32) {
            li_200 = 1;
            ls_168 = ls_168 + "!ECN Exit Conditions failed";
            if (SupportECN && SupportNFA || gi_836 >= 15) {
               hardStopTrailingEnabled = 0;
               ls_168 = ls_168 + " (Hard_Stop_Trailing adjusted)";
            } else {
               if (hardStopTrailingEnabled) {
                  ls_168 = ls_168 + ", Hard_Stop_Trailing is NOT recommended";
                  if (SupportECN) ls_168 = ls_168 + " (auto-adjusted in " + ((15 - gi_836)) + ")";
               }
            }
            ls_168 = ls_168 + " : ";
            li_32 = FALSE;
            if (gi_836 > 0) {
               if (gd_820 / gi_836 > 10.0) {
                  ls_168 = ls_168 + " Close Slip > 10";
                  ls_168 = ls_168 + "    ";
               }
            }
            if (SupportNFA) ls_168 = ls_168 + "SupportNFA = true";
            ls_168 = ls_168 
            + "\n";
         }
      }
      if (gi_772 > 0) {
         if (gd_764 / gi_772 <= 1000.0) ls_176 = " ECN Condition for order modification time met : " + getDoubleString(gd_764 / gi_772, 0) + "ms <= 1000ms\n";
         else {
            ls_36 = "";
            if (maxOrders >= 5) ls_36 = " ( setting lower Max_Simultaneous_Orders may help ) ";
            li_200 = 1;
            ls_176 = "!ECN Condition for order modification time failed" + ls_36 + " : " + getDoubleString(gd_764 / gi_772, 0) + "ms > 1000ms\n";
         }
      }
      if (gi_776 > 0) {
         ld_44 = gd_784 / (5 * gi_776);
         if (ld_44 <= 0.1) ls_184 = " ECN Condition for requotes met : " + getDoubleString(100.0 * ld_44, 0) + "% <= 10% of possible requote errors\n";
         else {
            ls_52 = "";
            if (maxOrders >= 5) ls_52 = " ( setting lower Max_Simultaneous_Orders may help ) ";
            li_200 = 1;
            ls_184 = "!ECN Condition for requotes failed" + ls_52 + " : " + getDoubleString(100.0 * ld_44, 1) + "% > 10% of possible requote errors\n";
         }
      }
      if (gd_1400 <= 0.00001 * gd_244) {
         ld_60 = gd_244 - gd_236;
         ld_68 = MathMin(ld_60, MathMax(gd_244 - gd_1400 / 0.00001, 0));
         ld_76 = 90.0 * (MathPow(ld_68, 1.5) / MathPow(ld_60, 1.5)) + 10.0;
      } else ld_76 = 0;
      if (gd_1400 <= 0.0002) ls_192 = " ECN Condition of low spread met : realAvgSpread <= " + getDoubleString(0.0002) + "    spread strength (affecting trading frequency):" + getDoubleString(ld_76, 0) + "% (higher is better)\n";
      else {
         li_200 = 1;
         ls_192 = "!ECN Condition of low spread failed : realAvgSpread > " + getDoubleString(0.0002) + "    spread strength (affecting trading frequency):" + getDoubleString(ld_76, 0) + "% (higher is better)\n";
      }
   }
   if (gi_1512 || (ls_116 != "" && gi_868 == 0) && (!IsTesting())) {
      li_84 = 0;
      for (int li_204 = 0; li_204 <= 14; li_204++) {
         for (int li_208 = 1; li_208 <= gi_1484; li_208++) {
            if (!f0_13(li_204, li_208)) {
               ls_4 = getGlobalPrefix() + li_204 + "," + li_208;
               li_0 = GlobalVariableGet(ls_4);
               ArrayResize(lia_88, li_84 + 1);
               lia_88[li_84] = li_0;
               li_84++;
            }
         }
      }
      if (li_84 > 0) ArraySort(lia_88);
      for (li_124 = OrdersTotal() - 1; li_124 >= 0; li_124--) {
         OrderSelect(li_124, SELECT_BY_POS, MODE_TRADES);
         if (OrderSymbol() == Symbol() && OrderMagicNumber() == Magic && OrderCloseTime() == 0) {
            li_0 = OrderTicket();
            for (li_156 = 0; li_156 < li_84; li_156++) {
               li_92 = lia_88[li_156];
               if (li_0 < li_92) li_156 = li_84 - 1;
               else
                  if (li_0 == li_92) break;
            }
            if (li_156 >= li_84) {
               if (li_84 < 15 * gi_1484) {
                  for (li_204 = 0; li_204 <= 14; li_204++) {
                     for (li_208 = 1; li_208 <= gi_1484; li_208++) {
                        if (f0_13(li_204, li_208)) {
                           ls_4 = getGlobalPrefix() + li_204 + "," + li_208;
                           GlobalVariableSet(ls_4, li_0);
                           GlobalVariableSet(ls_4 + "PriceProcessed", 1);
                           GlobalVariableSet(ls_4 + "USO", useStopOrdersEnabled);
                           GlobalVariableSet(ls_4 + "HST", hardStopTrailingEnabled);
                           GlobalVariableSet(ls_4 + "SL", 0);
                           GlobalVariableSet(ls_4 + "TP", 0);
                           GlobalVariableSet(ls_4 + "Price", 0);
                           ArrayResize(lia_88, li_84 + 1);
                           lia_88[li_84] = li_0;
                           li_84++;
                           Print("Order #" + li_0 + " recovered using Magic:" + Magic + " index:" + li_204 + " subindex:" + li_208);
                           li_204 = 14;
                           li_208 = gi_1484;
                        }
                     }
                  }
                  continue;
               }
               Print("Closing order #" + li_0 + " using Magic:" + Magic);
               closeOrderWithTicket(li_0);
            }
         }
      }
      gi_1512 = FALSE;
   }
   gi_1424 = 0;
   gi_1432 = -1;
   gi_1436 = 0;
   if ((!IsTesting()) || !gi_1140 || gi_1504) {
      if (SupportNFA) {
         li_96 = -1;
         for (li_124 = 14; li_124 >= 0; li_124--) {
            for (li_208 = 1; li_208 <= gi_1484; li_208++) {
               ls_4 = getGlobalPrefix() + li_124 + "," + li_208;
               li_0 = GlobalVariableGet(ls_4);
               if (li_96 < li_0)
                  if (f0_6(li_124, li_208) != 0) li_96 = li_0;
            }
         }
         if (li_96 >= 0) {
            Print(gi_868 + ": Closing SupportNFA Orders...");
            li_100 = 0;
            for (li_124 = 0; li_124 <= 14; li_124++) {
               for (li_208 = 1; li_208 <= gi_1484; li_208++) {
                  ls_4 = getGlobalPrefix() + li_124 + "," + li_208;
                  li_0 = GlobalVariableGet(ls_4);
                  if (li_0 <= li_96) {
                     ArrayResize(lia_104, li_100 + 1);
                     lia_104[li_100] = li_0;
                     li_100++;
                     GlobalVariableSet("ClosedManually#" + li_0, 1);
                  }
               }
            }
            ArraySort(lia_104);
            for (li_124 = 0; li_124 < li_100; li_124++) closeOrderWithTicket(lia_104[li_124]);
         }
      } else {
         for (li_124 = 0; li_124 <= 14; li_124++) {
            for (li_208 = 1; li_208 <= gi_1484; li_208++)
               if (f0_6(li_124, li_208) != 0) f0_9(li_124, li_208);
         }
      }
      for (li_124 = 0; li_124 <= 14; li_124++) {
         for (li_156 = 1; li_156 <= gi_1484; li_156++) {
            ls_4 = getGlobalPrefix() + li_124 + "," + li_156;
            li_0 = GlobalVariableGet(ls_4);
            if (OrderSelect(li_0, SELECT_BY_TICKET) && OrderCloseTime() == 0) f0_16(OrderType(), li_124);
         }
      }
   }
   if ((!IsTesting()) || printInfo) {
      ls_108 = TimeToStr(TimeCurrent()) + " tick:" + getFormattedValue(gi_868) + "  base balance:" + getDoubleString(gd_140, 2);
      ls_108 = ls_108 
      + "\n";
      ls_108 = ls_108 + ls_116;
      ls_108 = ls_108 + " NumOrders_Level: 0  Search_Entry_Channels:" + searchEntryChannels + "  Max.Sim.:" + maxOrders + "  Use_Stop_Orders:" + getBoolString(useStopOrdersEnabled) + "  Hard_Stop_Trailing:" + getBoolString(hardStopTrailingEnabled) + "  SupportNFA:" + getBoolString(SupportNFA);
      ls_108 = ls_108 
      + "\n";
      ls_108 = ls_108 + " Bid:" + getDoubleString(Bid) + " Ask:" + getDoubleString(Ask) + " avgSpread:" + getDoubleString(gd_1368) + "  Commission rate:" + getDoubleString(gd_716);
      ls_108 = ls_108 + "  Real avg. spread:" + getDoubleString(gd_1400);
      ls_108 = ls_108 + "  ( recent:" + getDoubleString(gd_1408) + " )";
      ls_108 = ls_108 
      + "\n";
      ls_108 = ls_108 
      + "\n";
      if (gi_908 != 0) {
         ls_108 = ls_108 + " Avg Loss:" + getDoubleString(gd_896 / gi_908, 2) + "%";
         ls_108 = ls_108 + "  Max Loss:" + getDoubleString(gd_888, 2) + "% at order #" + gi_904;
         ls_108 = ls_108 
         + "\n";
      }
      if (gi_740 != 0) {
         ls_108 = ls_108 + " Avg. Exec. Time:" + getDoubleString(gd_732 / gi_740, 0) + "ms";
         if (gi_756 != 0) ls_108 = ls_108 + "   Avg. Open Time:" + getDoubleString(gd_748 / gi_756, 0) + "ms";
         if (gi_772 != 0) ls_108 = ls_108 + "   Avg. Modify Time:" + getDoubleString(gd_764 / gi_772, 0) + "ms";
         if (gi_776 != 0) ls_108 = ls_108 + "   Avg. Num. Requotes:" + getDoubleString(gd_784 / gi_776, 2) + " per transaction";
         ls_108 = ls_108 
         + "\n";
      }
      if (gi_812 != 0) {
         ls_108 = ls_108 + " Avg. Open Slip.:" + getDoubleString(gd_804 / gi_812, 0) + "  (signed):" + getDoubleString(gd_796 / gi_812, 0);
         ls_108 = ls_108 + "   ";
      }
      if (gi_836 != 0) ls_108 = ls_108 + " Avg. Close Slip.:" + getDoubleString(gd_828 / gi_836, 0) + "  (signed):" + getDoubleString(gd_820 / gi_836, 0);
      if (gi_908 || gi_740 || gi_812 || gi_836) {
         ls_108 = ls_108 
         + "\n";
         ls_108 = ls_108 
         + "\n";
      }
      if (enableDebug) {
         ls_108 = ls_108 + " Diagnostics :      ( ! marks warning, still trading unless otherwise mentioned )";
         ls_108 = ls_108 
         + "\n";
         ls_108 = ls_108 
         + "\n";
         ls_108 = ls_108 + ls_160;
         ls_108 = ls_108 + ls_168;
         ls_108 = ls_108 + ls_176;
         ls_108 = ls_108 + ls_184;
         ls_108 = ls_108 + ls_192;
      }
      if (normalizeDouble(gd_1400) > normalizeDouble(0.00001 * gd_244)) {
         ls_108 = ls_108 
         + "\n";
         ls_108 = ls_108 + "!Robot is OFF :: Real avg. spread is too high for this scalping strategy ( " + getDoubleString(gd_1400) + " > " + getDoubleString(0.00001 * gd_244) + " )" 
         + "\n";
      } else {
         if (normalizeDouble(gd_1408) > normalizeDouble(0.00001 * gd_244)) {
            ls_108 = ls_108 
            + "\n";
            ls_108 = ls_108 + "!Robot is OFF :: Real avg. (recent) spread is too high for this scalping strategy ( " + getDoubleString(gd_1408) + " > " + getDoubleString(0.00001 * gd_244) + " )" 
            + "\n";
         }
      }
      debugMessage = debugMessage + ls_108;
   }
}

void f0_4(int ai_0, int ai_4, int ai_8, int ai_12, int ai_16, bool ai_20, double ad_24, double ad_32, double ad_40, double ad_48, double ad_56, double ad_64, double ad_72, double ad_80, double ad_88, double ad_96, double ad_104, int ai_112, double ad_116, double ada_124[5000]) {
   int li_128;
   string ls_132;
   double ld_140;
   double ld_148;
   double ld_156;
   double ld_164;
   double ld_172;
   double lda_180[2];
   double ld_184;
   double ld_192;
   int li_200;
   double ld_204;
   int li_212;
   double ld_216;
   string info;
   bool li_232;
   if (Period() == PERIOD_M1) {
      if (ai_4 == 5) {
         ld_156 = gd_1216;
         ld_164 = gd_1224;
         ld_172 = gd_1232;
      } else {
         ld_156 = gd_1192;
         ld_164 = gd_1200;
         ld_172 = gd_1208;
      }
   }
   if (Period() == PERIOD_M5) {
      if (ai_4 == 15) {
         ld_156 = gd_1216;
         ld_164 = gd_1224;
         ld_172 = gd_1232;
      } else {
         ld_156 = gd_1192;
         ld_164 = gd_1200;
         ld_172 = gd_1208;
      }
   }
   switch (ai_8) {
   case 0:
      ld_140 = gd_1240;
      ld_148 = gd_1248;
      break;
   case 3:
      ld_140 = gd_1256;
      ld_148 = gd_1264;
      break;
   case 6:
      ld_140 = gd_1272;
      ld_148 = gd_1280;
      break;
   case 9:
      ld_140 = gd_1288;
      ld_148 = gd_1296;
      break;
   case 12:
      ld_140 = gd_1304;
      ld_148 = gd_1312;
   }
   lda_180[0] = ad_64;
   lda_180[1] = ad_80;
   f0_0(lda_180);
   ad_64 = lda_180[0];
   ad_80 = lda_180[1];
   double ld_240 = ld_140 - ld_148;
   double ld_248 = ld_148 + ld_240 / 2.0;
   double ld_256 = gd_508;
   double ld_264 = 0.00001 * ad_104;
   double ld_272 = 0.00001 * gd_452;
   double ld_280 = ld_272;
   double ld_288 = 0.00001 * Trailing_Pips;
   ld_264 = MathMax(ld_264, gd_1352);
   if (gi_1144) {
      gda_1180[7] = 0;
      gda_1180[8] = 0;
      gda_1180[9] = gi_1152;
      EURUSD_IMPORT(ai_0, ai_4, 0, 0, ad_40, ad_24, ad_32, gd_236, gd_244, ad_48, gd_508, ad_56, ad_64, ad_72, ad_80, ad_88, gd_1124, ad_96, gd_1132, - 2, ld_148,
         ld_140, ld_256, ld_272, ld_288, gd_1400, 0.00001, Bid, ld_172, ada_124, gda_1180);
      ld_184 = gda_1180[0];
      ld_192 = gda_1180[1];
      li_200 = gda_1180[2];
      ld_204 = gda_1180[3];
      ld_256 = gda_1180[4];
      ld_272 = gda_1180[5];
      ld_288 = gda_1180[6];
      gda_840[ai_8 / 3] = ld_204;
   } else gda_840[ai_8 / 3] = 0;
   double ld_296 = gd_508;
   double ld_304 = 0.00001 * gd_452;
   double ld_312 = 0.00001 * Trailing_Pips;
   if (gi_1148) {
      gda_1180[7] = 0;
      gda_1180[8] = 0;
      gda_1180[9] = gi_1152;
      EURUSD_IMPORT(ai_0, ai_4, 0, 1, ad_40, ad_24, ad_32, gd_236, gd_244, ad_48, gd_508, ad_56, ad_64, ad_72, ad_80, ad_88, gd_1124, ad_96, gd_1132, - 2, ld_148,
         ld_140, ld_296, ld_304, ld_312, gd_1400, 0.00001, Bid, ld_172, ada_124, gda_1180);
      li_212 = gda_1180[2];
      ld_216 = gda_1180[3];
      ld_296 = gda_1180[4];
      ld_304 = gda_1180[5];
      ld_312 = gda_1180[6];
      gda_840[ai_8 / 3 * 2] = ld_216;
   } else gda_840[ai_8 / 3 * 2] = 0;
   if (Bid == 0.0 || MarketInfo(Symbol(), MODE_LOTSIZE) == 0.0) {
      ld_204 = 0;
      ld_216 = 0;
   } else {
      ld_204 = MathMax(0.0001, MathMax(gd_1352, ld_204));
      ld_216 = MathMax(0.0001, MathMax(gd_1352, ld_216));
   }
   if (gi_880) gi_1448 = TimeCurrent() + 60.0 * MathMax(10 * ai_0, 60);
   else gi_1448 = 0;
   gi_1420 = 0;
   gi_1428 = 0;
   int li_320 = 0;
   int li_324 = 0;
   int li_328 = 0;
   if ((!IsTesting()) || !gi_1140 || gi_1504) {
      for (int li_332 = 1; li_332 <= gi_1484; li_332++) {
         if (gi_1144) {
            ls_132 = getGlobalPrefix() + ai_8 + "," + li_332;
            li_128 = GlobalVariableGet(ls_132);
            if (OrderSelect(li_128, SELECT_BY_TICKET)) {
               li_320++;
               if (TimeCurrent() - OrderOpenTime() < 180) gi_1428++;
               if (OrderCloseTime() == 0) f0_18(ai_8, li_332, ld_148, ld_140, ld_248, ld_204, ld_264, ld_272, ld_280, ld_288, ld_256);
            }
         }
         if (gi_1148) {
            ls_132 = getGlobalPrefix() + ai_16 + "," + li_332;
            li_128 = GlobalVariableGet(ls_132);
            if (OrderSelect(li_128, SELECT_BY_TICKET)) {
               li_328++;
               if (TimeCurrent() - OrderOpenTime() < 180) gi_1428++;
               if (OrderCloseTime() == 0) f0_18(ai_16, li_332, ld_148, ld_140, ld_248, ld_216, ld_264, ld_304, ld_280, ld_312, ld_296);
            }
         }
         if (ai_20) {
            ls_132 = getGlobalPrefix() + ai_12 + "," + li_332;
            li_128 = GlobalVariableGet(ls_132);
            if (OrderSelect(li_128, SELECT_BY_TICKET)) {
               li_324++;
               if (TimeCurrent() - OrderOpenTime() < 180) gi_1428++;
               if (OrderCloseTime() == 0) f0_18(ai_12, li_332, ld_148, ld_140, ld_248, ld_204, ld_264, ld_272, ld_280, ld_288, ld_256);
            }
         }
      }
   }
   string ls_336 = "";
   double ld_344 = 0;
   double ld_352 = 0;
   double ld_360 = 0;
   bool li_368 = gi_1424 < maxOrders && gi_1436 == 0 || (gi_1436 != (-li_200) && gi_1436 != (-li_212)) && normalizeDouble(gd_1400) <= normalizeDouble(0.00001 * gd_244) && normalizeDouble(gd_1408) <= normalizeDouble(0.00001 * gd_244) && gi_724 == -1;
   if ((!IsTesting()) || printInfo) {
      if (gi_1144) {
         ld_344 = f0_22(ld_204, ld_256, li_200, 0);
         ls_336 = ls_336 + gs_1184;
         if (li_320 > 0) ls_336 = ls_336 + "   Running Trades:" + li_320;
         ls_336 = ls_336 
         + "\n";
      }
      if (gi_1148) {
         ld_360 = f0_22(ld_216, ld_296, li_212, ld_344);
         ls_336 = ls_336 + gs_1184;
         if (li_328 > 0) ls_336 = ls_336 + "   Running Trades:" + li_328;
         ls_336 = ls_336 
         + "\n";
      }
      if (ai_20) {
         ld_352 = f0_22(ld_204, ld_256, li_200, ld_344 + ld_360);
         ls_336 = ls_336 + gs_1184;
         if (li_324 > 0) ls_336 = ls_336 + "   Running Trades:" + li_324;
         ls_336 = ls_336 
         + "\n";
      }
   }
   if (li_368) {
      if (gi_1144 && ld_204 > 0.0 && li_200 != 0) {
         ld_344 = f0_22(ld_204, ld_256, li_200, 0);
         f0_23(ai_8, ld_164, ld_156, ld_204, ld_272, ld_280, ld_256, li_200, ld_344);
      }
      if (gi_1148 && ld_216 > 0.0 && li_212 != 0 && gi_1424 < maxOrders) {
         ld_360 = f0_22(ld_216, ld_296, li_212, 0);
         f0_23(ai_16, ld_164, ld_156, ld_216, ld_304, ld_280, ld_296, li_212, ld_360);
      }
      if (ai_20 && ld_204 > 0.0 && li_200 != 0 && gi_1424 < maxOrders) {
         ld_352 = f0_22(ld_204, ld_256, li_200, 0);
         f0_23(ai_12, ld_164, ld_156, ld_204, ld_272, ld_280, ld_256, li_200, ld_352);
      }
   }
   if (gi_1420 > 0) gi_1508 = TRUE;
   if (gi_724 >= 0) Comment("New System is initializing...");
   else {
      if (gi_724 == -2) Comment("ERROR -- Instrument " + Symbol() + " prices should have " + 5 + " fraction digits on broker account");
      else {
         info = "";
         if (printInfo) {
            info = info + " " + getDoubleString(ld_192) + " (" + ld_184 + "->" + ad_32 + ")" + " " + getDoubleString(ld_204) + " digits:" + 5 + " " + gi_724 + " stopLevel:" + getDoubleString(gd_1352) + " (" + ld_256 + ")" 
            + "\n";
            info = info + " " + li_200 + " " + getDoubleString(ld_148) + " " + getDoubleString(ld_140) + " " + getDoubleString(ad_40) + " exp:" + TimeToStr(gi_1448, TIME_MINUTES) + " numOrders:" + gi_1420 + " numRecentOrders:" + gi_1428 
            + "\n";
            info = info + " " + "trailingLimit:" + getDoubleString(ld_272) + " trailingDist:" + getDoubleString(ld_264) + " trailingResolution:" + getDoubleString(ld_288) 
            + "\n";
         }
         if ((!IsTesting()) || printInfo) {
            if (enableDebug) info = info + ls_336;
            debugMessage = debugMessage + info;
            if (printInfo) printMessage(debugMessage);
         }
      }
   }
   gi_1476 = gi_1480;
   if (gi_912 != 0/* NO_ERROR */) {
      li_232 = f0_24(gi_912);
      gi_1480 = gi_1476;
      if (li_232) f0_4(ai_0, ai_4, ai_8, ai_12, ai_16, ai_20, ad_24, ad_32, ad_40, ad_48, ad_56, ad_64, ad_72, ad_80, ad_88, ad_96, ad_104, ai_112, ad_116, ada_124);
   }
}

string getGlobalPrefix() {
   if (IsTesting()) return ("NewSystemEU" + Magic + "T");
   return ("NewSystemEU" + Magic);
}

int f0_6(int ai_0, int ai_4) {
   double ld_8;
   double ld_16;
   string ls_24;
   int li_32;
   double ld_36;
   double ld_44;
   double ld_52;
   double ld_60;
   int li_68;
   int li_72;
   bool li_76;
   if (f0_13(ai_0, ai_4)) GetLastError();
   else {
      ls_24 = getGlobalPrefix() + ai_0 + "," + ai_4;
      li_32 = GlobalVariableGet(ls_24);
      if (OrderSelect(li_32, SELECT_BY_TICKET) && OrderCloseTime() == 0 && (!GlobalVariableGet(ls_24 + "HST"))) {
         switch (ai_0) {
         case 0:
         case 1:
         case 2:
            ld_36 = gd_1240;
            ld_44 = gd_1248;
            break;
         case 3:
         case 4:
         case 5:
            ld_36 = gd_1256;
            ld_44 = gd_1264;
            break;
         case 6:
         case 7:
         case 8:
            ld_36 = gd_1272;
            ld_44 = gd_1280;
            break;
         case 9:
         case 10:
         case 11:
            ld_36 = gd_1288;
            ld_44 = gd_1296;
            break;
         case 12:
         case 13:
         case 14:
            ld_36 = gd_1304;
            ld_44 = gd_1312;
         }
         ld_52 = ld_36 - ld_44;
         ld_60 = ld_44 + ld_52 / 2.0;
         li_68 = Bid >= ld_60;
         li_72 = Bid <= ld_60;
         li_76 = FALSE;
         ld_16 = GlobalVariableGet(ls_24 + "TP");
         ld_8 = GlobalVariableGet(ls_24 + "SL");
         switch (OrderType()) {
         case OP_BUY:
            if (Smart_Exit) li_76 = Bid >= gd_1344;
            else li_76 = li_68;
            if (li_76) {
               gi_884++;
               if (IsTesting()) Print(gi_868 + ":" + ai_0 + "," + ai_4 + ": cntDirectClose:" + gi_884);
            }
            if (!li_76) li_76 = f0_7(Ask, ld_16, 65280);
            if (!li_76) li_76 = f0_8(Bid, ld_8, 65280);
            if (!(li_76)) break;
            GlobalVariableSet("ClosedManually#" + li_32, 1);
            break;
         case OP_SELL:
            if (Smart_Exit) li_76 = Bid <= gd_1344;
            else li_76 = li_72;
            if (li_76) {
               gi_884++;
               if (IsTesting()) Print(gi_868 + ":" + ai_0 + "," + ai_4 + ": cntDirectClose:" + gi_884);
            }
            if (!li_76) li_76 = f0_7(Ask, ld_8, 42495);
            if (!li_76) li_76 = f0_8(Bid, ld_16, 42495);
            if (!(li_76)) break;
            GlobalVariableSet("ClosedManually#" + li_32, 1);
         }
         return (li_76);
      }
   }
   return (0);
}

int f0_7(double ad_0, double ad_8, int ai_16) {
   double ld_20 = gda_660[0] - gda_660[1];
   bool li_28 = ld_20 > 0.0 && ad_8 <= ad_0 + 0.00001 * Slippage;
   return (li_28);
}

int f0_8(double ad_0, double ad_8, int ai_16) {
   double ld_20 = gda_660[0] - gda_660[1];
   bool li_28 = ld_20 < 0.0 && ad_8 >= ad_0 - 0.00001 * Slippage;
   return (li_28);
}

void f0_9(int ai_0, int ai_4) {
   if (f0_13(ai_0, ai_4)) {
      GetLastError();
      return;
   }
   string ls_8 = getGlobalPrefix() + ai_0 + "," + ai_4;
   int ticket = GlobalVariableGet(ls_8);
   Print(gi_868 + ":" + ai_0 + "," + ai_4 + "...");
   closeOrderWithTicket(ticket);
}

void closeOrderWithTicket(int ai_0) {
   if (OrderSelect(ai_0, SELECT_BY_TICKET) && OrderCloseTime() == 0) {
      switch (OrderType()) {
      case OP_BUY:
         Print(gi_868 + ": Closing Soft Stop BUY #" + ai_0);
         closeOrder(Bid, Lime);
         return;
      case OP_SELL:
         Print(gi_868 + ": Closing Soft Stop SELL #" + ai_0);
         closeOrder(Ask, Orange);
      }
   }
}

void closeOrder(double close_price, color close_color) {
   bool result;
   int li_16;
   int ticket;
   gi_1476 = 0;
   while (true) {
      ticket = GetTickCount();
      result = OrderClose(OrderTicket(), OrderLots(), close_price, 100000, close_color);
      f0_26(ticket);
      if (result) {
         f0_29(gi_1476);
         return;
      }
      li_16 = f0_24(0/* NO_ERROR */);
      if (!(li_16)) break;
   }
}

int f0_12(int ai_0) {
   for (int li_4 = 1; li_4 <= gi_1484; li_4++)
      if (f0_13(ai_0, li_4)) return (li_4);
   for (li_4 = 1; li_4 <= gi_1484; li_4++) checkOrderForClose(ai_0, li_4);
   for (li_4 = 1; li_4 <= gi_1484; li_4++)
      if (f0_13(ai_0, li_4)) return (li_4);
   return (-1);
}

bool f0_13(int ai_0, int ai_4) {
   string ls_8 = getGlobalPrefix() + ai_0 + "," + ai_4;
   return (!GlobalVariableCheck(ls_8) || GlobalVariableGet(ls_8) == -1.0);
}

void checkOrdersForClose() {
   for (int li_0 = 0; li_0 <= 14; li_0++)
      for (int li_4 = 1; li_4 <= gi_1484; li_4++)
         checkOrderForClose(li_0, li_4);
}

void checkOrderForClose(int ai_0, int ai_4) {
   string ls_8 = getGlobalPrefix() + ai_0 + "," + ai_4;
   int ticket = GlobalVariableGet(ls_8);
   if (OrderSelect(ticket, SELECT_BY_TICKET)) {
      if (OrderCloseTime() != 0) {
         if (!Sound_Alert) PlaySound("alert2.wav");
         f0_20();
         f0_21();
         GlobalVariableSet(ls_8, -1);
      }
   } else GlobalVariableSet(ls_8, -1);
}

void f0_16(int ai_0, int ai_4) {
   switch (ai_0) {
   case 0:
   case 4:
      gi_1436 = -1;
      break;
   case 1:
   case 5:
      gi_1436 = 1;
   }
   gi_1424++;
   gi_1420++;
   gi_1432 = MathMax(gi_1432, ai_4);
}

void f0_17() {
   string ls_0;
   int li_8;
   string ls_12;
   for (int li_20 = 0; li_20 <= 14; li_20++) {
      for (int li_24 = 1; li_24 <= gi_1484; li_24++) {
         if (!f0_13(li_20, li_24)) {
            ls_0 = getGlobalPrefix() + li_20 + "," + li_24;
            li_8 = GlobalVariableGet(ls_0);
            if (OrderSelect(li_8, SELECT_BY_TICKET)) {
               ls_12 = getOrderTypeString(OrderType()) + "#" + li_8 + " price:" + getDoubleString(OrderOpenPrice()) + "(" + getDoubleString(GlobalVariableGet(ls_0 + "Price")) + ")" + " sl/hard:" + getDoubleString(OrderStopLoss()) + " tp/hard:" + getDoubleString(OrderTakeProfit()) + " sl:" + getDoubleString(GlobalVariableGet(ls_0 + "SL")) + " tp:" + getDoubleString(GlobalVariableGet(ls_0 + "TP")) + " opened:" + TimeToStr(OrderOpenTime());
               if (OrderCloseTime() != 0) ls_12 = ls_12 + " closed:" + TimeToStr(OrderCloseTime());
               Print(gi_868 + ":" + li_20 + "," + li_24 + ": " + ls_12);
               continue;
            }
            Print(gi_868 + ": " + li_20 + "," + li_24 + ": #" + li_8 + " MISSING");
         }
      }
   }
}

void f0_18(int ai_0, int ai_4, double ad_8, double ad_16, double ad_24, double ad_32, double ad_40, double ad_48, double ad_56, double ad_64, double ad_72) {
   int li_80;
   int li_84;
   bool li_88;
   bool li_92;
   double ld_96;
   double ld_104;
   double ld_112;
   double ld_120;
   bool li_128 = Bid >= ad_24;
   bool li_132 = Bid <= ad_24;
   string ls_136 = getGlobalPrefix() + ai_0 + "," + ai_4;
   double ld_144 = GlobalVariableGet(ls_136 + "Price");
   bool li_152 = GlobalVariableGet(ls_136 + "PriceProcessed");
   switch (OrderType()) {
   case OP_BUY: break;
   case OP_SELL: break;
   }
   double ld_160 = OrderStopLoss();
   double ld_168 = OrderTakeProfit();
   double ld_176 = GlobalVariableGet(ls_136 + "TP");
   double ld_184 = GlobalVariableGet(ls_136 + "SL");
   if (ad_48 < gd_1352) {
      ad_48 = gd_1352;
      ad_56 = gd_1352 + 0.00001 * Slippage;
   }
   switch (OrderType()) {
   case OP_BUY:
      if (!li_152) {
         ArrayCopy(gda_792, gda_792, 0, 1, 99);
         gda_792[99] = MathRound((OrderOpenPrice() - ld_144) / 0.00001);
         if (gi_812 < 100) gi_812++;
         GlobalVariableSet(ls_136 + "PriceProcessed", 1);
      }
      if (GlobalVariableGet(ls_136 + "HST") && Smart_Exit && Bid >= gd_1344) {
         closeOrder(Bid, Lime);
         GlobalVariableSet("ClosedManually#" + OrderTicket(), 1);
         gi_884++;
         if (!(IsTesting())) break;
         Print(gi_868 + ":" + ai_0 + "," + ai_4 + ": cntDirectClose:" + gi_884);
      } else {
         if (GlobalVariableGet(ls_136 + "HST") && (!Smart_Exit) && li_128) {
            closeOrder(Bid, Lime);
            GlobalVariableSet("ClosedManually#" + OrderTicket(), 1);
            gi_884++;
            if (!(IsTesting())) break;
            Print(gi_868 + ":" + ai_0 + "," + ai_4 + ": cntDirectClose:" + gi_884);
         } else {
            if (gi_524) {
               if (ld_184 != 0.0) {
                  ld_96 = (ld_176 - ld_184 - gd_1368 - gd_716) / 2.0;
                  ad_40 = MathMin(ad_40, ld_96);
                  ad_40 = MathMax(ad_40, gd_1352);
               }
               gi_1476 = 0;
               while (true) {
                  ld_104 = normalizeDouble(Bid - ad_40);
                  ld_112 = normalizeDouble(gd_1384 + ad_40);
                  if (!((ld_184 == 0.0 || ld_160 == 0.0 || (ld_176 < ld_112 && ld_112 - ld_176 > ad_64) || (ld_184 < ld_104 && ld_104 - ld_184 > ad_64)))) break;
                  if (ld_184 != 0.0) {
                     ld_104 = MathMax(ld_184, ld_104);
                     ld_112 = MathMax(ld_176, ld_112);
                  }
                  Print(gi_868 + ":" + ai_0 + "," + ai_4 + ": Modify Order #" + OrderTicket() + " BUY tp:" + getDoubleString(ld_176) + "->" + getDoubleString(ld_112) + "  sl:" + getDoubleString(ld_184) + "->" +
                     getDoubleString(ld_104));
                  if (GlobalVariableGet(ls_136 + "HST") != 0.0) {
                     li_84 = GetTickCount();
                     li_92 = OrderModify(OrderTicket(), 0, ld_104, ld_112, gi_1448, Lime);
                     f0_26(li_84);
                     f0_28(li_84);
                  } else {
                     if (!IsTesting() && ld_160 == 0.0 || (ld_160 < ld_104 - 0.0008 && ld_104 - 0.0008 - ld_160 > 0.0002)) {
                        li_84 = GetTickCount();
                        li_92 = OrderModify(OrderTicket(), 0, ld_104 - 0.0008, ld_112 + 0.0008, gi_1448, Lime);
                        f0_26(li_84);
                        f0_28(li_84);
                     } else li_92 = TRUE;
                  }
                  if (li_92) {
                     f0_29(gi_1476);
                     GlobalVariableSet(ls_136 + "TP", ld_112);
                     GlobalVariableSet(ls_136 + "SL", ld_104);
                     break;
                  }
                  li_88 = f0_24(0/* NO_ERROR */);
                  if (!(li_88)) break;
               }
            }
            gi_1420++;
            gi_1436 = -1;
            return;
         }
      }
   case OP_SELL:
      if (!li_152) {
         ArrayCopy(gda_792, gda_792, 0, 1, 99);
         gda_792[99] = MathRound((ld_144 - OrderOpenPrice()) / 0.00001);
         if (gi_812 < 100) gi_812++;
         GlobalVariableSet(ls_136 + "PriceProcessed", 1);
      }
      if (GlobalVariableGet(ls_136 + "HST") && Smart_Exit && Bid <= gd_1344) {
         closeOrder(Ask, Orange);
         GlobalVariableSet("ClosedManually#" + OrderTicket(), 1);
         gi_884++;
         if (!(IsTesting())) break;
         Print(gi_868 + ":" + ai_0 + "," + ai_4 + ": cntDirectClose:" + gi_884);
      } else {
         if (GlobalVariableGet(ls_136 + "HST") && (!Smart_Exit) && li_132) {
            closeOrder(Ask, Orange);
            GlobalVariableSet("ClosedManually#" + OrderTicket(), 1);
            gi_884++;
            if (!(IsTesting())) break;
            Print(gi_868 + ":" + ai_0 + "," + ai_4 + ": cntDirectClose:" + gi_884);
         } else {
            if (gi_524) {
               if (ld_184 != 0.0) {
                  ld_96 = (ld_184 - ld_176 - gd_1368 - gd_716) / 2.0;
                  ad_40 = MathMin(ad_40, ld_96);
                  ad_40 = MathMax(ad_40, gd_1352);
               }
               gi_1476 = 0;
               while (true) {
                  ld_104 = normalizeDouble(Ask + ad_40);
                  ld_112 = normalizeDouble(gd_1392 - ad_40);
                  if (!((ld_184 == 0.0 || ld_160 == 0.0 || (ld_176 > ld_112 && ld_176 - ld_112 > ad_64) || (ld_184 > ld_104 && ld_184 - ld_104 > ad_64)))) break;
                  if (ld_184 != 0.0) {
                     ld_104 = MathMin(ld_184, ld_104);
                     ld_112 = MathMin(ld_176, ld_112);
                  }
                  Print(gi_868 + ":" + ai_0 + "," + ai_4 + ": Modify Order #" + OrderTicket() + " SELL tp:" + getDoubleString(ld_176) + "->" + getDoubleString(ld_112) + "  sl:" + getDoubleString(ld_184) + "->" +
                     getDoubleString(ld_104));
                  if (GlobalVariableGet(ls_136 + "HST") != 0.0) {
                     li_84 = GetTickCount();
                     li_92 = OrderModify(OrderTicket(), 0, ld_104, ld_112, gi_1448, Orange);
                     f0_26(li_84);
                     f0_28(li_84);
                  } else {
                     if (!IsTesting() && ld_160 == 0.0 || (ld_160 > ld_104 + 0.0008 && ld_160 - ld_104 - 0.0008 > 0.0002)) {
                        li_84 = GetTickCount();
                        li_92 = OrderModify(OrderTicket(), 0, ld_104 + 0.0008, ld_112 - 0.0008, gi_1448, Orange);
                        f0_26(li_84);
                        f0_28(li_84);
                     } else li_92 = TRUE;
                  }
                  if (li_92) {
                     f0_29(gi_1476);
                     GlobalVariableSet(ls_136 + "TP", ld_112);
                     GlobalVariableSet(ls_136 + "SL", ld_104);
                     break;
                  }
                  li_88 = f0_24(0/* NO_ERROR */);
                  if (!(li_88)) break;
               }
            }
            gi_1420++;
            gi_1436 = 1;
            return;
         }
      }
   case OP_BUYSTOP:
      if (li_132) {
         ld_96 = OrderTakeProfit() - OrderOpenPrice() - gd_716;
         ld_120 = ad_48;
         gi_1476 = 0;
         while (true) {
            ld_144 = normalizeDouble(Ask + ld_120);
            if (!((ld_144 < OrderOpenPrice() && OrderOpenPrice() - ld_144 > ad_64))) break;
            ld_104 = normalizeDouble(Bid + ld_120 - ld_96 * ad_72);
            ld_112 = normalizeDouble(gd_1384 + ld_120 + ld_96);
            if (GlobalVariableGet(ls_136 + "HST") != 0.0) {
               li_84 = GetTickCount();
               li_92 = OrderModify(OrderTicket(), ld_144, ld_104, ld_112, 0, Lime);
               f0_26(li_84);
               f0_28(li_84);
            } else {
               if (!IsTesting() && ld_160 == 0.0 || (ld_160 < ld_104 - 0.0008 && ld_104 - 0.0008 - ld_160 > 0.0002)) {
                  li_84 = GetTickCount();
                  li_92 = OrderModify(OrderTicket(), ld_144, ld_104 - 0.0008, ld_112 + 0.0008, 0, Lime);
                  f0_26(li_84);
                  f0_28(li_84);
               } else {
                  li_84 = GetTickCount();
                  li_92 = OrderModify(OrderTicket(), ld_144, 0, 0, 0, Lime);
                  f0_26(li_84);
                  f0_28(li_84);
               }
            }
            if (li_92) {
               f0_29(gi_1476);
               GlobalVariableSet(ls_136 + "Price", ld_144);
               GlobalVariableSet(ls_136 + "TP", ld_112);
               GlobalVariableSet(ls_136 + "SL", ld_104);
               break;
            }
            li_88 = f0_24(0/* NO_ERROR */);
            if (!(li_88)) break;
            ld_120 = ad_56;
         }
         gi_1420++;
         gi_1436 = -1;
      } else {
         li_88 = FALSE;
         gi_1476 = 0;
         while (true) {
            li_84 = GetTickCount();
            li_92 = OrderDelete(OrderTicket());
            f0_26(li_84);
            if (li_92) {
               f0_29(gi_1476);
               break;
            }
            if (!li_88) Print(gi_868 + ":" + ai_0 + "," + ai_4 + ": WARN Unable to delete BUYSTOP Order #" + OrderTicket());
            li_88 = f0_24(0/* NO_ERROR */);
            if (!(li_88)) break;
         }
         li_80 = -1;
         return;
      }
   case OP_SELLSTOP:
      if (li_128) {
         ld_96 = OrderOpenPrice() - OrderTakeProfit() - gd_716;
         ld_120 = ad_48;
         gi_1476 = 0;
         while (true) {
            ld_144 = normalizeDouble(Bid - ld_120);
            if (!((ld_144 > OrderOpenPrice() && ld_144 - OrderOpenPrice() > ad_64))) break;
            ld_104 = normalizeDouble(Ask - ld_120 + ld_96 * ad_72);
            ld_112 = normalizeDouble(gd_1392 - ld_120 - ld_96);
            if (GlobalVariableGet(ls_136 + "HST") != 0.0) {
               li_84 = GetTickCount();
               li_92 = OrderModify(OrderTicket(), ld_144, ld_104, ld_112, 0, Orange);
               f0_26(li_84);
               f0_28(li_84);
            } else {
               if (!IsTesting() && ld_160 == 0.0 || (ld_160 > ld_104 + 0.0008 && ld_160 - ld_104 - 0.0008 > 0.0002)) {
                  li_84 = GetTickCount();
                  li_92 = OrderModify(OrderTicket(), ld_144, ld_104 + 0.0008, ld_112 - 0.0008, 0, Orange);
                  f0_26(li_84);
                  f0_28(li_84);
               } else {
                  li_84 = GetTickCount();
                  li_92 = OrderModify(OrderTicket(), ld_144, 0, 0, 0, Orange);
                  f0_26(li_84);
                  f0_28(li_84);
               }
            }
            if (li_92) {
               f0_29(gi_1476);
               GlobalVariableSet(ls_136 + "Price", ld_144);
               GlobalVariableSet(ls_136 + "TP", ld_112);
               GlobalVariableSet(ls_136 + "SL", ld_104);
               break;
            }
            li_88 = f0_24(0/* NO_ERROR */);
            if (!(li_88)) break;
            ld_120 = ad_56;
         }
         gi_1420++;
         gi_1436 = 1;
      } else {
         li_88 = FALSE;
         gi_1476 = 0;
         while (true) {
            li_84 = GetTickCount();
            li_92 = OrderDelete(OrderTicket());
            f0_26(li_84);
            if (li_92) {
               f0_29(gi_1476);
               break;
            }
            if (!li_88) Print(gi_868 + ":" + ai_0 + "," + ai_4 + ": WARN Unable to delete SELLSTOP Order #" + OrderTicket());
            li_88 = f0_24(0/* NO_ERROR */);
            if (!(li_88)) break;
         }
         li_80 = -1;
      }
      return;
   }
}

void f0_19() {
   double ld_0;
   if (OrderSymbol() == Symbol() && OrderCloseTime() != 0 && OrderLots() != 0.0 && OrderClosePrice() != OrderOpenPrice() && OrderProfit() != 0.0 && MarketInfo(Symbol(),
      MODE_LOTSIZE) != 0.0 && OrderComment() != "partial close" && StringFind(OrderComment(), "[sl]from #") == -1 && StringFind(OrderComment(), "[tp]from #") == -1) {
      gi_700 = TRUE;
      ld_0 = MathAbs(OrderProfit() / (OrderClosePrice() - OrderOpenPrice()));
      gd_708 = ld_0 / OrderLots() / MarketInfo(Symbol(), MODE_LOTSIZE);
      gd_716 = (-OrderCommission()) / ld_0;
      Print(gi_868 + ": Commission_Rate : " + getDoubleString(gd_716));
   }
}

void f0_20() {
   double ld_0 = -1000000;
   if (!GlobalVariableGet("ClosedManually#" + OrderTicket())) {
      switch (OrderType()) {
      case OP_BUY:
         if (OrderStopLoss() != 0.0 && StringFind(OrderComment(), "[sl]") >= 0 || OrderClosePrice() <= OrderStopLoss()) ld_0 = OrderStopLoss() - OrderClosePrice();
         else {
            if (!((OrderTakeProfit() != 0.0 && StringFind(OrderComment(), "[tp]") >= 0 || OrderClosePrice() >= OrderTakeProfit()))) break;
            ld_0 = OrderTakeProfit() - OrderClosePrice();
         }
         break;
      case OP_SELL:
         if (OrderStopLoss() != 0.0 && StringFind(OrderComment(), "[sl]") >= 0 || OrderClosePrice() >= OrderStopLoss()) ld_0 = OrderClosePrice() - OrderStopLoss();
         else {
            if (!((OrderTakeProfit() != 0.0 && StringFind(OrderComment(), "[tp]") >= 0 || OrderClosePrice() <= OrderTakeProfit()))) break;
            ld_0 = OrderClosePrice() - OrderTakeProfit();
         }
      }
   }
   if (ld_0 != -1000000.0) {
      ArrayCopy(gda_816, gda_816, 0, 1, 99);
      gda_816[99] = MathRound(ld_0 / 0.00001);
      if (gi_836 < 100) gi_836++;
   }
}

void f0_21() {
   double ld_0;
   double ld_8 = OrderProfit() + OrderCommission() + OrderSwap();
   if (ld_8 < 0.0 && gd_140 > 0.0) {
      ld_0 = NormalizeDouble(100.0 * MathAbs(ld_8) / gd_140, 2);
      gd_896 += ld_0;
      gi_908++;
      if (ld_0 > gd_888) {
         gd_888 = ld_0;
         gi_904 = OrderTicket();
         if ((!Sound_Alert) || printInfo) {
            Print(gi_868 + ": realRisk:" + getDoubleString(ld_0, 2) + " ( profit:" + getDoubleString(ld_8, 2) + " of balance:" + getDoubleString(gd_140, 2) + " with lot:" + getDoubleString(OrderLots(), 2) + " )");
            Print(gi_868 + ": maxRealRiskPercent:" + getDoubleString(gd_888, 2));
            Print(gi_868 + ": maxRealRiskTicket:" + gi_904);
         }
      }
   }
}

double f0_22(double ad_0, double ad_8, int ai_16, double ad_20) {
   double ld_28;
   double ld_36;
   double ld_44;
   string ls_52;
   int li_60;
   double ld_68;
   double ld_76;
   double ld_84;
   double ld_92;
   double ld_100 = ad_0 * ad_8 + gd_1360;
   if (ld_100 > 0.0 && MarketInfo(Symbol(), MODE_LOTSIZE) != 0.0 && AccountLeverage() != 0) {
      ld_44 = AccountFreeMargin();
      for (int li_108 = 0; li_108 <= 14; li_108++) {
         for (int li_112 = 1; li_112 <= gi_1484; li_112++) {
            ls_52 = getGlobalPrefix() + li_108 + "," + li_112;
            li_60 = GlobalVariableGet(ls_52);
            if (OrderSelect(li_60, SELECT_BY_TICKET) && OrderCloseTime() == 0) {
               switch (OrderType()) {
               case OP_BUYSTOP:
               case OP_SELLSTOP:
                  ld_44 -= MarketInfo(Symbol(), MODE_LOTSIZE) * OrderLots() / AccountLeverage();
               }
            }
         }
      }
      ld_44 -= MarketInfo(Symbol(), MODE_LOTSIZE) * ad_20 / AccountLeverage();
      gd_140 = MathMax(AccountBalance(), gd_140);
      ld_68 = (ld_44 - gd_140 / 10.0) * AccountLeverage();
      ld_28 = ld_68 / MarketInfo(Symbol(), MODE_LOTSIZE);
      ld_28 = NormalizeDouble(ld_28, gi_1416);
      if (ld_28 < MarketInfo(Symbol(), MODE_MINLOT)) {
         ld_28 = 0.0;
         gs_1184 = "!Lots:0.0  Risk set at:" + getDoubleString(Risk, 2) + "%   ( Free Margin is too low : Channel is OFF )";
      } else {
         ld_84 = 0;
         for (li_112 = 0; li_112 < 10; li_112++) ld_84 = MathMax(ld_84, gda_840[li_112] * ad_8 + gd_1360);
         ld_84 = MathMax(ld_84, ld_100);
         ld_68 = (ld_44 - gd_140 * Risk * ld_100 / ld_84 / 100.0) * AccountLeverage() / 2.0;
         ld_76 = gd_140 * Risk / 100.0 * Bid / ld_84;
         ld_92 = MathMin(ld_68, ld_76);
         ld_28 = ld_92 / MarketInfo(Symbol(), MODE_LOTSIZE);
         ld_28 = NormalizeDouble(ld_28, gi_1416);
         ld_28 = MathMax(Min_Lots, ld_28);
         ld_28 = MathMax(MarketInfo(Symbol(), MODE_MINLOT), ld_28);
         ld_28 = MathMin(Max_Lots, ld_28);
         ld_28 = MathMin(MarketInfo(Symbol(), MODE_MAXLOT), ld_28);
         gs_1184 = "Lots:" + getDoubleString(ld_28, gi_1416) + "  ";
         if (ld_28 > 0.0 && AccountBalance() > 0.0 && Bid > 0.0) {
            ld_36 = 100.0 * (ld_28 * MarketInfo(Symbol(), MODE_LOTSIZE) * ld_100) / Bid / AccountBalance();
            gs_1184 = gs_1184 + "Actual Risk:" + getDoubleString(ld_36, 2) + "%  Risk set at:" + getDoubleString(Risk, 2) + "%";
            if (NormalizeDouble(ld_36, 2) > NormalizeDouble(Risk, 2)) {
               if (ld_28 == Min_Lots || ld_28 == MarketInfo(Symbol(), MODE_MINLOT)) gs_1184 = "!" + gs_1184 + "   ( at Lot Size Minumum : " + getDoubleString(ld_28, 2) + " : still trading with Actual Risk )";
               else gs_1184 = "!" + gs_1184 + "   ( still trading with Actual Risk )";
            } else {
               if (ld_68 < ld_76) gs_1184 = "!" + gs_1184 + "   ( free Margin at S/L reached : " + getDoubleString(2.0 * ld_68 / AccountLeverage(), 2) + " : still trading with Actual Risk )";
               else gs_1184 = " " + gs_1184;
            }
         } else {
            gs_1184 = "!Lots:0.0  Risk set at:" + getDoubleString(Risk, 2) + "%   ( Channel is OFF )";
            ld_28 = 0;
         }
      }
   } else {
      gs_1184 = "!Lots:0.0  Risk set at:" + getDoubleString(Risk, 2) + "%   ( no scalp distance yet : Channel is OFF )";
      ld_28 = 0;
   }
   return (ld_28);
}

void f0_23(int ai_0, double ad_4, double ad_12, double ad_20, double ad_28, double ad_36, double ad_44, int ai_52, double ad_56) {
   int orderType;
   color li_68;
   bool li_72;
   bool li_76;
   double ld_80;
   double ld_88;
   double ld_96;
   double ld_104;
   int li_112;
   int li_116;
   int li_120;
   double ld_124;
   string ls_132;
   int li_140;
   string ls_144;
   int li_152;
   int li_156 = -1;
   bool li_160 = TRUE;
   double ld_164 = gda_660[0] - gda_660[1];
   if (initialized) {
      if (ad_56 != 0.0) {
         if (!IsTesting() && gi_1488 == 10) {
            if (SupportECN) {
               if (!useStopOrdersEnabled && gd_1352 <= 0.00001 * minStopLevel) useStopOrdersEnabled = 1;
               if ((!hardStopTrailingEnabled) && !SupportNFA) hardStopTrailingEnabled = 1;
            }
         }
         if (useStopOrdersEnabled && ad_28 < gd_1352) {
            ad_28 = gd_1352;
            ad_36 = gd_1352 + 0.00001 * Slippage;
         }
         if (ai_52 < 0) {
            li_112 = 1;
            li_68 = Lime;
            ld_104 = GetTickCount();
            if (useStopOrdersEnabled) {
               orderType = OP_BUYSTOP;
               ld_80 = normalizeDouble(Ask + ad_36);
               ld_88 = normalizeDouble(Bid + ad_36 - ad_20 * ad_44);
               ld_96 = normalizeDouble(gd_1384 + ad_36 + ad_20);
            } else {
               orderType = OP_BUY;
               ld_80 = normalizeDouble(ad_4 + gd_1360 + ad_28);
               li_72 = ld_164 > 0.0 && ld_80 - 0.00001 * Slippage <= Ask && Ask <= ld_80 + 0.00001 * Slippage;
               ld_80 = Ask;
               ld_88 = normalizeDouble(ld_80 - gd_1360 - MathMax(gd_1352 + 0.00001 * Slippage, ad_20 * ad_44));
               ld_96 = normalizeDouble(ld_80 + MathMax(gd_1352 + 0.00001 * Slippage, gd_716 + ad_20));
            }
         } else {
            if (ai_52 <= 0) return;
            li_112 = -1;
            li_68 = Orange;
            ld_104 = GetTickCount();
            if (useStopOrdersEnabled) {
               orderType = OP_SELLSTOP;
               ld_80 = normalizeDouble(Bid - ad_36);
               ld_88 = normalizeDouble(Ask - ad_36 + ad_20 * ad_44);
               ld_96 = normalizeDouble(gd_1392 - ad_36 - ad_20);
            } else {
               orderType = OP_SELL;
               ld_80 = normalizeDouble(ad_12 - ad_28);
               li_72 = ld_164 < 0.0 && ld_80 + 0.00001 * Slippage >= Bid && Bid >= ld_80 - 0.00001 * Slippage;
               ld_80 = Bid;
               ld_88 = normalizeDouble(ld_80 + gd_1360 + MathMax(gd_1352 + 0.00001 * Slippage, ad_20 * ad_44));
               ld_96 = normalizeDouble(ld_80 - MathMax(gd_1352 + 0.00001 * Slippage, gd_716 + ad_20));
            }
         }
         li_116 = f0_12(ai_0);
         if (li_116 != -1) {
            li_120 = 0;
            ld_124 = 0;
            for (int li_172 = 1; li_172 <= gi_1484; li_172++) {
               ls_132 = getGlobalPrefix() + ai_0 + "," + li_172;
               li_140 = GlobalVariableGet(ls_132);
               if (OrderSelect(li_140, SELECT_BY_TICKET) && OrderCloseTime() == 0) {
                  if (li_120 < OrderOpenTime()) {
                     li_120 = OrderOpenTime();
                     ld_124 = OrderOpenPrice();
                  }
               }
            }
            if (ld_124 != 0.0 && li_112 * (ld_124 - ld_80) < 0.00001 * gd_516) return;
            ls_144 = getGlobalPrefix() + ai_0 + "," + li_116;
            li_76 = TRUE;
            if (useStopOrdersEnabled) {
               if (hardStopTrailingEnabled) {
                  gi_1512 = TRUE;
                  li_156 = OrderSend(Symbol(), orderType, ad_56, ld_80, Slippage, ld_88, ld_96, orderComment, Magic, gi_1448, li_68);
               } else {
                  if (!IsTesting()) {
                     gi_1512 = TRUE;
                     li_156 = OrderSend(Symbol(), orderType, ad_56, ld_80, Slippage, ld_88 - 0.00001 * (80 * li_112), ld_96 + 0.00001 * (80 * li_112), orderComment, Magic, gi_1448, li_68);
                  } else {
                     gi_1512 = TRUE;
                     li_156 = OrderSend(Symbol(), orderType, ad_56, ld_80, Slippage, 0, 0, orderComment, Magic, gi_1448, li_68);
                  }
               }
               li_152 = GetLastError();
            } else {
               if (!(li_72)) return;
               gi_1512 = TRUE;
               li_156 = OrderSend(Symbol(), orderType, ad_56, ld_80, Slippage, 0, 0, orderComment, Magic, gi_1448, li_68);
               li_152 = GetLastError();
               if (li_156 >= 0) {
                  li_76 = TRUE;
                  if (hardStopTrailingEnabled) {
                     gi_1476 = 0;
                     while (true) {
                        li_76 = OrderModify(li_156, 0, ld_88, ld_96, gi_1448, li_68);
                        if (li_76) {
                           f0_29(gi_1476);
                           break;
                        }
                        li_160 = f0_24(0/* NO_ERROR */);
                        if (!(li_160)) break;
                     }
                  } else {
                     if (!IsTesting()) {
                        gi_1476 = 0;
                        while (true) {
                           li_76 = OrderModify(li_156, 0, ld_88 - 0.00001 * (80 * li_112), ld_96 + 0.00001 * (80 * li_112), gi_1448, li_68);
                           if (li_76) {
                              f0_29(gi_1476);
                              break;
                           }
                           li_160 = f0_24(0/* NO_ERROR */);
                           if (!(li_160)) break;
                        }
                     }
                  }
               }
            }
            if (li_156 >= 0) {
               if (gi_1488 == 10) gi_1488 = 0;
               gi_1488++;
               GlobalVariableSet(ls_144, li_156);
               GlobalVariableSet(ls_144 + "Price", ld_80);
               if (useStopOrdersEnabled) GlobalVariableSet(ls_144 + "PriceProcessed", 0);
               else GlobalVariableSet(ls_144 + "PriceProcessed", 1);
               GlobalVariableSet(ls_144 + "TP", ld_96);
               GlobalVariableSet(ls_144 + "SL", ld_88);
               GlobalVariableSet(ls_144 + "USO", useStopOrdersEnabled);
               GlobalVariableSet(ls_144 + "HST", hardStopTrailingEnabled);
               f0_26(ld_104);
               f0_27(ld_104);
               Print(gi_868 + ":" + ai_0 + "," + li_116 + ": " + getOrderTypeString(orderType) + "  price:" + getDoubleString(ld_80) + " SL:" + getDoubleString(ld_88) + " TP:" + getDoubleString(ld_96));
               if (!Sound_Alert) {
                  if (li_76) PlaySound("news.wav");
                  else PlaySound("wait.wav");
               }
               f0_16(orderType, li_172);
               f0_29(gi_1480);
               gi_1480 = FALSE;
               if (!li_76) {
                  Print(gi_868 + ":" + ai_0 + "," + li_116 + ": WARN Unable to setup s/l or t/p for order #" + li_156 + " : " + getOrderTypeString(orderType) + "  price:" + getDoubleString(ld_80) + " SL:" + getDoubleString(ld_88) +
                     " TP:" + getDoubleString(ld_96));
               }
            } else {
               if (li_160) gi_912 = li_152;
               Print(gi_868 + ":" + ai_0 + "," + li_116 + ": WARN Unable to create " + getOrderTypeString(orderType) + "  price:" + getDoubleString(ld_80) + " SL:" + getDoubleString(ld_88) + " TP:" + getDoubleString(ld_96));
            }
            gi_1512 = FALSE;
         }
      }
   }
}

int f0_24(int ai_0) {
   if (!ai_0) ai_0 = GetLastError();
   if (ai_0 == 0/* NO_ERROR */) {
      if (gi_1476 != 0) Print(gi_868 + ": INFO Trading command is now succeeded after recent complaints are resolved...");
      f0_29(gi_1476);
      gi_1476 = 0;
      return (0);
   }
   if (IsTesting()) {
      if (ai_0 != 4059/* FUNCTION_NOT_ALLOWED_IN_TESTING_MODE */) Print(gi_868 + ": ERROR unhandled error (unable to repeat command in testing mode) : " + ErrorDescription(ai_0));
      f0_29(gi_1476);
      gi_1476 = 0;
      return (0);
   }
   if (gi_1476 == 5) {
      if (!Sound_Alert) Print(gi_868 + ": Number of subsequently repeated orders reached limit (5)");
      f0_29(gi_1476);
      gi_1476 = 0;
      return (0);
   }
   if (ai_0 == 130/* INVALID_STOPS */ || ai_0 == 129/* INVALID_PRICE */ || ai_0 == 138/* REQUOTE */ || ai_0 == 135/* PRICE_CHANGED */) {
      Sleep(50);
      RefreshRates();
      if (!Sound_Alert) Print(gi_868 + ": WARN following error blocked our last trading command (REQUOTING + REPEATING) : " + ErrorDescription(ai_0));
      gi_1476++;
      return (1);
   }
   if (ai_0 == 146/* TRADE_CONTEXT_BUSY */ || ai_0 == 133/* TRADE_DISABLED */ || ai_0 == 128/* TRADE_TIMEOUT */ || ai_0 == 139/* ORDER_LOCKED */ || ai_0 == 136/* OFF_QUOTES */) {
      Sleep(500);
      RefreshRates();
      if (!Sound_Alert) Print(gi_868 + ": WARN following error blocked our last trading command (WAITING + REQUOTING + REPEATING) : " + ErrorDescription(ai_0));
      gi_1476++;
      return (1);
   }
   if (ai_0 == 4/* SERVER_BUSY */ || ai_0 == 137/* BROKER_BUSY */ || ai_0 == 4022/* SYSTEM_BUSY */ || ai_0 == 6/* NO_CONNECTION */ || ai_0 == 141/* TOO_MANY_REQUESTS */ ||
      ai_0 == 8/* TOO_FREQUENT_REQUESTS */) {
      Sleep(1500);
      RefreshRates();
      if (!Sound_Alert) Print(gi_868 + ": WARN following error blocked our last trading command (WAITING(2) + REQUOTING + REPEATING) : " + ErrorDescription(ai_0));
      gi_1476++;
      return (1);
   }
   if (ai_0 == 147/* TRADE_EXPIRATION_DENIED */) {
      RefreshRates();
      gi_880 = FALSE;
      gi_1448 = 0;
      if (!Sound_Alert) Print(gi_868 + ": WARN following error blocked our last trading command (REQUOTING + REPEATING + TURNING OFF EXPIRATION) : " + ErrorDescription(ai_0));
      gi_1476++;
      return (1);
   }
   Print(gi_868 + ": ERROR unhandled error (unable to repeat command) : " + ErrorDescription(ai_0));
   f0_29(gi_1476);
   gi_1476 = 0;
   return (0);
}

void f0_25(double &ada_0[2], double &ada_4[2], int &aia_8[2], double ad_12) {
   double ld_20;
   for (int li_28 = 1; li_28 > 0; li_28--) {
      ada_0[li_28] = ada_0[li_28 - 1];
      ada_4[li_28] = ada_4[li_28 - 1];
      aia_8[li_28] = aia_8[li_28 - 1];
   }
   ada_0[0] = Bid;
   ada_4[0] = Ask;
   aia_8[0] = GetTickCount();
   gd_680 = 0;
   gi_688 = FALSE;
   double ld_32 = 0;
   int li_40 = 0;
   double ld_44 = 0;
   int li_52 = 0;
   int li_56 = 0;
   for (li_28 = 1; li_28 < 2; li_28++) {
      if (aia_8[li_28] == 0) break;
      ld_20 = ada_0[0] - ada_0[li_28];
      if (ld_20 < ld_32) {
         ld_32 = ld_20;
         li_40 = aia_8[0] - aia_8[li_28];
      }
      if (ld_20 > ld_44) {
         ld_44 = ld_20;
         li_52 = aia_8[0] - aia_8[li_28];
         if (ld_32 < 0.0 && (-ld_32) - ld_44 > 0.00001 * ad_12) {
         }
      }
      if (ld_32 < 0.0 && ld_44 > 0.0) {
         if ((-ld_32) - ld_44 > 0.00001 * ad_12) {
            gd_680 = ld_44;
            gi_688 = li_52;
            break;
         }
         if (ld_44 + ld_32 < 0.5) {
            gd_680 = ld_32;
            gi_688 = li_40;
         }
      } else {
         if (ld_44 > 5.0 * (0.00001 * ad_12)) {
            gd_680 = ld_44;
            gi_688 = li_52;
         } else {
            if (ld_32 < 5.0 * (0.00001 * (-ad_12))) {
               gd_680 = ld_32;
               gi_688 = li_40;
               break;
            }
         }
      }
   }
   if (gi_688 == FALSE) {
      gd_692 = 0;
      return;
   }
   gd_692 = 1000.0 * gd_680 / gi_688;
}

void f0_26(int ai_0) {
   ArrayCopy(gda_728, gda_728, 0, 1, 99);
   gda_728[99] = GetTickCount() - ai_0;
   if (gi_740 < 100) gi_740++;
}

void f0_27(int ai_0) {
   ArrayCopy(gda_744, gda_744, 0, 1, 99);
   gda_744[99] = GetTickCount() - ai_0;
   if (gi_756 < 100) gi_756++;
}

void f0_28(int ai_0) {
   ArrayCopy(gda_760, gda_760, 0, 1, 99);
   gda_760[99] = GetTickCount() - ai_0;
   if (gi_772 < 100) gi_772++;
}

void f0_29(int ai_0) {
   ArrayCopy(gda_780, gda_780, 0, 1, 99);
   gda_780[99] = ai_0;
   if (gi_776 < 100) gi_776++;
}

void reInitGlobalVariables() {
   gi_704 = FALSE;
   gi_836 = 0;
   ArrayInitialize(gda_816, 0);
   gi_740 = readGlobalVariables(getGlobalPrefix() + "ExecTimes", gda_728, 100);
   gi_756 = readGlobalVariables(getGlobalPrefix() + "OpenTimes", gda_744, 100);
   gi_772 = readGlobalVariables(getGlobalPrefix() + "ModifyTimes", gda_760, 100);
   gi_812 = readGlobalVariables(getGlobalPrefix() + "OpenSlips", gda_792, 100);
   gi_776 = readGlobalVariables(getGlobalPrefix() + "Requotes", gda_780, 100);
   gd_140 = GlobalVariableGet(getGlobalPrefix() + "Base_Balance");
}

void setGlobalVars() {
   setGlobalVariables(getGlobalPrefix() + "ExecTimes", gda_728, 100, gi_740);
   setGlobalVariables(getGlobalPrefix() + "OpenTimes", gda_744, 100, gi_756);
   setGlobalVariables(getGlobalPrefix() + "ModifyTimes", gda_760, 100, gi_772);
   setGlobalVariables(getGlobalPrefix() + "OpenSlips", gda_792, 100, gi_812);
   setGlobalVariables(getGlobalPrefix() + "Requotes", gda_780, 100, gi_776);
   GlobalVariableSet(getGlobalPrefix() + "Base_Balance", gd_140);
}

void reset() {
   GlobalVariableSet(getGlobalPrefix() + "Reset", 0);
   resetGlobalVariables(getGlobalPrefix() + "ExecTimes", 100);
   resetGlobalVariables(getGlobalPrefix() + "OpenTimes", 100);
   resetGlobalVariables(getGlobalPrefix() + "ModifyTimes", 100);
   resetGlobalVariables(getGlobalPrefix() + "OpenSlips", 100);
   resetGlobalVariables(getGlobalPrefix() + "Requotes", 100);
   GlobalVariableSet(getGlobalPrefix() + "Base_Balance", 0);
   gd_888 = 0;
   gd_896 = 0;
   gi_904 = 0;
   gi_908 = 0;
}

void setGlobalVariables(string prefix, double values[100], int count, int baseValue) {
   GlobalVariableSet(prefix, baseValue);
   for (int i = 0; i < count; i++) GlobalVariableSet(prefix + i, values[i]);
}

void resetGlobalVariables(string prefix, int count) {
   GlobalVariableSet(prefix, 0);
   for (int li_12 = 0; li_12 < count; li_12++) GlobalVariableSet(prefix + li_12, 0);
}

int readGlobalVariables(string prefix, double &ada_8[100], int count) {
   int baseValue = GlobalVariableGet(prefix);
   for (int i = 0; i < count; i++) ada_8[i] = GlobalVariableGet(prefix + i);
   return (baseValue);
}

int getNonZeroValueBackwards(double array[5000], int lastIndex) {
   for (int i = lastIndex - 1; i >= 0; i--)
      if (array[i] != 0.0) return (i);
   return (-1);
}

void swapFirstHalfElements(double &array[5000], int maxIndexToSwap) {
   double temp;
   for (int i = 0; i < maxIndexToSwap / 2; i++) {
      temp = array[maxIndexToSwap - 1 - i];
      array[maxIndexToSwap - 1 - i] = array[i];
      array[i] = temp;
   }
}

string getOrderTypeString(int ai_0) {
   switch (ai_0) {
   case 0:
      return ("BUY");
   case 2:
      return ("BUYLIMIT");
   case 4:
      return ("BUYSTOP");
   case 1:
      return ("SELL");
   case 3:
      return ("SELLLIMIT");
   case 5:
      return ("SELLSTOP");
   }
   return ("?");
}

string getDoubleString(double ad_0) {
   return (DoubleToStr(ad_0, 5));
}

string getDoubleString(double ad_0, int ai_8) {
   return (DoubleToStr(ad_0, ai_8));
}

double normalizeDouble(double ad_0) {
   return (NormalizeDouble(ad_0, 5));
}

string getFormattedValue(int ai_0) {
   if (ai_0 < 10) return ("00" + ai_0);
   if (ai_0 < 100) return ("0" + ai_0);
   return ("" + ai_0);
}

string getBoolString(bool ai_0) {
   if (ai_0) return ("true");
   return ("false");
}

double f0_44(double ad_0, double ad_8) {
   return (MathLog(ad_8) / MathLog(ad_0));
}

void printMessage(string as_0) {
   int li_8;
   int li_12 = -1;
   while (li_12 < StringLen(as_0)) {
      li_8 = li_12 + 1;
      li_12 = StringFind(as_0, 
      "\n", li_8);
      if (li_12 == -1) {
         Print(StringSubstr(as_0, li_8));
         return;
      }
      Print(StringSubstr(as_0, li_8, li_12 - li_8));
   }
}
