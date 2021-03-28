package com.qq.modules.main.command
{
   import com.qq.modules.basic.modle.BasicProxy;
   import org.robotlegs.extend.command.StrongRobotlegCommand;
   import org.robotlegs.mvcs.Actor;
   
   public class RegisterModuleCommand extends StrongRobotlegCommand
   {
       
      
      public function RegisterModuleCommand()
      {
         super();
      }
      
      public function registerModuleMVC(param1:Array, param2:Array, param3:Array, param4:Array) : void
      {
         this.registerModuleSingtlon(param1);
         this.registerModuleProxy(param2);
         this.registerModuleCommand(param3);
         this.registerModuleView(param4);
      }
      
      public function unregisterModuleMVC(param1:Array, param2:Array, param3:Array, param4:Array) : void
      {
         this.unregisterModuleSingtlon(param1);
         this.unregisterModuleProxy(param2);
         this.unregisterModuleCommand(param3);
         this.unregisterModuleView(param4);
      }
      
      public function registerModuleCommand(param1:Array) : void
      {
         var _loc2_:Array = null;
         var _loc3_:String = null;
         var _loc4_:Class = null;
         var _loc5_:Class = null;
         for each(_loc2_ in param1)
         {
            _loc3_ = _loc2_[0];
            _loc4_ = _loc2_[1];
            _loc5_ = _loc2_[2];
            if(!commandMap.hasEventCommand(_loc3_,_loc4_,_loc5_))
            {
               commandMap.mapEvent(_loc3_,_loc4_,_loc5_);
            }
         }
      }
      
      public function unregisterModuleCommand(param1:Array) : void
      {
         var _loc2_:Array = null;
         var _loc3_:String = null;
         var _loc4_:Class = null;
         var _loc5_:Class = null;
         for each(_loc2_ in param1)
         {
            _loc3_ = _loc2_[0];
            _loc4_ = _loc2_[1];
            _loc5_ = _loc2_[2];
            commandMap.unmapEvent(_loc3_,_loc4_,_loc5_);
         }
      }
      
      public function registerModuleView(param1:Array) : void
      {
         var _loc2_:Array = null;
         for each(_loc2_ in param1)
         {
            mediatorMap.mapView(_loc2_[0],_loc2_[1]);
         }
      }
      
      public function unregisterModuleView(param1:Array) : void
      {
         var _loc2_:Array = null;
         for each(_loc2_ in param1)
         {
            mediatorMap.unmapView(_loc2_[0]);
         }
      }
      
      public function registerModuleSingtlon(param1:Array) : void
      {
         var _loc2_:Class = null;
         for each(_loc2_ in param1)
         {
            injector.mapSingleton(_loc2_);
         }
      }
      
      public function unregisterModuleSingtlon(param1:Array) : void
      {
         var _loc2_:Class = null;
         for each(_loc2_ in param1)
         {
            injector.unmap(_loc2_);
         }
      }
      
      public function registerModuleProxy(param1:Array) : void
      {
         var _loc2_:Array = null;
         var _loc3_:Class = null;
         var _loc4_:Array = null;
         var _loc5_:Actor = null;
         for each(_loc2_ in param1)
         {
            _loc3_ = _loc2_[0];
            _loc4_ = _loc2_[1];
            _loc5_ = new _loc3_();
            injector.injectInto(_loc5_);
            injector.mapValue(_loc3_,_loc5_);
            if(_loc5_ is BasicProxy)
            {
               (_loc5_ as BasicProxy).init(_loc4_);
            }
         }
      }
      
      public function unregisterModuleProxy(param1:Array) : void
      {
         var _loc2_:Array = null;
         var _loc3_:Class = null;
         var _loc4_:Actor = null;
         for each(_loc2_ in param1)
         {
            _loc3_ = _loc2_[0];
            if((_loc4_ = injector.getInstance(_loc3_)) is BasicProxy)
            {
               (_loc4_ as BasicProxy).Dispose();
            }
            injector.unmap(_loc3_);
         }
      }
   }
}
