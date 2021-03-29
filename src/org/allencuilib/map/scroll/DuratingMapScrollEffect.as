package org.allencuilib.map.scroll
{
   import flash.display.DisplayObject;
   import flash.events.Event;
   
   public class DuratingMapScrollEffect implements IMapScrollEffect
   {
       
      
      private var stage:DisplayObject;
      
      private var doCameraFunc:Function;
      
      private var endFunction:Function;
      
      private var sourceX:Number;
      
      private var sourceY:Number;
      
      private var targetX:Number;
      
      private var targetY:Number;
      
      private var x:Number;
      
      private var y:Number;
      
      public var leaseStopDistance:Number = 4;
      
      public var scrollSpeed:Number = 1.4;
      
      private var _hasDisposed:Boolean = false;
      
      public function DuratingMapScrollEffect(param1:DisplayObject, param2:Function = null)
      {
         super();
         this.stage = param1;
         this.endFunction = param2;
         param1.addEventListener(Event.ENTER_FRAME,this.EnterFrameHandler);
      }
      
      public function Dispose() : void
      {
         this.stage.removeEventListener(Event.ENTER_FRAME,this.EnterFrameHandler);
         this.stage = null;
         this.doCameraFunc = null;
         this._hasDisposed = true;
      }
      
      public function get hasDisposed() : Boolean
      {
         return this._hasDisposed;
      }
      
      public function CameraTo(param1:Function, param2:Number, param3:Number, param4:Number, param5:Number) : void
      {
         this.doCameraFunc = param1;
         this.sourceX = param2;
         this.sourceY = param3;
         this.targetX = param4;
         this.targetY = param5;
         this.x = param2;
         this.y = param3;
      }
      
      private function EnterFrameHandler(param1:Event) : void
      {
         if(!isNaN(this.targetX) || !isNaN(this.targetY))
         {
            if(Math.abs(this.x - this.targetX) < this.leaseStopDistance)
            {
               this.x = this.targetX;
            }
            else
            {
               this.x = this.targetX - (this.targetX - this.x) / this.scrollSpeed;
            }
            if(Math.abs(this.y - this.targetY) < this.leaseStopDistance)
            {
               this.y = this.targetY;
            }
            else
            {
               this.y = this.targetY - (this.targetY - this.y) / this.scrollSpeed;
            }
            if(this.x == this.targetX && this.y == this.targetY)
            {
               this.targetX = NaN;
               this.targetY = NaN;
               if(this.endFunction != null)
               {
                  this.endFunction.apply();
               }
            }
            this.doCameraFunc(this.x,this.y);
         }
      }
   }
}
