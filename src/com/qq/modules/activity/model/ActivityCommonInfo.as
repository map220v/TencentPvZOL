package com.qq.modules.activity.model
{
   import PVZ.Cmd.Dto_FlexibleActivityCommon;
   import PVZ.Cmd.Dto_FlexibleActivityCondtionReward;
   import com.qq.modules.activity.model.condtion.ActivityLimitCondition;
   
   public class ActivityCommonInfo
   {
       
      
      private var m_id:uint;
      
      private var m_type:uint;
      
      private var m_iconID:uint;
      
      private var m_beginDate:uint;
      
      private var m_endDate:uint;
      
      private var m_viewType:uint;
      
      private var m_hasInit:Boolean;
      
      private var m_open:Boolean = true;
      
      private var m_vecRewardInfo:Vector.<ActivityRewardInfo>;
      
      private var m_currentModuleInfo:ActivityModuleInfo;
      
      private var m_limitCondition:ActivityLimitCondition;
      
      private var m_clientParam:String;
      
      private var m_showLimitCondition:ActivityLimitCondition;
      
      private var _extraPropList:Array;
      
      public function ActivityCommonInfo(param1:Dto_FlexibleActivityCommon)
      {
         super();
         this.m_id = param1.activityId;
         this.m_type = param1.activityType;
         this.m_iconID = param1.activityIconId;
         this.m_beginDate = param1.beginDate;
         this.m_endDate = param1.endDate;
         this.m_viewType = param1.activityPanelId;
         this.m_vecRewardInfo = new Vector.<ActivityRewardInfo>();
         this.m_currentModuleInfo = new ActivityModuleInfo();
         this.m_clientParam = param1.clientParams;
         if(param1.hasLimit)
         {
            this.m_limitCondition = new ActivityLimitCondition(param1.limit);
         }
         if(param1.hasShowLimit)
         {
            this.m_showLimitCondition = new ActivityLimitCondition(param1.showLimit);
         }
      }
      
      public static function DEFAULT_SORT(param1:ActivityCommonInfo, param2:ActivityCommonInfo) : int
      {
         return param1.id - param2.id;
      }
      
      public function setRewards(param1:Array) : void
      {
         var _loc3_:ActivityRewardInfo = null;
         var _loc4_:Dto_FlexibleActivityCondtionReward = null;
         var _loc2_:int = param1.length;
         this.clearReward();
         var _loc5_:int = 0;
         while(_loc5_ < _loc2_)
         {
            _loc4_ = param1[_loc5_];
            _loc3_ = new ActivityRewardInfo(_loc4_);
            this.addReward(_loc3_);
            _loc5_++;
         }
      }
      
      public function clearReward() : void
      {
         this.m_vecRewardInfo.length = 0;
         this.m_hasInit = false;
      }
      
      public function addReward(param1:ActivityRewardInfo) : void
      {
         this.m_hasInit = true;
         this.m_vecRewardInfo.push(param1);
      }
      
      public function setExtraProp(param1:int, param2:*) : void
      {
         if(this._extraPropList == null)
         {
            this._extraPropList = new Array();
         }
         this._extraPropList[param1] = param2;
      }
      
      public function getExtraProp(param1:int) : *
      {
         if(this._extraPropList == null)
         {
            this._extraPropList = new Array();
         }
         if(this._extraPropList[param1] == null)
         {
            return null;
         }
         return this._extraPropList[param1];
      }
      
      public function hasExtraProp(param1:int) : Boolean
      {
         if(this._extraPropList == null)
         {
            this._extraPropList = new Array();
         }
         return this._extraPropList.hasOwnProperty(param1);
      }
      
      public function setExtraPropList(param1:Array) : void
      {
         this._extraPropList = param1;
      }
      
      public function cleanExtraProp(param1:int) : void
      {
         if(this._extraPropList == null)
         {
            this._extraPropList = new Array();
         }
         delete this._extraPropList[param1];
      }
      
      public function get hasInit() : Boolean
      {
         return this.m_hasInit;
      }
      
      public function set moduleInfo(param1:ActivityModuleInfo) : void
      {
         this.m_currentModuleInfo = param1;
      }
      
      public function get moduleInfo() : ActivityModuleInfo
      {
         return this.m_currentModuleInfo;
      }
      
      public function get rewards() : Vector.<ActivityRewardInfo>
      {
         return this.m_vecRewardInfo;
      }
      
      public function get id() : uint
      {
         return this.m_id;
      }
      
      public function get type() : uint
      {
         return this.m_type;
      }
      
      public function get iconID() : uint
      {
         return this.m_iconID;
      }
      
      public function get beginDate() : uint
      {
         return this.m_beginDate;
      }
      
      public function get endDate() : uint
      {
         return this.m_endDate;
      }
      
      public function get viewType() : uint
      {
         return this.m_viewType;
      }
      
      public function get limitCondition() : ActivityLimitCondition
      {
         return this.m_limitCondition;
      }
      
      public function get showLimitCondition() : ActivityLimitCondition
      {
         return this.m_showLimitCondition;
      }
      
      public function get clientParam() : String
      {
         return this.m_clientParam;
      }
      
      public function set open(param1:Boolean) : void
      {
         this.m_open = param1;
      }
      
      public function get open() : Boolean
      {
         return this.m_open;
      }
   }
}
