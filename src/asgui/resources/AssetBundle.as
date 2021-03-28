package asgui.resources
{
   import asgui.logger.AsguiLogger;
   import asgui.managers.SystemManager;
   import flash.display.DisplayObjectContainer;
   import flash.display.LoaderInfo;
   import flash.system.ApplicationDomain;
   
   class AssetBundle implements IAssetBundle
   {
       
      
      private var contents:Array;
      
      private var resources:Array;
      
      function AssetBundle()
      {
         this.contents = [];
         this.resources = [];
         super();
      }
      
      public function get bundleName() : String
      {
         return null;
      }
      
      public function AddResource(param1:String, param2:Class) : void
      {
         this.resources[param1] = param2;
      }
      
      public function GetContent(param1:String) : Object
      {
         var _loc2_:int = 0;
         var _loc3_:LoaderInfo = null;
         var _loc5_:ApplicationDomain = null;
         var _loc6_:String = null;
         if(this.resources[param1])
         {
            return this.resources[param1];
         }
         if(SystemManager.instance.hasOwnProperty(param1))
         {
            return SystemManager.instance[param1];
         }
         if((_loc5_ = SystemManager.instance.loaderInfo.applicationDomain) && _loc5_.hasDefinition(param1))
         {
            return _loc5_.getDefinition(param1);
         }
         var _loc4_:int = this.contents.length;
         _loc2_ = 0;
         while(_loc2_ < _loc4_)
         {
            _loc6_ = this.contents[_loc2_][1];
            _loc3_ = this.contents[_loc2_][0];
            if(_loc3_.content)
            {
               if(_loc3_.content.hasOwnProperty(param1))
               {
                  return _loc3_.content[param1];
               }
               if(_loc3_.applicationDomain.hasDefinition(param1))
               {
                  return _loc3_.applicationDomain.getDefinition(param1);
               }
            }
            _loc2_++;
         }
         AsguiLogger.Warn(this,"Doesn\'t have resource : " + param1);
         return null;
      }
      
      public function AddContent(param1:LoaderInfo, param2:String) : void
      {
         var _loc3_:DisplayObjectContainer = null;
         if(param1.loader.content is DisplayObjectContainer)
         {
            _loc3_ = param1.loader.content as DisplayObjectContainer;
            while(_loc3_.numChildren > 0)
            {
               _loc3_.removeChildAt(0);
            }
         }
         this.contents.push([param1,param2]);
      }
      
      public function RemoveContent(param1:String) : void
      {
         var _loc2_:int = 0;
         var _loc3_:LoaderInfo = null;
         var _loc5_:String = null;
         var _loc4_:int = this.contents.length;
         _loc2_ = 0;
         while(_loc2_ < _loc4_)
         {
            _loc5_ = this.contents[_loc2_][1];
            _loc3_ = this.contents[_loc2_][0];
            if(_loc5_ == param1)
            {
               if(_loc3_.loader)
               {
                  _loc3_.loader.unload();
               }
               this.contents.splice(_loc2_,1);
               break;
            }
            _loc2_++;
         }
      }
   }
}
