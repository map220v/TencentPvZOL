package com.qq.modules.activity.model.condtion
{
   import PVZ.Cmd.Dto_Uint32Compare;
   import PVZ.Cmd.Dto_Uint32Tracker;
   
   public class ActivityValueCondition
   {
      
      public static const EXPRESSION_EQ:uint = 0;
      
      public static const EXPRESSION_NE:uint = 1;
      
      public static const EXPRESSION_LT:uint = 2;
      
      public static const EXPRESSION_LE:uint = 3;
      
      public static const EXPRESSION_GT:uint = 4;
      
      public static const EXPRESSION_GE:uint = 5;
       
      
      private var m_vecCondition:Vector.<Number>;
      
      private var m_nowValue:Number;
      
      public function ActivityValueCondition()
      {
         super();
         this.m_vecCondition = new Vector.<Number>(6);
         var _loc1_:int = 0;
         while(_loc1_ < 6)
         {
            this.m_vecCondition[_loc1_] = NaN;
            _loc1_++;
         }
         this.m_nowValue = NaN;
      }
      
      public static function createByCompare(param1:Dto_Uint32Compare) : ActivityValueCondition
      {
         var _loc2_:ActivityValueCondition = null;
         if(param1)
         {
            _loc2_ = new ActivityValueCondition();
            _loc2_.updateCondition(EXPRESSION_EQ,!!param1.hasEq ? Number(param1.eq) : Number(NaN));
            _loc2_.updateCondition(EXPRESSION_NE,!!param1.hasNe ? Number(param1.ne) : Number(NaN));
            _loc2_.updateCondition(EXPRESSION_LT,!!param1.hasLt ? Number(param1.lt) : Number(NaN));
            _loc2_.updateCondition(EXPRESSION_LE,!!param1.hasLe ? Number(param1.le) : Number(NaN));
            _loc2_.updateCondition(EXPRESSION_GT,!!param1.hasGt ? Number(param1.gt) : Number(NaN));
            _loc2_.updateCondition(EXPRESSION_GE,!!param1.hasGe ? Number(param1.ge) : Number(NaN));
         }
         return _loc2_;
      }
      
      public static function createByTracker(param1:Dto_Uint32Tracker) : ActivityValueCondition
      {
         var _loc2_:ActivityValueCondition = null;
         if(param1)
         {
            _loc2_ = new ActivityValueCondition();
            _loc2_.updateCondition(EXPRESSION_EQ,!!param1.hasEq ? Number(param1.eq) : Number(NaN));
            _loc2_.updateCondition(EXPRESSION_NE,!!param1.hasNe ? Number(param1.ne) : Number(NaN));
            _loc2_.updateCondition(EXPRESSION_LT,!!param1.hasLt ? Number(param1.lt) : Number(NaN));
            _loc2_.updateCondition(EXPRESSION_LE,!!param1.hasLe ? Number(param1.le) : Number(NaN));
            _loc2_.updateCondition(EXPRESSION_GT,!!param1.hasGt ? Number(param1.gt) : Number(NaN));
            _loc2_.updateCondition(EXPRESSION_GE,!!param1.hasGe ? Number(param1.ge) : Number(NaN));
            _loc2_.updateNowValue(param1.value);
         }
         return _loc2_;
      }
      
      function updateCondition(param1:int, param2:Number = NaN) : void
      {
         this.m_vecCondition[param1] = param2;
      }
      
      function updateNowValue(param1:Number = NaN) : void
      {
         this.m_nowValue = param1;
      }
      
      public function getConditionValue(param1:int) : Number
      {
         return this.m_vecCondition[param1];
      }
      
      public function get nowValue() : Number
      {
         return this.m_nowValue;
      }
      
      public function get conditionValue() : Number
      {
         var _loc1_:Number = NaN;
         var _loc2_:int = 0;
         while(_loc2_ < 6)
         {
            _loc1_ = this.m_vecCondition[_loc2_];
            if(isNaN(_loc1_) == false)
            {
               return _loc1_;
            }
            _loc2_++;
         }
         return 0;
      }
   }
}
