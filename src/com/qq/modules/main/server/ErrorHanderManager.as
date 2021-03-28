package com.qq.modules.main.server
{
   import PVZ.Cmd.Dto_StringReplace;
   import PVZ.ErrorDefineType;
   import asgui.controls.Alert;
   import asgui.events.CloseEvent;
   import asgui.managers.ConfigManager;
   import asgui.managers.PopUpManager;
   import asgui.managers.SystemManager;
   import com.qq.GameGloble;
   import com.qq.constant.ErrorConstant;
   import com.qq.data.DataCacheManager;
   import com.qq.display.QAlert;
   import com.qq.modules.basic.model.templates.ServerConfigTemplateFactory;
   import com.qq.modules.battleLineup.command.BattleLineupCmd;
   import com.qq.modules.battleLineup.constant.BattleLineupConst;
   import com.qq.modules.expedition.ExpeditionConst;
   import com.qq.modules.main.command.CommonCmd;
   import com.qq.modules.main.command.GameFlowCmd;
   import com.qq.modules.main.model.templates.ce.ErrorTemplateCE;
   import com.qq.modules.secondaryPassword.command.SecondaryPasswordCmd;
   import com.qq.modules.td.logic.TDDebugManager;
   import com.qq.net.IdleMessageSendManager;
   import com.qq.utils.CommandDispatcher;
   import com.qq.utils.UtilsManager;
   import com.qq.utils.db.ClientDBTableName;
   import tencent.base.utils.StringUtil;
   
   public class ErrorHanderManager
   {
       
      
      public function ErrorHanderManager()
      {
         super();
      }
      
      public static function getErrorStr(param1:int) : String
      {
         var _loc3_:String = null;
         var _loc2_:ErrorTemplateCE = DataCacheManager.getInstance().getTemplateDataById(ClientDBTableName.Table_ErrorInfo,param1,ErrorTemplateCE) as ErrorTemplateCE;
         if(_loc2_ != null)
         {
            _loc3_ = _loc2_.desc;
         }
         else
         {
            _loc3_ = "未知错误" + param1;
         }
         return _loc3_;
      }
      
      public static function errorHandler(param1:int, param2:Array = null) : void
      {
         var _loc5_:Array = null;
         var _loc6_:String = null;
         var _loc9_:Dto_StringReplace = null;
         var _loc10_:Dto_StringReplace = null;
         var _loc11_:Alert = null;
         var _loc3_:ErrorTemplateCE = DataCacheManager.getInstance().getTemplateDataById(ClientDBTableName.Table_ErrorInfo,param1,ErrorTemplateCE) as ErrorTemplateCE;
         var _loc4_:Function = null;
         switch(param1)
         {
            case -15:
               return;
            case ErrorDefineType.Error_ExpeditionFight_InBanActionCD:
               CommandDispatcher.send(ExpeditionConst.Event_Battle_RetryRobCmd);
               return;
            case ErrorDefineType.Error_ElseLogin:
               _loc4_ = refreshGameHandler;
               break;
            case ErrorDefineType.Error_War_AtLeastOneNoEmptyTeam:
               CommandDispatcher.send(BattleLineupConst.LINEUP_UPDATE);
               break;
            case ErrorDefineType.Error_Friend_HelpCardPower:
               BattleLineupCmd.getFriendCardList();
               break;
            case ErrorDefineType.Error_SecondPwd_PwdError:
               SecondaryPasswordCmd.parseErrorCodeInputError();
               break;
            case ErrorDefineType.Error_SecondPwd_OldEqualNew:
               SecondaryPasswordCmd.parseErrorCodeOldEqualNew();
               break;
            case ErrorDefineType.Error_Cheat:
            case ErrorDefineType.Error_TD_NotExistLevel:
            case ErrorDefineType.Error_TD_NotPassPreLevel:
            case ErrorDefineType.Error_TD_LevelNoThisAchievement:
            case ErrorDefineType.Error_TD_LevelGateHasUnlock:
            case ErrorDefineType.Error_TD_LevelPreGatelock:
            case ErrorDefineType.Error_TD_TDLogParseError:
            case ErrorDefineType.Error_SnowMan_NoSuchMode:
            case ErrorDefineType.Error_SnowMan_FinishTimeExpire:
            case ErrorDefineType.Error_SnowMan_KillNumError:
            case ErrorDefineType.Error_NoEndTD_FinishTimeExpire:
            case ErrorDefineType.Error_NoEndTD_ModeNotExist:
            case ErrorDefineType.Error_NoEndTD_NotTodayMode:
            case ErrorDefineType.Error_DailyTD_FinishTimeExpire:
            case ErrorDefineType.Error_DailyTD_AlreadyPass:
            case ErrorDefineType.Error_DailyTD_FormerNotPass:
            case ErrorDefineType.Error_TableNoData:
               TDDebugManager.getInstance().uncheckTDSeverMsg();
               break;
            case ErrorDefineType.Error_Item_BagNoLeftSpace:
            case ErrorDefineType.Error_Item_BagNoLeftSpaceForAction:
            case ErrorDefineType.Error_Item_UseBatchGridLimit:
               param2 = new Array();
               (_loc9_ = new Dto_StringReplace()).name = "bag";
               _loc9_.value = "（当前背包容量" + GameGloble.getBagTotal() + "/" + (ServerConfigTemplateFactory.instance.iItemMaxBagSize - ServerConfigTemplateFactory.instance.iItemReserveBagSize) + ")";
               param2.push(_loc9_);
         }
         if(_loc3_ != null)
         {
            _loc6_ = _loc3_.desc;
            if(param2 != null && param2.length > 0)
            {
               for each(_loc10_ in param2)
               {
                  _loc6_ = StringUtil.replace(_loc6_,"{" + _loc10_.name + "}",_loc10_.value);
               }
            }
         }
         else
         {
            _loc6_ = "未知错误" + param1;
         }
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         if(_loc3_ != null)
         {
            _loc7_ = _loc3_.showPos;
            switch(_loc3_.handlerID)
            {
               case ErrorConstant.Handler_Refresh:
                  _loc4_ = refreshGameHandler;
                  break;
               case ErrorConstant.Handler_GotoHomeSite:
                  _loc4_ = gotoHome;
                  break;
               case ErrorConstant.Handler_GotoCity:
                  _loc4_ = gotoCity;
                  break;
               case ErrorConstant.Handler_ShowBuyCoinPanel:
                  QAlert.Show("需求金币不足");
                  break;
               case ErrorConstant.Handler_ShowBuyEnergy:
                  _loc4_ = CommonCmd.showBuyPhysicalPanel;
                  break;
               case ErrorConstant.Handler_FlyText:
                  _loc4_ = CommonCmd.txtFly;
                  _loc5_ = [_loc6_];
            }
            _loc8_ = _loc3_.isForbidConnectAgain;
         }
         if(_loc8_ == 1)
         {
            GameFlowCmd.forbidConnectAgain();
         }
         switch(_loc7_)
         {
            case ErrorConstant.ShowPos_Chat:
               break;
            case ErrorConstant.ShowPos_TV:
               break;
            case ErrorConstant.DIRECTLY_CALL_HANDLER:
               if(_loc4_ != null)
               {
                  _loc4_();
               }
               break;
            default:
               if(_loc5_ != null)
               {
                  _loc4_.apply(null,_loc5_);
               }
               else
               {
                  Alert.okLabel = "确定";
                  _loc11_ = QAlert.Show(_loc6_,"",Alert.OK,SystemManager.instance.ErrorCodeLayer,_loc4_);
                  PopUpManager.CenterPopUp(_loc11_);
               }
         }
      }
      
      private static function gotoCity(param1:CloseEvent) : void
      {
         GameFlowCmd.gotoCity();
      }
      
      public static function gotoHome(param1:CloseEvent) : void
      {
         var _loc2_:String = ConfigManager.GetConfig("homesite");
         UtilsManager.gotoUrl(_loc2_,"_self");
      }
      
      private static function refreshGameHandler(param1:CloseEvent) : void
      {
         IdleMessageSendManager.getInstance().stop();
         UtilsManager.gotoUrl("javascript:window.location.reload( false );","_self");
      }
   }
}
