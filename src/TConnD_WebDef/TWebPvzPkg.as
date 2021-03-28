package TConnD_WebDef
{
   import flash.utils.ByteArray;
   
   public class TWebPvzPkg
   {
      
      public static const BASEVERSION:uint = 1;
      
      public static const CURRVERSION:uint = 1;
      
      public static const VERSION_Head:uint = 1;
      
      public static const VERSION_Body:uint = 1;
       
      
      public var Head:TWebHead;
      
      public var Body:ByteArray;
      
      public function TWebPvzPkg()
      {
         super();
         this.Head = new TWebHead();
         this.Body = new ByteArray();
      }
      
      public function encode(param1:ByteArray, param2:uint = 0) : int
      {
         var _loc7_:int = 0;
         if(param2 == 0 || param2 > CURRVERSION)
         {
            param2 = CURRVERSION;
         }
         var _loc3_:uint = param1.position + 1;
         var _loc4_:uint = param1.position;
         var _loc5_:int = ErrorMap.NO_ERROR;
         if(VERSION_Head <= param2)
         {
            if(this.Head == null)
            {
               return ErrorMap.ERR_REFERENCE_IS_NULL;
            }
            if((_loc5_ = this.Head.encode(param1,param2)) != ErrorMap.NO_ERROR)
            {
               return _loc5_;
            }
         }
         if(VERSION_Body <= param2)
         {
            if((_loc7_ = this.Head.Base.BodyLen) < 0)
            {
               return ErrorMap.ERR_MINUS_REFER_VALUE;
            }
            param1.writeBytes(this.Body);
         }
         if(param1.position < _loc3_ + 4)
         {
            return ErrorMap.ERR_NO_BUF_FOR_SIZEINFO;
         }
         var _loc6_:uint = param1.position - _loc4_;
         TdrUtil.directWriteUint(param1,_loc3_,_loc6_);
         return _loc5_;
      }
      
      public function decode(param1:ByteArray, param2:uint = 0) : int
      {
         var _loc3_:uint = 0;
         if(param2 == 0 || param2 > CURRVERSION)
         {
            param2 = CURRVERSION;
         }
         if(param1.bytesAvailable < 5)
         {
            return ErrorMap.ERR_PARTIAL_MSG;
         }
         _loc3_ = TdrUtil.directReadUint(param1,param1.position + 1);
         if(param1.bytesAvailable < _loc3_)
         {
            return ErrorMap.ERR_PARTIAL_MSG;
         }
         var _loc4_:uint = param1.position;
         var _loc5_:int = ErrorMap.NO_ERROR;
         if(VERSION_Head <= param2)
         {
            if(this.Head == null)
            {
               return ErrorMap.ERR_REFERENCE_IS_NULL;
            }
            if((_loc5_ = this.Head.decode(param1,param2)) != ErrorMap.NO_ERROR)
            {
               return _loc5_;
            }
         }
         return _loc5_;
      }
   }
}
