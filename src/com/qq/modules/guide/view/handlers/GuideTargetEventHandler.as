package com.qq.modules.guide.view.handlers
{
   import com.qq.utils.QDisplayUtil;
   import flash.display.DisplayObject;
   import flash.events.Event;
   import flash.events.IEventDispatcher;
   
   public class GuideTargetEventHandler
   {
       
      
      private var dispathCall:Function;
      
      public function GuideTargetEventHandler(param1:*, param2:String, param3:Function)
      {
         var _loc4_:IEventDispatcher = null;
         super();
         this.dispathCall = param3;
         if(param1 is String)
         {
            _loc4_ = QDisplayUtil.CodeToDisplay(param1);
         }
         else if(param1 is DisplayObject)
         {
            _loc4_ = param1;
         }
         _loc4_.addEventListener(param2,this.onEvent);
      }
      
      protected function onEvent(param1:Event) : void
      {
         (param1.currentTarget as IEventDispatcher).removeEventListener(param1.type,this.onEvent);
         this.dispathCall.apply();
         this.dispathCall = null;
      }
   }
}
