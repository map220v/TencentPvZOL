package asgui.core
{
   import flash.events.IEventDispatcher;
   
   public interface ILoadingWatchable extends IEventDispatcher
   {
       
      
      function get workingLoader() : *;
      
      function get leftLoaders() : int;
   }
}
