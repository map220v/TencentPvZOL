package com.qq.modules.basic.view
{
   import asgui.core.IDisposable;
   import com.qq.GameGloble;
   import com.qq.modules.guide.command.GuideCmd;
   import flash.display.DisplayObject;
   import flash.events.IEventDispatcher;
   import org.robotlegs.mvcs.Mediator;
   
   public class BasicScreenMediator extends Mediator
   {
       
      
      protected var _param:Object;
      
      public function BasicScreenMediator()
      {
         super();
      }
      
      protected function init() : void
      {
      }
      
      override public function onRegister() : void
      {
         super.onRegister();
         this.init();
         this.initListener();
         this.initialized();
      }
      
      protected function initListener() : void
      {
      }
      
      protected function initialized() : void
      {
         if(GameGloble.isFinishInit)
         {
            GuideCmd.checkBtnVisible(getViewComponent());
         }
      }
      
      public function reset(param1:Object = null) : void
      {
         this._param = param1;
      }
      
      protected function addComponentListener(param1:Object, param2:String, param3:Function, param4:Class = null, param5:Boolean = false, param6:int = 0, param7:Boolean = true) : void
      {
         eventMap.mapListener(param1 as IEventDispatcher,param2,param3,param4,param5,param6,param7);
      }
      
      protected function removeComponentListener(param1:Object, param2:String, param3:Function, param4:Class = null, param5:Boolean = false) : void
      {
         eventMap.unmapListener(param1 as IEventDispatcher,param2,param3,param4,param5);
      }
      
      protected function hasComponentListener(param1:Object, param2:String, param3:Function, param4:Class = null) : Boolean
      {
         if(param1 is IEventDispatcher)
         {
            return (param1 as IEventDispatcher).hasEventListener(param2);
         }
         return false;
      }
      
      public function dispose() : void
      {
         var _loc1_:IDisposable = null;
         if(viewComponent is DisplayObject)
         {
            (viewComponent as DisplayObject).visible = false;
         }
         if(viewComponent is IDisposable)
         {
            _loc1_ = viewComponent as IDisposable;
            if(_loc1_.hasDisposed == false)
            {
               _loc1_.Dispose();
            }
         }
      }
      
      override public function preRemove() : void
      {
         this.dispose();
         super.preRemove();
      }
   }
}
