package com.qq.utils
{
   import com.greensock.TweenMax;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.DisplayObject;
   import flash.display.DisplayObjectContainer;
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import flash.geom.Point;
   import org.as3commons.logging.api.getLogger;
   
   public class MoveManager extends EventDispatcher
   {
      
      private static var _root:DisplayObjectContainer;
       
      
      private var tween:TweenMax;
      
      public function MoveManager()
      {
         super();
      }
      
      public static function initlize(param1:DisplayObjectContainer) : void
      {
         _root = param1;
      }
      
      public static function moveToDisplay(param1:DisplayObject, param2:DisplayObject, param3:Number = 1) : MoveManager
      {
         var _loc4_:Point = param2.localToGlobal(new Point(0,0));
         return moveToPoint(param1,_loc4_,param3);
      }
      
      public static function moveFromTo(param1:Point, param2:Point, param3:DisplayObject, param4:Number = 1) : MoveManager
      {
         var _loc5_:MoveManager;
         (_loc5_ = createInstance()).$moveFromTo(param1,param2,param3,param4);
         return _loc5_;
      }
      
      public static function moveToPoint(param1:DisplayObject, param2:Point, param3:Number = 1) : MoveManager
      {
         var _loc4_:Point = param1.localToGlobal(new Point(0,0));
         return moveFromTo(_loc4_,param2,param1,param3);
      }
      
      private static function createInstance() : MoveManager
      {
         return new MoveManager();
      }
      
      public function $moveFromTo(param1:Point, param2:Point, param3:DisplayObject, param4:Number = 1) : void
      {
         var bmp:Bitmap = null;
         var completeHandler:Function = null;
         var fromP:Point = param1;
         var toP:Point = param2;
         var fromDisplay:DisplayObject = param3;
         var time:Number = param4;
         completeHandler = function():void
         {
            tween = null;
            if(_root)
            {
               _root.stage.removeChild(bmp);
            }
            dispatchEvent(new Event(Event.COMPLETE));
         };
         var bmd:BitmapData = new BitmapData(fromDisplay.width,fromDisplay.height,true,16711680);
         bmd.draw(fromDisplay);
         bmp = new Bitmap(bmd);
         if(_root)
         {
            _root.stage.addChild(bmp);
         }
         else
         {
            getLogger().error("MoveManager need initlize!");
         }
         bmp.x = fromP.x;
         bmp.y = fromP.y;
         this.tween = TweenMax.to(bmp,time,{
            "x":toP.x,
            "y":toP.y,
            "alpha":0,
            "onComplete":completeHandler
         });
      }
      
      public function killTween() : void
      {
         if(this.tween)
         {
            this.tween.kill();
            this.tween = null;
         }
      }
   }
}
