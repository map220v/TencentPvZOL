package com.qq.modules.entryIcon.policy
{
   import com.qq.modules.entryIcon.EntryIconConst;
   import com.qq.modules.entryIcon.model.EntryIconVO;
   
   public class BasePolicy
   {
       
      
      private var m_type:int;
      
      public function BasePolicy(param1:int)
      {
         super();
         this.m_type = param1;
      }
      
      public function get type() : int
      {
         return this.m_type;
      }
      
      public function excute(param1:EntryIconVO) : void
      {
      }
      
      protected final function showEffect(param1:EntryIconVO) : void
      {
         switch(param1.type)
         {
            case EntryIconConst.TYPE_ACTIVITY_ICON:
               break;
            case EntryIconConst.TYPE_SYSTEM_ICON:
         }
      }
      
      protected final function hideEffect(param1:EntryIconVO) : void
      {
      }
   }
}
