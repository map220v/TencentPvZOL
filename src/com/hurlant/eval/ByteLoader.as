package com.hurlant.eval
{
   import flash.display.Loader;
   import flash.system.ApplicationDomain;
   import flash.system.LoaderContext;
   import flash.utils.ByteArray;
   import flash.utils.Endian;
   
   public class ByteLoader
   {
      
      private static var abc_header:Array = [63,18];
      
      private static var swf_start:Array = [70,87,83,9,255,255,255,255,120,0,3,232,0,0,11,184,0,0,12,1,0,68,17,8,0,0,0];
      
      private static var swf_end:Array = [64,0];
       
      
      public function ByteLoader()
      {
         super();
      }
      
      public static function getType(param1:ByteArray) : int
      {
         param1.endian = "littleEndian";
         var _loc2_:uint = param1.readUnsignedInt();
         switch(_loc2_)
         {
            case 46 << 16 | 14:
            case 46 << 16 | 15:
            case 46 << 16 | 16:
               return 2;
            case 67 | 87 << 8 | 83 << 16 | 9 << 24:
            case 67 | 87 << 8 | 83 << 16 | 8 << 24:
            case 67 | 87 << 8 | 83 << 16 | 7 << 24:
            case 67 | 87 << 8 | 83 << 16 | 6 << 24:
               return 5;
            case 70 | 87 << 8 | 83 << 16 | 9 << 24:
            case 70 | 87 << 8 | 83 << 16 | 8 << 24:
            case 70 | 87 << 8 | 83 << 16 | 7 << 24:
            case 70 | 87 << 8 | 83 << 16 | 6 << 24:
            case 70 | 87 << 8 | 83 << 16 | 5 << 24:
            case 70 | 87 << 8 | 83 << 16 | 4 << 24:
               return 1;
            default:
               return 0;
         }
      }
      
      public static function wrapInSWF(param1:Array) : ByteArray
      {
         var _loc4_:ByteArray = null;
         var _loc5_:int = 0;
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.endian = Endian.LITTLE_ENDIAN;
         var _loc3_:int = 0;
         while(_loc3_ < swf_start.length)
         {
            _loc2_.writeByte(swf_start[_loc3_]);
            _loc3_++;
         }
         _loc3_ = 0;
         while(_loc3_ < param1.length)
         {
            _loc4_ = param1[_loc3_];
            _loc5_ = 0;
            while(_loc5_ < abc_header.length)
            {
               _loc2_.writeByte(abc_header[_loc5_]);
               _loc5_++;
            }
            _loc2_.writeInt(_loc4_.length);
            _loc2_.writeBytes(_loc4_,0,_loc4_.length);
            _loc3_++;
         }
         _loc3_ = 0;
         while(_loc3_ < swf_end.length)
         {
            _loc2_.writeByte(swf_end[_loc3_]);
            _loc3_++;
         }
         _loc2_.position = 4;
         _loc2_.writeInt(_loc2_.length);
         _loc2_.position = 0;
         return _loc2_;
      }
      
      public static function isSWF(param1:ByteArray) : Boolean
      {
         var _loc2_:int = getType(param1);
         return (_loc2_ & 1) == 1;
      }
      
      public static function loadBytes(param1:*, param2:Boolean = false) : Boolean
      {
         var c:LoaderContext = null;
         var l:Loader = null;
         var bytes:* = param1;
         var inplace:Boolean = param2;
         if(bytes is Array || getType(bytes) == 2)
         {
            if(!(bytes is Array))
            {
               bytes = [bytes];
            }
            bytes = wrapInSWF(bytes);
         }
         try
         {
            c = null;
            if(inplace)
            {
               c = new LoaderContext(false,ApplicationDomain.currentDomain,null);
            }
            l = new Loader();
            l.loadBytes(bytes,c);
            return true;
         }
         catch(e:*)
         {
            Debug.print(e);
            return false;
         }
      }
   }
}
