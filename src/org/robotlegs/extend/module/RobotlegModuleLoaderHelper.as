package org.robotlegs.extend.module
{
   import asgui.modules.ModuleEvent;
   import asgui.modules.ModuleLoader;
   import asgui.modules.ModuleLoaderManager;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.IEventDispatcher;
   import org.robotlegs.extend.ExtendContext;
   import org.robotlegs.extend.command.StrongRobotlegCommandEvent;
   
   public class RobotlegModuleLoaderHelper
   {
       
      
      public var loader:ModuleLoader;
      
      private var eventTypes:Vector.<String>;
      
      private var layer:Sprite;
      
      private var data:Object;
      
      private var onEventStrongTypeCommand:StrongRobotlegCommandEvent;
      
      var assetsManagerCheckLoads:Vector.<int>;
      
      var $hasInit:Boolean;
      
      public var autoInitModule:Boolean = true;
      
      public var initFunction:Function = null;
      
      public var moduleUrl:String;
      
      public function RobotlegModuleLoaderHelper(param1:String, param2:Vector.<int> = null, param3:Sprite = null, param4:Object = null)
      {
         super();
         this.moduleUrl = param1;
         this.assetsManagerCheckLoads = param2;
         this.data = param4;
         this.layer = param3;
         this.loader = ModuleLoaderManager.CreateModuleLoader(param1);
      }
      
      public function setAddEventTypes(param1:Vector.<String> = null) : void
      {
         this.removeEventsListen(this.eventTypes);
         this.addEventsListen(param1);
         this.eventTypes = param1;
      }
      
      private function addEventsListen(param1:Vector.<String>) : void
      {
         var _loc2_:int = 0;
         if(param1 == null || param1.length == 0)
         {
            return;
         }
         var _loc3_:int = param1.length;
         _loc2_ = 0;
         while(_loc2_ < _loc3_)
         {
            ExtendContext.instance.addEventListener(param1[_loc2_],this.onEvent);
            _loc2_++;
         }
      }
      
      protected function onEvent(param1:Event) : void
      {
         var _loc2_:Boolean = true;
         if(this.initFunction != null)
         {
            _loc2_ = this.initFunction.call(this,param1);
         }
         if(_loc2_)
         {
            this.removeEventsListen(this.eventTypes);
            if(param1 is StrongRobotlegCommandEvent)
            {
               this.onEventStrongTypeCommand = param1 as StrongRobotlegCommandEvent;
            }
            if(this.autoInitModule)
            {
               this.doModuleInit();
            }
            this.loader.addEventListener(ModuleEvent.SETUP,this.moduleSetupHandler);
         }
      }
      
      protected function moduleSetupHandler(param1:ModuleEvent) : void
      {
         (param1.currentTarget as IEventDispatcher).removeEventListener(ModuleEvent.SETUP,this.moduleSetupHandler);
         if(this.onEventStrongTypeCommand)
         {
            ExtendContext.instance.dispatchEvent(this.onEventStrongTypeCommand);
         }
      }
      
      private function removeEventsListen(param1:Vector.<String>) : void
      {
         var _loc2_:int = 0;
         if(param1 == null || param1.length == 0)
         {
            return;
         }
         var _loc3_:int = param1.length;
         _loc2_ = 0;
         while(_loc2_ < _loc3_)
         {
            ExtendContext.instance.removeEventListener(param1[_loc2_],this.onEvent);
            _loc2_++;
         }
      }
      
      public function doModuleInit(param1:Vector.<int> = null, param2:Sprite = null, param3:Object = null) : void
      {
         if(param1 == null)
         {
            param1 = this.assetsManagerCheckLoads;
         }
         if(param2 == null)
         {
            param2 = this.layer;
         }
         if(param3 == null)
         {
            param3 = this.data;
         }
         this.loader.SetupModule(param1,param2,param3);
         this.$hasInit = true;
         this.removeEventsListen(this.eventTypes);
         RobotlegModuleLoaderManager.impl.dispatchChange();
      }
      
      public function setData(param1:Object) : void
      {
         if(!this.$hasInit)
         {
            this.doModuleInit(this.assetsManagerCheckLoads,this.layer,param1);
         }
         else
         {
            this.loader.SetupModule(this.assetsManagerCheckLoads,this.layer,param1);
         }
      }
      
      public function unloadModule() : void
      {
         this.loader.UnloadModule();
         this.$hasInit = false;
         this.addEventsListen(this.eventTypes);
      }
   }
}
