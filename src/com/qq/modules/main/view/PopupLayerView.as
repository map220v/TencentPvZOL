package com.qq.modules.main.view
{
   import com.qq.GameGloble;
   import com.qq.modules.basic.view.BasicPage;
   import com.qq.utils.GraphicsUtils;
   import com.qq.utils.UtilsManager;
   import flash.display.Sprite;
   import flash.events.Event;
   
   public class PopupLayerView extends BasicPage
   {
       
      
      public var popupMask:Sprite;
      
      public function PopupLayerView()
      {
         super();
      }
      
      override protected function init() : void
      {
         this.popupMask = new Sprite();
         GameGloble.stage.addEventListener(Event.RESIZE,this.onResize);
         this.onResize(null);
      }
      
      override public function Dispose() : void
      {
         GameGloble.stage.removeEventListener(Event.RESIZE,this.onResize);
         super.Dispose();
      }
      
      public function addMask() : void
      {
         addChildAt(this.popupMask,0);
      }
      
      public function removeMask() : void
      {
         UtilsManager.removeFromContainer(this.popupMask);
      }
      
      private function onResize(param1:Event) : void
      {
         GraphicsUtils.cleanContainer(this.popupMask);
         GraphicsUtils.drawRect(this.popupMask,0,0,GameGloble.stage.stageWidth,GameGloble.stage.stageHeight,0,0);
      }
   }
}
