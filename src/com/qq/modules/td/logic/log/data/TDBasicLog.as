package com.qq.modules.td.logic.log.data
{
   import org.as3commons.logging.api.getLogger;
   
   public class TDBasicLog implements ITDLog
   {
       
      
      protected var _formatStr:String;
      
      public function TDBasicLog()
      {
         super();
      }
      
      public function write(param1:Array) : Array
      {
         getLogger("TDLog").info(this.toString(param1));
         return param1;
      }
      
      public function toString(param1:Array) : String
      {
         return null;
      }
      
      protected function getTimeStr(param1:Array) : String
      {
         var _loc2_:String = "";
         if(param1 == null)
         {
            return _loc2_;
         }
         return _loc2_.concat(param1[1],"ms:");
      }
   }
}
