package asgui.managers
{
   public class LoaderManagerStatus
   {
       
      
      public var percent:int;
      
      private var _curLoadingResName:String;
      
      private var _curLoadingResPercent:int;
      
      private var _curbyteLoaded:int;
      
      private var _curbyteTotal:int;
      
      public var queue:Array;
      
      private var _url:String;
      
      private var _byteLoaded:int;
      
      private var _byteTotal:int;
      
      private var _queueIndex:int;
      
      private var _queueLength:int;
      
      private var queueInLoadingLength:int;
      
      public function LoaderManagerStatus()
      {
         super();
      }
      
      public function Dispose() : void
      {
      }
      
      function LoadManager(param1:int, param2:LoaderCollection, param3:Array, param4:int, param5:int) : void
      {
         var _loc6_:LoaderCollection = null;
         var _loc7_:String = null;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         this.queueInLoadingLength = param5;
         this._queueIndex = param1;
         this._queueLength = param3.length;
         this.queue = param3;
         this.percent = param4;
         this._curLoadingResName = null;
         for each(_loc6_ in param3)
         {
            _loc7_ = _loc6_.url;
            _loc8_ = _loc6_.byteLoader.byteLoaded;
            _loc9_ = Math.max(_loc6_.byteLoader.byteTotal,_loc6_.getGuessSize());
            if(_loc8_ < _loc9_)
            {
               if(this._curLoadingResName == null)
               {
                  this._curLoadingResName = _loc6_.url;
                  this._curbyteLoaded = _loc8_;
                  this._curbyteTotal = _loc9_;
                  this._curLoadingResPercent = int(100 * (_loc8_ / _loc9_));
                  break;
               }
            }
         }
         if(param2)
         {
            this._url = param2.url;
            this._byteLoaded = param2.byteLoader.byteLoaded;
            this._byteTotal = param2.byteLoader.byteTotal;
         }
      }
      
      public function getPercentDesc() : String
      {
         var _loc1_:String = null;
         if(this._curLoadingResName != null)
         {
            _loc1_ = this._curLoadingResName.replace(/\_\w+\./,".");
            return _loc1_.concat(" ",this._curbyteLoaded," / ",this._curbyteTotal);
         }
         return "";
      }
      
      public function get isOpening() : Boolean
      {
         return this.queueInLoadingLength != 0;
      }
      
      public function get url() : String
      {
         return this._url;
      }
      
      public function get byteLoaded() : int
      {
         return this._byteLoaded;
      }
      
      public function get byteTotal() : int
      {
         return this._byteTotal;
      }
      
      public function get queueIndex() : int
      {
         return this._queueIndex;
      }
      
      public function get queueLength() : int
      {
         return this._queueLength;
      }
   }
}
