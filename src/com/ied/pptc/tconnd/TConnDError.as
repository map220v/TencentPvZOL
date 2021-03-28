package com.ied.pptc.tconnd
{
   public class TConnDError
   {
      
      public static const NO_ERROR:int = 0;
      
      public static const ERR_UNKNOWN:int = -100;
      
      public static const ERR_INVALID_PARAMETER:int = -101;
      
      public static const ERR_INVALIED_STATUS:int = -102;
      
      public static const ERR_IOERROR:int = -103;
      
      public static const ERR_SECURITY:int = -104;
      
      public static const ERR_TIMEOUT:int = -105;
      
      public static const ERR_CONNECT_FAIL:int = -106;
      
      public static const ERR_LOAD_REQ:int = -107;
      
      public static const ERR_CONNECT_CLOSE:int = -108;
       
      
      public function TConnDError()
      {
         super();
      }
   }
}
