package com.qq.modules.buffActivity.model.buff
{
   import com.qq.modules.bag.model.vo.ItemVO;
   
   public class BuffTrial
   {
       
      
      private var m_resetCount:uint;
      
      private var m_resetTime:uint;
      
      private var m_usedCount:uint;
      
      private var m_cost:Vector.<ItemVO>;
      
      public function BuffTrial(param1:String)
      {
         var _loc2_:Array = null;
         var _loc3_:Array = null;
         var _loc4_:String = null;
         super();
         if(this.m_cost == null)
         {
            this.m_cost = new Vector.<ItemVO>();
            _loc2_ = param1.split(";");
            for each(_loc4_ in _loc2_)
            {
               _loc3_ = _loc4_.split(":");
               this.m_cost.push(new ItemVO(_loc3_[0],_loc3_[1]));
            }
         }
      }
      
      public function set resetCount(param1:uint) : void
      {
         this.m_resetCount = param1;
      }
      
      public function get resetCount() : uint
      {
         return this.m_resetCount;
      }
      
      public function set resetTime(param1:uint) : void
      {
         this.m_resetTime = param1;
      }
      
      public function get resetTime() : uint
      {
         return this.m_resetTime;
      }
      
      public function set usedCount(param1:uint) : void
      {
         this.m_usedCount = param1;
      }
      
      public function get usedCount() : uint
      {
         return this.m_usedCount;
      }
      
      public function getCost(param1:int) : ItemVO
      {
         if(param1 >= 0 && param1 < this.m_cost.length)
         {
            return this.m_cost[param1];
         }
         return this.m_cost[0];
      }
   }
}
