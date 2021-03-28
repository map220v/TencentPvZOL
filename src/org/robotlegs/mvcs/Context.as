package org.robotlegs.mvcs
{
   import flash.display.DisplayObjectContainer;
   import flash.events.Event;
   import flash.events.IEventDispatcher;
   import flash.system.ApplicationDomain;
   import org.as3commons.logging.api.getLogger;
   import org.robotlegs.adapters.SwiftSuspendersInjector;
   import org.robotlegs.adapters.SwiftSuspendersReflector;
   import org.robotlegs.base.CommandMap;
   import org.robotlegs.base.ContextBase;
   import org.robotlegs.base.ContextError;
   import org.robotlegs.base.ContextEvent;
   import org.robotlegs.base.EventMap;
   import org.robotlegs.base.MediatorMap;
   import org.robotlegs.base.ViewMap;
   import org.robotlegs.core.ICommandMap;
   import org.robotlegs.core.IContext;
   import org.robotlegs.core.IEventMap;
   import org.robotlegs.core.IInjector;
   import org.robotlegs.core.IMediatorMap;
   import org.robotlegs.core.IReflector;
   import org.robotlegs.core.IViewMap;
   
   public class Context extends ContextBase implements IContext
   {
       
      
      protected var _injector:IInjector;
      
      protected var _reflector:IReflector;
      
      protected var _autoStartup:Boolean;
      
      protected var _contextView:DisplayObjectContainer;
      
      protected var _commandMap:ICommandMap;
      
      protected var _mediatorMap:IMediatorMap;
      
      protected var _viewMap:IViewMap;
      
      public function Context(param1:DisplayObjectContainer = null, param2:Boolean = true)
      {
         super();
         this._contextView = param1;
         this._autoStartup = param2;
         if(this._contextView)
         {
            getLogger().debug("======================== contextView:" + param1);
            this.mapInjections();
            getLogger().debug("======================== injector:" + this.injector);
            this.checkAutoStartup();
         }
      }
      
      public function startup() : void
      {
         dispatchEvent(new ContextEvent(ContextEvent.STARTUP_COMPLETE));
      }
      
      public function shutdown() : void
      {
         dispatchEvent(new ContextEvent(ContextEvent.SHUTDOWN_COMPLETE));
      }
      
      public function get contextView() : DisplayObjectContainer
      {
         return this._contextView;
      }
      
      public function set contextView(param1:DisplayObjectContainer) : void
      {
         if(param1 == this._contextView)
         {
            return;
         }
         if(this._contextView)
         {
            throw new ContextError(ContextError.E_CONTEXT_VIEW_OVR);
         }
         this._contextView = param1;
         this.mapInjections();
         this.checkAutoStartup();
      }
      
      protected function get injector() : IInjector
      {
         return this._injector = this._injector || this.createInjector();
      }
      
      protected function set injector(param1:IInjector) : void
      {
         this._injector = param1;
      }
      
      protected function get reflector() : IReflector
      {
         return this._reflector = this._reflector || new SwiftSuspendersReflector();
      }
      
      protected function set reflector(param1:IReflector) : void
      {
         this._reflector = param1;
      }
      
      protected function get commandMap() : ICommandMap
      {
         return this._commandMap = this._commandMap || new CommandMap(eventDispatcher,this.createChildInjector(),this.reflector);
      }
      
      protected function set commandMap(param1:ICommandMap) : void
      {
         this._commandMap = param1;
      }
      
      protected function get mediatorMap() : IMediatorMap
      {
         return this._mediatorMap = this._mediatorMap || new MediatorMap(this.contextView,this.createChildInjector(),this.reflector);
      }
      
      protected function set mediatorMap(param1:IMediatorMap) : void
      {
         this._mediatorMap = param1;
      }
      
      protected function get viewMap() : IViewMap
      {
         return this._viewMap = this._viewMap || new ViewMap(this.contextView,this.injector);
      }
      
      protected function set viewMap(param1:IViewMap) : void
      {
         this._viewMap = param1;
      }
      
      protected function mapInjections() : void
      {
         this.injector.mapValue(IReflector,this.reflector);
         this.injector.mapValue(IInjector,this.injector);
         this.injector.mapValue(IEventDispatcher,eventDispatcher);
         this.injector.mapValue(DisplayObjectContainer,this.contextView);
         this.injector.mapValue(ICommandMap,this.commandMap);
         this.injector.mapValue(IMediatorMap,this.mediatorMap);
         this.injector.mapValue(IViewMap,this.viewMap);
         this.injector.mapClass(IEventMap,EventMap);
      }
      
      protected function checkAutoStartup() : void
      {
         if(this._autoStartup && this.contextView)
         {
            if(this.contextView.stage)
            {
               this.startup();
            }
            else
            {
               this.contextView.addEventListener(Event.ADDED_TO_STAGE,this.onAddedToStage,false,0,true);
            }
         }
      }
      
      protected function onAddedToStage(param1:Event) : void
      {
         this.contextView.removeEventListener(Event.ADDED_TO_STAGE,this.onAddedToStage);
         this.startup();
      }
      
      protected function createInjector() : IInjector
      {
         var _loc1_:IInjector = new SwiftSuspendersInjector();
         _loc1_.applicationDomain = this.getApplicationDomainFromContextView();
         return _loc1_;
      }
      
      protected function createChildInjector() : IInjector
      {
         return this.injector.createChild(this.getApplicationDomainFromContextView());
      }
      
      protected function getApplicationDomainFromContextView() : ApplicationDomain
      {
         if(this.contextView && this.contextView.loaderInfo)
         {
            return this.contextView.loaderInfo.applicationDomain;
         }
         return ApplicationDomain.currentDomain;
      }
   }
}
