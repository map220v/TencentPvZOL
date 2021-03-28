package com.qq.modules.entryIcon.policy
{
   import com.qq.modules.entryIcon.model.EntryIconVO;
   import flash.utils.Dictionary;
   
   public class PolicyManager
   {
      
      private static var s_instance:PolicyManager;
       
      
      private var m_dicPolicy:Dictionary;
      
      public function PolicyManager()
      {
         super();
         this.m_dicPolicy = new Dictionary();
      }
      
      public static function get instance() : PolicyManager
      {
         if(s_instance == null)
         {
            s_instance = new PolicyManager();
         }
         return s_instance;
      }
      
      public function doPolicy(param1:EntryIconVO, param2:int) : void
      {
         var _loc3_:BasePolicy = this.getPolicy(param2);
         _loc3_.excute(param1);
      }
      
      public function getPolicy(param1:int) : BasePolicy
      {
         var _loc2_:BasePolicy = null;
         if(this.m_dicPolicy.hasOwnProperty(param1))
         {
            _loc2_ = this.m_dicPolicy[param1];
         }
         else
         {
            _loc2_ = this.createPolicy(param1);
            this.m_dicPolicy[param1] = _loc2_;
         }
         return _loc2_;
      }
      
      private function createPolicy(param1:int) : BasePolicy
      {
         var _loc2_:BasePolicy = null;
         switch(param1)
         {
            case PolicyType.TYPE_FIRST_LOGIN:
               _loc2_ = new LoginPolicy();
               break;
            case PolicyType.TYPE_OPEN_UI:
               _loc2_ = new ViewPolicy();
               break;
            case PolicyType.TYPE_LIMIT_BEGIN:
               _loc2_ = new LimitBeginPolicy();
               break;
            case PolicyType.TYPE_LIMIT_END:
               _loc2_ = new LimitEndPolicy();
               break;
            case PolicyType.TYPE_HAS_REWARD:
            case PolicyType.TYPE_TAKE_REWARD:
               _loc2_ = new RewardPolicy();
               break;
            default:
               _loc2_ = new BasePolicy(PolicyType.TYPE_NULL);
         }
         return _loc2_;
      }
   }
}
