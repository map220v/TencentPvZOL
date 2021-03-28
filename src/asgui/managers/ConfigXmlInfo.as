package asgui.managers
{
   import flash.utils.ByteArray;
   
   class ConfigXmlInfo
   {
       
      
      public var name:String;
      
      private var data:ByteArray;
      
      public var decompressedSec:int;
      
      private var _xml:XML;
      
      function ConfigXmlInfo(param1:String, param2:Object, param3:int = -1)
      {
         super();
         this.name = param1;
         this.decompressedSec = param3;
         if(param2 is XML)
         {
            this._xml = param2 as XML;
         }
         else if(param2 is ByteArray)
         {
            this.data = param2 as ByteArray;
         }
      }
      
      public function get xml() : XML
      {
         if(!this._xml && this.data)
         {
            this._xml = XML(this.data);
         }
         return this._xml;
      }
   }
}
