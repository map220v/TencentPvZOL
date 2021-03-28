package com.qq.modules.td.logic.trigger.triggerNode
{
   import com.qq.modules.td.logic.trigger.TDTrigConst;
   import org.as3commons.logging.api.getLogger;
   
   public class TrigPlantDieNum extends TrigPvz
   {
       
      
      private var maxNum:int;
      
      private var curNum:int;
      
      public function TrigPlantDieNum()
      {
         super();
      }
      
      override protected function init() : void
      {
         this.maxNum = triggerParams[0];
         this.curNum = 0;
         _triggerType = [TDTrigConst.TYPE_PLANT_DIE];
         getLogger("trigger").debug("TrigPlantDieNum: " + this.maxNum);
         this.ui.txt.text = this.maxNum.toString();
      }
      
      override public function notify(param1:String, param2:Array) : void
      {
         ++this.curNum;
         this.ui.txt.text = (this.maxNum - this.curNum).toString();
         if(this.curNum > this.maxNum)
         {
            this.setResult(false);
         }
      }
      
      override public function execute() : Boolean
      {
         if(this.curNum > this.maxNum)
         {
            this.setResult(false);
            return false;
         }
         this.setResult(true);
         return true;
      }
      
      override protected function setResult(param1:Boolean) : void
      {
         super.setResult(param1);
      }
   }
}
