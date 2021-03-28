package asgui.strings
{
   import asgui.core.ByteLoader;
   import asgui.managers.LoaderManager;
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import flash.events.IEventDispatcher;
   import flash.utils.Dictionary;
   
   public class StringPool extends EventDispatcher
   {
       
      
      private var dict:Dictionary;
      
      public var byteLoader:ByteLoader;
      
      private var list:Array;
      
      public function StringPool()
      {
         super();
      }
      
      public function T(param1:int) : String
      {
         return this.list[param1];
      }
      
      public function $(param1:String) : String
      {
         if(this.dict.hasOwnProperty(param1))
         {
            return this.dict[param1];
         }
         return param1;
      }
      
      public function LoadDictionary(param1:Dictionary, param2:Array) : void
      {
         this.dict = param1;
         this.list = param2;
         this.dispatchEvent(new Event(Event.COMPLETE));
      }
      
      public function LoadDictByUrl(param1:String) : void
      {
         var _loc2_:ByteLoader = LoaderManager.GetByteLoader(param1);
         this.byteLoader = _loc2_;
         _loc2_.addEventListener(Event.COMPLETE,this.DictLoadCompleteHandler);
      }
      
      public function LoadDictByXml(param1:XML) : void
      {
         var _loc3_:int = 0;
         var _loc7_:String = null;
         var _loc8_:String = null;
         var _loc2_:XMLList = param1["main"]["entry"];
         var _loc4_:int = _loc2_.length();
         var _loc5_:Dictionary = new Dictionary();
         var _loc6_:Array = [];
         _loc3_ = 0;
         while(_loc3_ < _loc4_)
         {
            _loc7_ = String(_loc2_[_loc3_].@value);
            while(_loc7_.indexOf("&quot;") != -1)
            {
               _loc7_ = _loc7_.replace("&quot;","\"");
            }
            _loc8_ = String(_loc2_[_loc3_].@name);
            _loc5_[_loc8_] = _loc7_;
            _loc6_[int(_loc2_[_loc3_].@id)] = _loc7_;
            _loc3_++;
         }
         this.LoadDictionary(_loc5_,_loc6_);
      }
      
      private function DictLoadCompleteHandler(param1:Event) : void
      {
         (param1.currentTarget as IEventDispatcher).removeEventListener(Event.COMPLETE,this.DictLoadCompleteHandler);
         var _loc2_:ByteLoader = param1.currentTarget as ByteLoader;
         var _loc3_:XML = XML(_loc2_.data);
         this.LoadDictByXml(_loc3_);
      }
   }
}
