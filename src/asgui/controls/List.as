package asgui.controls
{
   import asgui.controls.lists.ListBase;
   import asgui.controls.lists.ListColumn;
   import asgui.core.IList;
   import asgui.core.IListItemRenderer;
   
   public class List extends ListBase implements IList
   {
      
      public static const STYLE:String = "List";
       
      
      public function List()
      {
         super();
      }
      
      override protected function get $defaultStyleName() : String
      {
         return STYLE;
      }
      
      public function get column() : ListColumn
      {
         this.CheckColumns();
         return columns[0] as ListColumn;
      }
      
      public function get itemRendererClass() : Class
      {
         return this.column.itemRendererClass;
      }
      
      public function set itemRendererClass(param1:Class) : void
      {
         if(this.column.itemRendererClass == param1)
         {
            return;
         }
         this.column.itemRendererClass = param1;
         InvalidateColumns();
      }
      
      public function get itemRendererDataChangeFunction() : Function
      {
         return this.column.itemRendererDataChangeFunction;
      }
      
      public function set itemRendererDataChangeFunction(param1:Function) : void
      {
         if(this.column.itemRendererDataChangeFunction == param1)
         {
            return;
         }
         this.column.itemRendererDataChangeFunction = param1;
         InvalidateColumns();
      }
      
      public function get itemRendererCreatedFunction() : Function
      {
         return this.column.itemRendererCreatedFunction;
      }
      
      public function set itemRendererCreatedFunction(param1:Function) : void
      {
         if(this.column.itemRendererCreatedFunction == param1)
         {
            return;
         }
         this.column.itemRendererCreatedFunction = param1;
         InvalidateColumns();
      }
      
      public function get itemRendererDisposeFunction() : Function
      {
         return this.column.itemRendererDisposeFunction;
      }
      
      public function set itemRendererDisposeFunction(param1:Function) : void
      {
         if(this.column.itemRendererDisposeFunction == param1)
         {
            return;
         }
         this.column.itemRendererDisposeFunction = param1;
         InvalidateColumns();
      }
      
      public function get headerText() : String
      {
         return this.column.headerText;
      }
      
      public function set headerText(param1:String) : void
      {
         if(this.column.headerText == param1)
         {
            return;
         }
         this.column.headerText = param1;
         InvalidateColumns();
      }
      
      public function get itemRendererCreatingFunction() : Function
      {
         return this.column.itemRendererCreatingFunction;
      }
      
      public function set itemRendererCreatingFunction(param1:Function) : void
      {
         this.column.itemRendererCreatingFunction = param1;
         InvalidateColumns();
      }
      
      public function GetItemAt(param1:int) : IListItemRenderer
      {
         if(param1 >= items.length)
         {
            return null;
         }
         return items[param1][0] as IListItemRenderer;
      }
      
      override protected function CheckColumns() : void
      {
         var _loc1_:ListColumn = null;
         if(columnCount == 0)
         {
            _loc1_ = new ListColumn();
            _loc1_.dataField = "label";
            _loc1_.columnWidth = displayWidth;
            _loc1_.headerText = null;
            _loc1_.itemRendererClass = null;
            _loc1_.itemRendererCreatedFunction = null;
            _loc1_.itemRendererDataChangeFunction = null;
            _loc1_.itemRendererDisposeFunction = null;
            AddColumn(_loc1_);
         }
         super.CheckColumns();
      }
   }
}
