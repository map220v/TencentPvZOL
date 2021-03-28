package asgui.core
{
   import asgui.controls.lists.ListColumn;
   
   public interface IList extends IUIComponent
   {
       
      
      function get dataProvider() : Object;
      
      function set dataProvider(param1:Object) : void;
      
      function get rowHeight() : int;
      
      function set rowHeight(param1:int) : void;
      
      function get rowHeightWithCss() : int;
      
      function get selectedIndex() : int;
      
      function set selectedIndex(param1:int) : void;
      
      function get column() : ListColumn;
   }
}
