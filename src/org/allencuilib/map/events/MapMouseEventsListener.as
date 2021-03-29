package org.allencuilib.map.events
{
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import org.allencuilib.map.MapStage;
   import org.allencuilib.map.MapStageScrollMode;
   
   public class MapMouseEventsListener implements IMapEventsListener
   {
       
      
      protected var map:MapStage;
      
      public var enableMoveAfterClickRole:Boolean = false;
      
      private var mouseDown:Boolean;
      
      private var lastMouseX:Number;
      
      private var lastMouseY:Number;
      
      private var isDragging:Boolean;
      
      public function MapMouseEventsListener(param1:Boolean = false)
      {
         super();
         this.enableMoveAfterClickRole = param1;
      }
      
      public function StartListen(param1:MapStage) : void
      {
         this.map = param1;
         param1.addEventListener(MouseEvent.MOUSE_DOWN,this.DownHandler);
         param1.addEventListener(MouseEvent.MOUSE_UP,this.UpHandler);
         param1.addEventListener(MouseEvent.MOUSE_MOVE,this.MoveHandler);
      }
      
      public function StopListen() : void
      {
         this.map.removeEventListener(MouseEvent.MOUSE_DOWN,this.DownHandler);
         this.map.removeEventListener(MouseEvent.MOUSE_UP,this.UpHandler);
         this.map.removeEventListener(MouseEvent.MOUSE_MOVE,this.MoveHandler);
         this.map = null;
      }
      
      private function DownHandler(param1:MouseEvent) : void
      {
         this.mouseDown = true;
         this.lastMouseX = this.map.mouseScorllX + param1.stageX;
         this.lastMouseY = this.map.mouseScorllY + param1.stageY;
      }
      
      private function UpHandler(param1:MouseEvent) : void
      {
         var _loc2_:MapRoleEvent = null;
         var _loc3_:MapRoleEvent = null;
         var _loc4_:Point = null;
         if(!this.isDragging && this.mouseDown)
         {
            if(this.map.roleStage.overRole)
            {
               _loc2_ = new MapRoleEvent(MapRoleEvent.ROLE_CLICK);
               _loc2_.role = this.map.roleStage.overRole;
               this.map.dispatchEvent(_loc2_);
               if(this.map.lastOverRole != this.map.roleStage.overRole)
               {
                  _loc3_ = new MapRoleEvent(MapRoleEvent.SELECT_CHANGED);
                  _loc3_.role = this.map.roleStage.overRole;
                  this.map.dispatchEvent(_loc3_);
                  this.map.lastOverRole = this.map.roleStage.overRole;
               }
               if(!this.enableMoveAfterClickRole)
               {
                  return;
               }
            }
            if(this.map.clickForMove && this.map.roleStage.mainRole)
            {
               _loc4_ = this.map.backgroud.overTilePoint;
               this.map.MainRoleMoveTo(_loc4_);
            }
         }
         this.mouseDown = false;
         this.isDragging = false;
      }
      
      private function MoveHandler(param1:MouseEvent) : void
      {
         if(param1.buttonDown && this.mouseDown && this.map.mapStageScrollMode == MapStageScrollMode.MOUSE_DOWN_SCROLL)
         {
            this.map.mouseScorllX = this.lastMouseX - param1.stageX;
            this.map.mouseScorllY = this.lastMouseY - param1.stageY;
            this.map.CheckScroll(true);
            this.isDragging = true;
         }
      }
   }
}
