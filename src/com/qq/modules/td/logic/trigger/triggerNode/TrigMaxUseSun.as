package com.qq.modules.td.logic.trigger.triggerNode
{
   import com.qq.modules.td.logic.trigger.TDTrigConst;
   import org.as3commons.logging.api.getLogger;
   
   public class TrigMaxUseSun extends TrigPvz
   {
       
      
      private var goalSun:int;
      
      private var usedSun:int;
      
      public function TrigMaxUseSun()
      {
         super();
      }
      
      override protected function init() : void
      {
         this.goalSun = triggerParams[0];
         this.usedSun = 0;
         _triggerType = [TDTrigConst.TYPE_USE_SUN];
         getLogger("trigger").debug("TrigMaxUseSun: " + this.goalSun);
         this.ui.txt.text = this.goalSun.toString();
      }
      
      override public function notify(param1:String, param2:Array) : void
      {
         this.usedSun += param2[0];
         this.ui.txt.text = (this.goalSun - this.usedSun).toString();
         if(this.usedSun > this.goalSun)
         {
            this.setResult(false);
         }
      }
      
      override public function execute() : Boolean
      {
         if(this.usedSun > this.goalSun)
         {
            this.setResult(false);
            return false;
         }
         this.setResult(true);
         return true;
      }
      
      override protected function setResult(param1:Boolean) : void
      {
         if(!param1)
         {
         }
         super.setResult(param1);
      }
   }
}
