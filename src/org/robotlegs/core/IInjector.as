package org.robotlegs.core
{
   import flash.system.ApplicationDomain;
   
   public interface IInjector
   {
       
      
      function mapValue(param1:Class, param2:Object, param3:String = "") : *;
      
      function mapClass(param1:Class, param2:Class, param3:String = "") : *;
      
      function mapSingleton(param1:Class, param2:String = "") : *;
      
      function mapSingletonOf(param1:Class, param2:Class, param3:String = "") : *;
      
      function mapRule(param1:Class, param2:*, param3:String = "") : *;
      
      function injectInto(param1:Object, param2:Boolean = true) : void;
      
      function instantiate(param1:Class) : *;
      
      function getInstance(param1:Class, param2:String = "") : *;
      
      function createChild(param1:ApplicationDomain = null) : IInjector;
      
      function unmap(param1:Class, param2:String = "") : void;
      
      function hasMapping(param1:Class, param2:String = "") : Boolean;
      
      function get applicationDomain() : ApplicationDomain;
      
      function set applicationDomain(param1:ApplicationDomain) : void;
   }
}
