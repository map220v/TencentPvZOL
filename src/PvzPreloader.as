package
{
   import asgui.core.ByteLoader;
   import com.qq.ConstGlobal;
   import flash.display.Sprite;
   import flash.display.Stage;
   import flash.events.ErrorEvent;
   import flash.events.Event;
   import flash.events.ProgressEvent;
   import flash.external.ExternalInterface;
   import flash.utils.setTimeout;
   
   public class PvzPreloader extends Sprite
   {
       
      
      private var _progressFunc:Function;
      
      private var _initializeFunc:Function;
      
      private var _stage:Stage;
      
      public function PvzPreloader(param1:Stage, param2:Function, param3:Function)
      {
         super();
         this._stage = param1;
         this._progressFunc = param2;
         this._initializeFunc = param3;
         this.initHanlder(null);
      }
      
      protected function initHanlder(param1:Event) : void
      {
         this.preInit();
      }
      
      protected function preInit_errorHandler(param1:ErrorEvent) : void
      {
      }
      
      protected function getConfigPath() : String
      {
         var _loc1_:String = ExternalVars.CONFIG_PATH;
         return _loc1_ + ("?v=" + new Date().getTime());
      }
      
      protected function preInit() : void
      {
         var _loc1_:ByteLoader = new ByteLoader(this.getConfigPath());
         _loc1_.addEventListener(Event.COMPLETE,this.initConfigHandler);
      }
      
      private function initConfigHandler(param1:Event) : void
      {
         var _loc6_:int = 0;
         var _loc2_:ByteLoader = param1.currentTarget as ByteLoader;
         _loc2_.removeEventListener(Event.COMPLETE,this.initConfigHandler);
         var _loc3_:XML = XML(_loc2_.data);
         var _loc4_:XMLList = _loc3_[0]["ProjectSettings"]["Add"];
         var _loc5_:Array = [];
         while(_loc6_ < _loc4_.length())
         {
            if(_loc4_[_loc6_].@key == "socketURL")
            {
               _loc5_.push(String(_loc4_[_loc6_].@value));
            }
            _loc6_++;
         }
         ConstGlobal.initSocket = _loc5_;
         setTimeout(this._initializeFunc,25);
      }
      
      protected function preInit_progressHandler(param1:ProgressEvent) : void
      {
         if(isNaN(param1.bytesLoaded / param1.bytesTotal))
         {
         }
      }
      
      protected function updateProgress(param1:uint) : void
      {
      }
      
      public function get href() : String
      {
         var _loc1_:String = "";
         if(ExternalInterface.available)
         {
            _loc1_ = ExternalInterface.call("function getHref(){return document.location.href;}");
         }
         return _loc1_;
      }
   }
}
