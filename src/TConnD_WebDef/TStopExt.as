package TConnD_WebDef
{
   import flash.utils.ByteArray;
   
   public class TStopExt
   {
      
      public static const BASEVERSION:uint = 1;
      
      public static const CURRVERSION:uint = 1;
      
      public static const VERSION_Reason:uint = 1;
       
      
      public var Reason:int;
      
      public function TStopExt()
      {
         super();
      }
      
      public function encode(param1:ByteArray, param2:uint = 0) : int
      {
         if(param2 == 0 || param2 > CURRVERSION)
         {
            param2 = CURRVERSION;
         }
         var _loc3_:uint = param1.position;
         var _loc4_:int = ErrorMap.NO_ERROR;
         if(VERSION_Reason <= param2)
         {
            param1.writeInt(this.Reason);
         }
         return _loc4_;
      }
      
      public function decode(param1:ByteArray, param2:uint = 0) : int
      {
         if(param2 == 0 || param2 > CURRVERSION)
         {
            param2 = CURRVERSION;
         }
         var _loc3_:uint = param1.position;
         var _loc4_:int = ErrorMap.NO_ERROR;
         if(VERSION_Reason <= param2)
         {
            if(param1.bytesAvailable < 4)
            {
               return ErrorMap.ERR_PARTIAL_MSG;
            }
            this.Reason = param1.readInt();
         }
         return _loc4_;
      }
   }
}
