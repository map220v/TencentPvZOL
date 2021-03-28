package org.robotlegs.extend.module
{
   import asgui.managers.ConfigModuleXmlInfo;
   import asgui.modules.ModuleLoader;
   import asgui.modules.ModuleLoaderManager;
   import asgui.resources.AssetManager;
   import com.qq.utils.UrlManager;
   import flash.display.Sprite;
   import flash.events.Event;
   
   public class RobotlegModuleLoaderManager extends ModuleLoaderManager
   {
       
      
      private var viewCloseToUnloadDict:Array;
      
      private var moduleLoaderHelpers:Array;
      
      public function RobotlegModuleLoaderManager()
      {
         this.viewCloseToUnloadDict = [];
         this.moduleLoaderHelpers = [];
         super();
      }
      
      public static function get impl() : RobotlegModuleLoaderManager
      {
         if(!(ModuleLoaderManager._impl is RobotlegModuleLoaderManager))
         {
            ModuleLoaderManager._impl = new RobotlegModuleLoaderManager();
         }
         return ModuleLoaderManager.impl as RobotlegModuleLoaderManager;
      }
      
      public function setModuleInitParam(param1:String, param2:Vector.<String> = null, param3:Vector.<int> = null, param4:Vector.<String> = null, param5:Sprite = null, param6:Object = null) : ModuleLoader
      {
         var _loc7_:int = 0;
         var _loc8_:RobotlegModuleLoaderHelper;
         (_loc8_ = new RobotlegModuleLoaderHelper(param1,param3,param5,param6)).setAddEventTypes(param2);
         this.moduleLoaderHelpers[param1] = _loc8_;
         if(param4)
         {
            while(_loc7_ < param4.length)
            {
               if(param4[_loc7_] && param4[_loc7_].length > 0)
               {
                  this.viewCloseToUnloadDict[param4[_loc7_]] = _loc8_;
               }
               _loc7_++;
            }
         }
         return _loc8_.loader;
      }
      
      public function setModuleInitParamByConfigModuleXmlInfos(param1:Vector.<ConfigModuleXmlInfo>, param2:Sprite = null, param3:Object = null) : void
      {
         var _loc4_:int = 0;
         var _loc6_:ConfigModuleXmlInfo = null;
         var _loc5_:int = param1.length;
         _loc4_ = 0;
         while(_loc4_ < _loc5_)
         {
            _loc6_ = param1[_loc4_];
            RobotlegModuleLoaderManager.impl.setModuleInitParam(UrlManager.getUrl(UrlManager.Url_Module,_loc6_.name),_loc6_.cmdListenInit,_loc6_.resourceOrder,_loc6_.viewCloseToUnload);
            _loc4_++;
         }
      }
      
      function dispatchChange() : void
      {
         dispatchEvent(new Event(Event.CHANGE));
      }
      
      public function getModuleHelper(param1:String) : RobotlegModuleLoaderHelper
      {
         if(this.moduleLoaderHelpers[param1] != null)
         {
            return this.moduleLoaderHelpers[param1];
         }
         return null;
      }
      
      public function getModuleHelperInitedList() : Vector.<RobotlegModuleLoaderHelper>
      {
         var _loc2_:RobotlegModuleLoaderHelper = null;
         var _loc1_:Vector.<RobotlegModuleLoaderHelper> = new Vector.<RobotlegModuleLoaderHelper>();
         for each(_loc2_ in this.moduleLoaderHelpers)
         {
            if(_loc2_.$hasInit)
            {
               _loc1_.push(_loc2_);
            }
         }
         return _loc1_;
      }
      
      public function checkUnloadUnusedAsset(param1:Vector.<int>) : void
      {
         var _loc3_:int = 0;
         var _loc4_:RobotlegModuleLoaderHelper = null;
         var _loc2_:Vector.<int> = param1.concat();
         for each(_loc4_ in this.moduleLoaderHelpers)
         {
            if(_loc4_.$hasInit)
            {
               _loc3_ = 0;
               while(_loc3_ < _loc4_.assetsManagerCheckLoads.length)
               {
                  if(_loc2_.indexOf(_loc4_.assetsManagerCheckLoads[_loc3_]) != -1)
                  {
                     _loc2_.splice(_loc2_.indexOf(_loc4_.assetsManagerCheckLoads[_loc3_]),1);
                  }
                  _loc3_++;
               }
            }
         }
         if(_loc2_.length > 0)
         {
            AssetManager.instance.CheckUnload(_loc2_);
         }
      }
      
      public function doModuleInit(param1:String, param2:Vector.<int> = null, param3:Sprite = null, param4:Object = null) : ModuleLoader
      {
         if(this.moduleLoaderHelpers[param1] == null)
         {
            this.moduleLoaderHelpers[param1] = new RobotlegModuleLoaderHelper(param1);
         }
         var _loc5_:RobotlegModuleLoaderHelper;
         if(!(_loc5_ = this.moduleLoaderHelpers[param1]).$hasInit)
         {
            _loc5_.doModuleInit(param2,param3,param4);
         }
         else
         {
            _loc5_.setData(param4);
         }
         return _loc5_.loader;
      }
      
      public function doModuleInitByType(param1:String, param2:Vector.<int> = null, param3:Sprite = null, param4:Object = null) : ModuleLoader
      {
         var _loc5_:String = UrlManager.getUrl(UrlManager.Url_Module,param1 + ".swf");
         return this.doModuleInit(_loc5_,param2,param3,param4);
      }
      
      public function unloadModuleInit(param1:String) : ModuleLoader
      {
         var _loc2_:RobotlegModuleLoaderHelper = this.moduleLoaderHelpers[param1];
         _loc2_.unloadModule();
         this.checkUnloadUnusedAsset(_loc2_.assetsManagerCheckLoads);
         return _loc2_.loader;
      }
      
      public function unloadModuleInitByType(param1:String) : ModuleLoader
      {
         var _loc2_:String = UrlManager.getUrl(UrlManager.Url_Module,param1 + ".swf");
         return this.unloadModuleInit(_loc2_);
      }
      
      public function getRobotlegModuleLoaderHelperByUnloadViewName(param1:String) : RobotlegModuleLoaderHelper
      {
         return this.viewCloseToUnloadDict[param1];
      }
   }
}
