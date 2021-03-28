package org.as3commons.logging.api
{
   public interface ILogger
   {
       
      
      function get name() : String;
      
      function get shortName() : String;
      
      function get person() : String;
      
      function debug(param1:*, param2:Array = null) : void;
      
      function info(param1:*, param2:Array = null) : void;
      
      function warn(param1:*, param2:Array = null) : void;
      
      function error(param1:*, param2:Array = null) : void;
      
      function fatal(param1:*, param2:Array = null) : void;
      
      function get debugEnabled() : Boolean;
      
      function get infoEnabled() : Boolean;
      
      function get warnEnabled() : Boolean;
      
      function get errorEnabled() : Boolean;
      
      function get fatalEnabled() : Boolean;
   }
}
