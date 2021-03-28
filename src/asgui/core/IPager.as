package asgui.core
{
   import flash.events.IEventDispatcher;
   
   public interface IPager extends IEventDispatcher, IUIComponent
   {
       
      
      function set dataProvider(param1:DataProvider) : void;
      
      function get dataProvider() : DataProvider;
      
      function set currentPage(param1:int) : void;
      
      function get currentPage() : int;
      
      function set totalPage(param1:int) : void;
      
      function get totalPage() : int;
   }
}
