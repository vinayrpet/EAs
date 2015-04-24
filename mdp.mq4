//+------------------------------------------------------------------+
//|                                                          mdp.mq4 |
//|                                                    Vinayakumar B |
//|                                              vinayrpet@gmail.com |
//+------------------------------------------------------------------+
#property copyright "Vinayakumar B"
#property link      "vinayrpet@gmail.com"
#property version   "1.00"

#import "stdlib.ex4" 
   string ErrorDescription(int a0);

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
double baseBalance = 0.0;
bool hardStopTrailingEnabled = TRUE;
bool useStopOrdersEnabled = TRUE;
int maxOrders = 2;
// Order comment should not contain any special character or identifier like [sl], [tp] or 'partial close'"
string orderComment = "NewSystem_1.1.6";
// "================ Configuration";
bool enableDebug = FALSE;
bool printInfo = FALSE;
bool searchChannel_1 = TRUE;
bool searchChannel_2 = TRUE;
bool searchChannel_3 = TRUE;
bool searchChannel_4 = TRUE;
bool searchChannel_5 = TRUE;
//"---------------- Scalping Factors";
double spreadFactor = 15.0;
double maxSpread = 40.0;
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
double maxStopLevel = 20.0;
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
int channel1_period = 10;
double channel1_dev = 2.0;
int channel2_p1 = 1;
int channel2_p2 = 1;
int channel2_period = 30;
double channel2_dev = 2.0;
int channel3_p1 = 1;
int channel3_p2 = 5;
int channel3_period = 30;
double channel3_dev = 2.0;
int channel4_p1 = 5;
int channel4_p2 = 5;
int channel4_period = 10;
double channel4_dev = 2.0;
int channel5_p1 = 5;
int channel5_p2 = 5;
int channel5_period = 30;
double channel5_dev = 2.0;
int smartExit_period = 5;
double smartExit_dev = 2.0;
double bid_prices[2];
double ask_prices[2];
int tickCounts[2];
double pointValue = 1.0;
bool commissionRateFound = FALSE;
bool closeSlippagesUpdated = FALSE;
double commissionRate = 0.0;
double execTimes[100];
double totalExecTime = 0.0;
int execTimesCount = 0;
double openTimes[100];
double totalOpenTime = 0.0;
int openTimesCount = 0;
double modifyTimes[100];
double totalModifyTime = 0.0;
int modifyTimesCount = 0;
int requotes = 0;
double requoteValues[100];
double totalRequoteValues;
double openSlipValues[100];
double totalOpenslipValue;
double totalOpenslipPoints;
int openSlips = 0;
double closeSlippages[100];
double totalSlippageValue;
double totalSlippagePoints;
int closeSlippagesCount = 0;
double gda_840[10] = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
double gda_844[5000];
double gda_848[5000];
double gda_852[5000];
double gda_856[5000];
double gda_860[5000];
int currentBarOpenTime = 0;
int tickCountInCurrentBar = 0;
double spreads[200];
int spreadsCount = 0;
bool gi_880 = TRUE;
int gi_884 = 0;
double maxLoss = 0.0;
double totalLoss = 0.0;
int maxLossOrderTicket = 0;
int lossesCount = 0;
int lastErrorCode = 0/* NO_ERROR */;
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
string gs_1164;
int gia_1172[] = {0};
bool confValidated = FALSE;
double gda_1180[10] = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
string infoMessage = "";
double curChartHigh;
double curChartLow;
double curChartMovement;
double nextChartHigh;
double nextChartLow;
double nextChartMovement;
double channel1_band_high;
double channel1_band_low;
double channel2_band_high;
double channel2_band_low;
double channel3_band_high;
double channel3_band_low;
double channel4_band_high;
double channel4_band_low;
double channel5_band_high;
double channel5_band_low;
double smartexit_band_high;
double smartexit_band_low;
double smartexit_band_gap;
double smartexit_band_low_median;
double stopLevel;
double curSpread;
double avgSpread;
double gd_1376;
double gd_1384;
double gd_1392;
double realAvgSpread;
double recentRealAvgSpread;
int gi_1416;
int gi_1420 = 0;
int numOpenOrders = 0;
int gi_1428 = 0;
int gi_1432 = -1;
int gi_1436 = 0;
string debugMessage;
int expireTime;
int bandsShift;
int hlshift;
int gi_1460;
int gi_1464;
int gi_1468;
int gi_1472;
int curRequote = 0;
int lastRequote = 0;
int maxOrdersPerChannel;
int hstCheckInterval = 0;
bool initialized;
bool started;
bool gi_1500;
int gi_1504;
bool gi_1508;
bool relookVariables = FALSE;

int IMPORT(int ai_12, double ad_16, double ad_24, double ad_32,
   double ad_40, double ad_48, double ad_56, double ad_64, double ad_72,
   double ad_80, double ad_88, double ad_96, double ad_104, double ad_112,
   double ad_120, double ad_128, int ai_136, double ad_140, double ad_148,
   double ad_156, double ad_164, double ad_172, double ad_180, double ad_188,
   double ad_196, double ad_204, double &ada_212[], double &ada_216[]) {

   int li_228, li_232, li_236, li_240, li_244, li_248, li_252, li_256;
   double ld_268, ld_276, ld_284, ld_292, ld_300, ld_356, ld_364, ld_372, ld_380, ld_388, ld_396;
   double ld_404, ld_412, ld_420, ld_428, ld_436, ld_444, ld_452, ld_460, ld_468, ld_476, ld_484;
   double ld_492, ld_528, ld_552;
   int li_508, li_544, li_548, li_560;

   li_228 = -2;
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
         ld_268 += ad_104 * ld_380;
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
   ada_216[0] = 0;
   ada_216[1] = 0;
   ada_216[2] = 0;
   ada_216[3] = 0;
   ada_216[4] = 0;
   ada_216[5] = 0;
   ada_216[6] = 0;
   return (0);
}

