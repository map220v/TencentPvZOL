package org.as3commons.logging.api
{
   import org.as3commons.logging.util.toLogName;
   
   public function getLogger(param1:* = null, param2:String = null) : ILogger
   {
      if(param1 && !(param1 is String))
      {
         param1 = toLogName(param1);
      }
      return LOGGER_FACTORY.getNamedLogger(param1,param2);
   }
}
