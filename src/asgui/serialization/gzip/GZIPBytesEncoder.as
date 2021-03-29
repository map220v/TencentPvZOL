package asgui.serialization.gzip
{
   import flash.errors.IllegalOperationError;
   import flash.system.Capabilities;
   import flash.utils.ByteArray;
   import flash.utils.Endian;
   
   public class GZIPBytesEncoder
   {
       
      
      public function GZIPBytesEncoder()
      {
         super();
      }
      
      public function compressToByteArray(param1:ByteArray, param2:Date = null) : ByteArray
      {
         var _loc12_:uint = 0;
         if(param1 == null)
         {
            throw new ArgumentError("src can\'t be null.");
         }
         var _loc3_:uint = param1.position;
         var _loc4_:ByteArray;
         (_loc4_ = new ByteArray()).writeBytes(param1);
         var _loc5_:ByteArray;
         (_loc5_ = new ByteArray()).endian = Endian.LITTLE_ENDIAN;
         var _loc6_:uint = 31;
         _loc5_.writeByte(_loc6_);
         var _loc7_:uint = 139;
         _loc5_.writeByte(_loc7_);
         var _loc8_:uint = 8;
         _loc5_.writeByte(_loc8_);
         var _loc9_:int = parseInt("00000000",2);
         _loc5_.writeByte(_loc9_);
         var _loc10_:uint = param2 == null ? uint(0) : uint(param2.time);
         _loc5_.writeUnsignedInt(_loc10_);
         var _loc11_:uint = parseInt("00000100",2);
         _loc5_.writeByte(_loc11_);
         if(Capabilities.os.indexOf("Windows") >= 0)
         {
            _loc12_ = 11;
         }
         else if(Capabilities.os.indexOf("Mac OS") >= 0)
         {
            _loc12_ = 7;
         }
         else
         {
            _loc12_ = 3;
         }
         _loc5_.writeByte(_loc12_);
         var _loc13_:CRC32Generator;
         var _loc14_:uint = (_loc13_ = new CRC32Generator()).generateCRC32(_loc4_);
         var _loc15_:uint = _loc4_.length % Math.pow(2,32);
         _loc4_.deflate();
         _loc5_.writeBytes(_loc4_,0,_loc4_.length);
         _loc5_.writeUnsignedInt(_loc14_);
         _loc5_.writeUnsignedInt(_loc15_);
         return _loc5_;
      }
      
      public function uncompressToByteArray(param1:ByteArray) : ByteArray
      {
         var gzipData:GZIPFile = null;
         var src:ByteArray = param1;
         gzipData = this.parseGZIPData(src);
         var data:ByteArray = gzipData.getCompressedData();
         try
         {
            data.inflate();
         }
         catch(error:Error)
         {
            throw new IllegalOperationError("The specified source is not a GZIP file format file or data.");
         }
         return data;
      }
      
      public function parseGZIPData(param1:ByteArray, param2:String = "") : GZIPFile
      {
         var _loc17_:String = null;
         var _loc22_:String = null;
         var _loc23_:ByteArray = null;
         var _loc24_:ByteArray = null;
         var _loc25_:int = 0;
         if(param1 == null)
         {
            throw new ArgumentError("The srcBytes ByteArray can\'t be null.");
         }
         param1.endian = Endian.LITTLE_ENDIAN;
         var _loc3_:uint = param1.readUnsignedByte();
         if(_loc3_ != 31)
         {
            throw new IllegalOperationError("The specified data is not in GZIP file format structure.");
         }
         var _loc4_:uint;
         if((_loc4_ = param1.readUnsignedByte()) != 139)
         {
            throw new IllegalOperationError("The specified data is not in GZIP file format structure.");
         }
         var _loc5_:uint;
         if((_loc5_ = param1.readUnsignedByte()) != 8)
         {
            throw new IllegalOperationError("The specified data is not in GZIP file format structure.");
         }
         var _loc6_:int;
         var _loc7_:* = ((_loc6_ = param1.readByte()) >> 7 & 1) == 1;
         var _loc8_:* = (_loc6_ >> 6 & 1) == 1;
         var _loc9_:* = (_loc6_ >> 5 & 1) == 1;
         var _loc10_:* = (_loc6_ >> 4 & 1) == 1;
         var _loc11_:* = (_loc6_ >> 3 & 1) == 1;
         var _loc12_:Boolean = false;
         _loc12_ = (_loc6_ >> 2 & 1) == 1 ? true : Boolean(_loc12_);
         _loc12_ = (_loc6_ >> 1 & 1) == 1 ? true : Boolean(_loc12_);
         if(_loc12_ = (_loc6_ & 1) == 1 ? true : Boolean(_loc12_))
         {
            throw new IllegalOperationError("The specified data is not in GZIP file format structure.");
         }
         var _loc13_:uint = param1.readUnsignedInt();
         var _loc14_:uint = param1.readUnsignedByte();
         var _loc15_:uint = param1.readUnsignedByte();
         if(_loc9_)
         {
            _loc22_ = param1.readUTF();
         }
         var _loc16_:String = null;
         if(_loc10_)
         {
            _loc23_ = new ByteArray();
            while(param1.readUnsignedByte() != 0)
            {
               --param1.position;
               _loc23_.writeByte(param1.readByte());
            }
            _loc23_.position = 0;
            _loc16_ = _loc23_.readUTFBytes(_loc23_.length);
         }
         if(_loc11_)
         {
            _loc24_ = new ByteArray();
            while(param1.readUnsignedByte() != 0)
            {
               --param1.position;
               _loc24_.writeByte(param1.readByte());
            }
            _loc24_.position = 0;
            _loc17_ = _loc24_.readUTFBytes(_loc24_.length);
         }
         if(_loc8_)
         {
            _loc25_ = param1.readUnsignedShort();
         }
         var _loc18_:int = param1.length - param1.position - 8;
         var _loc19_:ByteArray = new ByteArray();
         param1.readBytes(_loc19_,0,_loc18_);
         var _loc20_:uint = param1.readUnsignedInt();
         var _loc21_:uint = param1.readUnsignedInt();
         return new GZIPFile(_loc19_,_loc21_,new Date(_loc13_),param2,_loc16_,_loc17_);
      }
   }
}
