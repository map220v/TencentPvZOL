package com.qq.modules.td.logic.log.data
{
   public class TDLog_DoubleCheckError extends TDBasicLog
   {
       
      
      public function TDLog_DoubleCheckError()
      {
         super();
         _formatStr = "双重校验数据失败";
      }
      
      override public function toString(param1:Array) : String
      {
         return _formatStr;
      }
   }
}
