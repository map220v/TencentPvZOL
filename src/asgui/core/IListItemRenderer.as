package asgui.core
{
   import flash.events.IEventDispatcher;
   
   public interface IListItemRenderer extends IDataRenderer, IAsguiDisplayObject, IEventDispatcher
   {
       
      
      function Dispose() : void;
      
      function get dataEditable() : Boolean;
      
      function set dataEditable(param1:Boolean) : void;
      
      function get id() : String;
      
      function set id(param1:String) : void;
   }
}
