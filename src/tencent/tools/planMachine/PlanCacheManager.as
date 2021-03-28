package tencent.tools.planMachine
{
   import flash.utils.Dictionary;
   
   public class PlanCacheManager
   {
      
      private static var planDic:Dictionary = new Dictionary();
       
      
      public function PlanCacheManager()
      {
         super();
      }
      
      public static function addPlan(param1:IPlan, param2:String = "all") : void
      {
         if(!planDic[param2])
         {
            planDic[param2] = [];
         }
         (planDic[param2] as Array).push(param1);
      }
      
      public static function removeModuleCachePlan(param1:String = "all") : void
      {
         var _loc5_:IPlan = null;
         var _loc2_:Array = planDic[param1] as Array;
         var _loc3_:int = _loc2_.length;
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            (_loc5_ = _loc2_[_loc4_]).cancelPlan();
            _loc4_++;
         }
         planDic[param1] = [];
      }
      
      public static function removeAllCachePlan() : void
      {
         var _loc1_:Array = null;
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:IPlan = null;
         for each(_loc1_ in planDic)
         {
            _loc2_ = _loc1_.length;
            _loc3_ = 0;
            while(_loc3_ < _loc2_)
            {
               (_loc4_ = _loc1_[_loc3_]).cancelPlan();
               _loc3_++;
            }
         }
         planDic = new Dictionary();
      }
   }
}
