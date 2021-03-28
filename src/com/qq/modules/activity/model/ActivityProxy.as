package com.qq.modules.activity.model
{
   import PVZ.Cmd.Cmd_FlexibleActivity_GetActivityList_SC;
   import PVZ.Cmd.Cmd_FlexibleActivity_TakeReward_SC;
   import PVZ.Cmd.Dto_FlexibleActivityCommon;
   import PVZ.Cmd.Dto_FlexibleActivityCondtionReward;
   import PVZ.Cmd.Dto_FlexibleCrossGameActivityCondtionReward;
   import PVZ.Cmd.Dto_IdNum;
   import PVZ.Cmd.Dto_ItemInfo;
   import PVZ.Cmd.FlexibleActivity_1;
   import PVZ.Cmd.FlexibleActivity_1001;
   import PVZ.Cmd.FlexibleActivity_1007;
   import PVZ.Cmd.FlexibleActivity_13;
   import com.qq.GameGloble;
   import com.qq.modules.activity.ActivityGlobal;
   import com.qq.modules.activity.command.ActivityProxyCmd;
   import com.qq.modules.activity.command.ActivityViewCmd;
   import com.qq.modules.bag.ItemType;
   import com.qq.modules.bag.model.BagItemTemplate;
   import com.qq.modules.bag.model.BagService;
   import com.qq.modules.bag.model.ItemTemplateFactory;
   import com.qq.modules.basic.event.CommonEvent;
   import com.qq.modules.basic.modle.BasicProxy;
   import com.qq.modules.main.command.CommonCmd;
   import tencent.io.service.events.SocketServiceEvent;
   
   public class ActivityProxy extends BasicProxy
   {
      
      private static const AUTO_USE_SUBTYPE_LIST:Array = [ItemType.SUB_TYPE_TREASURE_CHEST,ItemType.SUB_TYPE_GIFT_BAG];
       
      
      private var m_vecActivity:Vector.<ActivityCommonInfo>;
      
      private var m_aryIcon:Array;
      
      [Inject]
      public var bagService:BagService;
      
      public function ActivityProxy()
      {
         this.m_vecActivity = new Vector.<ActivityCommonInfo>();
         this.m_aryIcon = [];
         super();
      }
      
      override public function listMsgInterests() : Array
      {
         return [[Cmd_FlexibleActivity_GetActivityList_SC.$MessageID,this.onCmd_FlexibleActivity_GetActivityList_SC],[FlexibleActivity_1.$MessageID,this.onFlexibleActivity_1_SC],[FlexibleActivity_1001.$MessageID,this.onFlexibleActivity_1001_SC],[FlexibleActivity_1007.$MessageID,this.onFlexibleActivity_1007_SC],[FlexibleActivity_13.$MessageID,this.onFlexibleActivity_13_SC],[Cmd_FlexibleActivity_TakeReward_SC.$MessageID,this.onCmd_FlexibleActivity_TakeReward_SC]];
      }
      
      private function onCmd_FlexibleActivity_TakeReward_SC(param1:SocketServiceEvent) : void
      {
         var _loc5_:Dto_ItemInfo = null;
         var _loc7_:BagItemTemplate = null;
         var _loc8_:Dto_IdNum = null;
         var _loc2_:int = ActivityGlobal.NEED_UPDATE_LIST.length > 0 ? int(ActivityGlobal.NEED_UPDATE_LIST.shift()) : 0;
         var _loc3_:Boolean = ActivityGlobal.AUTO_USE_MAP[_loc2_];
         delete ActivityGlobal.AUTO_USE_MAP[_loc2_];
         if(_loc2_ > 0)
         {
            ActivityProxyCmd.getActivityInfo(_loc2_);
         }
         var _loc4_:Cmd_FlexibleActivity_TakeReward_SC = param1.socketData as Cmd_FlexibleActivity_TakeReward_SC;
         var _loc6_:Array = [];
         for each(_loc8_ in _loc4_.items)
         {
            if(_loc7_ = ItemTemplateFactory.instance.getBagItemTemplateById(_loc8_.id))
            {
               if(_loc3_ && this.checkAutoUse(_loc7_.subType) && this.checkLevel(_loc7_.minLvRequired))
               {
                  this.bagService.useItem(_loc8_.id,_loc8_.num);
               }
               else
               {
                  _loc6_.push(_loc8_);
               }
            }
         }
         if(_loc6_.length > 0)
         {
            CommonCmd.itemFly(_loc6_);
         }
      }
      
      private function checkLevel(param1:int) : Boolean
      {
         return GameGloble.actorModel.actorLevel >= param1;
      }
      
      private function checkAutoUse(param1:int) : Boolean
      {
         return AUTO_USE_SUBTYPE_LIST.indexOf(param1) >= 0;
      }
      
      private function onFlexibleActivity_1_SC(param1:SocketServiceEvent) : void
      {
         var _loc2_:FlexibleActivity_1 = param1.socketData as FlexibleActivity_1;
         var _loc3_:ActivityCommonInfo = this.getActivity(_loc2_.activityId);
         if(_loc3_)
         {
            _loc3_.moduleInfo.parseFromDto(_loc2_.limit);
         }
         this.dispatch(new CommonEvent(ActivityGlobal.EVENT_ACTIVITY_UPDATE,_loc3_));
      }
      
      private function onFlexibleActivity_1001_SC(param1:SocketServiceEvent) : void
      {
         var _loc4_:int = 0;
         var _loc5_:ActivityRewardInfo = null;
         var _loc6_:Dto_FlexibleActivityCondtionReward = null;
         var _loc7_:int = 0;
         var _loc2_:FlexibleActivity_1001 = param1.socketData as FlexibleActivity_1001;
         var _loc3_:ActivityCommonInfo = this.getActivity(_loc2_.activityId);
         if(_loc3_)
         {
            _loc4_ = _loc2_.conditionReward.length;
            _loc3_.clearReward();
            _loc7_ = 0;
            while(_loc7_ < _loc4_)
            {
               _loc6_ = _loc2_.conditionReward[_loc7_];
               _loc5_ = new ActivityRewardInfo(_loc6_);
               _loc3_.addReward(_loc5_);
               _loc7_++;
            }
            this.dispatch(new CommonEvent(ActivityGlobal.EVENT_ACTIVITY_UPDATE,_loc3_));
         }
      }
      
      private function onFlexibleActivity_1007_SC(param1:SocketServiceEvent) : void
      {
         var _loc4_:int = 0;
         var _loc5_:ActivityRewardInfo = null;
         var _loc6_:Dto_FlexibleCrossGameActivityCondtionReward = null;
         var _loc7_:int = 0;
         var _loc2_:FlexibleActivity_1007 = param1.socketData as FlexibleActivity_1007;
         var _loc3_:ActivityCommonInfo = this.getActivity(_loc2_.activityid);
         if(_loc3_)
         {
            _loc4_ = _loc2_.conditionreward.length;
            _loc3_.clearReward();
            _loc7_ = 0;
            while(_loc7_ < _loc4_)
            {
               _loc6_ = _loc2_.conditionreward[_loc7_];
               (_loc5_ = new ActivityRewardInfo(null)).setTakeInfo(_loc6_.cantake,_loc6_.taketime);
               _loc3_.addReward(_loc5_);
               _loc7_++;
            }
            this.dispatch(new CommonEvent(ActivityGlobal.EVENT_ACTIVITY_UPDATE,_loc3_));
         }
      }
      
      private function onFlexibleActivity_13_SC(param1:SocketServiceEvent) : void
      {
         var _loc2_:FlexibleActivity_13 = param1.socketData as FlexibleActivity_13;
         var _loc3_:ActivityCommonInfo = this.getActivity(_loc2_.activityId);
         if(_loc3_)
         {
            _loc3_.setRewards(_loc2_.conditionReward);
            _loc3_.setExtraProp(ActivityGlobal.EXTRA_PROP_CHALLENGE_LIMIT_TIME,_loc2_.flexibleValue);
            this.dispatch(new CommonEvent(ActivityGlobal.EVENT_ACTIVITY_UPDATE,_loc3_));
         }
      }
      
      private function onCmd_FlexibleActivity_GetActivityList_SC(param1:SocketServiceEvent) : void
      {
         var _loc3_:ActivityCommonInfo = null;
         var _loc5_:int = 0;
         var _loc6_:Dto_FlexibleActivityCommon = null;
         var _loc7_:Array = null;
         var _loc8_:Array = null;
         var _loc9_:int = 0;
         var _loc10_:int = 0;
         var _loc2_:Cmd_FlexibleActivity_GetActivityList_SC = param1.socketData as Cmd_FlexibleActivity_GetActivityList_SC;
         this.m_vecActivity.length = 0;
         var _loc4_:Array = [];
         for each(_loc6_ in _loc2_.activities)
         {
            if(this.checkTGP(_loc6_.activityPanelId) && this.checkBanList(_loc6_.activityPanelId))
            {
               _loc3_ = new ActivityCommonInfo(_loc6_);
               this.m_vecActivity.push(_loc3_);
               if((_loc5_ = _loc3_.iconID) > 0 && _loc4_.indexOf(_loc5_) < 0)
               {
                  _loc4_.push(_loc3_.iconID);
               }
            }
         }
         _loc7_ = [];
         _loc8_ = [];
         _loc9_ = Math.max(_loc4_.length,this.m_aryIcon.length);
         _loc10_ = 0;
         while(_loc10_ < _loc9_)
         {
            if(_loc10_ < _loc4_.length)
            {
               _loc5_ = _loc4_[_loc10_];
               if(this.m_aryIcon.indexOf(_loc5_) < 0)
               {
                  _loc7_.push(_loc5_);
               }
            }
            if(_loc10_ < this.m_aryIcon.length)
            {
               _loc5_ = this.m_aryIcon[_loc10_];
               if(_loc4_.indexOf(_loc5_) < 0)
               {
                  _loc8_.push(_loc5_);
               }
            }
            _loc10_++;
         }
         this.m_aryIcon = _loc4_;
         ActivityViewCmd.addActivityIcon(_loc7_);
         ActivityViewCmd.removeActivityIcon(_loc8_);
         this.dispatch(new CommonEvent(ActivityGlobal.EVENT_ACTIVITY_INIT));
      }
      
      private function checkBanList(param1:int) : Boolean
      {
         if(ExternalVars.banAcitivityViewID)
         {
            return ExternalVars.banAcitivityViewID.indexOf(param1) < 0;
         }
         return true;
      }
      
      private function checkTGP(param1:int) : Boolean
      {
         if(param1 == ActivityGlobal.VIEW_TYPE_TGP)
         {
            if(ExternalVars.isPlatform(ExternalVars.SFROM_QQGAME))
            {
               return ExternalVars.Is_MicroClient;
            }
            return true;
         }
         if(param1 == ActivityGlobal.VIEW_TYPE_ACTQQGAME)
         {
            if(ExternalVars.isPlatform(ExternalVars.SFROM_QQGAME))
            {
               return !ExternalVars.Is_MicroClient;
            }
         }
         return true;
      }
      
      public function getActivity(param1:int) : ActivityCommonInfo
      {
         var _loc2_:ActivityCommonInfo = null;
         for each(_loc2_ in this.m_vecActivity)
         {
            if(_loc2_.id == param1)
            {
               return _loc2_;
            }
         }
         return null;
      }
      
      public function getGroupByEntry(param1:int) : Vector.<ActivityCommonInfo>
      {
         var _loc3_:ActivityCommonInfo = null;
         var _loc2_:Vector.<ActivityCommonInfo> = new Vector.<ActivityCommonInfo>();
         for each(_loc3_ in this.m_vecActivity)
         {
            if(_loc3_.iconID == param1)
            {
               _loc2_.push(_loc3_);
            }
         }
         return _loc2_;
      }
      
      public function getGroupActivityID(param1:int) : Vector.<int>
      {
         var _loc3_:ActivityCommonInfo = null;
         var _loc2_:Vector.<int> = new Vector.<int>();
         for each(_loc3_ in this.m_vecActivity)
         {
            if(_loc3_.iconID == param1)
            {
               _loc2_.push(_loc3_.id);
            }
         }
         return _loc2_;
      }
      
      public function getGroupByViewType(param1:uint) : Vector.<ActivityCommonInfo>
      {
         var _loc3_:ActivityCommonInfo = null;
         var _loc2_:Vector.<ActivityCommonInfo> = new Vector.<ActivityCommonInfo>();
         for each(_loc3_ in this.m_vecActivity)
         {
            if(_loc3_.viewType == param1)
            {
               _loc2_.push(_loc3_);
            }
         }
         return _loc2_;
      }
      
      public function getGroupByActivityType(param1:uint) : Vector.<ActivityCommonInfo>
      {
         var _loc3_:ActivityCommonInfo = null;
         var _loc2_:Vector.<ActivityCommonInfo> = new Vector.<ActivityCommonInfo>();
         for each(_loc3_ in this.m_vecActivity)
         {
            if(_loc3_.type == param1)
            {
               _loc2_.push(_loc3_);
            }
         }
         return _loc2_;
      }
      
      public function get allActivity() : Vector.<ActivityCommonInfo>
      {
         return this.m_vecActivity;
      }
      
      public function checkActivityByViewType(param1:uint) : Boolean
      {
         var _loc2_:Vector.<ActivityCommonInfo> = this.getGroupByViewType(param1);
         return _loc2_.length > 0;
      }
   }
}
