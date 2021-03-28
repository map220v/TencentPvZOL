package org.robotlegs.core
{
   public interface IMediator
   {
       
      
      function preRegister() : void;
      
      function onRegister() : void;
      
      function preRemove() : void;
      
      function onRemove() : void;
      
      function getViewComponent() : Object;
      
      function setViewComponent(param1:Object) : void;
   }
}
