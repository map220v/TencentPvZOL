package com.qq.modules.entryIcon.policy
{
   import com.qq.GameGloble;
   import com.qq.modules.activity.model.ActivityCommonInfo;
   import com.qq.modules.activity.model.ActivityProxy;
   import com.qq.modules.entryIcon.command.EntryIconCmd;
   import com.qq.modules.entryIcon.model.EntryIconVO;
   import com.qq.utils.DateUtils;
   import com.qq.utils.DelayManager;
   
   public class LimitEndPolicy extends BasePolicy
   {
       
      
      private var m_activityProxy:ActivityProxy;
      
      private var m_vecCheckList:Vector.<ActivityCommonInfo>;
      
      private var m_delayID:int = 0;
      
      public function LimitEndPolicy()
      {
         super(PolicyType.TYPE_LIMIT_END);
         this.m_vecCheckList = new Vector.<ActivityCommonInfo>();
         this.m_activityProxy = GameGloble.injector.getInstance(ActivityProxy);
      }
      
      override public function excute(param1:EntryIconVO) : void
      {
         var _loc2_:Vector.<ActivityCommonInfo> = this.m_activityProxy.getGroupByEntry(param1.id);
         if(_loc2_ && _loc2_.length > 0)
         {
            this.addToList(_loc2_[0]);
         }
         this.checkStart();
      }
      
      private function checkStart() : void
      {
         if(this.m_vecCheckList.length > 0 && this.m_delayID <= 0)
         {
            this.m_delayID = DelayManager.getInstance().addDelay(10000,this.checkAll,true);
         }
      }
      
      private function checkEnd() : void
      {
         if(this.m_vecCheckList.length == 0 && this.m_delayID > 0)
         {
            DelayManager.getInstance().removeDelay(this.m_delayID);
            this.m_delayID = 0;
         }
      }
      
      private function addToList(param1:ActivityCommonInfo) : void
      {
         if(this.m_vecCheckList.indexOf(param1) < 0)
         {
            this.m_vecCheckList.push(param1);
         }
      }
      
      private function checkAll() : void
      {
         var _loc2_:ActivityCommonInfo = null;
         var _loc3_:int = 0;
         var _loc4_:ActivityCommonInfo = null;
         var _loc1_:Array = [];
         for each(_loc2_ in this.m_vecCheckList)
         {
            if(this.checkIsEnd(_loc2_))
            {
               _loc1_.push(_loc2_);
               EntryIconCmd.changeIconEffect(_loc2_.iconID,false);
            }
         }
         if(_loc1_.length > 0)
         {
            for each(_loc4_ in _loc1_)
            {
               _loc3_ = this.m_vecCheckList.indexOf(_loc4_);
               if(_loc3_ >= 0)
               {
                  this.m_vecCheckList.splice(_loc3_,1);
               }
            }
         }
         this.checkEnd();
      }
      
      private function checkIsEnd(param1:ActivityCommonInfo) : Boolean
      {
         if(param1 && param1.limitCondition)
         {
            return DateUtils.getInstance().getInterval(param1.limitCondition.uEndTime) <= 0;
         }
         return true;
      }
   }
}
