package asgui.modules
{
   import asgui.core.ByteLoader;
   import asgui.core.ILoadingWatchable;
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import flash.events.IEventDispatcher;
   import flash.events.ProgressEvent;
   
   public class ModuleLoaderManager extends EventDispatcher implements ILoadingWatchable
   {
      
      public static var _impl:ModuleLoaderManager;
       
      
      public var moduleOrderZeroUrls:Array;
      
      public var modules:Array;
      
      private var _workingLoader:ByteLoader;
      
      public function ModuleLoaderManager()
      {
         this.moduleOrderZeroUrls = [];
         this.modules = [];
         super();
      }
      
      public static function get impl() : ModuleLoaderManager
      {
         if(!_impl)
         {
            _impl = new ModuleLoaderManager();
         }
         return _impl;
      }
      
      public static function CreateModuleLoader(param1:String) : ModuleLoader
      {
         return impl.CreateModuleLoader(param1);
      }
      
      public function CreateModuleLoader(param1:String) : ModuleLoader
      {
         var _loc2_:ModuleLoader = this.GetModuleLoaderByUrl(param1);
         if(_loc2_)
         {
            return _loc2_;
         }
         _loc2_ = new ModuleLoader();
         this._workingLoader = _loc2_.byteLoader;
         _loc2_.addEventListener(ModuleEvent.READY,this.ModuleLoaderCompleteHandler,false,0,true);
         _loc2_.addEventListener(ProgressEvent.PROGRESS,this.ModuleLoadProgressHandler,false,0,true);
         _loc2_.url = param1;
         return _loc2_;
      }
      
      public function GetModuleLoaderByUrl(param1:String) : ModuleLoader
      {
         var _loc2_:int = 0;
         var _loc3_:ModuleLoader = null;
         _loc2_ = 0;
         while(_loc2_ < this.modules.length)
         {
            _loc3_ = this.modules[_loc2_] as ModuleLoader;
            if(_loc3_.url == param1)
            {
               return _loc3_;
            }
            _loc2_++;
         }
         return null;
      }
      
      public function LoadOrderZeros() : void
      {
         this.CheckLoad();
      }
      
      private function CheckLoad() : void
      {
         if(this.moduleOrderZeroUrls.length > 0)
         {
            this.CreateModuleLoader(this.moduleOrderZeroUrls.pop());
         }
         else
         {
            this.moduleOrderZeroUrls = [];
            this.dispatchEvent(new Event(Event.COMPLETE));
         }
      }
      
      public function get workingLoader() : *
      {
         return this._workingLoader;
      }
      
      public function get leftLoaders() : int
      {
         return this.moduleOrderZeroUrls.length;
      }
      
      private function ModuleLoaderCompleteHandler(param1:ModuleEvent) : void
      {
         this._workingLoader = null;
         (param1.currentTarget as IEventDispatcher).removeEventListener(ModuleEvent.READY,this.ModuleLoaderCompleteHandler);
         (param1.currentTarget as IEventDispatcher).removeEventListener(ProgressEvent.PROGRESS,this.ModuleLoadProgressHandler);
         this.CheckLoad();
      }
      
      private function ModuleLoadProgressHandler(param1:ProgressEvent) : void
      {
      }
   }
}
