package asgui.blit.data
{
   import asgui.core.ByteLoader;
   import asgui.managers.LoaderManager;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.DisplayObject;
   import flash.display.Loader;
   import flash.display.LoaderInfo;
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import flash.events.IEventDispatcher;
   import flash.events.IOErrorEvent;
   
   class BlitDataSpritesheetInfo extends EventDispatcher
   {
       
      
      protected var byteLoader:ByteLoader;
      
      public var frameRects:Array;
      
      public var imagePath:String;
      
      public var bitmapData:BitmapData;
      
      protected var url:String;
      
      function BlitDataSpritesheetInfo(param1:IEventDispatcher = null)
      {
         this.frameRects = [];
         super(param1);
      }
      
      public function LoadByUrl(param1:String) : void
      {
         this.url = param1;
         this.byteLoader = LoaderManager.GetByteLoader(param1);
         this.byteLoader.addEventListener(Event.COMPLETE,this.CompleteHandler);
         this.byteLoader.addEventListener(IOErrorEvent.IO_ERROR,this.IoErrorHandler);
      }
      
      public function LoadXml(param1:XML) : void
      {
      }
      
      public function LoadImgByUrl(param1:String) : void
      {
         var _loc2_:Loader = LoaderManager.GetLoader(param1);
         _loc2_.contentLoaderInfo.addEventListener(Event.COMPLETE,this.CompleteHandler);
         _loc2_.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR,this.IoErrorHandler);
      }
      
      protected function LoadImg(param1:DisplayObject) : void
      {
         if(param1 is Bitmap)
         {
            this.bitmapData = (param1 as Bitmap).bitmapData;
         }
         this.dispatchEvent(new Event(Event.COMPLETE));
      }
      
      private function CompleteHandler(param1:Event) : void
      {
         (param1.currentTarget as IEventDispatcher).removeEventListener(Event.COMPLETE,this.CompleteHandler);
         (param1.currentTarget as IEventDispatcher).removeEventListener(IOErrorEvent.IO_ERROR,this.IoErrorHandler);
         if(param1.currentTarget is ByteLoader)
         {
            this.LoadXml(XML(this.byteLoader.data));
         }
         else if(param1.currentTarget is LoaderInfo)
         {
            this.LoadImg((param1.currentTarget as LoaderInfo).content);
         }
      }
      
      private function IoErrorHandler(param1:IOErrorEvent) : void
      {
         (param1.currentTarget as IEventDispatcher).removeEventListener(Event.COMPLETE,this.CompleteHandler);
         (param1.currentTarget as IEventDispatcher).removeEventListener(IOErrorEvent.IO_ERROR,this.IoErrorHandler);
         this.dispatchEvent(param1.clone());
      }
   }
}
