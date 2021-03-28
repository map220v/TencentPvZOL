package asgui.managers.drags
{
   import asgui.core.Application;
   import asgui.core.UIComponent;
   import asgui.managers.DragManager;
   import flash.display.DisplayObject;
   import flash.events.Event;
   import flash.events.KeyboardEvent;
   import flash.events.MouseEvent;
   import flash.utils.ByteArray;
   import flash.utils.getDefinitionByName;
   import flash.utils.getQualifiedClassName;
   
   public class DragProxy extends UIComponent
   {
       
      
      private var cursorClass:Class = null;
      
      private var cursorID:int = 0;
      
      private var lastKeyEvent:KeyboardEvent;
      
      private var lastMouseEvent:MouseEvent;
      
      public var dragInitiator:DisplayObject;
      
      public var xOffset:Number;
      
      public var yOffset:Number;
      
      public var startX:Number;
      
      public var startY:Number;
      
      public var target:DisplayObject = null;
      
      public var action:String;
      
      public var allowMove:Boolean = true;
      
      public function DragProxy(param1:DisplayObject)
      {
         super();
         this.dragInitiator = param1;
         this.mouseChildren = false;
         this.mouseEnabled = false;
         this.addEventListener(Event.ENTER_FRAME,this.EnterFrameHandler);
      }
      
      override public function Dispose() : void
      {
         this.removeEventListener(Event.ENTER_FRAME,this.EnterFrameHandler);
         if(this.numChildren > 0)
         {
            this.removeChildAt(0);
         }
         super.Dispose();
      }
      
      private function EnterFrameHandler(param1:Event) : void
      {
         this.visible = true;
         this.x = Application.application.stage.mouseX + this.xOffset;
         this.y = Application.application.stage.mouseY + this.yOffset;
      }
      
      public function GetDropDisplayObject() : DisplayObject
      {
         var _loc1_:ByteArray = null;
         var _loc2_:String = null;
         var _loc3_:Class = null;
         var _loc4_:Object = null;
         switch(this.action)
         {
            case DragManager.MOVE:
               return this.dragInitiator;
            case DragManager.COPY:
               _loc1_ = new ByteArray();
               _loc2_ = getQualifiedClassName(this.dragInitiator);
               _loc3_ = getDefinitionByName(_loc2_) as Class;
               _loc1_.writeObject(this.dragInitiator);
               _loc1_.position = 0;
               _loc4_ = _loc1_.readObject();
               return _loc3_(_loc4_);
            default:
               return null;
         }
      }
   }
}
