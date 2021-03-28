package com.qq.modules.guide.view.handlers
{
   import com.qq.GameGloble;
   import flash.events.Event;
   import flash.events.IEventDispatcher;
   
   public class GuideRobotlegsEventHandler
   {
       
      
      private var dispathCall:Function;
      
      public function GuideRobotlegsEventHandler(param1:String, param2:Function)
      {
         super();
         this.dispathCall = param2;
         GameGloble.context.addEventListener(param1,this.onEvent);
      }
      
      protected function onEvent(param1:Event) : void
      {
         (param1.currentTarget as IEventDispatcher).removeEventListener(param1.type,this.onEvent);
         this.dispathCall.apply();
         this.dispathCall = null;
      }
   }
}
