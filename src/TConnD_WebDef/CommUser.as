package TConnD_WebDef
{
   import flash.utils.ByteArray;
   
   public class CommUser
   {
      
      public static const BASEVERSION:uint = 1;
      
      public static const CURRVERSION:uint = 1;
      
      public static const VERSION_Id:uint = 1;
      
      public static const VERSION_Account:uint = 1;
      
      public static const VERSION_Token:uint = 1;
       
      
      public var Id:uint;
      
      public var Account:String;
      
      public var Token:String;
      
      public function CommUser()
      {
         super();
         this.Account = new String();
         this.Token = new String();
      }
      
      public function encode(param1:ByteArray, param2:uint = 0) : int
      {
         var _loc5_:uint = 0;
         var _loc6_:uint = 0;
         var _loc7_:uint = 0;
         var _loc8_:uint = 0;
         if(param2 == 0 || param2 > CURRVERSION)
         {
            param2 = CURRVERSION;
         }
         var _loc3_:uint = param1.position;
         var _loc4_:int = ErrorMap.NO_ERROR;
         if(VERSION_Id <= param2)
         {
            param1.writeUnsignedInt(this.Id);
         }
         if(VERSION_Account <= param2)
         {
            _loc5_ = param1.position;
            param1.position += 4;
            _loc6_ = param1.position;
            if(this.Account == null)
            {
               return ErrorMap.ERR_REFERENCE_IS_NULL;
            }
            if(this.Account.length + 1 > 31)
            {
               return ErrorMap.ERR_STR_SURPASS_DEFINED_SIZE;
            }
            param1.writeUTFBytes(this.Account);
            param1.writeByte(0);
            TdrUtil.directWriteUint(param1,_loc5_,param1.position - _loc6_);
         }
         if(VERSION_Token <= param2)
         {
            _loc7_ = param1.position;
            param1.position += 4;
            _loc8_ = param1.position;
            if(this.Token == null)
            {
               return ErrorMap.ERR_REFERENCE_IS_NULL;
            }
            if(this.Token.length + 1 > 201)
            {
               return ErrorMap.ERR_STR_SURPASS_DEFINED_SIZE;
            }
            param1.writeUTFBytes(this.Token);
            param1.writeByte(0);
            TdrUtil.directWriteUint(param1,_loc7_,param1.position - _loc8_);
         }
         return _loc4_;
      }
      
      public function decode(param1:ByteArray, param2:uint = 0) : int
      {
         var _loc5_:uint = 0;
         var _loc6_:uint = 0;
         if(param2 == 0 || param2 > CURRVERSION)
         {
            param2 = CURRVERSION;
         }
         var _loc3_:uint = param1.position;
         var _loc4_:int = ErrorMap.NO_ERROR;
         if(VERSION_Id <= param2)
         {
            if(param1.bytesAvailable < 4)
            {
               return ErrorMap.ERR_PARTIAL_MSG;
            }
            this.Id = param1.readUnsignedInt();
         }
         if(VERSION_Account <= param2)
         {
            if((_loc5_ = param1.readUnsignedInt()) > param1.bytesAvailable)
            {
               return ErrorMap.ERR_PARTIAL_MSG;
            }
            if(param1.bytesAvailable < _loc5_)
            {
               return ErrorMap.ERR_PARTIAL_MSG;
            }
            this.Account = param1.readUTFBytes(_loc5_ - 1);
            param1.readByte();
         }
         if(VERSION_Token <= param2)
         {
            if((_loc6_ = param1.readUnsignedInt()) > param1.bytesAvailable)
            {
               return ErrorMap.ERR_PARTIAL_MSG;
            }
            if(param1.bytesAvailable < _loc6_)
            {
               return ErrorMap.ERR_PARTIAL_MSG;
            }
            this.Token = param1.readUTFBytes(_loc6_ - 1);
            param1.readByte();
         }
         return _loc4_;
      }
   }
}
