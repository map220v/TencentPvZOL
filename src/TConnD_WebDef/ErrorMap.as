package TConnD_WebDef
{
   public class ErrorMap
   {
      
      private static var errors:Array = new Array();
      
      public static const NO_ERROR:int = 0;
      
      public static const ERR_PARTIAL_MSG:int = -1;
      
      public static const ERR_INVALIED_CUTOFF_VERSION:int = -2;
      
      public static const ERR_REFERENCE_IS_NULL:int = -3;
      
      public static const ERR_NO_BUF_FOR_SIZEINFO:int = -4;
      
      public static const ERR_NO_BUF_FOR_INDICATOR:int = -5;
      
      public static const ERR_STR_SURPASS_DEFINED_SIZE:int = -6;
      
      public static const ERR_ARRAY_REFER_IS_NULL:int = -7;
      
      public static const ERR_REFER_BIGGER_THAN_COUNT:int = -8;
      
      public static const ERR_ARRAY_ELEMENT_UNDEFIND:int = -9;
      
      public static const ERR_MINUS_REFER_VALUE:int = -10;
      
      {
         errors[NO_ERROR] = "no error";
         errors[ERR_PARTIAL_MSG] = "data in buffer do not cover a complete package";
         errors[ERR_INVALIED_CUTOFF_VERSION] = "version-indicator is invalid";
         errors[ERR_REFERENCE_IS_NULL] = "reference is null";
         errors[ERR_NO_BUF_FOR_SIZEINFO] = "refer to an invalid position, when set sizeinfo";
         errors[ERR_NO_BUF_FOR_INDICATOR] = "refer to an invalid position, when set version-indicator";
         errors[ERR_STR_SURPASS_DEFINED_SIZE] = "length of string surpass customed-size";
         errors[ERR_ARRAY_REFER_IS_NULL] = "array-type reference is null";
         errors[ERR_REFER_BIGGER_THAN_COUNT] = "value of refer is bigger than that of count";
         errors[ERR_ARRAY_ELEMENT_UNDEFIND] = "element of array is undefined";
         errors[ERR_MINUS_REFER_VALUE] = "value of refer is minus";
      }
      
      public function ErrorMap()
      {
         super();
      }
      
      public static function getErrorString(param1:int) : String
      {
         var _loc2_:* = ErrorMap.errors[param1];
         if(_loc2_ == undefined)
         {
            return ErrorMap.errors[NO_ERROR];
         }
         return _loc2_;
      }
   }
}
