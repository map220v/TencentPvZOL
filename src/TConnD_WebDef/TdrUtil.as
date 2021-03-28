package TConnD_WebDef
{
   import flash.utils.ByteArray;
   
   public class TdrUtil
   {
       
      
      public function TdrUtil()
      {
         super();
      }
      
      public static function directWriteInt(param1:ByteArray, param2:uint, param3:int) : void
      {
         var _loc4_:uint = param1.position;
         param1.position = param2;
         param1.writeInt(param3);
         param1.position = _loc4_;
      }
      
      public static function directWriteUint(param1:ByteArray, param2:uint, param3:uint) : void
      {
         var _loc4_:uint = param1.position;
         param1.position = param2;
         param1.writeUnsignedInt(param3);
         param1.position = _loc4_;
      }
      
      public static function directWriteSmallint(param1:ByteArray, param2:uint, param3:int) : void
      {
         var _loc4_:uint = param1.position;
         param1.position = param2;
         param1.writeShort(param3);
         param1.position = _loc4_;
      }
      
      public static function directWriteSmalluint(param1:ByteArray, param2:uint, param3:int) : void
      {
         var _loc4_:uint = param1.position;
         param1.position = param2;
         param1.writeShort(param3);
         param1.position = _loc4_;
      }
      
      public static function directWriteTinyint(param1:ByteArray, param2:uint, param3:uint) : void
      {
         var _loc4_:uint = param1.position;
         param1.position = param2;
         param1.writeByte(param3);
         param1.position = _loc4_;
      }
      
      public static function directWriteTinyuint(param1:ByteArray, param2:uint, param3:uint) : void
      {
         var _loc4_:uint = param1.position;
         param1.position = param2;
         param1.writeByte(param3);
         param1.position = _loc4_;
      }
      
      public static function directReadInt(param1:ByteArray, param2:uint) : int
      {
         var _loc3_:int = 0;
         var _loc4_:uint = param1.position;
         param1.position = param2;
         _loc3_ = param1.readInt();
         param1.position = _loc4_;
         return _loc3_;
      }
      
      public static function directReadUint(param1:ByteArray, param2:uint) : uint
      {
         var _loc3_:uint = 0;
         var _loc4_:uint = param1.position;
         param1.position = param2;
         _loc3_ = param1.readUnsignedInt();
         param1.position = _loc4_;
         return _loc3_;
      }
      
      public static function directReadSmallint(param1:ByteArray, param2:uint) : int
      {
         var _loc3_:int = 0;
         var _loc4_:uint = param1.position;
         param1.position = param2;
         _loc3_ = param1.readShort();
         param1.position = _loc4_;
         return _loc3_;
      }
      
      public static function directReadSmalluint(param1:ByteArray, param2:uint) : int
      {
         var _loc3_:int = 0;
         var _loc4_:uint = param1.position;
         param1.position = param2;
         _loc3_ = param1.readUnsignedShort();
         param1.position = _loc4_;
         return _loc3_;
      }
      
      public static function directReadTinyint(param1:ByteArray, param2:uint) : int
      {
         var _loc3_:int = 0;
         var _loc4_:uint = param1.position;
         param1.position = param2;
         _loc3_ = param1.readByte();
         param1.position = _loc4_;
         return _loc3_;
      }
      
      public static function directReadTinyuint(param1:ByteArray, param2:uint) : int
      {
         var _loc3_:int = 0;
         var _loc4_:uint = param1.position;
         param1.position = param2;
         _loc3_ = param1.readUnsignedByte();
         param1.position = _loc4_;
         return _loc3_;
      }
   }
}
