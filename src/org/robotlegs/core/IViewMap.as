package org.robotlegs.core
{
   import flash.display.DisplayObjectContainer;
   
   public interface IViewMap
   {
       
      
      function mapPackage(param1:String) : void;
      
      function unmapPackage(param1:String) : void;
      
      function hasPackage(param1:String) : Boolean;
      
      function mapType(param1:Class) : void;
      
      function unmapType(param1:Class) : void;
      
      function hasType(param1:Class) : Boolean;
      
      function get contextView() : DisplayObjectContainer;
      
      function set contextView(param1:DisplayObjectContainer) : void;
      
      function get enabled() : Boolean;
      
      function set enabled(param1:Boolean) : void;
   }
}
