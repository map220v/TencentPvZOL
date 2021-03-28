package asgui.managers
{
   import asgui.events.DragEvent;
   import asgui.managers.drags.DragProxy;
   import asgui.managers.drags.IReceivable;
   import asgui.managers.drags.IReceivableImpl;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.DisplayObject;
   import flash.display.DisplayObjectContainer;
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import flash.events.MouseEvent;
   import flash.utils.setTimeout;
   
   public class DragManagerImpl extends EventDispatcher implements IDragManagerImpl
   {
       
      
      private var dragInitiator:DisplayObject;
      
      public var bDoingDrag:Boolean = false;
      
      private var mouseIsDown:Boolean = false;
      
      private var receiverList:Array;
      
      private var _dragProxy:DragProxy;
      
      private var currentReceiver:IReceivable;
      
      public function DragManagerImpl()
      {
         this.receiverList = [];
         super();
      }
      
      public function get dragProxy() : DragProxy
      {
         return this._dragProxy;
      }
      
      public function get isDragging() : Boolean
      {
         return this.bDoingDrag;
      }
      
      public function DoDrag(param1:DisplayObject, param2:MouseEvent, param3:DisplayObject = null, param4:Number = 0, param5:Number = 0, param6:Number = 0.5, param7:String = "move") : void
      {
         var _loc8_:Number = NaN;
         var _loc9_:Number = NaN;
         var _loc10_:int = 0;
         var _loc11_:Event = null;
         var _loc13_:BitmapData = null;
         var _loc14_:IReceivable = null;
         var _loc15_:DisplayObjectContainer = null;
         if(this.bDoingDrag)
         {
            return;
         }
         this.bDoingDrag = true;
         this.dragInitiator = param1;
         this._dragProxy = new DragProxy(param1);
         if(!param3)
         {
            _loc8_ = param1.width;
            _loc9_ = param1.height;
            (_loc13_ = new BitmapData(_loc8_,_loc9_,true,0)).draw(param1);
            this.dragProxy.addChild(new Bitmap(_loc13_));
         }
         else
         {
            this.dragProxy.addChild(param3);
            _loc8_ = param3.width;
            _loc9_ = param3.height;
         }
         this.dragProxy.alpha = param6;
         this.dragProxy.action = param7;
         this.dragProxy.xOffset = param4;
         this.dragProxy.yOffset = param5;
         this.dragProxy.visible = false;
         if(param3 is DisplayObject)
         {
            DisplayObject(param3).cacheAsBitmap = true;
         }
         if(SystemManager.instance.dragLayer == null)
         {
            return;
         }
         SystemManager.instance.dragLayer.addChild(this.dragProxy);
         _loc10_ = 0;
         while(_loc10_ < this.receiverList.length)
         {
            (_loc14_ = this.receiverList[_loc10_] as IReceivable).StartHandler(this.dragProxy);
            _loc14_.addEventListener(MouseEvent.ROLL_OVER,this.MouseOverHandler);
            _loc14_.addEventListener(MouseEvent.ROLL_OUT,this.MouseOutHandler);
            if((_loc15_ = _loc14_ as DisplayObjectContainer).mouseX > 0 && _loc15_.mouseX < _loc15_.width && _loc15_.mouseY > 0 && _loc15_.mouseY < _loc15_.height)
            {
               this.currentReceiver = _loc14_;
            }
            _loc10_++;
         }
         SystemManager.instance._root.addEventListener(MouseEvent.MOUSE_UP,this.MouseUpHandler);
         var _loc12_:DragEvent = new DragEvent(DragEvent.DRAG_START,false,true,this.dragProxy.dragInitiator,this.dragProxy.action,false,false,false,this.currentReceiver);
         this.dispatchEvent(_loc12_);
      }
      
      public function EndDrag() : void
      {
         var _loc1_:int = 0;
         var _loc3_:IReceivable = null;
         SystemManager.instance._root.removeEventListener(MouseEvent.MOUSE_UP,this.MouseUpHandler);
         var _loc2_:DragEvent = new DragEvent(DragEvent.DRAG_COMPLETE,false,true,!!this.dragProxy ? this.dragProxy.dragInitiator : null,!!this.dragProxy ? this.dragProxy.action : null,false,false,false,this.currentReceiver);
         this.dispatchEvent(_loc2_);
         if(this.dragProxy)
         {
            _loc1_ = 0;
            while(_loc1_ < this.receiverList.length)
            {
               _loc3_ = this.receiverList[_loc1_] as IReceivable;
               if(_loc3_ == _loc2_.dragInitiator)
               {
                  _loc3_.dispatchEvent(_loc2_);
               }
               _loc3_.EndHandler(this.dragProxy);
               _loc3_.removeEventListener(MouseEvent.ROLL_OVER,this.MouseOverHandler);
               _loc3_.removeEventListener(MouseEvent.ROLL_OUT,this.MouseOutHandler);
               _loc1_++;
            }
            if(this.dragProxy)
            {
               if(SystemManager.instance.dragLayer.contains(this.dragProxy))
               {
                  SystemManager.instance.dragLayer.removeChild(this.dragProxy);
               }
               this.dragProxy.Dispose();
               this._dragProxy = null;
            }
         }
         this.dragInitiator = null;
         this.bDoingDrag = false;
         this.currentReceiver = null;
      }
      
      public function AddReceiver(param1:IReceivable) : void
      {
         this.RemoveReceiver(param1);
         this.receiverList.push(param1);
      }
      
      public function RemoveReceiver(param1:IReceivable) : void
      {
         var _loc2_:int = 0;
         param1.removeEventListener(MouseEvent.ROLL_OVER,this.MouseOverHandler);
         param1.removeEventListener(MouseEvent.ROLL_OUT,this.MouseOutHandler);
         _loc2_ = 0;
         while(_loc2_ < this.receiverList.length)
         {
            if(param1 == this.receiverList[_loc2_])
            {
               this.receiverList.splice(_loc2_,1);
               break;
            }
            _loc2_++;
         }
      }
      
      private function MouseOverHandler(param1:MouseEvent) : void
      {
         this.currentReceiver = param1.currentTarget as IReceivable;
         this.currentReceiver.OverHandler(this.dragProxy);
         var _loc2_:DragEvent = new DragEvent(DragEvent.DRAG_ENTER,false,true,this.dragProxy.dragInitiator,this.dragProxy.action,param1.ctrlKey,param1.altKey,param1.shiftKey,this.currentReceiver);
         this.dispatchEvent(_loc2_);
      }
      
      private function MouseOutHandler(param1:MouseEvent) : void
      {
         (param1.currentTarget as IReceivable).OutHandler(this.dragProxy);
         this.currentReceiver = null;
         var _loc2_:DragEvent = new DragEvent(DragEvent.DRAG_EXIT,false,true,this.dragProxy.dragInitiator,this.dragProxy.action,param1.ctrlKey,param1.altKey,param1.shiftKey,this.currentReceiver);
         this.dispatchEvent(_loc2_);
      }
      
      private function MouseUpHandler(param1:MouseEvent) : void
      {
         if(this.currentReceiver && this.dragProxy)
         {
            if(this.currentReceiver is IReceivableImpl)
            {
               setTimeout(this.MouseUpLaterHandler,100,param1);
               (this.currentReceiver as IReceivableImpl).DropImplHandler(this.dragProxy);
            }
            else
            {
               this.MouseUpLaterHandler(param1);
            }
         }
         else
         {
            this.EndDrag();
         }
      }
      
      private function MouseUpLaterHandler(param1:MouseEvent) : void
      {
         var _loc2_:DragEvent = null;
         if(this.currentReceiver && this.dragProxy)
         {
            _loc2_ = new DragEvent(DragEvent.DRAG_DROP,false,true,this.dragProxy.dragInitiator,this.dragProxy.action,param1.ctrlKey,param1.altKey,param1.shiftKey,this.currentReceiver);
            this.dispatchEvent(_loc2_);
            this.currentReceiver.DropHandler(this.dragProxy);
            if(this.dragProxy && this.dragProxy.action == DragManager.MOVE)
            {
               this.EndDrag();
            }
         }
         else
         {
            this.EndDrag();
         }
      }
   }
}
