package org.robotlegs.extend
{
   import asgui.managers.SystemManager;
   import flash.display.DisplayObjectContainer;
   import org.robotlegs.adapters.SwiftSuspendersReflector;
   import org.robotlegs.base.CommandMap;
   import org.robotlegs.base.MediatorMap;
   import org.robotlegs.base.ViewMap;
   import org.robotlegs.core.ICommandMap;
   import org.robotlegs.core.IInjector;
   import org.robotlegs.core.IMediatorMap;
   import org.robotlegs.core.IReflector;
   import org.robotlegs.core.IViewMap;
   import org.robotlegs.extend.command.RobotlegExtendCommand;
   import org.robotlegs.extend.command.StrongRobotlegCommandEvent;
   import org.robotlegs.mvcs.Context;
   
   public class ExtendContext extends Context
   {
      
      private static var _instance:ExtendContext;
       
      
      public function ExtendContext(param1:DisplayObjectContainer = null, param2:Boolean = true)
      {
         _instance = this;
         super(param1,param2);
      }
      
      public static function get instance() : ExtendContext
      {
         if(_instance == null)
         {
            _instance = new ExtendContext(SystemManager.instance);
         }
         return _instance;
      }
      
      override public function startup() : void
      {
         this.commandMap.mapEvent("org.robotlegs.extend::RobotlegExtendCommand",RobotlegExtendCommand,StrongRobotlegCommandEvent);
         super.startup();
      }
      
      public function get myInjector() : IInjector
      {
         return this.injector;
      }
      
      override protected function get injector() : IInjector
      {
         if(!_injector)
         {
            _injector = createInjector();
         }
         return _injector;
      }
      
      override protected function get reflector() : IReflector
      {
         if(!_reflector)
         {
            _reflector = new SwiftSuspendersReflector();
         }
         return _reflector;
      }
      
      public function getCommandMap() : ICommandMap
      {
         return this.commandMap;
      }
      
      override protected function get commandMap() : ICommandMap
      {
         if(!_commandMap)
         {
            _commandMap = new CommandMap(eventDispatcher,createChildInjector(),this.reflector);
         }
         return _commandMap;
      }
      
      public function getMediatorMap() : IMediatorMap
      {
         return this.mediatorMap;
      }
      
      override protected function get mediatorMap() : IMediatorMap
      {
         if(!_mediatorMap)
         {
            _mediatorMap = new MediatorMap(contextView,createChildInjector(),this.reflector);
         }
         return _mediatorMap;
      }
      
      public function getViewMap() : IViewMap
      {
         return this.viewMap;
      }
      
      override protected function get viewMap() : IViewMap
      {
         if(!_viewMap)
         {
            _viewMap = new ViewMap(contextView,this.injector);
         }
         return _viewMap;
      }
   }
}
