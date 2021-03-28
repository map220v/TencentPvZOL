package org.robotlegs.base
{
   import flash.display.DisplayObjectContainer;
   import flash.events.Event;
   import org.robotlegs.core.IInjector;
   
   public class ViewMapBase
   {
       
      
      protected var _enabled:Boolean = true;
      
      protected var _contextView:DisplayObjectContainer;
      
      protected var injector:IInjector;
      
      protected var useCapture:Boolean;
      
      protected var viewListenerCount:uint;
      
      public function ViewMapBase(param1:DisplayObjectContainer, param2:IInjector)
      {
         super();
         this.injector = param2;
         this.useCapture = true;
         this.contextView = param1;
      }
      
      public function get contextView() : DisplayObjectContainer
      {
         return this._contextView;
      }
      
      public function set contextView(param1:DisplayObjectContainer) : void
      {
         if(param1 != this._contextView)
         {
            this.removeListeners();
            this._contextView = param1;
            if(this.viewListenerCount > 0)
            {
               this.addListeners();
            }
         }
      }
      
      public function get enabled() : Boolean
      {
         return this._enabled;
      }
      
      public function set enabled(param1:Boolean) : void
      {
         if(param1 != this._enabled)
         {
            this.removeListeners();
            this._enabled = param1;
            if(this.viewListenerCount > 0)
            {
               this.addListeners();
            }
         }
      }
      
      protected function addListeners() : void
      {
      }
      
      protected function removeListeners() : void
      {
      }
      
      protected function onViewAdded(param1:Event) : void
      {
      }
   }
}
