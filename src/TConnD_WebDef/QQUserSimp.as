package TConnD_WebDef
{
   import flash.utils.ByteArray;
   
   public class QQUserSimp
   {
      
      public static const BASEVERSION:uint = 1;
      
      public static const CURRVERSION:uint = 1;
      
      public static const VERSION_Uin:uint = 1;
      
      public static const VERSION_SKey:uint = 1;
       
      
      public var Uin:uint;
      
      public var SKey:String;
      
      public function QQUserSimp()
      {
         super();
         this.SKey = new String();
      }
      
      public function encode(param1:ByteArray, param2:uint = 0) : int
      {
         var _loc5_:uint = 0;
         var _loc6_:uint = 0;
         if(param2 == 0 || param2 > CURRVERSION)
         {
            param2 = CURRVERSION;
         }
         var _loc3_:uint = param1.position;
         var _loc4_:int = ErrorMap.NO_ERROR;
         if(VERSION_Uin <= param2)
         {
            param1.writeUnsignedInt(this.Uin);
         }
         if(VERSION_SKey <= param2)
         {
            _loc5_ = param1.position;
            param1.position += 4;
            _loc6_ = param1.position;
            if(this.SKey == null)
            {
               return ErrorMap.ERR_REFERENCE_IS_NULL;
            }
            if(this.SKey.length + 1 > 11)
            {
               return ErrorMap.ERR_STR_SURPASS_DEFINED_SIZE;
            }
            param1.writeUTFBytes(this.SKey);
            param1.writeByte(0);
            TdrUtil.directWriteUint(param1,_loc5_,param1.position - _loc6_);
         }
         return _loc4_;
      }
      
      public function decode(param1:ByteArray, param2:uint = 0) : int
      {
         var _loc5_:uint = 0;
         if(param2 == 0 || param2 > CURRVERSION)
         {
            param2 = CURRVERSION;
         }
         var _loc3_:uint = param1.position;
         var _loc4_:int = ErrorMap.NO_ERROR;
         if(VERSION_Uin <= param2)
         {
            if(param1.bytesAvailable < 4)
            {
               return ErrorMap.ERR_PARTIAL_MSG;
            }
            this.Uin = param1.readUnsignedInt();
         }
         if(VERSION_SKey <= param2)
         {
            if((_loc5_ = param1.readUnsignedInt()) > param1.bytesAvailable)
            {
               return ErrorMap.ERR_PARTIAL_MSG;
            }
            if(param1.bytesAvailable < _loc5_)
            {
               return ErrorMap.ERR_PARTIAL_MSG;
            }
            this.SKey = param1.readUTFBytes(_loc5_ - 1);
            param1.readByte();
         }
         return _loc4_;
      }
   }
}
