package org.robotlegs.core
{
   public interface ICommandMap
   {
       
      
      function detain(param1:Object) : void;
      
      function release(param1:Object) : void;
      
      function execute(param1:Class, param2:Object = null, param3:Class = null, param4:String = "") : void;
      
      function mapEvent(param1:String, param2:Class, param3:Class = null, param4:Boolean = false) : void;
      
      function unmapEvent(param1:String, param2:Class, param3:Class = null) : void;
      
      function unmapEvents() : void;
      
      function hasEventCommand(param1:String, param2:Class, param3:Class = null) : Boolean;
   }
}
