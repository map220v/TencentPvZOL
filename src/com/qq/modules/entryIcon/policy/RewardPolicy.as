package com.qq.modules.entryIcon.policy
{
   import com.qq.GameGloble;
   import com.qq.modules.activity.command.ActivityProxyCmd;
   import com.qq.modules.activity.model.ActivityCommonInfo;
   import com.qq.modules.activity.model.ActivityProxy;
   import com.qq.modules.activity.model.ActivityRewardInfo;
   import com.qq.modules.entryIcon.command.EntryIconCmd;
   import com.qq.modules.entryIcon.model.EntryIconVO;
   
   public class RewardPolicy extends BasePolicy
   {
       
      
      private var m_activityProxy:ActivityProxy;
      
      private var m_aryActivity:Array;
      
      public function RewardPolicy()
      {
         super(PolicyType.TYPE_TAKE_REWARD);
         this.m_activityProxy = GameGloble.injector.getInstance(ActivityProxy);
         this.m_aryActivity = [];
      }
      
      override public function excute(param1:EntryIconVO) : void
      {
         var _loc3_:Boolean = false;
         var _loc4_:ActivityCommonInfo = null;
         var _loc5_:ActivityRewardInfo = null;
         var _loc2_:Vector.<ActivityCommonInfo> = this.m_activityProxy.getGroupByEntry(param1.id);
         if(_loc2_ && _loc2_.length > 0)
         {
            _loc3_ = false;
            for each(_loc4_ in _loc2_)
            {
               if(_loc4_.hasInit)
               {
                  for each(_loc5_ in _loc4_.rewards)
                  {
                     if(_loc5_.canTake)
                     {
                        _loc3_ = true;
                        break;
                     }
                  }
               }
               else if(this.m_aryActivity.indexOf(_loc4_.id) < 0)
               {
                  this.m_aryActivity.push(_loc4_.id);
                  ActivityProxyCmd.getActivityInfo(_loc4_.id);
               }
               if(_loc3_)
               {
                  break;
               }
            }
         }
         EntryIconCmd.changeIconEffect(param1.id,_loc3_);
      }
   }
}
