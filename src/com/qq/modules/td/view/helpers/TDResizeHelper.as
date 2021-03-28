package com.qq.modules.td.view.helpers
{
   import asgui.core.Application;
   import com.qq.GameGloble;
   import flash.events.Event;
   
   public class TDResizeHelper
   {
       
      
      private var resizeCallBacks:Vector.<Function>;
      
      public function TDResizeHelper()
      {
         this.resizeCallBacks = new Vector.<Function>();
         super();
         Application.application.addEventListener(Event.RESIZE,this.stageResizeHandler);
         Application.application.addEventListener(Event.ENTER_FRAME,this.enterFrameHandler);
         this.checkSize();
      }
      
      public function Dispose() : void
      {
         this.clear();
         Application.application.removeEventListener(Event.RESIZE,this.stageResizeHandler);
         Application.application.removeEventListener(Event.ENTER_FRAME,this.enterFrameHandler);
      }
      
      protected function enterFrameHandler(param1:Event) : void
      {
      }
      
      public function addListener(param1:Function) : void
      {
         if(this.resizeCallBacks.indexOf(param1) == -1)
         {
            this.resizeCallBacks.push(param1);
            this.checkSize(param1);
         }
      }
      
      public function removeListener(param1:Function) : void
      {
         if(this.resizeCallBacks.indexOf(param1) != -1)
         {
            this.resizeCallBacks.splice(this.resizeCallBacks.indexOf(param1),1);
         }
      }
      
      protected function stageResizeHandler(param1:Event) : void
      {
         this.checkSize();
      }
      
      private function checkSize(param1:Function = null) : void
      {
         var _loc9_:int = 0;
         var _loc2_:int = Application.application.width;
         var _loc3_:int = Application.application.height;
         var _loc4_:Number = GameGloble.TDScreenW / GameGloble.TDScreenH;
         var _loc5_:Number;
         if((_loc5_ = Application.application.width / Application.application.height) < _loc4_)
         {
            _loc3_ = Application.application.width / _loc4_;
         }
         var _loc6_:Number = _loc2_ / GameGloble.TDScreenW;
         var _loc7_:Number = _loc3_ / GameGloble.TDScreenH;
         var _loc8_:Number = Math.min(_loc6_,_loc7_);
         if(!GameGloble.isStalingMode)
         {
            _loc8_ = 1;
            _loc2_ = GameGloble.TDScreenW;
            _loc3_ = GameGloble.TDScreenH;
         }
         GameGloble.scaleCurrent = _loc8_;
         if(param1 != null)
         {
            param1(_loc8_,_loc2_,_loc3_);
         }
         else
         {
            _loc9_ = 0;
            while(_loc9_ < this.resizeCallBacks.length)
            {
               this.resizeCallBacks[_loc9_](_loc8_,_loc2_,_loc3_);
               _loc9_++;
            }
         }
      }
      
      public function clear() : void
      {
         this.resizeCallBacks.length = 0;
      }
   }
}
