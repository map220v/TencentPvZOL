package asgui.core
{
   import asgui.logger.AsguiLogger;
   import flash.display.Loader;
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import flash.events.HTTPStatusEvent;
   import flash.events.IOErrorEvent;
   import flash.events.ProgressEvent;
   import flash.events.SecurityErrorEvent;
   import flash.net.URLRequest;
   import flash.net.URLStream;
   import flash.utils.ByteArray;
   import flash.utils.getTimer;
   import flash.utils.setTimeout;
   
   public class ByteLoader extends EventDispatcher
   {
      
      public static const TIME_OUT:String = "TIME_OUT";
       
      
      private var stream:URLStream;
      
      private var externalLoader:Loader;
      
      private var reloadCounter:int = 5;
      
      private var numLoaded:Number;
      
      private var updatePercentArr:Array;
      
      public var data:ByteArray;
      
      public var url:String;
      
      public var ext:String;
      
      public var hasLoaded:Boolean;
      
      private var m_startTime:int;
      
      public var completeTime:int;
      
      public var loadTimeout:int;
      
      private var m_isTimeOut:Boolean = false;
      
      private var _byteLoaded:int;
      
      private var _byteTotal:int;
      
      private var m_lastLoadBytes:int = 0;
      
      private var m_blockTime:uint;
      
      public function ByteLoader(param1:String = "", param2:Array = null, param3:int = 30000)
      {
         super();
         this.loadTimeout = param3;
         if(param2 != null)
         {
            this.updatePercentArr = param2;
         }
         else
         {
            this.updatePercentArr = [];
         }
         if(param1 != null && param1 != "")
         {
            this.Load(param1);
         }
      }
      
      public function set startTime(param1:int) : void
      {
         this.m_startTime = param1;
         this.m_blockTime = param1;
         this.m_lastLoadBytes = 0;
         this.m_isTimeOut = false;
      }
      
      public function get startTime() : int
      {
         return this.m_startTime;
      }
      
      public function Load(param1:String, param2:Loader = null) : void
      {
         var _loc3_:String = null;
         if(param1 == null)
         {
            return;
         }
         this.startTime = getTimer();
         this.externalLoader = param2;
         this.url = param1;
         this.data = new ByteArray();
         if(param2)
         {
            param2.contentLoaderInfo.addEventListener(HTTPStatusEvent.HTTP_STATUS,this.HttpStatusHandler);
            param2.contentLoaderInfo.addEventListener(Event.COMPLETE,this.CompleteHandler);
            param2.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR,this.ErrorHandler);
            param2.contentLoaderInfo.addEventListener(ProgressEvent.PROGRESS,this.ProgressHandler);
            param2.contentLoaderInfo.addEventListener(SecurityErrorEvent.SECURITY_ERROR,this.SecurityErrorHandle);
            param2.load(new URLRequest(param1));
         }
         else
         {
            this.stream = new URLStream();
            this.stream.addEventListener(HTTPStatusEvent.HTTP_STATUS,this.HttpStatusHandler);
            this.stream.addEventListener(Event.COMPLETE,this.CompleteHandler);
            this.stream.addEventListener(IOErrorEvent.IO_ERROR,this.ErrorHandler);
            this.stream.addEventListener(ProgressEvent.PROGRESS,this.ProgressHandler);
            this.stream.addEventListener(SecurityErrorEvent.SECURITY_ERROR,this.SecurityErrorHandle);
            this.stream.load(new URLRequest(param1));
         }
         if(this.url)
         {
            _loc3_ = this.url.split("?")[0];
            this.ext = _loc3_.substr(_loc3_.lastIndexOf("."));
         }
      }
      
      public function LoadByteArray(param1:ByteArray) : void
      {
         this.data = param1;
         this.hasLoaded = true;
         setTimeout(this.SetComplete,0);
      }
      
      public function get isBmp() : Boolean
      {
         switch(this.ext)
         {
            case ".jpgz":
            case ".jpegz":
            case ".pngz":
            case ".jpg":
            case ".jpeg":
            case ".png":
               return true;
            default:
               return false;
         }
      }
      
      private function SetComplete() : void
      {
         this.completeTime = getTimer();
         if(this.url)
         {
            switch(this.ext)
            {
               case ".swfz":
               case ".jpgz":
               case ".jpegz":
               case ".pngz":
                  try
                  {
                     this.data.uncompress();
                  }
                  catch(err:Error)
                  {
                  }
            }
         }
         this.hasLoaded = true;
         this.dispatchEvent(new Event(Event.COMPLETE));
      }
      
      public function get isLoading() : Boolean
      {
         if(this.externalLoader)
         {
            return this.externalLoader.content == null;
         }
         if(this.stream == null)
         {
            return false;
         }
         return this.stream.connected;
      }
      
      public function CheckOutterLoaderUpdate() : Boolean
      {
         var _loc1_:Number = NaN;
         if(this.updatePercentArr != null && this.updatePercentArr.length > 0)
         {
            _loc1_ = this.updatePercentArr[0];
            if(_loc1_ > this.numLoaded)
            {
               this.updatePercentArr.shift();
               return true;
            }
         }
         return false;
      }
      
      private function Update() : void
      {
         if(this.stream)
         {
            this.stream.readBytes(this.data,this.data.length);
         }
         else if(this.externalLoader)
         {
            this.data = this.externalLoader.contentLoaderInfo.bytes;
         }
      }
      
      private function close() : void
      {
         if(this.isLoading && this.stream)
         {
            this.stream.close();
         }
         this.stream = null;
         this.externalLoader = null;
      }
      
      private function RemoveHandlers() : void
      {
         if(this.stream)
         {
            this.stream.removeEventListener(HTTPStatusEvent.HTTP_STATUS,this.HttpStatusHandler);
            this.stream.removeEventListener(Event.COMPLETE,this.CompleteHandler);
            this.stream.removeEventListener(IOErrorEvent.IO_ERROR,this.ErrorHandler);
            this.stream.removeEventListener(ProgressEvent.PROGRESS,this.ProgressHandler);
            this.stream.removeEventListener(SecurityErrorEvent.SECURITY_ERROR,this.SecurityErrorHandle);
         }
         if(this.externalLoader)
         {
            this.externalLoader.contentLoaderInfo.removeEventListener(HTTPStatusEvent.HTTP_STATUS,this.HttpStatusHandler);
            this.externalLoader.contentLoaderInfo.removeEventListener(Event.COMPLETE,this.CompleteHandler);
            this.externalLoader.contentLoaderInfo.removeEventListener(IOErrorEvent.IO_ERROR,this.ErrorHandler);
            this.externalLoader.contentLoaderInfo.removeEventListener(ProgressEvent.PROGRESS,this.ProgressHandler);
            this.externalLoader.contentLoaderInfo.removeEventListener(SecurityErrorEvent.SECURITY_ERROR,this.SecurityErrorHandle);
         }
      }
      
      private function HttpStatusHandler(param1:HTTPStatusEvent) : void
      {
      }
      
      private function ErrorHandler(param1:IOErrorEvent) : void
      {
         this.RemoveHandlers();
         if(this.reloadCounter > 0)
         {
            --this.reloadCounter;
            AsguiLogger.Warn(this,"IOErrorHandler Load fail, try to reload [url:" + this.url + ", reloadCounter:" + this.reloadCounter + "]");
            this.Load(this.url,this.externalLoader);
         }
         else
         {
            this.hasLoaded = true;
            this.close();
            AsguiLogger.Error(this,param1.text);
            this.dispatchEvent(param1.clone());
         }
      }
      
      private function SecurityErrorHandle(param1:SecurityErrorEvent) : void
      {
         this.RemoveHandlers();
         this.hasLoaded = true;
         this.close();
         AsguiLogger.Warn(this,"securityError Load fail, use normal load");
         this.dispatchEvent(param1.clone());
      }
      
      private function CompleteHandler(param1:Event) : void
      {
         this.RemoveHandlers();
         this.Update();
         this.close();
         this.SetComplete();
      }
      
      private function ProgressHandler(param1:ProgressEvent) : void
      {
         this._byteLoaded = param1.bytesLoaded;
         this._byteTotal = param1.bytesTotal;
      }
      
      public function UpdateByteLoaded() : void
      {
         if(this.stream)
         {
            if(this.stream.connected)
            {
               this._byteLoaded = this.stream.bytesAvailable;
            }
            else
            {
               this._byteLoaded = 0;
            }
         }
         else if(this.externalLoader)
         {
            this._byteLoaded = this.externalLoader.contentLoaderInfo.bytesLoaded;
         }
      }
      
      public function get byteLoaded() : int
      {
         return this._byteLoaded;
      }
      
      public function get byteTotal() : int
      {
         return this._byteTotal;
      }
      
      public function CheckLoaded() : void
      {
         var _loc1_:int = 0;
         var _loc2_:uint = 0;
         if(this.isLoading && this.loadTimeout > 0 && this.startTime > 0)
         {
            if(this.externalLoader)
            {
               _loc1_ = this.externalLoader.contentLoaderInfo.bytesLoaded;
            }
            else
            {
               _loc1_ = this.stream.bytesAvailable;
            }
            _loc2_ = getTimer();
            if(_loc1_ == this.m_lastLoadBytes)
            {
               if(this.m_blockTime + this.loadTimeout > _loc2_)
               {
                  if(this.m_isTimeOut == false)
                  {
                     this.m_isTimeOut = true;
                     this.dispatchEvent(new Event(TIME_OUT));
                  }
               }
            }
            else
            {
               this.m_blockTime = _loc2_;
               this.m_lastLoadBytes = _loc1_;
            }
         }
      }
   }
}
