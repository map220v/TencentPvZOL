package tencent.tools.planMachine
{
   public class ParallelPlan extends Plan implements IPlan
   {
       
      
      private var plans:Array;
      
      private var curNum:int;
      
      private var maxNum:int;
      
      public function ParallelPlan(param1:Array)
      {
         super();
         this.plans = param1;
      }
      
      override public function doPlan(param1:ICallBack) : void
      {
         var _loc3_:IPlan = null;
         super.doPlan(param1);
         this.curNum = 0;
         this.maxNum = this.plans.length;
         if(this.curNum == this.maxNum)
         {
            setComplete();
            return;
         }
         var _loc2_:int = 0;
         while(_loc2_ < this.maxNum)
         {
            _loc3_ = this.plans[_loc2_] as IPlan;
            _loc3_.doPlan(this);
            _loc2_++;
         }
      }
      
      override public function planCallBack() : void
      {
         if(isCanceled)
         {
            return;
         }
         ++this.curNum;
         if(this.curNum == this.maxNum)
         {
            setComplete();
         }
      }
      
      override protected function dispose() : void
      {
         var _loc2_:IPlan = null;
         var _loc1_:int = 0;
         while(_loc1_ < this.maxNum)
         {
            _loc2_ = this.plans[_loc1_] as IPlan;
            _loc2_.cancelPlan();
            _loc1_++;
         }
         this.plans.length = 0;
         super.dispose();
      }
   }
}
