package TConnD_WebDef
{
   import flash.utils.ByteArray;
   
   public class WebUserInfo
   {
      
      public static const BASEVERSION:uint = 1;
      
      public static const CURRVERSION:uint = 1;
      
      public static const VERSION_QQUserSimple:uint = 1;
      
      public static const VERSION_CommonUser:uint = 1;
       
      
      public var QQUserSimple:QQUserSimp;
      
      public var CommonUser:CommUser;
      
      public function WebUserInfo()
      {
         super();
         this.QQUserSimple = null;
         this.CommonUser = null;
      }
      
      public function encode(param1:int, param2:ByteArray, param3:uint = 0) : int
      {
         if(param3 == 0 || param3 > CURRVERSION)
         {
            param3 = CURRVERSION;
         }
         var _loc4_:int = ErrorMap.NO_ERROR;
         if(param1 == 1)
         {
            if(VERSION_QQUserSimple <= param3)
            {
               if(this.QQUserSimple == null)
               {
                  return ErrorMap.ERR_REFERENCE_IS_NULL;
               }
               if((_loc4_ = this.QQUserSimple.encode(param2,param3)) != ErrorMap.NO_ERROR)
               {
                  return _loc4_;
               }
            }
         }
         else if(param1 == 2)
         {
            if(VERSION_CommonUser <= param3)
            {
               if(this.CommonUser == null)
               {
                  return ErrorMap.ERR_REFERENCE_IS_NULL;
               }
               if((_loc4_ = this.CommonUser.encode(param2,param3)) != ErrorMap.NO_ERROR)
               {
                  return _loc4_;
               }
            }
         }
         return _loc4_;
      }
      
      public function decode(param1:int, param2:ByteArray, param3:uint = 0) : int
      {
         if(param3 == 0 || param3 > CURRVERSION)
         {
            param3 = CURRVERSION;
         }
         var _loc4_:int = ErrorMap.NO_ERROR;
         if(param1 == 1)
         {
            if(VERSION_QQUserSimple <= param3)
            {
               this.QQUserSimple = new QQUserSimp();
               if((_loc4_ = this.QQUserSimple.decode(param2,param3)) != ErrorMap.NO_ERROR)
               {
                  return _loc4_;
               }
            }
         }
         else if(param1 == 2)
         {
            if(VERSION_CommonUser <= param3)
            {
               this.CommonUser = new CommUser();
               if((_loc4_ = this.CommonUser.decode(param2,param3)) != ErrorMap.NO_ERROR)
               {
                  return _loc4_;
               }
            }
         }
         return _loc4_;
      }
   }
}
