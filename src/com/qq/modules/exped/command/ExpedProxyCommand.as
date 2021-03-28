package com.qq.modules.exped.command
{
   import PVZ.Cmd.Cmd_Setout_BuyMapWarSetoutTimes_CS;
   import PVZ.Cmd.Cmd_Setout_GetCityList_CS;
   import PVZ.Cmd.Cmd_Setout_GetSetoutTimes_CS;
   import PVZ.Cmd.Cmd_Setout_GetTempleList_CS;
   import PVZ.Cmd.SetoutTimesType;
   import PVZ.ErrorDefineType;
   import asgui.controls.Alert;
   import asgui.events.CloseEvent;
   import asgui.utils.StringUtil;
   import com.qq.GameGloble;
   import com.qq.display.QAlert;
   import com.qq.modules.bag.model.vo.ItemVO;
   import com.qq.modules.exped.ExpedGlobal;
   import com.qq.modules.exped.model.ExpedProxy;
   import com.qq.modules.exped.model.vo.ExpedInfoVO;
   import com.qq.modules.main.command.CommonCmd;
   import com.qq.modules.main.server.ErrorHanderManager;
   import com.qq.modules.main.server.PvzSocketService;
   import com.qq.templates.font.FontHKHB;
   import com.qq.templates.font.FontNormal;
   import org.robotlegs.extend.command.StrongRobotlegCommand;
   
   public class ExpedProxyCommand extends StrongRobotlegCommand
   {
      
      public static const NAME:String = "ExpedProxyCommand";
       
      
      [Inject]
      public var pvzService:PvzSocketService;
      
      [Inject]
      public var expedProxy:ExpedProxy;
      
      public function ExpedProxyCommand()
      {
         super();
      }
      
      public function queryCityList(param1:int, param2:int, param3:int) : void
      {
         var _loc4_:Cmd_Setout_GetCityList_CS;
         (_loc4_ = new Cmd_Setout_GetCityList_CS()).type = param1;
         _loc4_.startIndex = param2;
         _loc4_.endIndex = param3;
         this.pvzService.sendMessage(_loc4_);
      }
      
      public function queryTemplateList(param1:int, param2:int, param3:int) : void
      {
         var _loc4_:Cmd_Setout_GetTempleList_CS;
         (_loc4_ = new Cmd_Setout_GetTempleList_CS()).type = param1;
         _loc4_.startIndex = param2;
         _loc4_.endIndex = param3;
         this.pvzService.sendMessage(_loc4_);
      }
      
      public function queryTimes(param1:int) : void
      {
         var _loc2_:Cmd_Setout_GetSetoutTimes_CS = new Cmd_Setout_GetSetoutTimes_CS();
         _loc2_.type = param1;
         this.pvzService.sendMessage(_loc2_);
      }
      
      public function buyExpedCount() : void
      {
         var _loc2_:String = null;
         var _loc1_:ExpedInfoVO = this.expedProxy.getInfo(SetoutTimesType.SetoutTimesType_City);
         if(_loc1_)
         {
            if(_loc1_.expedCount >= _loc1_.totalExpedCount)
            {
               _loc2_ = FontNormal.EXPED_ERROR_FREE_FULL_COUNT;
            }
            else if(_loc1_.payCount <= 0)
            {
               _loc2_ = FontNormal.EXPED_ERRO_PAY_FULL_COUNT;
            }
            else
            {
               this.buyCount(FontHKHB.EXPED_BUY_COUNT);
            }
            if(_loc2_)
            {
               QAlert.Show(_loc2_);
            }
         }
      }
      
      private function buyCount(param1:String, param2:Function = null, param3:Array = null) : void
      {
         var onAletClose:Function = null;
         var content:String = param1;
         var callBack:Function = param2;
         var params:Array = param3;
         onAletClose = function(param1:CloseEvent):void
         {
            var _loc2_:Cmd_Setout_BuyMapWarSetoutTimes_CS = null;
            if(param1.detail == Alert.YES)
            {
               ExpedGlobal.setBuyCallBack(callBack,params);
               _loc2_ = new Cmd_Setout_BuyMapWarSetoutTimes_CS();
               pvzService.sendMessage(_loc2_);
            }
         };
         var info:ExpedInfoVO = this.expedProxy.getInfo(SetoutTimesType.SetoutTimesType_City);
         var item:ItemVO = ExpedGlobal.getExpedPayCost(info.totalPayCount - info.payCount);
         QAlert.Show(StringUtil.substitute(content,item.amount),"",Alert.YES | Alert.NO,null,onAletClose,null,null,null,null,350,230);
      }
      
      public function checkAndExped(param1:Function, param2:Array = null) : void
      {
         var _loc3_:ExpedInfoVO = null;
         if(GameGloble.actorModel.durability >= ExpedGlobal.expedNeedDurability)
         {
            _loc3_ = this.expedProxy.getInfo(SetoutTimesType.SetoutTimesType_City);
            if(_loc3_.expedCount > 0)
            {
               this.checkPlantHP(param1,param2);
            }
            else if(_loc3_.payCount > 0)
            {
               this.buyCount(FontHKHB.EXPED_BUY_COUNT_FREE,this.checkPlantHP,[param1,param2]);
            }
            else
            {
               QAlert.Show(FontHKHB.EXPED_COUNT_LIMIT);
            }
         }
         else
         {
            ErrorHanderManager.errorHandler(ErrorDefineType.Error_War_NotEnoughDuration);
         }
      }
      
      public function checkPlantHP(param1:Function, param2:Array = null) : void
      {
         var cost:int = 0;
         var callBack:Function = param1;
         var params:Array = param2;
         cost = GameGloble.actorModel.battleCardModel.defaultFormationVo.dto.recoverHpCost;
         if(cost > GameGloble.actorModel.actorCoin)
         {
            CommonCmd.showBuyCoinPanel(StringUtil.substitute(FontHKHB.EXPED_REPAIR_HP,cost));
         }
         else if(cost > 0)
         {
            var onClick:Function = function(param1:CloseEvent):void
            {
               if(param1.detail == Alert.OK && GameGloble.actorModel.actorCoin >= cost)
               {
                  applyCallBack(callBack,params);
               }
            };
            QAlert.Show(StringUtil.substitute(FontHKHB.EXPED_REPAIR_HP,cost),"",Alert.OK | Alert.NO,null,onClick);
         }
         else
         {
            this.applyCallBack(callBack,params);
         }
      }
      
      private function applyCallBack(param1:Function, param2:Array) : void
      {
         if(param1 != null)
         {
            if(param2)
            {
               param1.apply(null,param2);
            }
            else
            {
               param1.apply();
            }
         }
      }
   }
}
