package asgui.managers
{
   import asgui.core.EventPriority;
   import flash.display.DisplayObject;
   import flash.display.InteractiveObject;
   import flash.display.Sprite;
   import flash.events.ContextMenuEvent;
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import flash.ui.ContextMenu;
   import flash.ui.Mouse;
   import flash.ui.MouseCursor;
   
   public class CursorManagerImpl extends EventDispatcher implements ICursorManagerImpl
   {
       
      
      private var cursorList:Array;
      
      private var busyCursorList:Array;
      
      private var currentCursor:DisplayObject;
      
      private var cursorHolder:Sprite;
      
      private var nextCursorID:int = 10;
      
      var _currentCursorID:int = 0;
      
      private var currentCursorXOffset:Number;
      
      private var currentCursorYOffset:Number;
      
      private var listenForContextMenu:Boolean = true;
      
      public function CursorManagerImpl()
      {
         this.cursorList = [];
         this.busyCursorList = [];
         super();
         this.cursorHolder = new Sprite();
         this.cursorHolder.mouseEnabled = false;
         this.cursorHolder.mouseChildren = false;
         SystemManager.instance.cursorLayer.addChild(this.cursorHolder);
         SystemManager.instance._root.stage.addEventListener(Event.ENTER_FRAME,this.EnterFrameHandler);
      }
      
      public function get currentCursorID() : int
      {
         return this._currentCursorID;
      }
      
      public function set currentCursorID(param1:int) : void
      {
         this._currentCursorID = param1;
         this.ShowCurrentCursor();
      }
      
      public function ShowCursor() : void
      {
         if(this.currentCursorID < 10)
         {
            this.cursorHolder.visible = false;
            Mouse.show();
         }
         else if(this.cursorHolder)
         {
            this.cursorHolder.visible = true;
            Mouse.hide();
         }
      }
      
      public function HideCursor() : void
      {
         if(this.cursorHolder)
         {
            this.cursorHolder.visible = false;
         }
         Mouse.show();
      }
      
      public function SetCursor(param1:Class, param2:int = 2, param3:Number = 0, param4:Number = 0) : int
      {
         var _loc5_:int = ++this.nextCursorID;
         var _loc6_:CursorQueueItem;
         (_loc6_ = new CursorQueueItem()).cursorID = _loc5_;
         _loc6_.cursorClass = param1;
         _loc6_.priority = param2;
         _loc6_.x = param3;
         _loc6_.y = param4;
         this.cursorList.push(_loc6_);
         return _loc5_;
      }
      
      public function RemoveCursor(param1:int) : void
      {
      }
      
      public function RemoveAllCursors() : void
      {
         this.cursorList = [];
         this.currentCursorID = 0;
         this.ShowCurrentCursor();
      }
      
      public function SetBusyCursor() : void
      {
      }
      
      public function RemoveBusyCursor() : void
      {
      }
      
      private function ShowCurrentCursor() : void
      {
         var _loc1_:CursorQueueItem = null;
         var _loc2_:int = 0;
         var _loc3_:DisplayObject = null;
         if(this.currentCursorID < 10)
         {
            switch(this.currentCursorID)
            {
               case CursorManager.NO_CURSOR:
                  Mouse.cursor = MouseCursor.AUTO;
                  break;
               case CursorManager.ARROW:
                  Mouse.cursor = MouseCursor.ARROW;
                  break;
               case CursorManager.BUTTON:
                  Mouse.cursor = MouseCursor.BUTTON;
                  break;
               case CursorManager.HAND:
                  Mouse.cursor = MouseCursor.HAND;
                  break;
               case CursorManager.IBEAM:
                  Mouse.cursor = MouseCursor.IBEAM;
            }
         }
         else
         {
            _loc2_ = 0;
            while(_loc2_ < this.cursorList.length)
            {
               if((this.cursorList[_loc2_] as CursorQueueItem).cursorID == this.currentCursorID)
               {
                  _loc1_ = this.cursorList[_loc2_] as CursorQueueItem;
                  break;
               }
               _loc2_++;
            }
            if(_loc1_)
            {
               _loc3_ = new _loc1_.cursorClass() as DisplayObject;
               while(this.cursorHolder.numChildren > 0)
               {
                  this.cursorHolder.removeChildAt(0);
               }
               this.cursorHolder.addChild(_loc3_);
               _loc3_.x = _loc1_.x;
               _loc3_.y = _loc1_.y;
            }
         }
         this.addContextMenuHandlers();
         this.ShowCursor();
      }
      
      private function EnterFrameHandler(param1:Event) : void
      {
         if(!this.cursorHolder.visible && this.cursorHolder.numChildren > 0)
         {
            return;
         }
         this.cursorHolder.x = SystemManager.instance._root.mouseX;
         this.cursorHolder.y = SystemManager.instance._root.mouseY;
      }
      
      private function addContextMenuHandlers() : void
      {
         var _loc1_:InteractiveObject = null;
         if(!this.listenForContextMenu)
         {
            _loc1_ = SystemManager.instance._root;
            _loc1_.contextMenu = new ContextMenu();
            if(_loc1_ && _loc1_.contextMenu)
            {
               _loc1_.contextMenu.addEventListener(ContextMenuEvent.MENU_SELECT,this.contextMenu_menuSelectHandler,true,EventPriority.CURSOR_MANAGEMENT);
               this.listenForContextMenu = true;
            }
         }
      }
      
      private function contextMenu_menuSelectHandler(param1:ContextMenuEvent) : void
      {
         this.ShowCursor();
      }
   }
}

class CursorQueueItem
{
    
   
   public var cursorID:int = 0;
   
   public var cursorClass:Class = null;
   
   public var priority:int;
   
   public var x:Number;
   
   public var y:Number;
   
   function CursorQueueItem()
   {
      super();
   }
}
