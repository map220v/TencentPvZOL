package com.qq.modules.td.logic.trigger.triggerNode
{
   import com.qq.modules.td.logic.trigger.TDTrigConst;
   import com.qq.templates.font.FontHKHB;
   
   public class TrigCartUse extends TrigPvz
   {
       
      
      private var maxCartNum:int;
      
      private var useCartNum:int;
      
      public function TrigCartUse()
      {
         super();
      }
      
      override protected function init() : void
      {
         this.maxCartNum = triggerParams[0];
         this.useCartNum = 0;
         _triggerType = [TDTrigConst.TYPE_USE_CART];
         this.ui.txt.text = FontHKHB.DOING;
      }
      
      override public function notify(param1:String, param2:Array) : void
      {
         ++this.useCartNum;
         if(this.useCartNum > this.maxCartNum)
         {
            this.setResult(false);
         }
      }
      
      override public function execute() : Boolean
      {
         if(this.useCartNum > this.maxCartNum)
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
