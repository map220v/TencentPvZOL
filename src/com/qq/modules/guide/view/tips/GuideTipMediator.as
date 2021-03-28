package com.qq.modules.guide.view.tips
{
   import com.qq.modules.basic.view.BasicScreenMediator;
   import flash.events.Event;
   
   public class GuideTipMediator extends BasicScreenMediator
   {
       
      
      [Inject]
      public var view:GuideTip;
      
      public function GuideTipMediator()
      {
         super();
      }
      
      override protected function initListener() : void
      {
         var _loc1_:int = 0;
         var _loc2_:Array = null;
         var _loc3_:int = 0;
         super.initListener();
         if(this.view.disposeNotificationTypes != null)
         {
            _loc2_ = this.view.disposeNotificationTypes;
            _loc3_ = _loc2_.length;
            _loc1_ = 0;
            while(_loc1_ < _loc3_)
            {
               addContextListener(_loc2_[_loc1_],this.onEvent);
               _loc1_++;
            }
         }
      }
      
      private function onEvent(param1:Event) : void
      {
         this.view.Dispose();
      }
   }
}
