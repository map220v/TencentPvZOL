package tencent.tools.planMachine
{
   public class SerialPlan extends Plan implements IPlan
   {
       
      
      private var curPlan:IPlan;
      
      private var plans:Array;
      
      public function SerialPlan(param1:Array)
      {
         super();
         this.plans = param1;
      }
      
      override public function doPlan(param1:ICallBack) : void
      {
         super.doPlan(param1);
         this.planCallBack();
      }
      
      override public function planCallBack() : void
      {
         if(isCanceled)
         {
            return;
         }
         if(this.plans.length > 0)
         {
            this.curPlan = this.plans.shift();
            if(!this.curPlan)
            {
               throw new Error("plans子级没有实现IPlan接口: " + this.curPlan);
            }
            this.curPlan.doPlan(this);
         }
         else
         {
            this.setComplete();
         }
      }
      
      override protected function dispose() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         var _loc3_:IPlan = null;
         if(this.plans)
         {
            _loc1_ = this.plans.length;
            _loc2_ = 0;
            while(_loc2_ < _loc1_)
            {
               _loc3_ = this.plans[_loc2_] as IPlan;
               _loc3_.cancelPlan();
               _loc2_++;
            }
         }
         if(this.curPlan)
         {
            this.curPlan.cancelPlan();
         }
         this.curPlan = null;
         this.plans.length = 0;
         super.dispose();
      }
   }
}
