package com.qq.modules.activity.command
{
   import asgui.serialization.json.JSON;
   import com.qq.modules.act14days.command.Act14daysCmd;
   import com.qq.modules.act3years.command.Act3yearsViewCmd;
   import com.qq.modules.actDf51.command.ActDf51Cmd;
   import com.qq.modules.actFlipcard.command.ActFlipcardViewCmd;
   import com.qq.modules.actFund.command.ActFundCmd;
   import com.qq.modules.actHitJar.command.ActHitJarViewCmd;
   import com.qq.modules.actNightclub.command.ActNightclubViewCmd;
   import com.qq.modules.actPennyShop.command.ActPennyShopCmd;
   import com.qq.modules.actPinball.command.ActPinballCmd;
   import com.qq.modules.actPlantCarnival.command.ActPlantCarnivalViewCmd;
   import com.qq.modules.actQt.command.ActQTCmd;
   import com.qq.modules.actRechargeRebate.command.ActRechargeRebateViewCmd;
   import com.qq.modules.actRed.command.ActRedCmd;
   import com.qq.modules.actWishing.command.ActWishingViewCmd;
   import com.qq.modules.actXY.command.ActXYCmd;
   import com.qq.modules.activity.ActivityGlobal;
   import com.qq.modules.activity.command.blueVip.BlueVipCmd;
   import com.qq.modules.activity.model.ActivityCommonInfo;
   import com.qq.modules.activity.model.ActivityProxy;
   import com.qq.modules.activityArenaDoubleBonus.command.ActivityArenaDoubleBonusViewCmd;
   import com.qq.modules.activityChallengeLimitTime.command.ActivityChallengeLimitTimeViewCmd;
   import com.qq.modules.activityFirstRecharge.command.FirstRechargeViewCmd;
   import com.qq.modules.activityForTimes.command.ActivityForTimesCmd;
   import com.qq.modules.actqqgame.command.ActqqgameCmd;
   import com.qq.modules.betaReward.command.BetaRewardViewCmd;
   import com.qq.modules.buffActivity.command.BuffActivityViewCmd;
   import com.qq.modules.castle.command.CastleViewCmd;
   import com.qq.modules.childrenDay.command.ChildrenDayViewCmd;
   import com.qq.modules.collectWord.command.CollectWordViewCmd;
   import com.qq.modules.daily3366.command.Daily3366ViewCmd;
   import com.qq.modules.downloadShortcut.command.DownloadShortcutCmd;
   import com.qq.modules.dragonBoat.command.DragonBoatViewCmd;
   import com.qq.modules.entryIcon.ActivityIconConst;
   import com.qq.modules.entryIcon.command.EntryIconCmd;
   import com.qq.modules.groupBuying.command.GroupBuyingViewCmd;
   import com.qq.modules.halloween.command.HalloweenViewCmd;
   import com.qq.modules.heFuActivity.command.HeFuActivityCmd;
   import com.qq.modules.iwan.command.IWanVeiwCmd;
   import com.qq.modules.loginActivity.command.LoginActivityViewCmd;
   import com.qq.modules.loginReward.command.LoginRewardViewCmd;
   import com.qq.modules.miniClient.command.MiniClientViewCmd;
   import com.qq.modules.onlineReward.command.OnlineRewardCmd;
   import com.qq.modules.pcManager.command.PcManagerViewCmd;
   import com.qq.modules.plantExplore.command.PlantExploreCmd;
   import com.qq.modules.privilege.command.PrivilegeViewCmd;
   import com.qq.modules.qqbrower.command.QQBrowerCmd;
   import com.qq.modules.rechargeRebate.command.RechargeRebateViewCmd;
   import com.qq.modules.rookieCeremony.command.RookieCeremonyCmd;
   import com.qq.modules.rookieCeremony.command.RookieCeremonyViewCmd;
   import com.qq.modules.scratch.command.ScratchViewCmd;
   import com.qq.modules.seckill.command.SecKillViewCmd;
   import com.qq.modules.serverActivity.command.ServerActivityViewCmd;
   import com.qq.modules.shelling.command.ShellingViewCmd;
   import com.qq.modules.singlesDay.command.SinglesDayViewCmd;
   import com.qq.modules.slot.command.SlotViewCmd;
   import com.qq.modules.spring.command.SpringViewCmd;
   import com.qq.modules.tgp.command.TgpCmd;
   import com.qq.modules.thanksgiving.command.ThanksgivingCmd;
   import com.qq.modules.urlJump.command.UrlJumpCmd;
   import com.qq.modules.videoActivity.command.VideoActivityCmd;
   import com.qq.modules.welfareHall.WelfareHallTabType;
   import com.qq.modules.welfareHall.command.WelfareHallCmd;
   import com.qq.modules.yellowDiamond.command.YellowDiamondViewCmd;
   import com.qq.utils.UtilsManager;
   import com.qq.utils.external.QExternalUtil;
   import org.robotlegs.extend.command.StrongRobotlegCommand;
   
   public class ActivityViewCommand extends StrongRobotlegCommand
   {
      
      public static const NAME:String = "ActivityViewCommand";
       
      
      [Inject]
      public var activityProxy:ActivityProxy;
      
      public function ActivityViewCommand()
      {
         super();
      }
      
      public function addActivityIcon(param1:Array) : void
      {
         var _loc3_:uint = 0;
         var _loc2_:int = param1.length;
         var _loc4_:int = 0;
         while(_loc4_ < _loc2_)
         {
            _loc3_ = param1[_loc4_];
            switch(_loc3_)
            {
               case ActivityIconConst.ICON_DOWNLOAD_MINICLIENT:
                  if(QExternalUtil.getMicroClientId() < 0)
                  {
                     EntryIconCmd.addActivityIcon(_loc3_,ActivityViewCmd.openActivityByEntry,[_loc3_]);
                  }
                  break;
               case ActivityIconConst.ICON_MINI_CLIENT:
                  if(QExternalUtil.getMicroClientId() >= 0)
                  {
                     EntryIconCmd.addActivityIcon(_loc3_,ActivityViewCmd.openActivityByEntry,[_loc3_]);
                  }
                  break;
               case ActivityIconConst.ICON_ROOKIE_CEREMONEY:
                  RookieCeremonyCmd.getInfo();
                  break;
               default:
                  EntryIconCmd.addActivityIcon(_loc3_,ActivityViewCmd.openActivityByEntry,[_loc3_]);
                  break;
            }
            _loc4_++;
         }
      }
      
      public function removeActivityIcon(param1:Array) : void
      {
         var _loc3_:int = 0;
         var _loc2_:int = param1.length;
         var _loc4_:int = 0;
         while(_loc4_ < _loc2_)
         {
            _loc3_ = param1[_loc4_];
            EntryIconCmd.removeActivityIcon(_loc3_);
            _loc4_++;
         }
      }
      
      public function openActivityByEntry(param1:uint) : void
      {
         var _loc3_:ActivityCommonInfo = null;
         var _loc4_:uint = 0;
         var _loc5_:Object = null;
         var _loc6_:String = null;
         var _loc7_:Object = null;
         var _loc8_:String = null;
         var _loc9_:String = null;
         var _loc10_:String = null;
         var _loc11_:Array = null;
         var _loc12_:String = null;
         var _loc13_:Array = null;
         var _loc14_:String = null;
         var _loc2_:Vector.<ActivityCommonInfo> = this.activityProxy.getGroupByEntry(param1);
         if(_loc2_.length > 0)
         {
            _loc3_ = _loc2_[0];
            _loc4_ = _loc3_.viewType;
            switch(_loc4_)
            {
               case ActivityGlobal.VIEW_TYPE_BLUE_DIAMOND:
                  BlueVipCmd.openBlueVipWindow();
                  break;
               case ActivityGlobal.VIEW_TYPE_LOGIN_REWARD:
                  LoginRewardViewCmd.openLoginReward();
                  break;
               case ActivityGlobal.VIEW_TYPE_BETA_REWARD:
                  BetaRewardViewCmd.openBetaReward();
                  break;
               case ActivityGlobal.VIEW_TYPE_RECHARGE_REBATE:
                  RechargeRebateViewCmd.openRechargeRebate();
                  break;
               case ActivityGlobal.VIEW_TYPE_IMPORT_FLOW:
                  UrlJumpCmd.openUrlJumpWindow();
                  break;
               case ActivityGlobal.VIEW_TYPE_DOWNLOAD_ICON:
                  DownloadShortcutCmd.openDownloadShortcutWindow();
                  break;
               case ActivityGlobal.VIEW_TYPE_PRIVILEGE_HALL:
                  PrivilegeViewCmd.openHall();
                  break;
               case ActivityGlobal.VIEW_TYPE_PRIVILEGE_3366:
                  Daily3366ViewCmd.showDaily3366();
                  break;
               case ActivityGlobal.VIEW_TYPE_FIRST_RECHARGE:
                  FirstRechargeViewCmd.openWindow();
                  break;
               case ActivityGlobal.VIEW_TYPE_MINICLIENT:
                  MiniClientViewCmd.showMiniClientDailyActivity();
                  break;
               case ActivityGlobal.VIEW_TYPE_GROUP_BUYING:
                  GroupBuyingViewCmd.openGroupBuyingWindow();
                  break;
               case ActivityGlobal.VIEW_TYPE_QQ_BROWSER:
                  QQBrowerCmd.showMainWd();
                  break;
               case ActivityGlobal.VIEW_TYPE_BUFF_ACTIVITY:
                  BuffActivityViewCmd.openBuffActivityWindow();
                  break;
               case ActivityGlobal.VIEW_TYPE_SINGLES_DAY:
                  SinglesDayViewCmd.openSinglesDay();
                  break;
               case ActivityGlobal.VIEW_TYPE_THANKS_GIVING:
                  ThanksgivingCmd.openTanksgiving();
                  break;
               case ActivityGlobal.VIEW_TYPE_PRIVILEGE_ZONE:
                  PrivilegeViewCmd.openZone();
                  break;
               case ActivityGlobal.VIEW_TYPE_YELLOW_DIAMOND:
                  YellowDiamondViewCmd.openYellowDiamond();
                  break;
               case ActivityGlobal.VIEW_TYPE_ACTIVITY_FOR_TIMES:
                  ActivityForTimesCmd.openActivityForTimes();
                  break;
               case ActivityGlobal.VIEW_TYPE_SERVER_ACTIVITY:
                  ServerActivityViewCmd.openServerActivityWindow();
                  break;
               case ActivityGlobal.VIEW_TYPE_PINBALL:
                  ActPinballCmd.openActPinballWin();
                  break;
               case ActivityGlobal.VIEW_TYPE_Festival_Video:
                  _loc6_ = (_loc5_ = asgui.serialization.json.JSON.deserialize(_loc3_.clientParam))["jumpUrl"];
                  UtilsManager.gotoUrl(_loc6_,"_blank");
                  break;
               case ActivityGlobal.VIEW_TYPE_OPEN_NATIVE_PAGE:
                  _loc8_ = (_loc7_ = asgui.serialization.json.JSON.deserialize(_loc3_.clientParam))["jumpUrl"];
                  if((_loc9_ = _loc7_["params"]) != null && _loc9_.length > 0)
                  {
                     _loc10_ = "";
                     _loc11_ = _loc9_.split(";");
                     for each(_loc12_ in _loc11_)
                     {
                        if(_loc12_.length > 0)
                        {
                           _loc13_ = _loc12_.split(":");
                           switch(_loc13_[1])
                           {
                              case "serverID":
                                 _loc14_ = ExternalVars.ZONE_ID;
                           }
                           _loc10_ = _loc10_.concat(_loc13_[0],"=",_loc14_,"&");
                        }
                     }
                     if(_loc10_ != null && _loc10_.length > 0)
                     {
                        _loc8_ = _loc8_.concat("?",_loc10_);
                     }
                  }
                  QExternalUtil.openNativePage(_loc8_);
                  break;
               case ActivityGlobal.VIEW_TYPE_ACT_PENNY_SHOP:
                  ActPennyShopCmd.openWindow();
                  break;
               case ActivityGlobal.VIEW_TYPE_ACT_PlantCarnival:
                  ActPlantCarnivalViewCmd.openWindow();
                  break;
               case ActivityGlobal.VIEW_TYPE_ACT_HitJar:
                  ActHitJarViewCmd.openActHitJarMainWindow();
                  break;
               case ActivityGlobal.VIEW_TYPE_ACT_3Years:
                  Act3yearsViewCmd.openWindow();
                  break;
               case ActivityGlobal.VIEW_TYPE_IWAN_DAILYREWARD:
                  IWanVeiwCmd.openPrivilegeIWanWindow();
                  break;
               case ActivityGlobal.VIEW_TYPE_ONLINE_REWARD:
                  OnlineRewardCmd.clickDailyRewardIcon();
                  break;
               case ActivityGlobal.VIEW_TYPE_SLOT:
                  SlotViewCmd.openWindow();
                  break;
               case ActivityGlobal.VIEW_TYPE_SCRATCH:
                  ScratchViewCmd.openScratchWindow();
                  break;
               case ActivityGlobal.VIEW_TYPE_ARENA_DOUBLE_REWARD:
                  ActivityArenaDoubleBonusViewCmd.showWd();
                  break;
               case ActivityGlobal.VIEW_TYPE_SPRING:
                  SpringViewCmd.openWindow();
                  break;
               case ActivityGlobal.VIEW_TYPE_WELFARE_HALL:
               case ActivityGlobal.VIEW_TYPE_DODGE:
               case ActivityGlobal.VIEW_TYPE_CAT:
                  WelfareHallCmd.openWindow(WelfareHallTabType.WELFARE_HALL_TAB_TYPE_DAILY_WELFARE);
                  break;
               case ActivityGlobal.VIEW_TYPE_CHILDREN_DAY:
                  ChildrenDayViewCmd.openWindow();
                  break;
               case ActivityGlobal.VIEW_TYPE_PLANT_EXPLORE:
                  PlantExploreCmd.openPlantExploreWin();
                  break;
               case ActivityGlobal.VIEW_TYPE_CHALLENGE_LIMIT_TIME_ARENA:
               case ActivityGlobal.VIEW_TYPE_CHALLENGE_LIMIT_TIME_BIGFIGHT:
               case ActivityGlobal.VIEW_TYPE_CHALLENGE_LIMIT_TIME_ZOMBIEISLAND:
                  ActivityChallengeLimitTimeViewCmd.showWd();
                  break;
               case ActivityGlobal.VIEW_TYPE_TGP:
                  TgpCmd.openWindow();
                  break;
               case ActivityGlobal.VIEW_TYPE_DF51:
                  ActDf51Cmd.openActView();
                  break;
               case ActivityGlobal.VIEW_TYPE_ROOKIE_CEREMONY:
                  RookieCeremonyViewCmd.openWindow();
                  break;
               case ActivityGlobal.VIEW_TYPE_PC_MANAGER:
                  PcManagerViewCmd.openWindow();
                  break;
               case ActivityGlobal.VIEW_TYPE_DRAGON_BOAT:
                  DragonBoatViewCmd.openWindow();
                  break;
               case ActivityGlobal.VIEW_TYPE_CASTLE:
                  CastleViewCmd.openMainWindow();
                  break;
               case ActivityGlobal.VIEW_TYPE_QT:
                  ActQTCmd.openQTActWin();
                  break;
               case ActivityGlobal.VIEW_TYPE_COLLECT_WORD:
                  CollectWordViewCmd.openWindow();
                  break;
               case ActivityGlobal.VIEW_TYPE_GOLD_DIAMOND_RECHARGE_REBATE:
                  ActRechargeRebateViewCmd.openWindow();
                  break;
               case ActivityGlobal.VIEW_TYPE_LOGIN_ACTIVITY:
                  LoginActivityViewCmd.openWindow();
                  break;
               case ActivityGlobal.VIEW_NIGHT_CLUB_ACTIVITY:
                  ActNightclubViewCmd.openWindow();
                  break;
               case ActivityGlobal.VIEW_FLIPCARD_ACTIVITY:
                  ActFlipcardViewCmd.openWindow();
                  break;
               case ActivityGlobal.VIEW_WISHING_ACTIVITY:
                  ActWishingViewCmd.openWindow();
                  break;
               case ActivityGlobal.VIEW_TYPE_SHELLING:
                  ShellingViewCmd.openMainWindow();
                  break;
               case ActivityGlobal.VIEW_TYPE_HEFU_ACTIVITY:
                  HeFuActivityCmd.openHeFuActivityWin();
                  break;
               case ActivityGlobal.VIEW_TYPE_VIEDEO_ACTIVITY:
                  VideoActivityCmd.openVideoActivityWin();
                  break;
               case ActivityGlobal.VIEW_TYPE_HALLOWEEN:
                  HalloweenViewCmd.openHalloween();
                  break;
               case ActivityGlobal.VIEW_TYPE_SECKILL:
                  SecKillViewCmd.openWindow();
                  break;
               case ActivityGlobal.VIEW_TYPE_CONSUME_FUND:
               case ActivityGlobal.VIEW_TYPE_FUND_TRY:
                  ActFundCmd.openFundWindow();
                  break;
               case ActivityGlobal.VIEW_TYPE_14days:
                  Act14daysCmd.openWindow();
                  break;
               case ActivityGlobal.VIEW_TYPE_Dave_Red:
               case ActivityGlobal.VIEW_TYPE_God_Red:
                  ActRedCmd.openWindow();
                  break;
               case ActivityGlobal.VIEW_TYPE_XINYUE:
                  ActXYCmd.openWindow();
                  break;
               case ActivityGlobal.VIEW_TYPE_ACTQQGAME:
                  ActqqgameCmd.openWindow();
            }
         }
      }
   }
}
