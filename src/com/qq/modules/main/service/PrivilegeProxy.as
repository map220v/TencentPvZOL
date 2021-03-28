package com.qq.modules.main.service
{
   import PVZ.Cmd.Cmd_PVZPrivilege_SC;
   import PVZ.Cmd.Cmd_SyncPVZPrivilege_SC;
   import PVZ.Cmd.Dto_PVZPrivilege;
   import com.qq.CommandName;
   import com.qq.GameGloble;
   import com.qq.modules.basic.model.templates.ServerConfigTemplateFactory;
   import com.qq.modules.basic.modle.BasicProxy;
   import com.qq.modules.login.command.LoginServerCmd;
   import com.qq.modules.main.command.PrivilegeProxyCmd;
   import com.qq.modules.main.constant.PrivilegeConst;
   import com.qq.modules.main.model.templates.PrivilegeTemplateFactory;
   import com.qq.modules.main.model.templates.ce.PrivilegeConditoinCE;
   import com.qq.modules.vip.model.templates.VipInfoFactory;
   import com.qq.modules.vip.model.templates.VipInfoSetting;
   import com.qq.utils.DateUtils;
   import com.qq.utils.UrlManager;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   import tencent.io.service.events.SocketServiceEvent;
   
   public class PrivilegeProxy extends BasicProxy
   {
       
      
      public var privileges:Array;
      
      private var _timer:Timer;
      
      public function PrivilegeProxy()
      {
         super();
         this.privileges = [];
      }
      
      override public function init(param1:Array = null) : void
      {
         super.init(param1);
         this._timer = new Timer(5000);
         this._timer.addEventListener(TimerEvent.TIMER,this.onTimer);
      }
      
      private function onTimer(param1:TimerEvent) : void
      {
         var _loc2_:Number = NaN;
         if(GameGloble.actorModel.selfPrivilegeModel.vipCardId != 0)
         {
            _loc2_ = GameGloble.actorModel.selfPrivilegeModel.vipEndTime - DateUtils.getInstance().getServerTime();
            if(_loc2_ <= 0)
            {
               LoginServerCmd.requestVipInfo();
               PrivilegeProxyCmd.getPrivilege();
            }
         }
      }
      
      override public function listMsgInterests() : Array
      {
         return [[Cmd_PVZPrivilege_SC.$MessageID,this.onPrivilege_SC],[Cmd_SyncPVZPrivilege_SC.$MessageID,this.onSyncPrivilege_SC],[CommandName.ChangeVip,this.onChangeVip]];
      }
      
      private function onChangeVip(param1:Event) : void
      {
         if(GameGloble.actorModel.selfPrivilegeModel.vipCardId != 0)
         {
            if(!this._timer.running)
            {
               this._timer.start();
            }
         }
         else
         {
            this._timer.stop();
         }
      }
      
      private function onPrivilege_SC(param1:SocketServiceEvent) : void
      {
         var _loc3_:String = null;
         var _loc4_:String = null;
         var _loc2_:Cmd_PVZPrivilege_SC = param1.socketData as Cmd_PVZPrivilege_SC;
         this.privileges = _loc2_.privilege;
         if(this.hasPrivilege(PrivilegeConst.PRIVILEGE_PHYSICAL_GET) && GameGloble.actorModel.selfPrivilegeModel.vipGotPhysical != 0)
         {
            _loc3_ = UrlManager.getInstance().getUrl(UrlManager.Url_CollectCoin,"flag.png");
         }
         if(this.hasPrivilege(PrivilegeConst.PRIVILEGE_DAILY_DIAMOND) && GameGloble.actorModel.selfPrivilegeModel.vipGotTicket != 0)
         {
            _loc4_ = UrlManager.getInstance().getUrl(UrlManager.Url_CollectCoin,"flag.png");
         }
         GameGloble.privilegeProxy = this;
      }
      
      private function onSyncPrivilege_SC(param1:SocketServiceEvent) : void
      {
         var _loc2_:Cmd_SyncPVZPrivilege_SC = param1.socketData as Cmd_SyncPVZPrivilege_SC;
         this.privileges = _loc2_.privilege;
         dispatch(new Event(PrivilegeConst.PRIVILEGE_CHANGE));
      }
      
      public function hasPrivilege(param1:uint, param2:Boolean = false) : Boolean
      {
         var _loc3_:Dto_PVZPrivilege = null;
         var _loc4_:PrivilegeConditoinCE = null;
         for each(_loc3_ in this.privileges)
         {
            if(_loc3_.privilegeId == param1)
            {
               return true;
            }
         }
         if(param2)
         {
            if((_loc4_ = PrivilegeTemplateFactory.instance.getPrivilegeConditionById(param1)) != null)
            {
               if(GameGloble.actorModel.actorLevel >= _loc4_.needLv)
               {
                  return true;
               }
            }
         }
         return false;
      }
      
      public function getPrivilegeParamById(param1:uint, param2:Boolean = false) : uint
      {
         var _loc4_:Dto_PVZPrivilege = null;
         var _loc5_:PrivilegeConditoinCE = null;
         var _loc6_:VipInfoSetting = null;
         var _loc7_:Array = null;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc10_:String = null;
         var _loc11_:Array = null;
         var _loc3_:int = 0;
         for each(_loc4_ in this.privileges)
         {
            if(_loc4_.privilegeId == param1)
            {
               _loc3_ = _loc4_.privilegeParam;
               break;
            }
         }
         if(_loc3_ != 0)
         {
            return _loc3_;
         }
         if(param2)
         {
            if((_loc5_ = PrivilegeTemplateFactory.instance.getPrivilegeConditionById(param1)) == null)
            {
               return _loc3_;
            }
            if((_loc6_ = VipInfoFactory.instance.getVipInfoById(_loc5_.defaultVIPID)) != null)
            {
               _loc8_ = (_loc7_ = _loc6_.privilegeString.split(";")).length;
               _loc9_ = 0;
               while(_loc9_ < _loc8_)
               {
                  if((_loc11_ = (_loc10_ = _loc7_[_loc9_]).split(":"))[0] == param1)
                  {
                     return _loc11_[1];
                  }
                  _loc9_++;
               }
            }
         }
         return 0;
      }
      
      public function getPrivilegeById(param1:uint) : Dto_PVZPrivilege
      {
         var _loc2_:Dto_PVZPrivilege = null;
         for each(_loc2_ in this.privileges)
         {
            if(_loc2_.privilegeId == param1)
            {
               return _loc2_;
            }
         }
         return null;
      }
      
      public function get maxEnergyBuyNum() : int
      {
         var _loc1_:int = ServerConfigTemplateFactory.instance.iEnergyBuyTimes;
         if(this.hasPrivilege(PrivilegeConst.PRIVILEGE_ROLE_ENERGY))
         {
            _loc1_ += this.getPrivilegeParamById(PrivilegeConst.PRIVILEGE_ROLE_ENERGY);
         }
         return _loc1_;
      }
      
      public function get maxEnergy() : int
      {
         var _loc1_:uint = GameGloble.actorModel.levelTemplate.energyMax;
         if(this.hasPrivilege(PrivilegeConst.PRIVILEGE_ROLE_ENERGY))
         {
            _loc1_ += this.getPrivilegeParamById(PrivilegeConst.PRIVILEGE_ENERGY_ADD_MAX);
         }
         return _loc1_;
      }
   }
}