int OnInit(){
   initialized = FALSE;
   started = FALSE;
   gi_1500 = FALSE;
   closeSlippagesUpdated = FALSE;
   ArrayInitialize(spreads, 0);
   ArrayInitialize(gda_844, 0);
   ArrayInitialize(gda_848, 0);
   ArrayInitialize(gda_852, 0);
   ArrayInitialize(gda_856, 0);
   ArrayInitialize(gda_860, 0);
   if (Digits < 5) Slippage = 0;
   spreadsCount = 0;
   // searchEntryChannels = MathMax(searchEntryChannels, 0);
   // searchEntryChannels = MathMin(searchEntryChannels, 8);
   switch (searchEntryChannels) {
   //   case 0:
   //      maxOrdersPerChannel = 1;
   //      gd_516 = 0;
   //      break;
   // Always it comes to this.
   case 1:
      maxOrdersPerChannel = 2;
      gd_516 = 20;
      break;
   //   case 2:
   //      maxOrdersPerChannel = 2;
   //      gd_516 = 7;
   //      break;
   //   case 3:
   //      maxOrdersPerChannel = 3;
   //      gd_516 = 5;
   //      break;
   //   case 4:
   //      maxOrdersPerChannel = 4;
   //      gd_516 = 4;
   //      break;
   //   case 5:
   //      maxOrdersPerChannel = 5;
   //      gd_516 = 3;
   //      break;
   //   case 6:
   //      maxOrdersPerChannel = 6;
   //      gd_516 = 2;
   //      break;
   //   case 7:
   //   case 8:
   //      maxOrdersPerChannel = 7;
   //      gd_516 = 1;
   }
   stopLevel = MarketInfo(Symbol(), MODE_STOPLEVEL) * Point;
   maxStopLevel = 20 * Point;

   if (!IsTesting()) reInitGlobalVariables();
   checkOrdersForClose();
   if (Period() != PERIOD_M1 && Period() != PERIOD_M5) {
      Print("ERROR --  " + "NewSystem_1.1.6" + " should be attached to The 1/5 Minute Chart Window");
      Comment("ERROR --  " + "NewSystem_1.1.6" + " should be attached to The 1/5 Minute Chart Window");
   } else {
      if (useStopOrdersEnabled && (!SupportECN) && stopLevel > maxStopLevel) {
         Print("ERROR --  " + "NewSystem_1.1.6" + " - Use_Stop_Orders is not valid, stop level (" + getDoubleString(stopLevel) + ") should not be greater than " +
            getDoubleString(maxStopLevel));
         Comment("ERROR --  " + "NewSystem_1.1.6" + " - Use_Stop_Orders is not valid, stop level (" + getDoubleString(stopLevel) + ") should not be greater than " +
            getDoubleString(maxStopLevel));
      } else {
         if (maxOrders <= 1 && SupportNFA) {
            Print("ERROR --  " + "NewSystem_1.1.6" + " - SupportNFA is not valid unless setting Max_Simultaneous_Orders >= 2");
            Comment("ERROR --  " + "NewSystem_1.1.6" + " - SupportNFA is not valid unless setting Max_Simultaneous_Orders >= 2");
         } else {
            if (hardStopTrailingEnabled && (!SupportECN) && SupportNFA) {
               Print("ERROR --  " + "NewSystem_1.1.6" + " - Hard_Stop_Trailing is not valid in conjunction with SupportNFA");
               Comment("ERROR --  " + "NewSystem_1.1.6" + " - Hard_Stop_Trailing is not valid in conjunction with SupportNFA");
            } else {
               if (Risk < 0.001 || Risk > 1000.0) {
                  Comment("ERROR -- Invalid Risk Value.");
                  Print("ERROR -- Invalid Risk Value.");
               } else {
                  confValidated = TRUE;
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

void OnTick(){
  start();
}

int start() {
   if (!confValidated) {
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
         prepareChannels(-1);
      }
      loadPrices(bid_prices, ask_prices, tickCounts);
      debugMessage = "";
      f0_3();
      if (SupportNFA) {
         if (searchChannel_1) {
            if (enableDebug) debugMessage = debugMessage + " CHANNEL 1:\n";
            f0_4(currentPeriod, channel1_p2, 0, 1, 2, gd_252, gd_260, gd_268, gd_276, gd_284, gd_924, gd_940, gd_932, gd_948, gd_956, gd_468, channel1_period, channel1_dev, gda_844);
         }
         if (searchChannel_2) {
            if (enableDebug) debugMessage = debugMessage + " CHANNEL 2:\n";
            f0_4(channel2_p1, channel2_p2, 3, 4, 5, gd_292, gd_300, gd_308, gd_316, gd_324, gd_964, gd_980, gd_972, gd_988, gd_996, gd_476, channel2_period, channel2_dev, gda_848);
         }
         if (searchChannel_3) {
            if (enableDebug) debugMessage = debugMessage + " CHANNEL 3:\n";
            f0_4(channel3_p1, channel3_p2, 6, 7, 8, gd_332, gd_340, gd_348, gd_356, gd_364, gd_1004, gd_1020, gd_1012, gd_1028, gd_1036, gd_484, channel3_period, channel3_dev, gda_852);
         }
         if (searchChannel_4) {
            if (enableDebug) debugMessage = debugMessage + " CHANNEL 4:\n";
            f0_4(channel4_p1, channel4_p2, 9, 10, 11, gd_372, gd_380, gd_388, gd_396, gd_404, gd_1044, gd_1060, gd_1052, gd_1068, gd_1076, gd_492, channel4_period, channel4_dev, gda_856);
         }
         if (searchChannel_5) {
            if (enableDebug) debugMessage = debugMessage + " CHANNEL 5:\n";
            f0_4(channel5_p1, channel5_p2, 12, 13, 14, gd_412, gd_420, gd_428, gd_436, gd_444, gd_1084, gd_1100, gd_1092, gd_1108, gd_1116, gd_500, channel5_period, channel5_dev, gda_860);
         }
      } else {
         if (searchChannel_5) {
            if (enableDebug) debugMessage = debugMessage + " CHANNEL 5:\n";
            f0_4(channel5_p1, channel5_p2, 12, 13, 14, gd_412, gd_420, gd_428, gd_436, gd_444, gd_1084, gd_1100, gd_1092, gd_1108, gd_1116, gd_500, channel5_period, channel5_dev, gda_860);
         }
         if (searchChannel_4) {
            if (enableDebug) debugMessage = debugMessage + " CHANNEL 4:\n";
            f0_4(channel4_p1, channel4_p2, 9, 10, 11, gd_372, gd_380, gd_388, gd_396, gd_404, gd_1044, gd_1060, gd_1052, gd_1068, gd_1076, gd_492, channel4_period, channel4_dev, gda_856);
         }
         if (searchChannel_2) {
            if (enableDebug) debugMessage = debugMessage + " CHANNEL 2:\n";
            f0_4(channel2_p1, channel2_p2, 3, 4, 5, gd_292, gd_300, gd_308, gd_316, gd_324, gd_964, gd_980, gd_972, gd_988, gd_996, gd_476, channel2_period, channel2_dev, gda_848);
         }
         if (searchChannel_1) {
            if (enableDebug) debugMessage = debugMessage + " CHANNEL 1:\n";
            f0_4(currentPeriod, channel1_p2, 0, 1, 2, gd_252, gd_260, gd_268, gd_276, gd_284, gd_924, gd_940, gd_932, gd_948, gd_956, gd_468, channel1_period, channel1_dev, gda_844);
         }
         if (searchChannel_3) {
            if (enableDebug) debugMessage = debugMessage + " CHANNEL 3:\n";
            f0_4(channel3_p1, channel3_p2, 6, 7, 8, gd_332, gd_340, gd_348, gd_356, gd_364, gd_1004, gd_1020, gd_1012, gd_1028, gd_1036, gd_484, channel3_period, channel3_dev, gda_852);
         }
      }
      Comment("Searching for An Entry...");
   } else Comment("");
   return (0);
}

void prepareChannels(int prevCount) {
   int li_4;
   int li_8;
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
      for (int li_20 = 0; li_20 < prevCount || gda_844[gi_1152 - 1] == 0.0; li_20++) {
         li_8 = f0_2(currentPeriod, channel1_p2, gd_252, gd_260, gd_268, gd_276, gd_284, gd_924, gd_940, gd_932, gd_948, gd_956, gd_468, channel1_period, channel1_dev, gda_844);
         if (!(li_8)) break;
      }
      if (prevCount == -1) {
         li_4 = popLast(gda_844, gi_1152);
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
      for (li_20 = 0; li_20 < prevCount || gda_848[gi_1152 - 1] == 0.0; li_20++) {
         li_8 = f0_2(channel2_p1, channel2_p2, gd_292, gd_300, gd_308, gd_316, gd_324, gd_964, gd_980, gd_972, gd_988, gd_996, gd_476, channel2_period, channel2_dev, gda_848);
         if (!(li_8)) break;
      }
      if (prevCount == -1) {
         li_4 = popLast(gda_848, gi_1152);
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
      for (li_20 = 0; li_20 < prevCount || gda_852[gi_1152 - 1] == 0.0; li_20++) {
         li_8 = f0_2(channel3_p1, channel3_p2, gd_332, gd_340, gd_348, gd_356, gd_364, gd_1004, gd_1020, gd_1012, gd_1028, gd_1036, gd_484, channel3_period, channel3_dev, gda_852);
         if (!(li_8)) break;
      }
      if (prevCount == -1) {
         li_4 = popLast(gda_852, gi_1152);
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
      for (li_20 = 0; li_20 < prevCount || gda_856[gi_1152 - 1] == 0.0; li_20++) {
         li_8 = f0_2(channel4_p1, channel4_p2, gd_372, gd_380, gd_388, gd_396, gd_404, gd_1044, gd_1060, gd_1052, gd_1068, gd_1076, gd_492, channel4_period, channel4_dev, gda_856);
         if (!(li_8)) break;
      }
      if (prevCount == -1) {
         li_4 = popLast(gda_856, gi_1152);
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
      for (li_20 = 0; li_20 < prevCount || gda_860[gi_1152 - 1] == 0.0; li_20++) {
         li_8 = f0_2(channel5_p1, channel5_p2, gd_412, gd_420, gd_428, gd_436, gd_444, gd_1084, gd_1100, gd_1092, gd_1108, gd_1116, gd_500, channel5_period, channel5_dev, gda_860);
         if (!(li_8)) break;
      }
      if (prevCount == -1) {
         li_4 = popLast(gda_860, gi_1152);
         swapFirstHalfElements(gda_860, li_4 + 1);
      }
   }
}

int f0_2(int period, int hlperiod, double ad_8, double ad_16, double ad_24,
      double ad_32, double ad_40, double ad_48, double ad_56, double ad_64,
      double ad_72, double ad_80, double ad_88, int ai_96, double ad_100, double &ada_108[5000]) {

   if (hlperiod % period != 0 && period % hlperiod != 0) {
      Print("ERROR hlperiod%period!=0 && period%hlperiod!=0   hlperiod:" + hlperiod + "  period:" + period);
      return (0);
   }
   double ld_112 = gd_508;
   double ld_120 = Point * ad_88;
   double ld_128 = Point * gd_452;
   double trailingPips = Point * Trailing_Pips;
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
   IMPORT(0, ad_24, ad_8, ad_16, spreadFactor, maxSpread, ad_32, gd_508, ad_40, ad_48, ad_56, ad_64, ad_72, gd_1124, ad_80, gd_1132, -2, lowerBand,
      upperBand, ld_112, ld_128, trailingPips, 15 * Point, Point, hl_high, hl_diff, ada_108, gda_1180);
   gda_1180[7] = 0;
   gda_1180[8] = hl_low;
   gda_1180[9] = gi_1152;
   IMPORT(0, ad_24, ad_8, ad_16, spreadFactor, maxSpread, ad_32, gd_508, ad_40, ad_48, ad_56, ad_64, ad_72, gd_1124, ad_80, gd_1132, -2, lowerBand,
      upperBand, ld_112, ld_128, trailingPips, 15 * Point, Point, hl_low, hl_diff, ada_108, gda_1180);
   if (period < hlperiod) {
      bandsShift++;
      gi_1460++;
      if (gi_1460 % (hlperiod / period) == FALSE) {
         hlshift++;
         gi_1464++;
      }
   } else {
      if (period > hlperiod) {
         hlshift++;
         gi_1464++;
         if (gi_1464 % (period / hlperiod) == FALSE) {
            bandsShift++;
            gi_1460++;
         }
      } else {
         bandsShift++;
         gi_1460++;
         hlshift++;
         gi_1464++;
      }
   }
   return (1);
}

void f0_3() {
   int ticket;
   string ticketVariable;
   bool isEntryExitConditionFailed;
   string message;
   double ecnConditionValue;
   double idealSpread;
   double currentSpreadGap;
   double tradingFrequency;
   int ordersCount;
   int orders[];
   int curTicket;
   int li_96;
   int li_100;
   int lia_104[];
   string ls_108;
   if (GlobalVariableGet(getGlobalPrefix() + "Reset") != 0.0) {
      reset();
      reInitGlobalVariables();
   }
   if (!IsTesting())
      checkOrdersForClose();
   if (currentBarOpenTime < Time[0]) {
      currentBarOpenTime = Time[0];
      tickCountInCurrentBar = 0;
      if (gi_1500) prepareChannels(1);
      else gi_1500 = TRUE;
      if (!IsTesting()) setGlobalVars();
   } else tickCountInCurrentBar++;
   if (printInfo)
      printOrders();
   if (AccountFreeMargin() != AccountBalance() && AccountBalance() != 0.0) {
      int stopoutLevel = AccountStopoutLevel();
      message = "Leverage:" + AccountLeverage();
      if (AccountStopoutMode() == 0)
         message = message + "  StopOut level:" + stopoutLevel + "%";
      else
         message = message + "  StopOut level:" + stopoutLevel + AccountCurrency();
      message = message + "   free margin:" + getDoubleString(AccountFreeMargin() * AccountLeverage(), 2) +
         " balance:" + getDoubleString(AccountBalance(), 2) +
         " margin%:" + getDoubleString(100.0 * (AccountFreeMargin() * AccountLeverage()) / AccountBalance(), 2) +
         "%\n";
   }
   infoMessage = "";
   gi_1504 = gi_1508;
   gi_1508 = FALSE;
   lastErrorCode = 0;
   curSpread = Ask - Bid;
   if (MarketInfo(Symbol(), MODE_LOTSTEP) == 0.0)
      gi_1416 = 5;
   else gi_1416 = f0_44(0.1, MarketInfo(Symbol(), MODE_LOTSTEP));
   if (Period() == PERIOD_M1) {
      nextChartHigh = iHigh(Symbol(), PERIOD_M5, 0);
      nextChartLow = iLow(Symbol(), PERIOD_M5, 0);
      nextChartMovement = nextChartHigh - nextChartLow;
      curChartHigh = iHigh(Symbol(), PERIOD_M1, 0);
      curChartLow = iLow(Symbol(), PERIOD_M1, 0);
      curChartMovement = curChartHigh - curChartLow;
   }
   if (Period() == PERIOD_M5) {
      nextChartHigh = iHigh(Symbol(), PERIOD_M15, 0);
      nextChartLow = iLow(Symbol(), PERIOD_M15, 0);
      nextChartMovement = nextChartHigh - nextChartLow;
      curChartHigh = iHigh(Symbol(), PERIOD_M5, 0);
      curChartLow = iLow(Symbol(), PERIOD_M5, 0);
      curChartMovement = curChartHigh - curChartLow;
   }
   if (tickCountInCurrentBar == 0) {
      channel1_band_high = iBands(Symbol(), currentPeriod, channel1_period, channel1_dev, 0, PRICE_OPEN, MODE_UPPER, 0);
      channel1_band_low = iBands(Symbol(), currentPeriod, channel1_period, channel1_dev, 0, PRICE_OPEN, MODE_LOWER, 0);
      channel2_band_high = iBands(Symbol(), currentPeriod, channel2_period, channel2_dev, 0, PRICE_OPEN, MODE_UPPER, 0);
      channel2_band_low = iBands(Symbol(), currentPeriod, channel2_period, channel2_dev, 0, PRICE_OPEN, MODE_LOWER, 0);
      channel3_band_high = iBands(Symbol(), currentPeriod, channel3_period, channel3_dev, 0, PRICE_OPEN, MODE_UPPER, 0);
      channel3_band_low = iBands(Symbol(), currentPeriod, channel3_period, channel3_dev, 0, PRICE_OPEN, MODE_LOWER, 0);
      channel4_band_high = iBands(Symbol(), currentPeriod, channel4_period, channel4_dev, 0, PRICE_OPEN, MODE_UPPER, 0);
      channel4_band_low = iBands(Symbol(), currentPeriod, channel4_period, channel4_dev, 0, PRICE_OPEN, MODE_LOWER, 0);
      channel5_band_high = iBands(Symbol(), currentPeriod, channel5_period, channel5_dev, 0, PRICE_OPEN, MODE_UPPER, 0);
      channel5_band_low = iBands(Symbol(), currentPeriod, channel5_period, channel5_dev, 0, PRICE_OPEN, MODE_LOWER, 0);
      smartexit_band_high = iBands(Symbol(), currentPeriod, smartExit_period, smartExit_dev, 0, PRICE_OPEN, MODE_UPPER, 0);
      smartexit_band_low = iBands(Symbol(), currentPeriod, smartExit_period, smartExit_dev, 0, PRICE_OPEN, MODE_LOWER, 0);
      smartexit_band_gap = smartexit_band_high - smartexit_band_low;
      smartexit_band_low_median = smartexit_band_low + smartexit_band_gap / 2.0;
   }
   if (!commissionRateFound) {
      for (int i = OrdersTotal() - 1; i >= 0 && !commissionRateFound; i--) {
         if(OrderSelect(i, SELECT_BY_POS, MODE_TRADES)){
           findCommissionRate();
         }
      }
   }
   if (!commissionRateFound) {
      for (i = OrdersHistoryTotal() - 1; i >= 0 && !commissionRateFound; i--) {
         if(OrderSelect(i, SELECT_BY_POS, MODE_HISTORY)){
           findCommissionRate();
         }
      }
   }
   if (!closeSlippagesUpdated) {
      // find close slippages for closed orders of same EA
      for (i = OrdersTotal() - 1; i >= 0 && closeSlippagesCount < 100; i--) {
         if(OrderSelect(i, SELECT_BY_POS, MODE_TRADES)){
           if (OrderSymbol() == Symbol() 
               && (StringFind(OrderComment(), "NewSystem") >= 0 || OrderComment() == orderComment || OrderMagicNumber() == Magic))
            updateCloseSlippages();
         }
      }
      for (i = OrdersHistoryTotal() - 1; i >= 0 && closeSlippagesCount < 100; i--) {
         if(OrderSelect(i, SELECT_BY_POS, MODE_HISTORY)){
           if (OrderSymbol() == Symbol() 
              && (StringFind(OrderComment(), "NewSystem") >= 0 || OrderComment() == orderComment || OrderMagicNumber() == Magic))
            updateCloseSlippages();
         }
      }
      // find close slippages for closed orders of same symbol
      for (i = OrdersTotal() - 1; i >= 0 && closeSlippagesCount < 100; i--) {
         if(OrderSelect(i, SELECT_BY_POS, MODE_TRADES)){
           if (OrderSymbol() == Symbol())
            updateCloseSlippages();
         }
      }
      for (i = OrdersHistoryTotal() - 1; i >= 0 && closeSlippagesCount < 100; i--) {
         if(OrderSelect(i, SELECT_BY_POS, MODE_HISTORY)){
           if (OrderSymbol() == Symbol())
            updateCloseSlippages();
         }
      }
      closeSlippagesUpdated = TRUE;
   }

   ArrayCopy(spreads, spreads, 0, 1, 199);
   spreads[199] = curSpread;
   if (spreadsCount < 200) spreadsCount++;
   double totalSpread = 0;
   double totalRecentSpread = 0;
   int recentSpreadCount = MathMin(spreadsCount, 5);
   i = 199;
   for (int j = 0; j < spreadsCount; j++) {
      totalSpread += spreads[i];
      i--;
   }
   i = 199;
   for (j = 0; j < recentSpreadCount; j++) {
      totalRecentSpread += spreads[i];
      i--;
   }
   avgSpread = totalSpread / spreadsCount;
   double recentAvgSpread = totalRecentSpread / recentSpreadCount;
   totalOpenslipValue = 0;
   totalOpenslipPoints = 0;
   totalSlippageValue = 0;
   totalSlippagePoints = 0;
   totalExecTime = 0;
   totalOpenTime = 0;
   totalModifyTime = 0;
   totalRequoteValues = 0;
   for (i = 0; i < 100; i++) {
      totalOpenslipValue += openSlipValues[i];
      totalOpenslipPoints += MathAbs(openSlipValues[i]);
      totalSlippageValue += closeSlippages[i];
      totalSlippagePoints += MathAbs(closeSlippages[i]);
      totalExecTime += execTimes[i];
      totalOpenTime += openTimes[i];
      totalModifyTime += modifyTimes[i];
      totalRequoteValues += requoteValues[i];
   }
   if (!commissionRateFound && avgSpread < 15 * Point) commissionRate = 15 * Point - avgSpread;
   gd_1384 = normalizeDouble(Ask + commissionRate);
   gd_1392 = normalizeDouble(Bid - commissionRate);
   realAvgSpread = avgSpread + commissionRate;
   recentRealAvgSpread = recentAvgSpread + commissionRate;
   string ls_160 = "";
   string ls_168 = "";
   string ls_176 = "";
   string ls_184 = "";
   string ls_192 = "";
   int li_200 = 0;
   if (!IsTesting()) {
      if (openSlips > 0 || stopLevel > maxStopLevel) {
         isEntryExitConditionFailed = FALSE;
         if (openSlips > 0) {
            if (totalOpenslipValue / openSlips <= 10.0 && stopLevel <= maxStopLevel) {
               ls_160 = ls_160 + " ECN Entry Conditions met";
               if (SupportECN) {
                  useStopOrdersEnabled = 1;
                  ls_160 = ls_160 + " (Use_Stop_Orders adjusted)";
               } else
                  if (!useStopOrdersEnabled) ls_160 = ls_160 + ", Use_Stop_Orders is recommended";
               ls_160 = ls_160 + " :  Open Slip <= 10    stop level (" + getDoubleString(stopLevel) + ") <= " + getDoubleString(maxStopLevel);
               ls_160 = ls_160 
               + "\n";
            } else isEntryExitConditionFailed = TRUE;
         } else isEntryExitConditionFailed = TRUE;
         if (isEntryExitConditionFailed) {
            li_200 = 1;
            ls_160 = ls_160 + "!ECN Entry Conditions failed";
            if (SupportECN && (stopLevel > maxStopLevel || openSlips >= 15)) {
               useStopOrdersEnabled = 0;
               ls_160 = ls_160 + " (Use_Stop_Orders adjusted)";
            } else {
               if (useStopOrdersEnabled) {
                  ls_160 = ls_160 + ", Use_Stop_Orders is NOT recommended";
                  if (SupportECN) ls_160 = ls_160 + " (auto-adjusted in " + ((15 - openSlips)) + ")";
               }
            }
            ls_160 = ls_160 + " : ";
            if (openSlips > 0) {
               if (totalOpenslipValue / openSlips > 10.0) {
                  ls_160 = ls_160 + " Open Slip > 10";
                  ls_160 = ls_160 + "    ";
               }
            }
            if (stopLevel > maxStopLevel) ls_160 = ls_160 + "stop level (" + getDoubleString(stopLevel) + ") > " + getDoubleString(maxStopLevel);
            ls_160 = ls_160 
            + "\n";
         }
      }
      if (closeSlippagesCount > 0 || SupportNFA) {
         isEntryExitConditionFailed = FALSE;
         if (closeSlippagesCount > 0) {
            if (totalSlippageValue / closeSlippagesCount <= 10.0 && (!SupportNFA)) {
               ls_168 = ls_168 + " ECN Exit Conditions met";
               if (SupportECN) {
                  hardStopTrailingEnabled = 1;
                  ls_168 = ls_168 + " (Hard_Stop_Trailing adjusted)";
               } else
                  if (!hardStopTrailingEnabled) ls_168 = ls_168 + ", Hard_Stop_Trailing is recommended";
               ls_168 = ls_168 + " : Close Slip <= 10    SupportNFA = false";
               ls_168 = ls_168 
               + "\n";
            } else isEntryExitConditionFailed = TRUE;
         } else isEntryExitConditionFailed = TRUE;
         if (isEntryExitConditionFailed) {
            li_200 = 1;
            ls_168 = ls_168 + "!ECN Exit Conditions failed";
            if (SupportECN && (SupportNFA || closeSlippagesCount >= 15)) {
               hardStopTrailingEnabled = 0;
               ls_168 = ls_168 + " (Hard_Stop_Trailing adjusted)";
            } else {
               if (hardStopTrailingEnabled) {
                  ls_168 = ls_168 + ", Hard_Stop_Trailing is NOT recommended";
                  if (SupportECN) ls_168 = ls_168 + " (auto-adjusted in " + ((15 - closeSlippagesCount)) + ")";
               }
            }
            ls_168 = ls_168 + " : ";
            isEntryExitConditionFailed = FALSE;
            if (closeSlippagesCount > 0) {
               if (totalSlippageValue / closeSlippagesCount > 10.0) {
                  ls_168 = ls_168 + " Close Slip > 10";
                  ls_168 = ls_168 + "    ";
               }
            }
            if (SupportNFA) ls_168 = ls_168 + "SupportNFA = true";
            ls_168 = ls_168 
            + "\n";
         }
      }
      if (modifyTimesCount > 0) {
         if (totalModifyTime / modifyTimesCount <= 1000.0) ls_176 = " ECN Condition for order modification time met : " + getDoubleString(totalModifyTime / modifyTimesCount, 0) + "ms <= 1000ms\n";
         else {
            message = "";
            if (maxOrders >= 5) message = " ( setting lower Max_Simultaneous_Orders may help ) ";
            li_200 = 1;
            ls_176 = "!ECN Condition for order modification time failed" + message + " : " + getDoubleString(totalModifyTime / modifyTimesCount, 0) + "ms > 1000ms\n";
         }
      }
      if (requotes > 0) {
         ecnConditionValue = totalRequoteValues / (5 * requotes);
         if (ecnConditionValue <= 0.1) ls_184 = " ECN Condition for requotes met : " + getDoubleString(100.0 * ecnConditionValue, 0) + "% <= 10% of possible requote errors\n";
         else {
            message = "";
            if (maxOrders >= 5) message = " ( setting lower Max_Simultaneous_Orders may help ) ";
            li_200 = 1;
            ls_184 = "!ECN Condition for requotes failed" + message + " : " + getDoubleString(100.0 * ecnConditionValue, 1) + "% > 10% of possible requote errors\n";
         }
      }
      if (realAvgSpread <= Point * maxSpread) {
         idealSpread = maxSpread - spreadFactor;
         currentSpreadGap = MathMin(idealSpread, MathMax(maxSpread - realAvgSpread / Point, 0));
         tradingFrequency = 90.0 * (MathPow(currentSpreadGap, 1.5) / MathPow(idealSpread, 1.5)) + 10.0;
      } else tradingFrequency = 0;
      if (realAvgSpread <= 20 * Point)
         ls_192 = " ECN Condition of low spread met : realAvgSpread <= " + getDoubleString(20 * Point) 
                 + "    spread strength (affecting trading frequency):" + getDoubleString(tradingFrequency, 0)
                 + "% (higher is better)\n";
      else {
         li_200 = 1;
         ls_192 = "!ECN Condition of low spread failed : realAvgSpread > " + getDoubleString(20 * Point) 
                 + "    spread strength (affecting trading frequency):" + getDoubleString(tradingFrequency, 0)
                 + "% (higher is better)\n";
      }
   }
   if ((relookVariables || (message != "" && tickCountInCurrentBar == 0)) && (!IsTesting())) {
      ordersCount = 0;
      for (i = 0; i <= 14; i++) {
         for (j = 1; j <= maxOrdersPerChannel; j++) {
            if (!checkOrderNotExists(i, j)) {
               ticketVariable = getGlobalPrefix() + i + "," + j;
               ticket = GlobalVariableGet(ticketVariable);
               ArrayResize(orders, ordersCount + 1);
               orders[ordersCount] = ticket;
               ordersCount++;
            }
         }
      }
      if (ordersCount > 0) ArraySort(orders);
      for (i = OrdersTotal() - 1; i >= 0; i--) {
         if (OrderSelect(i, SELECT_BY_POS, MODE_TRADES)==FALSE ) continue ;
         if (OrderSymbol() == Symbol() && OrderMagicNumber() == Magic && OrderCloseTime() == 0) {
            ticket = OrderTicket();
            for (j = 0; j < ordersCount; j++) {
               curTicket = orders[j];
               if (ticket < curTicket) j = ordersCount - 1;
               else
                  if (ticket == curTicket) break;
            }
            if (j >= ordersCount) {
               if (ordersCount < 15 * maxOrdersPerChannel) {
                  for (j = 0; j <= 14; j++) {
                     for (int k = 1; k <= maxOrdersPerChannel; k++) {
                        if (checkOrderNotExists(j, k)) {
                           ticketVariable = getGlobalPrefix() + j + "," + k;
                           GlobalVariableSet(ticketVariable, ticket);
                           GlobalVariableSet(ticketVariable + "PriceProcessed", 1);
                           GlobalVariableSet(ticketVariable + "USO", useStopOrdersEnabled);
                           GlobalVariableSet(ticketVariable + "HST", hardStopTrailingEnabled);
                           GlobalVariableSet(ticketVariable + "SL", 0);
                           GlobalVariableSet(ticketVariable + "TP", 0);
                           GlobalVariableSet(ticketVariable + "Price", 0);
                           ArrayResize(orders, ordersCount + 1);
                           orders[ordersCount] = ticket;
                           ordersCount++;
                           Print("Order #" + ticket + " recovered using Magic:" + Magic + " index:" + j + " subindex:" + k);
                           j = 14;
                           k = maxOrdersPerChannel;
                        }
                     }
                  }
                  continue;
               }
               Print("Closing order #" + ticket + " using Magic:" + Magic);
               closeOrderWithTicket(ticket);
            }
         }
      }
      relookVariables = FALSE;
   }
   numOpenOrders = 0;
   gi_1432 = -1;
   gi_1436 = 0;
   if ((!IsTesting()) || !gi_1140 || gi_1504) {
      if (SupportNFA) {
         li_96 = -1;
         for (i = 14; i >= 0; i--) {
            for (j = 1; j <= maxOrdersPerChannel; j++) {
               ticketVariable = getGlobalPrefix() + i + "," + j;
               ticket = GlobalVariableGet(ticketVariable);
               if (li_96 < ticket)
                  if (f0_6(i, j) != 0) li_96 = ticket;
            }
         }
         if (li_96 >= 0) {
            Print(tickCountInCurrentBar + ": Closing SupportNFA Orders...");
            li_100 = 0;
            for (i = 0; i <= 14; i++) {
               for (j = 1; j <= maxOrdersPerChannel; j++) {
                  ticketVariable = getGlobalPrefix() + i + "," + j;
                  ticket = GlobalVariableGet(ticketVariable);
                  if (ticket <= li_96) {
                     ArrayResize(lia_104, li_100 + 1);
                     lia_104[li_100] = ticket;
                     li_100++;
                     GlobalVariableSet("ClosedManually#" + ticket, 1);
                  }
               }
            }
            ArraySort(lia_104);
            for (i = 0; i < li_100; i++) closeOrderWithTicket(lia_104[i]);
         }
      } else {
         for (i = 0; i <= 14; i++) {
            for (j = 1; j <= maxOrdersPerChannel; j++)
               if (f0_6(i, j) != 0) f0_9(i, j);
         }
      }
      for (i = 0; i <= 14; i++) {
         for (j = 1; j <= maxOrdersPerChannel; j++) {
            ticketVariable = getGlobalPrefix() + i + "," + j;
            ticket = GlobalVariableGet(ticketVariable);
            if (OrderSelect(ticket, SELECT_BY_TICKET) && OrderCloseTime() == 0)
              updateOpenOrder(OrderType());
         }
      }
   }
   if ((!IsTesting()) || printInfo) {
      ls_108 = TimeToStr(TimeCurrent()) + " tick:" + getFormattedValue(tickCountInCurrentBar) +
             "  base balance:" + getDoubleString(baseBalance, 2)+"\n"+
             "  NumOrders_Level: 0  Search_Entry_Channels:" + searchEntryChannels + 
             "  Max.Sim.:" + maxOrders + "  Use_Stop_Orders:" + getBoolString(useStopOrdersEnabled) + 
             "  Hard_Stop_Trailing:" + getBoolString(hardStopTrailingEnabled) + 
             "  SupportNFA:" + getBoolString(SupportNFA)+ "\n" +
             "  Bid:" + getDoubleString(Bid) + " Ask:" + getDoubleString(Ask) +
             "  avgSpread:" + getDoubleString(avgSpread) +
             "  Commission rate:" + getDoubleString(commissionRate)+
             "  Real avg. spread:" + getDoubleString(realAvgSpread)+ 
             "  ( recent:" + getDoubleString(recentRealAvgSpread) + " )\n";
      if (lossesCount != 0) {
         ls_108 = ls_108 + " Avg Loss:" + getDoubleString(totalLoss / lossesCount, 2) + "%"+
                 "  Max Loss:" + getDoubleString(maxLoss, 2) +"% at order #" + maxLossOrderTicket + "\n";
      }
      if (execTimesCount != 0) {
         ls_108 = ls_108 + " Avg. Exec. Time:" + getDoubleString(totalExecTime / execTimesCount, 0) + "ms";
         if (openTimesCount != 0)
            ls_108 = ls_108 + "   Avg. Open Time:" + getDoubleString(totalOpenTime / openTimesCount, 0) + "ms";
         if (modifyTimesCount != 0)
            ls_108 = ls_108 + "   Avg. Modify Time:" + getDoubleString(totalModifyTime / modifyTimesCount, 0) + "ms";
         if (requotes != 0)
            ls_108 = ls_108 + "   Avg. Num. Requotes:" + getDoubleString(totalRequoteValues / requotes, 2) + " per transaction\n";
      }
      if (openSlips != 0) {
         ls_108 = ls_108 + " Avg. Open Slip.:" + getDoubleString(totalOpenslipPoints / openSlips, 0) + 
                  "  (signed):" + getDoubleString(totalOpenslipValue / openSlips, 0);
      }
      if (closeSlippagesCount != 0)
         ls_108 = ls_108 + " Avg. Close Slip.:" + getDoubleString(totalSlippagePoints / closeSlippagesCount, 0) + 
                 "  (signed):" + getDoubleString(totalSlippageValue / closeSlippagesCount, 0);
      if (lossesCount || execTimesCount || openSlips || closeSlippagesCount) {
         ls_108 = ls_108 + "\n\n";
      }
      if (enableDebug) {
         ls_108 = ls_108 + " Diagnostics :      ( ! marks warning, still trading unless otherwise mentioned )"
         + "\n\n";
         ls_108 = ls_108 + ls_160;
         ls_108 = ls_108 + ls_168;
         ls_108 = ls_108 + ls_176;
         ls_108 = ls_108 + ls_184;
         ls_108 = ls_108 + ls_192;
      }
      if (normalizeDouble(realAvgSpread) > normalizeDouble(Point * maxSpread)) {
         ls_108 = "\n!Robot is OFF :: Real avg. spread is too high for this scalping strategy ( " + getDoubleString(realAvgSpread) +
                  " > " + getDoubleString(Point * maxSpread) + " )\n";
      } else {
         if (normalizeDouble(recentRealAvgSpread) > normalizeDouble(Point * maxSpread)) {
            ls_108 = ls_108 
            + "\n";
            ls_108 = ls_108 + "!Robot is OFF :: Real avg. (recent) spread is too high for this scalping strategy ( " + getDoubleString(recentRealAvgSpread) + " > " + getDoubleString(Point * maxSpread) + " )" 
            + "\n";
         }
      }
      debugMessage = debugMessage + ls_108;
   }
}

void f0_4(int period_1, int period_2, int channelId_1, int channelId_2, int channelId_3, double ad_24,
      double ad_32, double ad_40, double ad_48, double ad_56, double ad_64, double ad_72,
      double ad_80, double ad_88, double ad_96, double trailing, int ai_112, double ad_116,
      double &ada_124[5000]) {
   int ticket;
   string ticketVariableName;
   double ld_140;
   double ld_148;
   double p2high;
   double p2low;
   double p2Movement;
   double ld_184;
   double ld_192;
   int li_200;
   double ld_204;
   int li_212;
   double ld_216;
   string info;
   bool doRetry;
   if (Period() == PERIOD_M1) {
      if (period_2 == 5) {
         p2high = nextChartHigh;
         p2low = nextChartLow;
         p2Movement = nextChartMovement;
      } else {
         p2high = curChartHigh;
         p2low = curChartLow;
         p2Movement = curChartMovement;
      }
   }
   if (Period() == PERIOD_M5) {
      if (period_2 == 15) {
         p2high = nextChartHigh;
         p2low = nextChartLow;
         p2Movement = nextChartMovement;
      } else {
         p2high = curChartHigh;
         p2low = curChartLow;
         p2Movement = curChartMovement;
      }
   }
   switch (channelId_1) {
   case 0:
      ld_140 = channel1_band_high;
      ld_148 = channel1_band_low;
      break;
   case 3:
      ld_140 = channel2_band_high;
      ld_148 = channel2_band_low;
      break;
   case 6:
      ld_140 = channel3_band_high;
      ld_148 = channel3_band_low;
      break;
   case 9:
      ld_140 = channel4_band_high;
      ld_148 = channel4_band_low;
      break;
   case 12:
      ld_140 = channel5_band_high;
      ld_148 = channel5_band_low;
   }
   double ld_240 = ld_140 - ld_148;
   double ld_248 = ld_148 + ld_240 / 2.0;
   double ld_256 = gd_508;
   double trailingPoints = Point * trailing;
   double ld_272 = Point * gd_452;
   double ld_280 = ld_272;
   double ld_288 = Point * Trailing_Pips;
   trailingPoints = MathMax(trailingPoints, stopLevel);
   if (gi_1144) {
      gda_1180[7] = 0;
      gda_1180[8] = 0;
      gda_1180[9] = gi_1152;
      IMPORT(0, ad_40, ad_24, ad_32, spreadFactor, maxSpread, ad_48, gd_508, ad_56, ad_64, ad_72, ad_80, ad_88, gd_1124, ad_96, gd_1132, -2, ld_148,
         ld_140, ld_256, ld_272, ld_288, realAvgSpread, Point, Bid, p2Movement, ada_124, gda_1180);
      ld_184 = gda_1180[0];
      ld_192 = gda_1180[1];
      li_200 = gda_1180[2];
      ld_204 = gda_1180[3];
      ld_256 = gda_1180[4];
      ld_272 = gda_1180[5];
      ld_288 = gda_1180[6];
      gda_840[channelId_1 / 3] = ld_204;
   } else gda_840[channelId_1 / 3] = 0;
   double ld_296 = gd_508;
   double ld_304 = Point * gd_452;
   double ld_312 = Point * Trailing_Pips;
   if (gi_1148) {
      gda_1180[7] = 0;
      gda_1180[8] = 0;
      gda_1180[9] = gi_1152;
      IMPORT(1, ad_40, ad_24, ad_32, spreadFactor, maxSpread, ad_48, gd_508, ad_56, ad_64, ad_72, ad_80, ad_88, gd_1124, ad_96, gd_1132, -2, ld_148,
         ld_140, ld_296, ld_304, ld_312, realAvgSpread, Point, Bid, p2Movement, ada_124, gda_1180);
      li_212 = gda_1180[2];
      ld_216 = gda_1180[3];
      ld_296 = gda_1180[4];
      ld_304 = gda_1180[5];
      ld_312 = gda_1180[6];
      gda_840[channelId_1 / 3 * 2] = ld_216;
   } else gda_840[channelId_1 / 3 * 2] = 0;
   if (Bid == 0.0 || MarketInfo(Symbol(), MODE_LOTSIZE) == 0.0) {
      ld_204 = 0;
      ld_216 = 0;
   } else {
      ld_204 = MathMax(10 * Point, MathMax(stopLevel, ld_204));
      ld_216 = MathMax(10 * Point, MathMax(stopLevel, ld_216));
   }
   if (gi_880) expireTime = TimeCurrent() + 60.0 * MathMax(10 * period_1, 60);
   else expireTime = 0;
   gi_1420 = 0;
   gi_1428 = 0;
   int li_320 = 0;
   int li_324 = 0;
   int li_328 = 0;
   if ((!IsTesting()) || !gi_1140 || gi_1504) {
      for (int li_332 = 1; li_332 <= maxOrdersPerChannel; li_332++) {
         if (gi_1144) {
            ticketVariableName = getGlobalPrefix() + channelId_1 + "," + li_332;
            ticket = GlobalVariableGet(ticketVariableName);
            if (OrderSelect(ticket, SELECT_BY_TICKET)) {
               li_320++;
               if (TimeCurrent() - OrderOpenTime() < 180) gi_1428++;
               if (OrderCloseTime() == 0) f0_18(channelId_1, li_332, ld_148, ld_140, ld_248, ld_204, trailingPoints, ld_272, ld_280, ld_288, ld_256);
            }
         }
         if (gi_1148) {
            ticketVariableName = getGlobalPrefix() + channelId_3 + "," + li_332;
            ticket = GlobalVariableGet(ticketVariableName);
            if (OrderSelect(ticket, SELECT_BY_TICKET)) {
               li_328++;
               if (TimeCurrent() - OrderOpenTime() < 180) gi_1428++;
               if (OrderCloseTime() == 0) f0_18(channelId_3, li_332, ld_148, ld_140, ld_248, ld_216, trailingPoints, ld_304, ld_280, ld_312, ld_296);
            }
         }
      }
   }
   string ls_336 = "";
   double ld_344 = 0;
   double ld_352 = 0;
   double ld_360 = 0;
   bool li_368 = numOpenOrders < maxOrders && (gi_1436 == 0 || (gi_1436 != (-li_200) && gi_1436 != (-li_212)))
                 && normalizeDouble(realAvgSpread) <= normalizeDouble(Point * maxSpread) 
                 && normalizeDouble(recentRealAvgSpread) <= normalizeDouble(Point * maxSpread);
   if ((!IsTesting()) || printInfo) {
      if (gi_1144) {
         ld_344 = f0_22(ld_204, ld_256, li_200, 0);
         ls_336 = ls_336 + infoMessage;
         if (li_320 > 0) ls_336 = ls_336 + "   Running Trades:" + li_320;
         ls_336 = ls_336 
         + "\n";
      }
      if (gi_1148) {
         ld_360 = f0_22(ld_216, ld_296, li_212, ld_344);
         ls_336 = ls_336 + infoMessage;
         if (li_328 > 0) ls_336 = ls_336 + "   Running Trades:" + li_328;
         ls_336 = ls_336 
         + "\n";
      }
   }
   if (li_368) {
      if (gi_1144 && ld_204 > 0.0 && li_200 != 0) {
         ld_344 = f0_22(ld_204, ld_256, li_200, 0);
         f0_23(channelId_1, p2low, p2high, ld_204, ld_272, ld_280, ld_256, li_200, ld_344);
      }
      if (gi_1148 && ld_216 > 0.0 && li_212 != 0 && numOpenOrders < maxOrders) {
         ld_360 = f0_22(ld_216, ld_296, li_212, 0);
         f0_23(channelId_3, p2low, p2high, ld_216, ld_304, ld_280, ld_296, li_212, ld_360);
      }
   }
   if (gi_1420 > 0) gi_1508 = TRUE;
   info = "";
   if (printInfo) {
      info = info + " " + getDoubleString(ld_192) + " (" + ld_184 + "->" + ad_32 + ")" + " " + getDoubleString(ld_204) + " digits:" + Digits + " stopLevel:" + getDoubleString(stopLevel) + " (" + ld_256 + ")" 
          + "\n";
      info = info + " " + li_200 + " " + getDoubleString(ld_148) + " " + getDoubleString(ld_140) + " " + getDoubleString(ad_40) + " exp:" + TimeToStr(expireTime, TIME_MINUTES) + " numOrders:" + gi_1420 + " numRecentOrders:" + gi_1428 
          + "\n";
      info = info + " " + "trailingLimit:" + getDoubleString(ld_272) + " trailingDist:" + getDoubleString(trailingPoints) + " trailingResolution:" + getDoubleString(ld_288) 
          + "\n";
   }
   if ((!IsTesting()) || printInfo) {
     if (enableDebug) 
       info = info + ls_336;
     debugMessage = debugMessage + info;
     if (printInfo) 
       printMessage(debugMessage);
   }
   curRequote = lastRequote;
   if (lastErrorCode != 0/* NO_ERROR */) {
      doRetry = handleErrors(lastErrorCode);
      lastRequote = curRequote;
      if (doRetry)
        f0_4(period_1, period_2, channelId_1, channelId_2, channelId_3, ad_24, ad_32, ad_40, ad_48, ad_56, ad_64, ad_72, ad_80, ad_88, ad_96, trailing, ai_112, ad_116, ada_124);
   }
}

string getGlobalPrefix() {
   if (IsTesting()) return ("NewSystem" + Magic + "T");
   return ("NewSystem" + Magic);
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
   if (checkOrderNotExists(ai_0, ai_4)) GetLastError();
   else {
      ls_24 = getGlobalPrefix() + ai_0 + "," + ai_4;
      li_32 = GlobalVariableGet(ls_24);
      if (OrderSelect(li_32, SELECT_BY_TICKET) && OrderCloseTime() == 0 && (!GlobalVariableGet(ls_24 + "HST"))) {
         switch (ai_0) {
         case 0:
         case 1:
         case 2:
            ld_36 = channel1_band_high;
            ld_44 = channel1_band_low;
            break;
         case 3:
         case 4:
         case 5:
            ld_36 = channel2_band_high;
            ld_44 = channel2_band_low;
            break;
         case 6:
         case 7:
         case 8:
            ld_36 = channel3_band_high;
            ld_44 = channel3_band_low;
            break;
         case 9:
         case 10:
         case 11:
            ld_36 = channel4_band_high;
            ld_44 = channel4_band_low;
            break;
         case 12:
         case 13:
         case 14:
            ld_36 = channel5_band_high;
            ld_44 = channel5_band_low;
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
            if (Smart_Exit) li_76 = Bid >= smartexit_band_low_median;
            else li_76 = li_68;
            if (li_76) {
               gi_884++;
               if (IsTesting()) Print(tickCountInCurrentBar + ":" + ai_0 + "," + ai_4 + ": cntDirectClose:" + gi_884);
            }
            if (!li_76) li_76 = f0_7(Ask, ld_16, 65280);
            if (!li_76) li_76 = f0_8(Bid, ld_8, 65280);
            if (!(li_76)) break;
            GlobalVariableSet("ClosedManually#" + li_32, 1);
            break;
         case OP_SELL:
            if (Smart_Exit) li_76 = Bid <= smartexit_band_low_median;
            else li_76 = li_72;
            if (li_76) {
               gi_884++;
               if (IsTesting()) Print(tickCountInCurrentBar + ":" + ai_0 + "," + ai_4 + ": cntDirectClose:" + gi_884);
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
   double bid_diff = bid_prices[0] - bid_prices[1];
   bool li_28 = bid_diff > 0.0 && ad_8 <= ad_0 + Point * Slippage;
   return (li_28);
}

int f0_8(double ad_0, double ad_8, int ai_16) {
   double bid_diff = bid_prices[0] - bid_prices[1];
   bool li_28 = bid_diff < 0.0 && ad_8 >= ad_0 - Point * Slippage;
   return (li_28);
}

void f0_9(int ai_0, int ai_4) {
   if (checkOrderNotExists(ai_0, ai_4)) {
      GetLastError();
      return;
   }
   string var = getGlobalPrefix() + ai_0 + "," + ai_4;
   int ticket = GlobalVariableGet(var);
   Print(tickCountInCurrentBar + ":" + ai_0 + "," + ai_4 + "...");
   closeOrderWithTicket(ticket);
}

void closeOrderWithTicket(int ai_0) {
   if (OrderSelect(ai_0, SELECT_BY_TICKET) && OrderCloseTime() == 0) {
      switch (OrderType()) {
      case OP_BUY:
         Print(tickCountInCurrentBar + ": Closing Soft Stop BUY #" + ai_0);
         closeOrder(Bid, Lime);
         return;
      case OP_SELL:
         Print(tickCountInCurrentBar + ": Closing Soft Stop SELL #" + ai_0);
         closeOrder(Ask, Orange);
      }
   }
}

void closeOrder(double close_price, color close_color) {
   bool result;
   int li_16;
   int ticket;
   curRequote = 0;
   while (true) {
      ticket = GetTickCount();
      result = OrderClose(OrderTicket(), OrderLots(), close_price, 100000, close_color);
      addExecTime(ticket);
      if (result) {
         addRequote(curRequote);
         return;
      }
      li_16 = handleErrors(0/* NO_ERROR */);
      if (!(li_16)) break;
   }
}

int getNextOrderNumInChannel(int channelId) {
   for (int i = 1; i <= maxOrdersPerChannel; i++)
      if (checkOrderNotExists(channelId, i)) return (i);
   for (i = 1; i <= maxOrdersPerChannel; i++) checkOrderForClose(channelId, i);
   for (i = 1; i <= maxOrdersPerChannel; i++)
      if (checkOrderNotExists(channelId, i)) return (i);
   return (-1);
}

/*
 * Returns false if order exists
 */
bool checkOrderNotExists(int channelId, int orderNum) {
   string var = getGlobalPrefix() + channelId + "," + orderNum;
   return (!GlobalVariableCheck(var) || GlobalVariableGet(var) == -1.0);
}

void checkOrdersForClose() {
   for (int i = 0; i <= 14; i++)
      for (int j = 1; j <= maxOrdersPerChannel; j++)
         checkOrderForClose(i, j);
}

void checkOrderForClose(int channelId, int orderNum) {
   string var = getGlobalPrefix() + channelId + "," + orderNum;
   int ticket = GlobalVariableGet(var);
   if (OrderSelect(ticket, SELECT_BY_TICKET)) {
      if (OrderCloseTime() != 0) {
         if (Sound_Alert) PlaySound("alert2.wav");
         updateCloseSlippages();
         analyzeClosedOrder();
         GlobalVariableSet(var, -1);
      }
   } else GlobalVariableSet(var, -1);
}

void updateOpenOrder(int orderType) {
   switch (orderType) {
   case 0:
   case 4:
      gi_1436 = -1;
      break;
   case 1:
   case 5:
      gi_1436 = 1;
   }
   numOpenOrders++;
   gi_1420++;
}

void printOrders() {
   string ticketVariableName;
   int ticket;
   string message;
   for (int i = 0; i <= 14; i++) {
      for (int j = 1; j <= maxOrdersPerChannel; j++) {
         if (!checkOrderNotExists(i, j)) {
            ticketVariableName = getGlobalPrefix() + i + "," + j;
            ticket = GlobalVariableGet(ticketVariableName);
            if (OrderSelect(ticket, SELECT_BY_TICKET)) {
               message = getOrderTypeString(OrderType()) + "#" + ticket + 
                    " price:" + getDoubleString(OrderOpenPrice()) + 
                    "(" + getDoubleString(GlobalVariableGet(ticketVariableName + "Price")) + ")" + 
                    " sl/hard:" + getDoubleString(OrderStopLoss()) + 
                    " tp/hard:" + getDoubleString(OrderTakeProfit()) + 
                    " sl:" + getDoubleString(GlobalVariableGet(ticketVariableName + "SL")) + 
                    " tp:" + getDoubleString(GlobalVariableGet(ticketVariableName + "TP")) + 
                    " opened:" + TimeToStr(OrderOpenTime());
               if (OrderCloseTime() != 0)
                   message = message + " closed:" + TimeToStr(OrderCloseTime());
               Print(tickCountInCurrentBar + ":" + i + "," + j + ": " + message);
               continue;
            }
            Print(tickCountInCurrentBar + ": " + i + "," + j + ": #" + ticket + " MISSING");
         }
      }
   }
}

void f0_18(int ai_0, int ai_4, double ad_8, double ad_16, double ad_24, double ad_32, double ad_40, double ad_48, double ad_56, double ad_64, double ad_72) {
   int li_80;
   int startTick;
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
   if (ad_48 < stopLevel) {
      ad_48 = stopLevel;
      ad_56 = stopLevel + Point * Slippage;
   }
   switch (OrderType()) {
   case OP_BUY:
      if (!li_152) {
         ArrayCopy(openSlipValues, openSlipValues, 0, 1, 99);
         openSlipValues[99] = MathRound((OrderOpenPrice() - ld_144) / Point);
         if (openSlips < 100) openSlips++;
         GlobalVariableSet(ls_136 + "PriceProcessed", 1);
      }
      if (GlobalVariableGet(ls_136 + "HST") && Smart_Exit && Bid >= smartexit_band_low_median) {
         closeOrder(Bid, Lime);
         GlobalVariableSet("ClosedManually#" + OrderTicket(), 1);
         gi_884++;
         if (!(IsTesting())) break;
         Print(tickCountInCurrentBar + ":" + ai_0 + "," + ai_4 + ": cntDirectClose:" + gi_884);
      } else {
         if (GlobalVariableGet(ls_136 + "HST") && (!Smart_Exit) && li_128) {
            closeOrder(Bid, Lime);
            GlobalVariableSet("ClosedManually#" + OrderTicket(), 1);
            gi_884++;
            if (!(IsTesting())) break;
            Print(tickCountInCurrentBar + ":" + ai_0 + "," + ai_4 + ": cntDirectClose:" + gi_884);
         } else {
            if (gi_524) {
               if (ld_184 != 0.0) {
                  ld_96 = (ld_176 - ld_184 - avgSpread - commissionRate) / 2.0;
                  ad_40 = MathMin(ad_40, ld_96);
                  ad_40 = MathMax(ad_40, stopLevel);
               }
               curRequote = 0;
               while (true) {
                  ld_104 = normalizeDouble(Bid - ad_40);
                  ld_112 = normalizeDouble(gd_1384 + ad_40);
                  if (!((ld_184 == 0.0 || ld_160 == 0.0 || (ld_176 < ld_112 && ld_112 - ld_176 > ad_64) || (ld_184 < ld_104 && ld_104 - ld_184 > ad_64)))) break;
                  if (ld_184 != 0.0) {
                     ld_104 = MathMax(ld_184, ld_104);
                     ld_112 = MathMax(ld_176, ld_112);
                  }
                  Print(tickCountInCurrentBar + ":" + ai_0 + "," + ai_4 + ": Modify Order #" + OrderTicket() + " BUY tp:" + getDoubleString(ld_176) + "->" + getDoubleString(ld_112) + "  sl:" + getDoubleString(ld_184) + "->" +
                     getDoubleString(ld_104));
                  if (GlobalVariableGet(ls_136 + "HST") != 0.0) {
                     startTick = GetTickCount();
                     li_92 = OrderModify(OrderTicket(), 0, ld_104, ld_112, expireTime, Lime);
                     addExecTime(startTick);
                     addModifyTime(startTick);
                  } else {
                     if (!IsTesting() && (ld_160 == 0.0 || (ld_160 < ld_104 - 80 * Point && ld_104 - 80 * Point - ld_160 > 20 * Point))) {
                        startTick = GetTickCount();
                        li_92 = OrderModify(OrderTicket(), 0, ld_104 - 80 * Point, ld_112 + 80 * Point, expireTime, Lime);
                        addExecTime(startTick);
                        addModifyTime(startTick);
                     } else li_92 = TRUE;
                  }
                  if (li_92) {
                     addRequote(curRequote);
                     GlobalVariableSet(ls_136 + "TP", ld_112);
                     GlobalVariableSet(ls_136 + "SL", ld_104);
                     break;
                  }
                  li_88 = handleErrors(0/* NO_ERROR */);
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
         ArrayCopy(openSlipValues, openSlipValues, 0, 1, 99);
         openSlipValues[99] = MathRound((ld_144 - OrderOpenPrice()) / Point);
         if (openSlips < 100) openSlips++;
         GlobalVariableSet(ls_136 + "PriceProcessed", 1);
      }
      if (GlobalVariableGet(ls_136 + "HST") && Smart_Exit && Bid <= smartexit_band_low_median) {
         closeOrder(Ask, Orange);
         GlobalVariableSet("ClosedManually#" + OrderTicket(), 1);
         gi_884++;
         if (!(IsTesting())) break;
         Print(tickCountInCurrentBar + ":" + ai_0 + "," + ai_4 + ": cntDirectClose:" + gi_884);
      } else {
         if (GlobalVariableGet(ls_136 + "HST") && (!Smart_Exit) && li_132) {
            closeOrder(Ask, Orange);
            GlobalVariableSet("ClosedManually#" + OrderTicket(), 1);
            gi_884++;
            if (!(IsTesting())) break;
            Print(tickCountInCurrentBar + ":" + ai_0 + "," + ai_4 + ": cntDirectClose:" + gi_884);
         } else {
            if (gi_524) {
               if (ld_184 != 0.0) {
                  ld_96 = (ld_184 - ld_176 - avgSpread - commissionRate) / 2.0;
                  ad_40 = MathMin(ad_40, ld_96);
                  ad_40 = MathMax(ad_40, stopLevel);
               }
               curRequote = 0;
               while (true) {
                  ld_104 = normalizeDouble(Ask + ad_40);
                  ld_112 = normalizeDouble(gd_1392 - ad_40);
                  if (!((ld_184 == 0.0 || ld_160 == 0.0 || (ld_176 > ld_112 && ld_176 - ld_112 > ad_64) || (ld_184 > ld_104 && ld_184 - ld_104 > ad_64)))) break;
                  if (ld_184 != 0.0) {
                     ld_104 = MathMin(ld_184, ld_104);
                     ld_112 = MathMin(ld_176, ld_112);
                  }
                  Print(tickCountInCurrentBar + ":" + ai_0 + "," + ai_4 + ": Modify Order #" + OrderTicket() + " SELL tp:" + getDoubleString(ld_176) + "->" + getDoubleString(ld_112) + "  sl:" + getDoubleString(ld_184) + "->" +
                     getDoubleString(ld_104));
                  if (GlobalVariableGet(ls_136 + "HST") != 0.0) {
                     startTick = GetTickCount();
                     li_92 = OrderModify(OrderTicket(), 0, ld_104, ld_112, expireTime, Orange);
                     addExecTime(startTick);
                     addModifyTime(startTick);
                  } else {
                     if (!IsTesting() && (ld_160 == 0.0 || (ld_160 > ld_104 + 80 * Point && ld_160 - ld_104 - 80 * Point > 20 * Point))) {
                        startTick = GetTickCount();
                        li_92 = OrderModify(OrderTicket(), 0, ld_104 + 80 * Point, ld_112 - 80 * Point, expireTime, Orange);
                        addExecTime(startTick);
                        addModifyTime(startTick);
                     } else li_92 = TRUE;
                  }
                  if (li_92) {
                     addRequote(curRequote);
                     GlobalVariableSet(ls_136 + "TP", ld_112);
                     GlobalVariableSet(ls_136 + "SL", ld_104);
                     break;
                  }
                  li_88 = handleErrors(0/* NO_ERROR */);
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
         ld_96 = OrderTakeProfit() - OrderOpenPrice() - commissionRate;
         ld_120 = ad_48;
         curRequote = 0;
         while (true) {
            ld_144 = normalizeDouble(Ask + ld_120);
            if (!((ld_144 < OrderOpenPrice() && OrderOpenPrice() - ld_144 > ad_64))) break;
            ld_104 = normalizeDouble(Bid + ld_120 - ld_96 * ad_72);
            ld_112 = normalizeDouble(gd_1384 + ld_120 + ld_96);
            if (GlobalVariableGet(ls_136 + "HST") != 0.0) {
               startTick = GetTickCount();
               li_92 = OrderModify(OrderTicket(), ld_144, ld_104, ld_112, 0, Lime);
               addExecTime(startTick);
               addModifyTime(startTick);
            } else {
               if (!IsTesting() && (ld_160 == 0.0 || (ld_160 < ld_104 - 80 * Point && ld_104 - 80 * Point - ld_160 > 20 * Point))) {
                  startTick = GetTickCount();
                  li_92 = OrderModify(OrderTicket(), ld_144, ld_104 - 80 * Point, ld_112 + 80 * Point, 0, Lime);
                  addExecTime(startTick);
                  addModifyTime(startTick);
               } else {
                  startTick = GetTickCount();
                  li_92 = OrderModify(OrderTicket(), ld_144, 0, 0, 0, Lime);
                  addExecTime(startTick);
                  addModifyTime(startTick);
               }
            }
            if (li_92) {
               addRequote(curRequote);
               GlobalVariableSet(ls_136 + "Price", ld_144);
               GlobalVariableSet(ls_136 + "TP", ld_112);
               GlobalVariableSet(ls_136 + "SL", ld_104);
               break;
            }
            li_88 = handleErrors(0/* NO_ERROR */);
            if (!(li_88)) break;
            ld_120 = ad_56;
         }
         gi_1420++;
         gi_1436 = -1;
      } else {
         li_88 = FALSE;
         curRequote = 0;
         while (true) {
            startTick = GetTickCount();
            li_92 = OrderDelete(OrderTicket());
            addExecTime(startTick);
            if (li_92) {
               addRequote(curRequote);
               break;
            }
            if (!li_88) Print(tickCountInCurrentBar + ":" + ai_0 + "," + ai_4 + ": WARN Unable to delete BUYSTOP Order #" + OrderTicket());
            li_88 = handleErrors(0/* NO_ERROR */);
            if (!(li_88)) break;
         }
         li_80 = -1;
         return;
      }
   case OP_SELLSTOP:
      if (li_128) {
         ld_96 = OrderOpenPrice() - OrderTakeProfit() - commissionRate;
         ld_120 = ad_48;
         curRequote = 0;
         while (true) {
            ld_144 = normalizeDouble(Bid - ld_120);
            if (!((ld_144 > OrderOpenPrice() && ld_144 - OrderOpenPrice() > ad_64))) break;
            ld_104 = normalizeDouble(Ask - ld_120 + ld_96 * ad_72);
            ld_112 = normalizeDouble(gd_1392 - ld_120 - ld_96);
            if (GlobalVariableGet(ls_136 + "HST") != 0.0) {
               startTick = GetTickCount();
               li_92 = OrderModify(OrderTicket(), ld_144, ld_104, ld_112, 0, Orange);
               addExecTime(startTick);
               addModifyTime(startTick);
            } else {
               if (!IsTesting() && (ld_160 == 0.0 || (ld_160 > ld_104 + 80 * Point && ld_160 - ld_104 - 80 * Point > 20 * Point))) {
                  startTick = GetTickCount();
                  li_92 = OrderModify(OrderTicket(), ld_144, ld_104 + 80 * Point, ld_112 - 80 * Point, 0, Orange);
                  addExecTime(startTick);
                  addModifyTime(startTick);
               } else {
                  startTick = GetTickCount();
                  li_92 = OrderModify(OrderTicket(), ld_144, 0, 0, 0, Orange);
                  addExecTime(startTick);
                  addModifyTime(startTick);
               }
            }
            if (li_92) {
               addRequote(curRequote);
               GlobalVariableSet(ls_136 + "Price", ld_144);
               GlobalVariableSet(ls_136 + "TP", ld_112);
               GlobalVariableSet(ls_136 + "SL", ld_104);
               break;
            }
            li_88 = handleErrors(0/* NO_ERROR */);
            if (!(li_88)) break;
            ld_120 = ad_56;
         }
         gi_1420++;
         gi_1436 = 1;
      } else {
         li_88 = FALSE;
         curRequote = 0;
         while (true) {
            startTick = GetTickCount();
            li_92 = OrderDelete(OrderTicket());
            addExecTime(startTick);
            if (li_92) {
               addRequote(curRequote);
               break;
            }
            if (!li_88) Print(tickCountInCurrentBar + ":" + ai_0 + "," + ai_4 + ": WARN Unable to delete SELLSTOP Order #" + OrderTicket());
            li_88 = handleErrors(0/* NO_ERROR */);
            if (!(li_88)) break;
         }
         li_80 = -1;
      }
      return;
   }
}

void findCommissionRate() {
   double ld_0;
   if (OrderSymbol() == Symbol() && OrderCloseTime() != 0 && OrderLots() != 0.0 && OrderClosePrice() != OrderOpenPrice() && OrderProfit() != 0.0 && MarketInfo(Symbol(),
      MODE_LOTSIZE) != 0.0 && OrderComment() != "partial close" && StringFind(OrderComment(), "[sl]from #") == -1 && StringFind(OrderComment(), "[tp]from #") == -1) {
      ld_0 = MathAbs(OrderProfit() / (OrderClosePrice() - OrderOpenPrice()));
      commissionRate = (-OrderCommission()) / ld_0;
      Print(tickCountInCurrentBar + ": Commission_Rate : " + getDoubleString(commissionRate));
      commissionRateFound = TRUE;
   }
}

void updateCloseSlippages() {
   double closeSlippage = -1000000;
   if (!GlobalVariableGet("ClosedManually#" + OrderTicket())) {
      switch (OrderType()) {
      case OP_BUY:
         if ((OrderStopLoss() != 0.0 && StringFind(OrderComment(), "[sl]") >= 0) || OrderClosePrice() <= OrderStopLoss()) 
            closeSlippage = OrderStopLoss() - OrderClosePrice();
         else {
            if (!(((OrderTakeProfit() != 0.0 && StringFind(OrderComment(), "[tp]") >= 0) || OrderClosePrice() >= OrderTakeProfit())))
              closeSlippage = OrderTakeProfit() - OrderClosePrice();
         }
         break;
      case OP_SELL:
         if ((OrderStopLoss() != 0.0 && StringFind(OrderComment(), "[sl]") >= 0) || OrderClosePrice() >= OrderStopLoss()) 
            closeSlippage = OrderClosePrice() - OrderStopLoss();
         else {
            if (!(((OrderTakeProfit() != 0.0 && StringFind(OrderComment(), "[tp]") >= 0) || OrderClosePrice() <= OrderTakeProfit())))
              closeSlippage = OrderClosePrice() - OrderTakeProfit();
         }
      }
   }
   if (closeSlippage != -1000000.0) {
      ArrayCopy(closeSlippages, closeSlippages, 0, 1, 99);
      closeSlippages[99] = MathRound(closeSlippage / Point);
      if (closeSlippagesCount < 100) closeSlippagesCount++;
   }
}

void analyzeClosedOrder() {
   double loss;
   double profit = OrderProfit() + OrderCommission() + OrderSwap();
   if (profit < 0.0 && baseBalance > 0.0) {
      loss = NormalizeDouble(100.0 * MathAbs(profit) / baseBalance, 2);
      totalLoss += loss;
      lossesCount++;
      if (loss > maxLoss) {
         maxLoss = loss;
         maxLossOrderTicket = OrderTicket();
         if ((!Sound_Alert) || printInfo) {
            Print(tickCountInCurrentBar + ": realRisk:" + getDoubleString(loss, 2) 
               + " ( profit:" + getDoubleString(profit, 2) + " of balance:" + getDoubleString(baseBalance, 2)
               + " with lot:" + getDoubleString(OrderLots(), 2) + " )");
            Print(tickCountInCurrentBar + ": maxRealRiskPercent:" + getDoubleString(maxLoss, 2));
            Print(tickCountInCurrentBar + ": maxRealRiskTicket:" + maxLossOrderTicket);
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
   double ld_100 = ad_0 * ad_8 + curSpread;
   if (ld_100 > 0.0 && MarketInfo(Symbol(), MODE_LOTSIZE) != 0.0 && AccountLeverage() != 0) {
      ld_44 = AccountFreeMargin();
      for (int li_108 = 0; li_108 <= 14; li_108++) {
         for (int li_112 = 1; li_112 <= maxOrdersPerChannel; li_112++) {
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
      baseBalance = MathMax(AccountBalance(), baseBalance);
      ld_68 = (ld_44 - baseBalance / 10.0) * AccountLeverage();
      ld_28 = ld_68 / MarketInfo(Symbol(), MODE_LOTSIZE);
      ld_28 = NormalizeDouble(ld_28, gi_1416);
      if (ld_28 < MarketInfo(Symbol(), MODE_MINLOT)) {
         ld_28 = 0.0;
         infoMessage = "!Lots:0.0  Risk set at:" + getDoubleString(Risk, 2) + "%   ( Free Margin is too low : Channel is OFF )";
      } else {
         ld_84 = 0;
         for (li_112 = 0; li_112 < 10; li_112++) ld_84 = MathMax(ld_84, gda_840[li_112] * ad_8 + curSpread);
         ld_84 = MathMax(ld_84, ld_100);
         ld_68 = (ld_44 - baseBalance * Risk * ld_100 / ld_84 / 100.0) * AccountLeverage() / 2.0;
         ld_76 = baseBalance * Risk / 100.0 * Bid / ld_84;
         ld_92 = MathMin(ld_68, ld_76);
         ld_28 = ld_92 / MarketInfo(Symbol(), MODE_LOTSIZE);
         ld_28 = NormalizeDouble(ld_28, gi_1416);
         ld_28 = MathMax(Min_Lots, ld_28);
         ld_28 = MathMax(MarketInfo(Symbol(), MODE_MINLOT), ld_28);
         ld_28 = MathMin(Max_Lots, ld_28);
         ld_28 = MathMin(MarketInfo(Symbol(), MODE_MAXLOT), ld_28);
         infoMessage = "Lots:" + getDoubleString(ld_28, gi_1416) + "  ";
         if (ld_28 > 0.0 && AccountBalance() > 0.0 && Bid > 0.0) {
            ld_36 = 100.0 * (ld_28 * MarketInfo(Symbol(), MODE_LOTSIZE) * ld_100) / Bid / AccountBalance();
            infoMessage = infoMessage + "Actual Risk:" + getDoubleString(ld_36, 2) + "%  Risk set at:" + getDoubleString(Risk, 2) + "%";
            if (NormalizeDouble(ld_36, 2) > NormalizeDouble(Risk, 2)) {
               if (ld_28 == Min_Lots || ld_28 == MarketInfo(Symbol(), MODE_MINLOT)) infoMessage = "!" + infoMessage + "   ( at Lot Size Minumum : " + getDoubleString(ld_28, 2) + " : still trading with Actual Risk )";
               else infoMessage = "!" + infoMessage + "   ( still trading with Actual Risk )";
            } else {
               if (ld_68 < ld_76) infoMessage = "!" + infoMessage + "   ( free Margin at S/L reached : " + getDoubleString(2.0 * ld_68 / AccountLeverage(), 2) + " : still trading with Actual Risk )";
               else infoMessage = " " + infoMessage;
            }
         } else {
            infoMessage = "!Lots:0.0  Risk set at:" + getDoubleString(Risk, 2) + "%   ( Channel is OFF )";
            ld_28 = 0;
         }
      }
   } else {
      infoMessage = "!Lots:0.0  Risk set at:" + getDoubleString(Risk, 2) + "%   ( no scalp distance yet : Channel is OFF )";
      ld_28 = 0;
   }
   return (ld_28);
}

void f0_23(int channelId, double ad_4, double ad_12, double ad_20, double ad_28, double ad_36, double ad_44, int signal, double orderLots) {
   int orderType;
   color orderColor;
   bool isPriceWithinSlippage;
   bool orderModifyResult;
   double orderPrice;
   double sl;
   double tp;
   double startTick;
   int sltpDirectionMultiplier;
   int nextOrderNumInChannel;
   int orderOpentime;
   double orderOpenprice;
   string ticketVariable;
   int errCode;
   int ticket = -1;
   bool doRetry = TRUE;
   double bidDiff = bid_prices[0] - bid_prices[1];
   if (initialized) {
      if (orderLots != 0.0) {
         if (!IsTesting() && hstCheckInterval == 10) {
            if (SupportECN) {
               if (!useStopOrdersEnabled && stopLevel <= maxStopLevel) useStopOrdersEnabled = 1;
               if ((!hardStopTrailingEnabled) && !SupportNFA) hardStopTrailingEnabled = 1;
            }
         }
         if (useStopOrdersEnabled && ad_28 < stopLevel) {
            ad_28 = stopLevel;
            ad_36 = stopLevel + Point * Slippage;
         }
         if (signal < 0) { //BUY
            sltpDirectionMultiplier = 1;
            orderColor = Lime;
            startTick = GetTickCount();
            if (useStopOrdersEnabled) {
               orderType = OP_BUYSTOP;
               orderPrice = normalizeDouble(Ask + ad_36);
               sl = normalizeDouble(Bid + ad_36 - ad_20 * ad_44);
               tp = normalizeDouble(gd_1384 + ad_36 + ad_20);
            } else {
               orderType = OP_BUY;
               orderPrice = normalizeDouble(ad_4 + curSpread + ad_28);
               isPriceWithinSlippage = bidDiff > 0.0 && orderPrice - Point * Slippage <= Ask && Ask <= orderPrice + Point * Slippage;
               orderPrice = Ask;
               sl = normalizeDouble(orderPrice - curSpread - MathMax(stopLevel + Point * Slippage, ad_20 * ad_44));
               tp = normalizeDouble(orderPrice + MathMax(stopLevel + Point * Slippage, commissionRate + ad_20));
            }
         } else {
            if (signal <= 0) return; // NO-Signal
            //SELL
            sltpDirectionMultiplier = -1;
            orderColor = Orange;
            startTick = GetTickCount();
            if (useStopOrdersEnabled) {
               orderType = OP_SELLSTOP;
               orderPrice = normalizeDouble(Bid - ad_36);
               sl = normalizeDouble(Ask - ad_36 + ad_20 * ad_44);
               tp = normalizeDouble(gd_1392 - ad_36 - ad_20);
            } else {
               orderType = OP_SELL;
               orderPrice = normalizeDouble(ad_12 - ad_28);
               isPriceWithinSlippage = bidDiff < 0.0 && orderPrice + Point * Slippage >= Bid && Bid >= orderPrice - Point * Slippage;
               orderPrice = Bid;
               sl = normalizeDouble(orderPrice + curSpread + MathMax(stopLevel + Point * Slippage, ad_20 * ad_44));
               tp = normalizeDouble(orderPrice - MathMax(stopLevel + Point * Slippage, commissionRate + ad_20));
            }
         }
         nextOrderNumInChannel = getNextOrderNumInChannel(channelId);
         if (nextOrderNumInChannel != -1) {
            orderOpentime = 0;
            orderOpenprice = 0;
            for (int i = 1; i <= maxOrdersPerChannel; i++) {
               ticketVariable = getGlobalPrefix() + channelId + "," + i;
               ticket = GlobalVariableGet(ticketVariable);
               if (OrderSelect(ticket, SELECT_BY_TICKET) && OrderCloseTime() == 0) {
                  if (orderOpentime < OrderOpenTime()) {
                     orderOpentime = OrderOpenTime();
                     orderOpenprice = OrderOpenPrice();
                  }
               }
            }
            ticket = -1;
            if (orderOpenprice != 0.0 && sltpDirectionMultiplier * (orderOpenprice - orderPrice) < Point * gd_516) return;
            ticketVariable = getGlobalPrefix() + channelId + "," + nextOrderNumInChannel;
            orderModifyResult = TRUE;
            if (useStopOrdersEnabled) {
               if (hardStopTrailingEnabled) {
                  relookVariables = TRUE;
                  ticket = OrderSend(Symbol(), orderType, orderLots, orderPrice, Slippage, sl, tp, orderComment, Magic, expireTime, orderColor);
               } else {
                  if (!IsTesting()) {
                     relookVariables = TRUE;
                     ticket = OrderSend(Symbol(), orderType, orderLots, orderPrice, Slippage, sl - Point * (80 * sltpDirectionMultiplier), tp + Point * (80 * sltpDirectionMultiplier), orderComment, Magic, expireTime, orderColor);
                  } else {
                     relookVariables = TRUE;
                     ticket = OrderSend(Symbol(), orderType, orderLots, orderPrice, Slippage, 0, 0, orderComment, Magic, expireTime, orderColor);
                  }
               }
               errCode = GetLastError();
            } else {
               if (!(isPriceWithinSlippage)) return;
               relookVariables = TRUE;
               ticket = OrderSend(Symbol(), orderType, orderLots, orderPrice, Slippage, 0, 0, orderComment, Magic, expireTime, orderColor);
               errCode = GetLastError();
               if (ticket >= 0) {
                  if (hardStopTrailingEnabled) {
                     curRequote = 0;
                     while (true) {
                        orderModifyResult = OrderModify(ticket, 0, sl, tp, expireTime, orderColor);
                        if (orderModifyResult) {
                           addRequote(curRequote);
                           break;
                        }
                        doRetry = handleErrors(0/* NO_ERROR */);
                        if (!(doRetry)) break;
                     }
                  } else {
                     if (!IsTesting()) {
                        curRequote = 0;
                        while (true) {
                           orderModifyResult = OrderModify(ticket, 0, sl - Point * (80 * sltpDirectionMultiplier), tp + Point * (80 * sltpDirectionMultiplier), expireTime, orderColor);
                           if (orderModifyResult) {
                              addRequote(curRequote);
                              break;
                           }
                           doRetry = handleErrors(0/* NO_ERROR */);
                           if (!(doRetry)) break;
                        }
                     }
                  }
               }
            }
            if (ticket >= 0) {
               if (hstCheckInterval == 10) hstCheckInterval = 0;
               hstCheckInterval++;
               GlobalVariableSet(ticketVariable, ticket);
               GlobalVariableSet(ticketVariable + "Price", orderPrice);
               if (useStopOrdersEnabled) GlobalVariableSet(ticketVariable + "PriceProcessed", 0);
               else GlobalVariableSet(ticketVariable + "PriceProcessed", 1);
               GlobalVariableSet(ticketVariable + "TP", tp);
               GlobalVariableSet(ticketVariable + "SL", sl);
               GlobalVariableSet(ticketVariable + "USO", useStopOrdersEnabled);
               GlobalVariableSet(ticketVariable + "HST", hardStopTrailingEnabled);
               addExecTime(startTick);
               addOpenTime(startTick);
               Print(tickCountInCurrentBar + ":" + channelId + "," + nextOrderNumInChannel + ": " + getOrderTypeString(orderType) + "  price:" + getDoubleString(orderPrice) + " SL:" + getDoubleString(sl) + " TP:" + getDoubleString(tp));
               if (Sound_Alert) {
                  if (orderModifyResult) PlaySound("news.wav");
                  else PlaySound("wait.wav");
               }
               updateOpenOrder(orderType);
               addRequote(lastRequote);
               lastRequote = 0;
               if (!orderModifyResult) {
                  Print(tickCountInCurrentBar + ":" + channelId + "," + nextOrderNumInChannel + ": WARN Unable to setup s/l or t/p for order #" + ticket + " : " + getOrderTypeString(orderType) + "  price:" + getDoubleString(orderPrice) + " SL:" + getDoubleString(sl) +
                     " TP:" + getDoubleString(tp));
               }
            } else {
               if (doRetry) lastErrorCode = errCode;
               Print(tickCountInCurrentBar + ":" + channelId + "," + nextOrderNumInChannel + ": WARN Unable to create " + getOrderTypeString(orderType) + "  price:" + getDoubleString(orderPrice) + " SL:" + getDoubleString(sl) + " TP:" + getDoubleString(tp));
            }
            relookVariables = FALSE;
         }
      }
   }
}

int handleErrors(int errCode) {
   if (!errCode) errCode = GetLastError();
   if (errCode == 0/* NO_ERROR */) {
      if (curRequote != 0) Print(tickCountInCurrentBar + ": INFO Trading command is now succeeded after recent complaints are resolved...");
      addRequote(curRequote);
      curRequote = 0;
      return (0);
   }
   if (IsTesting()) {
      if (errCode != 4059/* FUNCTION_NOT_ALLOWED_IN_TESTING_MODE */) Print(tickCountInCurrentBar + ": ERROR unhandled error (unable to repeat command in testing mode) : " + ErrorDescription(errCode));
      addRequote(curRequote);
      curRequote = 0;
      return (0);
   }
   if (curRequote == 5) {
      if (!Sound_Alert) Print(tickCountInCurrentBar + ": Number of subsequently repeated orders reached limit (5)");
      addRequote(curRequote);
      curRequote = 0;
      return (0);
   }
   if (errCode == 130/* INVALID_STOPS */ || errCode == 129/* INVALID_PRICE */ || errCode == 138/* REQUOTE */ || errCode == 135/* PRICE_CHANGED */) {
      Sleep(50);
      RefreshRates();
      if (!Sound_Alert) Print(tickCountInCurrentBar + ": WARN following error blocked our last trading command (REQUOTING + REPEATING) : " + ErrorDescription(errCode));
      curRequote++;
      return (1);
   }
   if (errCode == 146/* TRADE_CONTEXT_BUSY */ || errCode == 133/* TRADE_DISABLED */ || errCode == 128/* TRADE_TIMEOUT */ || errCode == 139/* ORDER_LOCKED */ || errCode == 136/* OFF_QUOTES */) {
      Sleep(500);
      RefreshRates();
      if (!Sound_Alert) Print(tickCountInCurrentBar + ": WARN following error blocked our last trading command (WAITING + REQUOTING + REPEATING) : " + ErrorDescription(errCode));
      curRequote++;
      return (1);
   }
   if (errCode == 4/* SERVER_BUSY */ || errCode == 137/* BROKER_BUSY */ || errCode == 4022/* SYSTEM_BUSY */ || errCode == 6/* NO_CONNECTION */ || errCode == 141/* TOO_MANY_REQUESTS */ ||
      errCode == 8/* TOO_FREQUENT_REQUESTS */) {
      Sleep(1500);
      RefreshRates();
      if (!Sound_Alert) Print(tickCountInCurrentBar + ": WARN following error blocked our last trading command (WAITING(2) + REQUOTING + REPEATING) : " + ErrorDescription(errCode));
      curRequote++;
      return (1);
   }
   if (errCode == 147/* TRADE_EXPIRATION_DENIED */) {
      RefreshRates();
      gi_880 = FALSE;
      expireTime = 0;
      if (!Sound_Alert) Print(tickCountInCurrentBar + ": WARN following error blocked our last trading command (REQUOTING + REPEATING + TURNING OFF EXPIRATION) : " + ErrorDescription(errCode));
      curRequote++;
      return (1);
   }
   Print(tickCountInCurrentBar + ": ERROR unhandled error (unable to repeat command) : " + ErrorDescription(errCode));
   addRequote(curRequote);
   curRequote = 0;
   return (0);
}

void loadPrices(double &bids[2], double &asks[2], int &ticks[2]) {
   for (int i = 1; i > 0; i--) {
      bids[i] = bids[i - 1];
      asks[i] = asks[i - 1];
      ticks[i] = ticks[i - 1];
   }
   bids[0] = Bid;
   asks[0] = Ask;
   ticks[0] = GetTickCount();
}

void addExecTime(int ai_0) {
   ArrayCopy(execTimes, execTimes, 0, 1, 99);
   execTimes[99] = GetTickCount() - ai_0;
   if (execTimesCount < 100) execTimesCount++;
}

void addOpenTime(int ai_0) {
   ArrayCopy(openTimes, openTimes, 0, 1, 99);
   openTimes[99] = GetTickCount() - ai_0;
   if (openTimesCount < 100) openTimesCount++;
}

void addModifyTime(int ai_0) {
   ArrayCopy(modifyTimes, modifyTimes, 0, 1, 99);
   modifyTimes[99] = GetTickCount() - ai_0;
   if (modifyTimesCount < 100) modifyTimesCount++;
}

void addRequote(int ai_0) {
   ArrayCopy(requoteValues, requoteValues, 0, 1, 99);
   requoteValues[99] = ai_0;
   if (requotes < 100) requotes++;
}

void reInitGlobalVariables() {
   closeSlippagesUpdated = FALSE;
   closeSlippagesCount = 0;
   ArrayInitialize(closeSlippages, 0);
   execTimesCount = readGlobalVariables(getGlobalPrefix() + "ExecTimes", execTimes, 100);
   openTimesCount = readGlobalVariables(getGlobalPrefix() + "OpenTimes", openTimes, 100);
   modifyTimesCount = readGlobalVariables(getGlobalPrefix() + "ModifyTimes", modifyTimes, 100);
   openSlips = readGlobalVariables(getGlobalPrefix() + "OpenSlips", openSlipValues, 100);
   requotes = readGlobalVariables(getGlobalPrefix() + "Requotes", requoteValues, 100);
   baseBalance = GlobalVariableGet(getGlobalPrefix() + "Base_Balance");
}

void setGlobalVars() {
   setGlobalVariables(getGlobalPrefix() + "ExecTimes", execTimes, 100, execTimesCount);
   setGlobalVariables(getGlobalPrefix() + "OpenTimes", openTimes, 100, openTimesCount);
   setGlobalVariables(getGlobalPrefix() + "ModifyTimes", modifyTimes, 100, modifyTimesCount);
   setGlobalVariables(getGlobalPrefix() + "OpenSlips", openSlipValues, 100, openSlips);
   setGlobalVariables(getGlobalPrefix() + "Requotes", requoteValues, 100, requotes);
   GlobalVariableSet(getGlobalPrefix() + "Base_Balance", baseBalance);
}

void reset() {
   GlobalVariableSet(getGlobalPrefix() + "Reset", 0);
   resetGlobalVariables(getGlobalPrefix() + "ExecTimes", 100);
   resetGlobalVariables(getGlobalPrefix() + "OpenTimes", 100);
   resetGlobalVariables(getGlobalPrefix() + "ModifyTimes", 100);
   resetGlobalVariables(getGlobalPrefix() + "OpenSlips", 100);
   resetGlobalVariables(getGlobalPrefix() + "Requotes", 100);
   GlobalVariableSet(getGlobalPrefix() + "Base_Balance", 0);
   maxLoss = 0;
   totalLoss = 0;
   maxLossOrderTicket = 0;
   lossesCount = 0;
}

void setGlobalVariables(string prefix, double &values[100], int count, int baseValue) {
   GlobalVariableSet(prefix, baseValue);
   for (int i = 0; i < count; i++) GlobalVariableSet(prefix + i, values[i]);
}

void resetGlobalVariables(string prefix, int count) {
   GlobalVariableSet(prefix, 0);
   for (int i = 0; i < count; i++) GlobalVariableSet(prefix + i, 0);
}

int readGlobalVariables(string prefix, double &ada_8[100], int count) {
   int baseValue = GlobalVariableGet(prefix);
   for (int i = 0; i < count; i++) ada_8[i] = GlobalVariableGet(prefix + i);
   return (baseValue);
}

int popLast(double &array[5000], int lastIndex) {
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

string getOrderTypeString(int orderType) {
   switch (orderType) {
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
   return (DoubleToStr(ad_0, Digits));
}

string getDoubleString(double ad_0, int ai_8) {
   return (DoubleToStr(ad_0, ai_8));
}

double normalizeDouble(double ad_0) {
   return (NormalizeDouble(ad_0, 5));
}

string getFormattedValue(int value) {
   if (value < 10) return ("00" + value);
   if (value < 100) return ("0" + value);
   return ("" + value);
}

string getBoolString(bool value) {
   if (value) return ("true");
   return ("false");
}

double f0_44(double ad_0, double ad_8) {
   return (MathLog(ad_8) / MathLog(ad_0));
}

void printMessage(string message) {
   int li_8;
   int li_12 = -1;
   while (li_12 < StringLen(message)) {
      li_8 = li_12 + 1;
      li_12 = StringFind(message, 
      "\n", li_8);
      if (li_12 == -1) {
         Print(StringSubstr(message, li_8));
         return;
      }
      Print(StringSubstr(message, li_8, li_12 - li_8));
   }
}