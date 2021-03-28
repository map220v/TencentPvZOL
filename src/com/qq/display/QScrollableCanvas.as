package com.qq.display
{
   import asgui.core.Application;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   
   public class QScrollableCanvas extends QCanvas
   {
       
      
      public var enableScale:Boolean = false;
      
      public var enableMouse:Boolean = true;
      
      private var img:Sprite;
      
      protected var _target:Point;
      
      protected var downMousePt:Point;
      
      protected var downImgPt:Point;
      
      public var scaleMax:Number = 1.5;
      
      public var scaleMin:Number = 0.5;
      
      private var toScrollX:int;
      
      private var toScrollY:int;
      
      protected var toScale:Number = 1;
      
      protected var targetScale:Number = 1;
      
      private var paddingLeft:Number;
      
      private var paddingTop:Number;
      
      private var paddingRight:Number;
      
      private var paddingBottom:Number;
      
      public function QScrollableCanvas(param1:Class = null)
      {
         super(param1);
      }
      
      override public function InitializeComponent() : void
      {
         super.InitializeComponent();
         this.addEventListener(MouseEvent.MOUSE_MOVE,this.mouseHandler);
         this.addEventListener(MouseEvent.MOUSE_UP,this.mouseHandler);
         this.addEventListener(MouseEvent.MOUSE_DOWN,this.mouseHandler);
         this.addEventListener(Event.ENTER_FRAME,this.enterFrameHandler);
         this.addEventListener(MouseEvent.MOUSE_WHEEL,this.mouseHandler);
         Application.application.addEventListener(Event.RESIZE,this.resizeHandler);
      }
      
      protected function resizeHandler(param1:Event) : void
      {
         this.updateResize();
      }
      
      public function updateResize() : void
      {
         this._target = new Point(this.toScrollX,this.toScrollY);
         this.checkPosition();
         this.updateScroll();
      }
      
      override public function Dispose() : void
      {
         this.removeEventListener(MouseEvent.MOUSE_MOVE,this.mouseHandler);
         this.removeEventListener(MouseEvent.MOUSE_UP,this.mouseHandler);
         this.removeEventListener(MouseEvent.MOUSE_DOWN,this.mouseHandler);
         this.removeEventListener(Event.ENTER_FRAME,this.enterFrameHandler);
         this.removeEventListener(MouseEvent.MOUSE_WHEEL,this.mouseHandler);
         Application.application.removeEventListener(Event.RESIZE,this.resizeHandler);
         this.img = null;
         super.Dispose();
      }
      
      public function initScroll(param1:Sprite, param2:Number = NaN, param3:Number = NaN, param4:Number = NaN, param5:Number = NaN) : void
      {
         this.paddingBottom = !!isNaN(param5) ? Number(0) : Number(param5);
         this.paddingRight = !!isNaN(param4) ? Number(0) : Number(param4);
         this.paddingTop = !!isNaN(param3) ? Number(0) : Number(param3);
         this.paddingLeft = !!isNaN(param2) ? Number(0) : Number(param2);
         this.img = param1;
         this.updateScroll();
      }
      
      protected function enterFrameHandler(param1:Event) : void
      {
         if(this.img == null)
         {
            return;
         }
         if(this._target)
         {
            if(this.img.width > 100)
            {
               this.checkPosition();
            }
         }
         if(!isNaN(this.targetScale))
         {
            if(Math.abs(this.toScale - this.targetScale) < 0.01)
            {
               this.toScale = this.targetScale;
            }
            else
            {
               this.toScale += (this.targetScale - this.toScale) / 3;
            }
         }
         this.updateScroll();
      }
      
      private function checkPosition() : void
      {
         if(this._target == null || this.img == null)
         {
            return;
         }
         var _loc1_:int = Application.application.width / this.targetScale;
         var _loc2_:int = Application.application.height / this.targetScale;
         if(this.img.width + this.paddingRight + this.paddingLeft < _loc1_)
         {
            this._target.x = -this.img.width / 2;
         }
         else if(this._target.x < _loc1_ / 2 - (this.img.width + this.paddingRight) * 1)
         {
            this._target.x = _loc1_ / 2 - (this.img.width + this.paddingRight) * 1;
         }
         else if(this._target.x > this.paddingLeft * 1 - _loc1_ / 2)
         {
            this._target.x = this.paddingLeft * 1 - _loc1_ / 2;
         }
         if(this.img.height + this.paddingTop + this.paddingBottom < _loc2_)
         {
            this._target.y = -(this.img.height + this.paddingBottom + this.paddingTop) / 2;
         }
         else if(this._target.y < _loc2_ / 2 - (this.img.height + this.paddingBottom) * 1)
         {
            this._target.y = _loc2_ / 2 - (this.img.height + this.paddingBottom) * 1;
         }
         else if(this._target.y > this.paddingTop * 1 - _loc2_ / 2)
         {
            this._target.y = this.paddingTop * 1 - _loc2_ / 2;
         }
         this.toScrollX += (this._target.x - this.toScrollX) / 3;
         this.toScrollY += (this._target.y - this.toScrollY) / 3;
         var _loc3_:Number = Point.distance(new Point(this.toScrollX,this.toScrollY),this._target);
         if(_loc3_ < 10)
         {
            this.toScrollX = this._target.x;
            this.toScrollY = this._target.y;
            this._target = null;
         }
      }
      
      private function updateScroll() : void
      {
         if(!this.img)
         {
            return;
         }
         if(this.img.scaleX != this.toScale)
         {
            this.img.scaleX = this.img.scaleY = this.toScale;
         }
         var _loc1_:int = Application.application.width / this.toScale;
         var _loc2_:int = Application.application.height / this.toScale;
         var _loc3_:Rectangle = new Rectangle(int(-this.toScrollX - _loc1_ / 2),int(-this.toScrollY - _loc2_ / 2),int(_loc1_),int(_loc2_));
         if(this.img.scrollRect == null || !this.img.scrollRect.equals(_loc3_))
         {
            this.img.scrollRect = _loc3_;
         }
      }
      
      public function cameraTo(param1:int, param2:int, param3:Boolean = true) : void
      {
         this._target = new Point(-param1,-param2);
         if(!param3)
         {
            this.toScrollX = -param1;
            this.toScrollY = -param2;
            this.updateScroll();
         }
      }
      
      public function scaleTo(param1:Number) : void
      {
         this.targetScale = param1;
      }
      
      private function mouseHandler(param1:MouseEvent) : void
      {
         if(this.img == null)
         {
            return;
         }
         if(!this.enableMouse)
         {
            return;
         }
         switch(param1.type)
         {
            case MouseEvent.MOUSE_MOVE:
               if(!param1.buttonDown)
               {
                  this.downMousePt = null;
               }
               else if(this.downMousePt)
               {
                  this._target = new Point(this.downImgPt.x + param1.stageX - this.downMousePt.x,this.downImgPt.y + param1.stageY - this.downMousePt.y);
               }
               break;
            case MouseEvent.MOUSE_UP:
               this.downMousePt = null;
               break;
            case MouseEvent.MOUSE_DOWN:
               this.downMousePt = new Point(param1.stageX,param1.stageY);
               this.downImgPt = new Point(this.toScrollX,this.toScrollY);
               this._target = null;
               break;
            case MouseEvent.MOUSE_WHEEL:
               if(!this.enableScale)
               {
                  break;
               }
               if(isNaN(this.targetScale))
               {
                  this.targetScale = this.img.scaleX;
               }
               if(param1.delta > 0)
               {
                  this.targetScale += 0.5;
                  if(this.targetScale > this.scaleMax)
                  {
                     this.targetScale = this.scaleMax;
                  }
               }
               else
               {
                  this.targetScale -= 0.5;
                  if(this.targetScale < this.scaleMin)
                  {
                     this.targetScale = this.scaleMin;
                  }
               }
               this._target = new Point(-this.img.mouseX,-this.img.mouseY);
               break;
         }
      }
   }
}
