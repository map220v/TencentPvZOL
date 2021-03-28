package com.qq.modules.td.logic.unit.object
{
   import com.qq.constant.td.TDConstant;
   import flash.events.MouseEvent;
   
   public class TDLootItem extends TDNormalObject
   {
       
      
      public function TDLootItem()
      {
         super();
      }
      
      override protected function initListener() : void
      {
         addMouseEventListener(MouseEvent.ROLL_OVER,this.onRollOver);
         addMouseEventListener(MouseEvent.ROLL_OUT,this.onRollOut);
         addMouseEventListener(MouseEvent.CLICK,this.onClick);
      }
      
      private function onClick() : void
      {
         var _loc1_:int = model.staticInfo.getParam(TDConstant.NormalObj_Param_LootItemType);
         if(_loc1_ != 0)
         {
         }
         dispose();
      }
      
      private function onRollOver() : void
      {
         setButtonMode(true);
      }
      
      private function onRollOut() : void
      {
         setButtonMode(false);
      }
   }
}
