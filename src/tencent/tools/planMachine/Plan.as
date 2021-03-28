package tencent.tools.planMachine
{
   import flash.utils.getQualifiedClassName;
   import org.as3commons.logging.api.getLogger;
   
   public class Plan implements IPlan, ICallBack
   {
       
      
      private var _isDoing:Boolean = false;
      
      private var callBackFunc:ICallBack;
      
      private var isCancelPlan:Boolean = false;
      
      protected var params:Array;
      
      public var isDebug:Boolean = false;
      
      private var _className:String;
      
      public function Plan()
      {
         super();
         PlanCacheManager.addPlan(this);
      }
      
      public function setDynamicParams(param1:Array) : void
      {
         this.params = param1;
      }
      
      public function doPlan(param1:ICallBack) : void
      {
         if(this.isDebug)
         {
            getLogger("battle").debug("执行计划器: " + this.getClassName());
         }
         if(this._isDoing)
         {
            throw new Error("重复调用，Plan对象已经在执行中了！");
         }
         this._isDoing = true;
         this.callBackFunc = param1;
      }
      
      public final function cancelPlan() : void
      {
         if(!this.isCanceled)
         {
            this.isCancelPlan = true;
            this.dispose();
         }
      }
      
      protected function setComplete() : void
      {
         if(this.isDebug)
         {
            getLogger("battle").debug("完成计划器: " + this.getClassName());
         }
         this._isDoing = false;
         if(this.callBackFunc != null && !this.isCancelPlan)
         {
            this.callBackFunc.planCallBack();
            this.cancelPlan();
         }
      }
      
      public function planCallBack() : void
      {
         this.setComplete();
      }
      
      public function get isDoing() : Boolean
      {
         return this._isDoing;
      }
      
      protected function get isCanceled() : Boolean
      {
         return this.isCancelPlan;
      }
      
      protected function dispose() : void
      {
         this.callBackFunc = null;
      }
      
      protected function getClassName() : String
      {
         if(!this._className)
         {
            this._className = getQualifiedClassName(this).split("::")[1];
         }
         return this._className;
      }
   }
}
