package com.qq.modules.td.logic.trigger.triggerNode
{
   import com.qq.modules.td.logic.trigger.TDTrigConst;
   import com.qq.modules.td.model.TDGameInfo;
   import org.as3commons.logging.api.getLogger;
   import tencent.tools.trigger.ITrigger;
   
   public class TrigProductSun extends TrigPvz implements ITrigger
   {
       
      
      private var baseSun:int;
      
      private var goalSun:int;
      
      private var cacheSun:int;
      
      public function TrigProductSun()
      {
         super();
      }
      
      override protected function init() : void
      {
         this.baseSun = TDGameInfo.getInstance().sun.get();
         this.goalSun = triggerParams[0];
         this.cacheSun = 0;
         _triggerType = [TDTrigConst.TYPE_COLLECT_SUN];
         getLogger("trigger").debug("TrigProductSun: " + this.goalSun);
         this.ui.txt.text = "0/" + this.goalSun;
      }
      
      override public function notify(param1:String, param2:Array) : void
      {
         this.cacheSun += param2[0];
         this.ui.txt.text = this.cacheSun + "/" + this.goalSun;
         if(this.cacheSun >= this.goalSun)
         {
            this.setResult(true);
         }
      }
      
      override public function execute() : Boolean
      {
         if(TDGameInfo.getInstance().sun.get() - this.baseSun >= this.goalSun)
         {
            this.setResult(true);
            return true;
         }
         this.setResult(false);
         return false;
      }
      
      override protected function setResult(param1:Boolean) : void
      {
         super.setResult(param1);
      }
   }
}
