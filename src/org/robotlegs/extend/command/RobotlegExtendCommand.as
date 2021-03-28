package org.robotlegs.extend.command
{
   import flash.net.getClassByAlias;
   import flash.utils.getQualifiedClassName;
   import org.robotlegs.extend.module.RobotlegModuleLoaderHelper;
   import org.robotlegs.extend.module.RobotlegModuleLoaderManager;
   
   public class RobotlegExtendCommand extends StrongRobotlegCommand
   {
       
      
      public function RobotlegExtendCommand()
      {
         super();
      }
      
      public function checkViewCloseToUnload(param1:String) : void
      {
         var _loc2_:RobotlegModuleLoaderHelper = RobotlegModuleLoaderManager.impl.getRobotlegModuleLoaderHelperByUnloadViewName(param1);
         if(_loc2_)
         {
            _loc2_.unloadModule();
         }
      }
      
      public function registerMapView(param1:*, param2:Class, param3:* = null, param4:Boolean = false, param5:Boolean = false) : void
      {
         if(!mediatorMap.hasMapping(param1))
         {
            mediatorMap.mapView(param1,param2,param3,param4,param5);
         }
      }
      
      public function createMediator(param1:Object) : void
      {
         if(!mediatorMap.hasMediatorForView(param1))
         {
            mediatorMap.createMediator(param1);
         }
      }
      
      public function registerAndCreateMapView(param1:*, param2:Class, param3:Object) : void
      {
         this.registerMapView(param1,param2);
         this.createMediator(param3);
      }
      
      public function registerAndCreateMediator(param1:Object, param2:Class) : void
      {
         this.registerMapView(getClassByAlias(getQualifiedClassName(param1)),param2);
         this.createMediator(param1);
      }
      
      public function removeMediatorByView(param1:Object, param2:String = null) : void
      {
         mediatorMap.removeMediatorByView(param1);
         if(param2)
         {
            this.checkViewCloseToUnload(param2);
         }
      }
   }
}
