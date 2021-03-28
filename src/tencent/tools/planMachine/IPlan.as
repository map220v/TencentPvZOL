package tencent.tools.planMachine
{
   public interface IPlan
   {
       
      
      function setDynamicParams(param1:Array) : void;
      
      function doPlan(param1:ICallBack) : void;
      
      function cancelPlan() : void;
      
      function get isDoing() : Boolean;
   }
}
