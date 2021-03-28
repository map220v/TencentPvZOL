package com.qq.modules.basic.view
{
   import flash.events.IEventDispatcher;
   
   public class BasicScreenSupportStarlingMediator extends BasicScreenMediator
   {
       
      
      public function BasicScreenSupportStarlingMediator()
      {
         super();
      }
      
      override protected function init() : void
      {
         super.init();
      }
      
      override protected function addComponentListener(param1:Object, param2:String, param3:Function, param4:Class = null, param5:Boolean = false, param6:int = 0, param7:Boolean = true) : void
      {
         eventMap.mapListener(param1 as IEventDispatcher,param2,param3,param4,param5,param6,param7);
      }
      
      override protected function removeComponentListener(param1:Object, param2:String, param3:Function, param4:Class = null, param5:Boolean = false) : void
      {
         eventMap.unmapListener(param1 as IEventDispatcher,param2,param3,param4,param5);
      }
      
      override protected function hasComponentListener(param1:Object, param2:String, param3:Function, param4:Class = null) : Boolean
      {
         if(param1 is IEventDispatcher)
         {
            return (param1 as IEventDispatcher).hasEventListener(param2);
         }
         return false;
      }
      
      override public function dispose() : void
      {
         super.dispose();
      }
   }
}
