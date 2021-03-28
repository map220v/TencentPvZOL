package com.qq.utils.blit
{
   import asgui.blit.display.IBlitDisplayContainer;
   import asgui.core.Application;
   import asgui.managers.ToolTipManager;
   import flash.events.MouseEvent;
   
   public class QBlitUIContainerHelper
   {
       
      
      private var view:IBlitDisplayContainer;
      
      private var tip:String;
      
      public function QBlitUIContainerHelper(param1:IBlitDisplayContainer, param2:String)
      {
         super();
         this.tip = param2;
         this.view = param1;
         param1.addEventListener(MouseEvent.ROLL_OVER,this.overHandler);
         param1.addEventListener(MouseEvent.CLICK,this.clickHandler);
         param1.addEventListener(MouseEvent.ROLL_OUT,this.outHandler);
      }
      
      protected function clickHandler(param1:MouseEvent) : void
      {
         this.callOut();
      }
      
      protected function outHandler(param1:MouseEvent) : void
      {
         this.callOut();
      }
      
      protected function overHandler(param1:MouseEvent) : void
      {
         this.callOver();
      }
      
      public function callOver() : void
      {
         var _loc1_:Number = Application.application.mouseX;
         var _loc2_:Number = Application.application.mouseY;
         ToolTipManager.CreateToolTip(this.tip,_loc1_,_loc2_,null);
      }
      
      public function callOut() : void
      {
         ToolTipManager.DestroyToolTip();
      }
      
      public function Dispose() : void
      {
         if(this.view)
         {
            this.view.removeEventListener(MouseEvent.ROLL_OVER,this.overHandler);
            this.view.removeEventListener(MouseEvent.CLICK,this.clickHandler);
            this.view.removeEventListener(MouseEvent.ROLL_OUT,this.outHandler);
            this.view = null;
         }
      }
   }
}
