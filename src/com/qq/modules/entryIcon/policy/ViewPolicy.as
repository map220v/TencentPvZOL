package com.qq.modules.entryIcon.policy
{
   import com.qq.modules.entryIcon.EntryIconConst;
   import com.qq.modules.entryIcon.command.EntryIconCmd;
   import com.qq.modules.entryIcon.model.EntryIconVO;
   
   public class ViewPolicy extends BasePolicy
   {
       
      
      public function ViewPolicy()
      {
         super(PolicyType.TYPE_OPEN_UI);
      }
      
      override public function excute(param1:EntryIconVO) : void
      {
         switch(param1.type)
         {
            case EntryIconConst.TYPE_ACTIVITY_ICON:
               EntryIconCmd.changeActivityEffect(param1.id,false);
               break;
            case EntryIconConst.TYPE_SYSTEM_ICON:
               EntryIconCmd.changeSystemEffect(param1.id,false);
         }
         var _loc2_:LoginPolicy = PolicyManager.instance.getPolicy(PolicyType.TYPE_FIRST_LOGIN) as LoginPolicy;
         _loc2_.hideIconEffect(param1.id,param1.type);
      }
   }
}
