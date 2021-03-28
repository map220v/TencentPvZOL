package com.qq.managers
{
   import asgui.events.DragEvent;
   import asgui.managers.DragManager;
   import flash.utils.clearTimeout;
   import flash.utils.setTimeout;
   import org.as3commons.logging.api.getLogger;
   
   public class QDragStatus
   {
      
      private static var _instance:QDragStatus;
       
      
      private var timeout:uint;
      
      private var _inDragging:Boolean;
      
      public function QDragStatus()
      {
         super();
         DragManager.impl.addEventListener(DragEvent.DRAG_START,this.dragStartHandler);
         DragManager.impl.addEventListener(DragEvent.DRAG_COMPLETE,this.dragCompleteHandler);
      }
      
      public static function get instance() : QDragStatus
      {
         if(_instance == null)
         {
            _instance = new QDragStatus();
         }
         return _instance;
      }
      
      private function dragStartHandler(param1:DragEvent) : void
      {
         clearTimeout(this.timeout);
         this._inDragging = true;
         getLogger().debug("开始拖动");
      }
      
      private function dragCompleteHandler(param1:DragEvent) : void
      {
         clearTimeout(this.timeout);
         this.timeout = setTimeout(this.setCancelDragging,50);
      }
      
      private function setCancelDragging() : void
      {
         this._inDragging = false;
         getLogger().debug("取消拖动");
      }
      
      public function get inDragging() : Boolean
      {
         return this._inDragging;
      }
   }
}
