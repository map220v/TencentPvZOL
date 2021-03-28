package com.qq.display
{
   import flash.display.Loader;
   import flash.events.Event;
   import flash.events.IOErrorEvent;
   import flash.events.ProgressEvent;
   import flash.net.URLRequest;
   
   public class DLoader extends Loader
   {
       
      
      private var _onCompleteFunc:Function;
      
      private var _onProgressFunc:Function;
      
      private var _onErrorFunc:Function;
      
      public var url:String;
      
      public function DLoader(param1:Function = null, param2:Function = null, param3:Function = null)
      {
         super();
         this._onCompleteFunc = param1;
         this._onProgressFunc = param3;
         this._onErrorFunc = param2;
         contentLoaderInfo.addEventListener(ProgressEvent.PROGRESS,this.onProgress);
         contentLoaderInfo.addEventListener(Event.COMPLETE,this.onComplete);
         contentLoaderInfo.addEventListener(IOErrorEvent.DISK_ERROR,this.onError);
         contentLoaderInfo.addEventListener(IOErrorEvent.NETWORK_ERROR,this.onError);
         contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR,this.onError);
      }
      
      public function loadUrl(param1:String) : void
      {
         this.url = param1;
         load(new URLRequest(param1),null);
      }
      
      private function onComplete(param1:Event) : void
      {
         if(this._onCompleteFunc != null)
         {
            this._onCompleteFunc(param1);
         }
      }
      
      private function onError(param1:Event) : void
      {
         if(this._onErrorFunc != null)
         {
            this._onErrorFunc(param1);
         }
      }
      
      private function onProgress(param1:ProgressEvent) : void
      {
         if(this._onProgressFunc != null)
         {
            this._onProgressFunc(param1);
         }
      }
      
      public function dispose() : void
      {
         this._onCompleteFunc = null;
         this._onErrorFunc = null;
         contentLoaderInfo.removeEventListener(ProgressEvent.PROGRESS,this.onProgress);
         contentLoaderInfo.removeEventListener(Event.COMPLETE,this.onComplete);
         contentLoaderInfo.removeEventListener(IOErrorEvent.DISK_ERROR,this.onError);
         contentLoaderInfo.removeEventListener(IOErrorEvent.NETWORK_ERROR,this.onError);
         this.unload();
      }
   }
}
