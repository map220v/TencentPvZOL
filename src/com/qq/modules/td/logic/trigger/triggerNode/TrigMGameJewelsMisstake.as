package com.qq.modules.td.logic.trigger.triggerNode
{
   import com.qq.modules.td.logic.trigger.TDTrigConst;
   
   public class TrigMGameJewelsMisstake extends TrigPvz
   {
       
      
      private var mistakeNumMax:int;
      
      private var curNum:int = 0;
      
      public function TrigMGameJewelsMisstake()
      {
         super();
      }
      
      override protected function init() : void
      {
         _triggerType = [TDTrigConst.TYPE_MGAME_JEWELS_MISSTAKE_NUM];
         this.mistakeNumMax = triggerParams[0];
         this.ui.txt.text = this.curNum + "/" + this.mistakeNumMax;
      }
      
      override public function notify(param1:String, param2:Array) : void
      {
         ++this.curNum;
         this.ui.txt.text = this.curNum + "/" + this.mistakeNumMax;
         if(this.curNum > this.mistakeNumMax)
         {
            setResult(false);
         }
      }
      
      override public function execute() : Boolean
      {
         setResult(true);
         return true;
      }
   }
}
