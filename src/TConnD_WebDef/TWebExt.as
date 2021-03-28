package TConnD_WebDef
{
   import flash.utils.ByteArray;
   
   public class TWebExt
   {
      
      public static const BASEVERSION:uint = 1;
      
      public static const CURRVERSION:uint = 1;
      
      public static const VERSION_StopExt:uint = 1;
       
      
      public var StopExt:TStopExt;
      
      public function TWebExt()
      {
         super();
         this.StopExt = null;
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
            if(VERSION_StopExt <= param3)
            {
               if(this.StopExt == null)
               {
                  return ErrorMap.ERR_REFERENCE_IS_NULL;
               }
               if((_loc4_ = this.StopExt.encode(param2,param3)) != ErrorMap.NO_ERROR)
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
            if(VERSION_StopExt <= param3)
            {
               this.StopExt = new TStopExt();
               if((_loc4_ = this.StopExt.decode(param2,param3)) != ErrorMap.NO_ERROR)
               {
                  return _loc4_;
               }
            }
         }
         return _loc4_;
      }
   }
}
