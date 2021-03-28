package com.qq.modules.embattle.view.comps
{
   import asgui.events.DragEvent;
   import asgui.managers.drags.DragProxy;
   import asgui.managers.drags.IReceivableImpl;
   import com.qq.display.CardItemWithBitmap;
   
   public class DragableCard extends CardItemWithBitmap implements IReceivableImpl
   {
       
      
      public function DragableCard(param1:Class = null)
      {
         super(DragableCardMediator);
      }
      
      public function DropImplHandler(param1:DragProxy) : void
      {
         var _loc2_:DragEvent = new DragEvent(DragEvent.DRAG_DROP,false,true,param1.dragInitiator,param1.action);
         this.dispatchEvent(_loc2_);
      }
      
      public function get hasItem() : Boolean
      {
         return false;
      }
      
      public function DropHandler(param1:DragProxy) : void
      {
      }
      
      public function OverHandler(param1:DragProxy) : void
      {
      }
      
      public function OutHandler(param1:DragProxy) : void
      {
      }
      
      public function StartHandler(param1:DragProxy) : void
      {
      }
      
      public function EndHandler(param1:DragProxy) : void
      {
      }
   }
}
