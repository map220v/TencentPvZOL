package asgui.events
{
   import asgui.managers.drags.IReceivable;
   import flash.display.DisplayObject;
   import flash.events.Event;
   import flash.events.MouseEvent;
   
   public class DragEvent extends MouseEvent
   {
      
      public static const DRAG_COMPLETE:String = "dragComplete";
      
      public static const DRAG_DROP:String = "dragDrop";
      
      public static const DRAG_ENTER:String = "dragEnter";
      
      public static const DRAG_EXIT:String = "dragExit";
      
      public static const DRAG_START:String = "dragStart";
       
      
      public var action:String;
      
      public var draggedItem:Object;
      
      public var dragInitiator:DisplayObject;
      
      public var currentReceiver:IReceivable;
      
      public function DragEvent(param1:String, param2:Boolean = false, param3:Boolean = true, param4:DisplayObject = null, param5:String = null, param6:Boolean = false, param7:Boolean = false, param8:Boolean = false, param9:IReceivable = null)
      {
         super(param1,param2,param3);
         this.dragInitiator = param4;
         this.action = param5;
         this.ctrlKey = param6;
         this.altKey = param7;
         this.shiftKey = param8;
         this.currentReceiver = param9;
      }
      
      override public function clone() : Event
      {
         var _loc1_:DragEvent = new DragEvent(type,bubbles,cancelable,this.dragInitiator,this.action,ctrlKey,altKey,shiftKey,this.currentReceiver);
         _loc1_.relatedObject = this.relatedObject;
         _loc1_.localX = this.localX;
         _loc1_.localY = this.localY;
         return _loc1_;
      }
   }
}
