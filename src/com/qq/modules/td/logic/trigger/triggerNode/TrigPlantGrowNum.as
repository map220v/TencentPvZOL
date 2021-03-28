package com.qq.modules.td.logic.trigger.triggerNode
{
   import com.qq.modules.td.logic.trigger.TDTrigConst;
   import org.as3commons.logging.api.getLogger;
   
   public class TrigPlantGrowNum extends TrigPvz
   {
       
      
      private var maxNum:int;
      
      private var curNum:int;
      
      public function TrigPlantGrowNum()
      {
         super();
      }
      
      override protected function init() : void
      {
         this.maxNum = triggerParams[0];
         this.curNum = 0;
         _triggerType = [TDTrigConst.TYPE_PLANT_GROW,TDTrigConst.TYPE_PLANT_DIE];
         getLogger("trigger").debug("TrigPlantGrowNum: " + this.maxNum);
         this.ui.txt.text = this.curNum + "/" + this.maxNum;
      }
      
      override public function notify(param1:String, param2:Array) : void
      {
         if(result != 0)
         {
            return;
         }
         if(param1 == TDTrigConst.TYPE_PLANT_GROW)
         {
            ++this.curNum;
         }
         else if(param1 == TDTrigConst.TYPE_PLANT_DIE)
         {
            --this.curNum;
         }
         this.ui.txt.text = this.curNum + "/" + this.maxNum;
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
