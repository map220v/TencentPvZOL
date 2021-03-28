package com.qq.modules.rookieCeremony.model
{
   import PVZ.Cmd.Dto_FlexibleActivityCondtionReward;
   import PVZ.Cmd.FlexibleActivity_1002;
   import com.qq.modules.activity.ActivityGlobal;
   import com.qq.modules.activity.command.ActivityViewCmd;
   import com.qq.modules.activity.model.ActivityCommonInfo;
   import com.qq.modules.activity.model.ActivityProxy;
   import com.qq.modules.activity.model.ActivityRewardInfo;
   import com.qq.modules.basic.event.CommonEvent;
   import com.qq.modules.basic.modle.BasicProxy;
   import com.qq.modules.entryIcon.ActivityIconConst;
   import com.qq.modules.entryIcon.command.EntryIconCmd;
   import com.qq.modules.rookieCeremony.RookieCeremonyConst;
   import com.qq.utils.DateUtils;
   import tencent.io.service.events.SocketServiceEvent;
   
   public class RookieCeremonyProxy extends BasicProxy
   {
       
      
      [Inject]
      public var activityProxy:ActivityProxy;
      
      private var m_msg:FlexibleActivity_1002;
      
      private var m_info:ActivityCommonInfo;
      
      public function RookieCeremonyProxy()
      {
         super();
      }
      
      override public function listMsgInterests() : Array
      {
         return [[FlexibleActivity_1002.$MessageID,this.onFlexibleActivity_1002]];
      }
      
      private function onFlexibleActivity_1002(param1:SocketServiceEvent) : void
      {
         var _loc3_:ActivityRewardInfo = null;
         var _loc4_:Dto_FlexibleActivityCondtionReward = null;
         var _loc5_:int = 0;
         var _loc6_:uint = 0;
         var _loc7_:Date = null;
         var _loc8_:Date = null;
         var _loc9_:Date = null;
         this.m_msg = param1.socketData as FlexibleActivity_1002;
         var _loc2_:Vector.<ActivityCommonInfo> = this.activityProxy.getGroupByViewType(ActivityGlobal.VIEW_TYPE_ROOKIE_CEREMONY);
         if(_loc2_.length > 0)
         {
            this.m_info = _loc2_[0];
            if(this.m_info.id == this.m_msg.activityId)
            {
               this.m_info.clearReward();
               _loc5_ = 0;
               while(_loc5_ < this.m_msg.conditionReward.length)
               {
                  _loc4_ = this.m_msg.conditionReward[_loc5_];
                  _loc3_ = new ActivityRewardInfo(_loc4_);
                  this.activityInfo.addReward(_loc3_);
                  _loc5_++;
               }
               _loc6_ = ActivityIconConst.ICON_ROOKIE_CEREMONEY;
               _loc7_ = new Date();
               (_loc8_ = new Date()).time = this.m_msg.getActivityTime * 1000;
               _loc7_.time = this.m_msg.getActivityTime * 1000 + (this.m_msg.validDay - 1) * 24 * 3600 * 1000;
               if((_loc9_ = DateUtils.getInstance().getServerDate()).time <= _loc7_.time || _loc9_.date == _loc7_.date)
               {
                  EntryIconCmd.addActivityIcon(_loc6_,ActivityViewCmd.openActivityByEntry,[_loc6_]);
                  EntryIconCmd.changeActivityEffect(_loc6_,this.checkFlashEnable());
               }
               else
               {
                  EntryIconCmd.removeActivityIcon(_loc6_);
               }
               dispatch(new CommonEvent(RookieCeremonyConst.ROOKIE_CEREMONY_UPDATE));
            }
         }
      }
      
      private function checkFlashEnable() : Boolean
      {
         if(this.m_msg.accomplished >= 1 && this.m_msg.rewardTaken.indexOf(1) < 0 || this.m_msg.accomplished >= 2 && this.m_msg.rewardTaken.indexOf(2) < 0)
         {
            return true;
         }
         return false;
      }
      
      public function get msg() : FlexibleActivity_1002
      {
         return this.m_msg;
      }
      
      public function get activityInfo() : ActivityCommonInfo
      {
         return this.m_info;
      }
   }
}
