package TConnD_WebDef
{
   import flash.utils.ByteArray;
   
   public class TWebBase
   {
      
      public static const BASEVERSION:uint = 1;
      
      public static const CURRVERSION:uint = 1;
      
      public static const VERSION_Magic:uint = 1;
      
      public static const VERSION_PkgLen:uint = 1;
      
      public static const VERSION_BodyLen:uint = 1;
      
      public static const VERSION_Version:uint = 1;
      
      public static const VERSION_Cmd:uint = 1;
      
      public static const VERSION_UserType:uint = 1;
      
      public static const VERSION_User:uint = 1;
       
      
      public var Magic:uint;
      
      public var PkgLen:uint;
      
      public var BodyLen:uint;
      
      public var Version:uint;
      
      public var Cmd:uint;
      
      public var UserType:int;
      
      public var User:WebUserInfo;
      
      public function TWebBase()
      {
         super();
         this.User = new WebUserInfo();
      }
      
      public function encode(param1:ByteArray, param2:uint = 0) : int
      {
         var _loc5_:int = 0;
         if(param2 == 0 || param2 > CURRVERSION)
         {
            param2 = CURRVERSION;
         }
         var _loc3_:uint = param1.position;
         var _loc4_:int = ErrorMap.NO_ERROR;
         if(VERSION_Magic <= param2)
         {
            param1.writeByte(this.Magic);
         }
         if(VERSION_PkgLen <= param2)
         {
            param1.writeUnsignedInt(this.PkgLen);
         }
         if(VERSION_BodyLen <= param2)
         {
            param1.writeUnsignedInt(this.BodyLen);
         }
         if(VERSION_Version <= param2)
         {
            param1.writeByte(this.Version);
         }
         if(VERSION_Cmd <= param2)
         {
            param1.writeByte(this.Cmd);
         }
         if(VERSION_UserType <= param2)
         {
            param1.writeByte(this.UserType);
         }
         if(VERSION_User <= param2)
         {
            _loc5_ = this.UserType;
            if(this.User == null)
            {
               return ErrorMap.ERR_REFERENCE_IS_NULL;
            }
            if((_loc4_ = this.User.encode(_loc5_,param1,param2)) != ErrorMap.NO_ERROR)
            {
               return _loc4_;
            }
         }
         return _loc4_;
      }
      
      public function decode(param1:ByteArray, param2:uint = 0) : int
      {
         var _loc5_:int = 0;
         if(param2 == 0 || param2 > CURRVERSION)
         {
            param2 = CURRVERSION;
         }
         var _loc3_:uint = param1.position;
         var _loc4_:int = ErrorMap.NO_ERROR;
         if(VERSION_Magic <= param2)
         {
            if(param1.bytesAvailable < 1)
            {
               return ErrorMap.ERR_PARTIAL_MSG;
            }
            this.Magic = param1.readUnsignedByte();
         }
         if(VERSION_PkgLen <= param2)
         {
            if(param1.bytesAvailable < 4)
            {
               return ErrorMap.ERR_PARTIAL_MSG;
            }
            this.PkgLen = param1.readUnsignedInt();
         }
         if(VERSION_BodyLen <= param2)
         {
            if(param1.bytesAvailable < 4)
            {
               return ErrorMap.ERR_PARTIAL_MSG;
            }
            this.BodyLen = param1.readUnsignedInt();
         }
         if(VERSION_Version <= param2)
         {
            if(param1.bytesAvailable < 1)
            {
               return ErrorMap.ERR_PARTIAL_MSG;
            }
            this.Version = param1.readUnsignedByte();
         }
         if(VERSION_Cmd <= param2)
         {
            if(param1.bytesAvailable < 1)
            {
               return ErrorMap.ERR_PARTIAL_MSG;
            }
            this.Cmd = param1.readUnsignedByte();
         }
         if(VERSION_UserType <= param2)
         {
            if(param1.bytesAvailable < 1)
            {
               return ErrorMap.ERR_PARTIAL_MSG;
            }
            this.UserType = param1.readByte();
         }
         if(VERSION_User <= param2)
         {
            _loc5_ = this.UserType;
            if(this.User == null)
            {
               return ErrorMap.ERR_REFERENCE_IS_NULL;
            }
            if((_loc4_ = this.User.decode(_loc5_,param1,param2)) != ErrorMap.NO_ERROR)
            {
               return _loc4_;
            }
         }
         return _loc4_;
      }
   }
}
