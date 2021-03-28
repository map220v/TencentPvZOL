package com.qq.modules.td.logic.trigger.triggerNode
{
   import com.qq.modules.td.logic.trigger.TDTrigConst;
   import com.qq.modules.td.logic.unit.plant.BasicPlant;
   
   public class TrigPlantLimitNum extends TrigPvz
   {
       
      
      private var plantId:int;
      
      private var maxNum:int;
      
      private var curNum:int;
      
      public function TrigPlantLimitNum()
      {
         super();
      }
      
      override protected function init() : void
      {
         _triggerType = [TDTrigConst.TYPE_PLANT_GROW];
         this.plantId = triggerParams[0];
         this.maxNum = triggerParams[1];
         this.curNum = 0;
         this.updateUIText();
      }
      
      override public function notify(param1:String, param2:Array) : void
      {
         var _loc3_:BasicPlant = param2[0] as BasicPlant;
         if(_loc3_ && _loc3_.objectModel.unitType == this.plantId)
         {
            ++this.curNum;
            this.updateUIText();
            if(this.curNum > this.maxNum)
            {
               this.setResult(false);
            }
         }
      }
      
      private function updateUIText() : void
      {
         this.ui.txt.text = this.curNum + "/" + this.maxNum;
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
