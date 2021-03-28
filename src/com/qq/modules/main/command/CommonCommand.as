package com.qq.modules.main.command
{
   import PVZ.Cmd.Cmd_OpenPrivilege_CS;
   import PVZ.Cmd.Cmd_PlayZoneTask_CS;
   import PVZ.Cmd.Dto_PlayZoneTask;
   import PVZ.Cmd.E_OpenPrivilege;
   import asgui.blit.data.BlitDataManager;
   import asgui.blit.display.BlitDisplayContainerBatchEncoderCollectorManager;
   import asgui.blit.display.starling.IBlitStarlingDisplay;
   import asgui.controls.Alert;
   import asgui.core.Application;
   import asgui.core.IDisposable;
   import asgui.events.CloseEvent;
   import asgui.managers.LoaderManager;
   import asgui.managers.PopUpManager;
   import asgui.managers.ToolTipManager;
   import asgui.resources.AssetManager;
   import asgui.utils.IAnimatable;
   import asgui.utils.StringUtil;
   import asgui.utils.WorldClock;
   import com.qq.CommandName;
   import com.qq.GameGloble;
   import com.qq.IMyApplication;
   import com.qq.constant.ItemID;
   import com.qq.constant.QuickPayType;
   import com.qq.display.QAlert;
   import com.qq.modules.bag.model.ItemTemplateFactory;
   import com.qq.modules.basic.event.CommonEvent;
   import com.qq.modules.basic.model.templates.ServerConfigTemplateFactory;
   import com.qq.modules.goldExchange.command.GoldExchangeViewCmd;
   import com.qq.modules.main.constant.PrivilegeConst;
   import com.qq.modules.main.constant.UseDiamondConstant;
   import com.qq.modules.main.logic.flyitem.FlyRewardItemView;
   import com.qq.modules.main.logic.flytext.FlyTextView;
   import com.qq.modules.main.logic.moveitem.MoveRewardItemView;
   import com.qq.modules.main.model.StoreModel;
   import com.qq.modules.main.model.WhenAfterBattleDoProxy;
   import com.qq.modules.main.server.PvzSocketService;
   import com.qq.modules.main.service.PrivilegeProxy;
   import com.qq.modules.main.view.components.ConfirmWindowCE;
   import com.qq.modules.main.view.components.DiamondNotEnoughCE;
   import com.qq.modules.main.view.components.UseDiamondView;
   import com.qq.modules.main.view.components.VIPConfirmPanel;
   import com.qq.modules.roleInfo.command.RoleInfoCmd;
   import com.qq.modules.vip.constant.VipConst;
   import com.qq.modules.vip.model.templates.VipInfoFactory;
   import com.qq.templates.font.FontHKHB;
   import com.qq.templates.font.FontNormal;
   import com.qq.utils.CommandDispatcher;
   import com.qq.utils.UtilsManager;
   import flash.display.DisplayObjectContainer;
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.geom.Point;
   import flash.utils.setTimeout;
   import org.as3commons.logging.api.getLogger;
   import org.robotlegs.extend.command.StrongRobotlegCommand;
   
   public class CommonCommand extends StrongRobotlegCommand
   {
       
      
      [Inject]
      public var pvzService:PvzSocketService;
      
      [Inject]
      public var storeModel:StoreModel;
      
      [Inject]
      public var battleDelay:WhenAfterBattleDoProxy;
      
      [Inject]
      public var privilegeProxy:PrivilegeProxy;
      
      public function CommonCommand()
      {
         super();
      }
      
      public function itemMove(param1:Array, param2:Point, param3:Point, param4:Boolean = false, param5:Function = null) : void
      {
         var _loc9_:Object = null;
         var _loc10_:MoveRewardItemView = null;
         var _loc6_:int = 0;
         var _loc7_:int = param1.length;
         var _loc8_:int = 0;
         while(_loc8_ < _loc7_)
         {
            _loc9_ = param1[_loc8_];
            _loc10_ = new MoveRewardItemView();
            if(param2)
            {
               _loc10_.x = param2.x;
               _loc10_.y = param2.y;
            }
            else
            {
               _loc10_.x = Math.max(0,GameGloble.stage.mouseX - _loc10_.width * 0.5);
               _loc10_.y = Math.max(250,GameGloble.stage.mouseY);
            }
            setTimeout(this.startRewardItemMove,_loc6_,_loc10_,_loc9_,param4,param3,param5);
            if(_loc8_ > 3)
            {
               _loc6_ += 500;
            }
            else
            {
               _loc6_ += 800;
            }
            _loc8_++;
         }
      }
      
      private function startRewardItemMove(param1:MoveRewardItemView, param2:Object, param3:Boolean, param4:Point, param5:Function) : void
      {
         param1.reset([param2,param3,param4,param5]);
         (Application.application as IMyApplication).topEffectLayer.addChild(param1);
      }
      
      public function itemFly(param1:Array, param2:Boolean = false, param3:Point = null) : void
      {
         var _loc7_:Object = null;
         var _loc8_:FlyRewardItemView = null;
         var _loc4_:int = 0;
         var _loc5_:int = param1.length;
         var _loc6_:int = 0;
         while(_loc6_ < _loc5_)
         {
            _loc7_ = param1[_loc6_];
            _loc8_ = new FlyRewardItemView();
            if(param3)
            {
               _loc8_.x = param3.x;
               _loc8_.y = param3.y;
            }
            else
            {
               _loc8_.x = Math.max(0,GameGloble.stage.mouseX - _loc8_.width * 0.5);
               _loc8_.y = Math.max(250,GameGloble.stage.mouseY);
            }
            setTimeout(this.startRewardItemFly,_loc4_,_loc8_,_loc7_,param2);
            if(_loc6_ > 3)
            {
               _loc4_ += 500;
            }
            else
            {
               _loc4_ += 800;
            }
            _loc6_++;
         }
      }
      
      private function startRewardItemFly(param1:FlyRewardItemView, param2:Object, param3:Boolean) : void
      {
         param1.reset([param2,param3]);
         (Application.application as IMyApplication).topEffectLayer.addChild(param1);
      }
      
      public function showLoading() : void
      {
         this.dispatch(new CommonEvent(CommandName.Common_ShowLoding));
      }
      
      public function playClassMcEffct(param1:String, param2:Point = null, param3:Function = null, param4:DisplayObjectContainer = null, param5:Point = null) : void
      {
         var _loc6_:MovieClip = AssetManager.GetNewClass(param1) as MovieClip;
         this.playMovieClip(_loc6_,param2,param3,param4,param5);
      }
      
      public function playMovieClip(param1:MovieClip, param2:Point = null, param3:Function = null, param4:DisplayObjectContainer = null, param5:Point = null) : void
      {
         if(param1 != null)
         {
            if(param2 == null)
            {
               param1.x = (GameGloble.stage.stageWidth - param1.width) * 0.5;
               param1.y = (GameGloble.stage.stageHeight - param1.height) * 0.5;
            }
            else
            {
               param1.x = param2.x;
               param1.y = param2.y;
            }
            if(param5 != null)
            {
               param1.x += param5.x;
               param1.y += param5.y;
            }
            if(param4 == null)
            {
               param4 = (Application.application as IMyApplication).topEffectLayer;
            }
            param4.addChild(param1);
            if(param3 == null)
            {
               param3 = this.onPlayMc;
            }
            param1.addEventListener(Event.ENTER_FRAME,param3);
         }
      }
      
      private function onPlayMc(param1:Event) : void
      {
         var _loc2_:MovieClip = param1.currentTarget as MovieClip;
         if(_loc2_.currentFrame == _loc2_.totalFrames)
         {
            _loc2_.removeEventListener(Event.ENTER_FRAME,this.onPlayMc);
            _loc2_.stop();
            UtilsManager.removeFromContainer(_loc2_);
         }
      }
      
      public function txtFly(param1:String, param2:Number = NaN, param3:Number = NaN, param4:int = 0, param5:String = null, param6:Boolean = false) : void
      {
         var _loc7_:FlyTextView = new FlyTextView(param4,param5);
         if(param6)
         {
            param2 = GameGloble.stage.mouseX - _loc7_.width * 0.5;
            param3 = Math.max(250,GameGloble.stage.mouseY);
         }
         else
         {
            if(isNaN(param2))
            {
               param2 = (Application.application.width - _loc7_.width) / 2;
            }
            if(isNaN(param3))
            {
               param3 = (Application.application.height - _loc7_.height) / 2;
            }
         }
         _loc7_.x = param2;
         _loc7_.y = param3;
         _loc7_.reset(param1);
         (Application.application as IMyApplication).topEffectLayer.addChild(_loc7_);
      }
      
      public function shotScreen() : void
      {
         dispatch(new CommonEvent(CommandName.Common_ShotScreen));
      }
      
      public function clearBlitDataAndCache() : void
      {
         var _loc2_:int = 0;
         ToolTipManager.RemoveAllTooltips();
         BlitDisplayContainerBatchEncoderCollectorManager.instance.Clear();
         GameGloble.tdBlitBoneManager.clearAllChildren();
         GameGloble.normalBlitBoneManager.clearAllChildren();
         var _loc1_:Vector.<IAnimatable> = WorldClock.clock.removeByClass(IBlitStarlingDisplay);
         var _loc3_:int = _loc1_.length;
         while(_loc2_ < _loc3_)
         {
            (_loc1_[_loc2_] as IDisposable).Dispose();
            _loc2_++;
         }
         BlitDataManager.ClearDataBefore(0);
         BlitDataManager.ClearExternalBitmapMap(0);
         GameGloble.tdBlitBoneManager.clearAllBoneDataCache(0,GameGloble.checkClearNormalBoneDataFunc);
         GameGloble.normalBlitBoneManager.clearAllBoneDataCache(0,GameGloble.checkClearNormalBoneDataFunc);
         LoaderManager.impl.ClearCache();
      }
      
      public function showConfirmWindow(param1:String, param2:Function = null, param3:Array = null, param4:Function = null, param5:Array = null, param6:int = 0) : void
      {
         var _loc7_:ConfirmWindowCE = null;
         if(QuickPayType.isQuickPay(param6) && QuickPayType.isTipOnlyThis(param6))
         {
            if(param2 != null)
            {
               param2.apply(this,param3);
            }
         }
         else
         {
            (_loc7_ = new ConfirmWindowCE()).reset([param1,param2,param3,param4,param5,param6]);
            PopUpManager.AddPopUp(_loc7_,null,true);
         }
      }
      
      public function confirmUseDiamond(param1:String, param2:int, param3:Function, param4:Function = null, param5:uint = 0, param6:Boolean = false, param7:Array = null, param8:Boolean = false, param9:int = -1, param10:int = 1) : void
      {
         var _loc11_:UseDiamondView = new UseDiamondView();
         CommandDispatcher.send(UseDiamondConstant.INIT_USE_DIAMOND_OBJ,{
            "descTxt":param1,
            "confirmedFunc":param3,
            "cancelFunc":param4,
            "diamondCost":param2,
            "type":param5,
            "needGoldDiamond":param6,
            "confirmedCallbackParams":param7,
            "isCustomDesc":param8,
            "itemID":param9,
            "itemNum":param10
         });
      }
      
      public function showDiamondNotEnough(param1:int, param2:Boolean = false) : void
      {
         var _loc3_:DiamondNotEnoughCE = new DiamondNotEnoughCE();
         var _loc4_:int = !!param2 ? int(ItemID.GoldDiamond) : int(ItemID.GiftDiamond1);
         _loc3_.textarea_desc.htmlText = StringUtil.substitute(FontHKHB.DIAMOND_NOT_ENOUGH,param1,ItemTemplateFactory.instance.getBagItemName(_loc4_));
         PopUpManager.AddPopUp(_loc3_);
      }
      
      public function addAfterBattleDoFunc(param1:Function, param2:Array) : void
      {
         this.battleDelay.addDelayFunc(param1,param2);
      }
      
      public function useCoinCheck(param1:int, param2:Function, param3:Array = null) : void
      {
         if(GameGloble.actorModel.actorCoin >= param1)
         {
            if(param2 != null)
            {
               param2.apply(this,param3);
            }
            else
            {
               this.showBuyCoinPanel();
            }
         }
      }
      
      public function showBuyCoinPanel(param1:String = "") : void
      {
         var text:String = param1;
         QAlert.Show(text + FontNormal.BUY_COIN_TIP,FontNormal.Common_NoEnough_Coin,Alert.YES | Alert.NO,null,function(param1:CloseEvent):void
         {
            if(param1.detail == Alert.YES)
            {
               GoldExchangeViewCmd.showBuyCoinPanel();
            }
         },FontHKHB.GO_TO_BUY);
      }
      
      public function showBuyPhysicalPanel(param1:String = "") : void
      {
         var _loc3_:String = null;
         var _loc4_:int = 0;
         var _loc5_:String = null;
         var _loc2_:int = this.privilegeProxy.maxEnergyBuyNum - GameGloble.actorModel.currEnergyBuyNum;
         if(GameGloble.actorModel.selfPrivilegeModel.vipCardId != 0)
         {
            _loc4_ = this.privilegeProxy.getPrivilegeParamById(PrivilegeConst.PRIVILEGE_ROLE_ENERGY);
            if(GameGloble.actorModel.currEnergyBuyNum >= ServerConfigTemplateFactory.instance.iEnergyBuyTimes + _loc4_)
            {
               _loc5_ = (_loc5_ = (_loc5_ = (_loc5_ = FontHKHB.VIP_BUY_ENERGY_TIP) + StringUtil.substitute(FontHKHB.VIP_PHYSICAL_BUY_LIST,VipInfoFactory.instance.getVipName(VipConst.CARD_LEVEL_1),VipInfoFactory.instance.getEnergyVipAdd(VipConst.CARD_LEVEL_1))) + StringUtil.substitute(FontHKHB.VIP_PHYSICAL_BUY_LIST,VipInfoFactory.instance.getVipName(VipConst.CARD_LEVEL_2),VipInfoFactory.instance.getEnergyVipAdd(VipConst.CARD_LEVEL_2))) + StringUtil.substitute(FontHKHB.VIP_PHYSICAL_BUY_LIST,VipInfoFactory.instance.getVipName(VipConst.CARD_LEVEL_3),VipInfoFactory.instance.getEnergyVipAdd(VipConst.CARD_LEVEL_3));
               CommonCmd.showVipConfirm(_loc5_);
               return;
            }
            _loc3_ = param1 + FontNormal.BUY_ENERGY_TIP + StringUtil.substitute(FontNormal.BUY_ENERGY_TIP_VIP,VipInfoFactory.instance.getVipInfoById(GameGloble.actorModel.selfPrivilegeModel.vipCardId).name,this.privilegeProxy.maxEnergyBuyNum,_loc2_);
         }
         else
         {
            if(GameGloble.actorModel.currEnergyBuyNum >= ServerConfigTemplateFactory.instance.iEnergyBuyTimes)
            {
               CommonCmd.showVipConfirm(FontHKHB.VIP_BUY_ENERGY_TIP + FontHKHB.VIP_PHYSICAL_TIME_UP);
               return;
            }
            _loc3_ = param1 + StringUtil.substitute(FontNormal.BUY_ENERGY_TIP,GameGloble.actorModel.selfPrivilegeModel.vipCardId,this.privilegeProxy.maxEnergyBuyNum,_loc2_);
         }
         QAlert.Show(_loc3_,FontNormal.Common_NoEnough_Energy,Alert.YES | Alert.NO,null,this.onBuyPhysicalBack,FontHKHB.GO_TO_BUY);
      }
      
      private function onBuyPhysicalBack(param1:CloseEvent) : void
      {
         if(param1.detail == Alert.YES)
         {
            RoleInfoCmd.buyPhysical();
         }
      }
      
      public function showVipConfirm(param1:String) : void
      {
         var _loc2_:VIPConfirmPanel = new VIPConfirmPanel();
         _loc2_.data = param1;
         PopUpManager.AddPopUp(_loc2_,null,true);
      }
      
      public function sendVipPaySuccess(param1:Object = null) : void
      {
         var _loc2_:Cmd_OpenPrivilege_CS = new Cmd_OpenPrivilege_CS();
         var _loc3_:String = ExternalVars.PlatformFlag;
         switch(_loc3_)
         {
            case ExternalVars.SFROM_QQGAME:
            case ExternalVars.SFROM_3366:
               _loc2_.ePrivilege = E_OpenPrivilege.E_OpenPrivilege_BlueDiamond;
               break;
            case ExternalVars.SFROM_QZONE:
               _loc2_.ePrivilege = E_OpenPrivilege.E_OpenPrivilege_YellowDiamond;
               break;
            default:
               _loc2_.ePrivilege = E_OpenPrivilege.E_OpenPrivilege_QQMember;
         }
         this.pvzService.sendMessage(_loc2_);
      }
      
      public function doQzoneSummerHoliday(param1:String) : void
      {
         var _loc2_:Array = null;
         var _loc3_:Array = null;
         var _loc4_:int = 0;
         var _loc5_:Cmd_PlayZoneTask_CS = null;
         var _loc6_:int = 0;
         var _loc7_:String = null;
         var _loc8_:String = null;
         var _loc9_:Dto_PlayZoneTask = null;
         if(param1.length > 0)
         {
            _loc2_ = new Array();
            _loc3_ = param1.split("&");
            _loc4_ = 0;
            while(_loc4_ < _loc3_.length)
            {
               _loc6_ = _loc3_[_loc4_].indexOf("=");
               _loc7_ = _loc3_[_loc4_].substr(0,_loc6_);
               _loc8_ = _loc3_[_loc4_].substr(_loc6_ + 1);
               (_loc9_ = new Dto_PlayZoneTask()).key = _loc7_;
               _loc9_.value = _loc8_;
               getLogger("qzone").info("key:" + _loc7_ + " value:" + _loc8_);
               _loc2_.push(_loc9_);
               _loc4_++;
            }
            (_loc5_ = new Cmd_PlayZoneTask_CS()).playZoneTask = _loc2_;
            this.pvzService.sendMessage(_loc5_);
         }
      }
   }
}
