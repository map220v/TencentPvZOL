package asgui.controls.lists
{
   import asgui.core.IListItemRenderer;
   import flash.display.DisplayObject;
   import flash.events.EventDispatcher;
   
   public class ListColumn extends EventDispatcher
   {
       
      
      private var _columnWidth:int;
      
      private var _headerText:String = "head";
      
      private var _dataField:String = "data";
      
      private var _itemRendererDataChangeFunction:Function;
      
      private var _itemRendererCreatedFunction:Function;
      
      private var _itemRendererDisposeFunction:Function;
      
      var invalidateColumnsFlag:Boolean;
      
      private var _x:int;
      
      private var _dataEditable:Boolean;
      
      private var _itemRendererClass:Class;
      
      var hasCreatingFunction:Boolean;
      
      private var _itemRendererCreatingFunction:Function;
      
      private var _headerClass:Class;
      
      var hasHeaderCreatingFunction:Boolean;
      
      private var _headerCreatingFunction:Function;
      
      public function ListColumn()
      {
         this._itemRendererCreatingFunction = this._itemRendererCreatingFunctionDefault;
         this._headerCreatingFunction = this._headerCreatingFunctionDefault;
         super();
      }
      
      public function Dispose() : void
      {
         this._itemRendererClass = null;
         this._itemRendererDataChangeFunction = null;
         this._itemRendererCreatedFunction = null;
         this._itemRendererDisposeFunction = null;
      }
      
      protected function InvalidateColumns() : void
      {
         this.invalidateColumnsFlag = true;
      }
      
      function SetX(param1:DisplayObject) : void
      {
         param1.x = this.x;
      }
      
      function SetWidth(param1:DisplayObject) : void
      {
         param1.width = this.columnWidth;
      }
      
      public function get x() : int
      {
         return this._x;
      }
      
      public function set x(param1:int) : void
      {
         this._x = param1;
      }
      
      public function get dataField() : String
      {
         return this._dataField;
      }
      
      public function set dataField(param1:String) : void
      {
         if(this._dataField == param1)
         {
            return;
         }
         this._dataField = param1;
         this.InvalidateColumns();
      }
      
      public function get columnWidth() : int
      {
         return this._columnWidth;
      }
      
      public function set columnWidth(param1:int) : void
      {
         if(this._columnWidth == param1)
         {
            return;
         }
         this._columnWidth = param1;
         this.InvalidateColumns();
      }
      
      public function get headerText() : String
      {
         return this._headerText;
      }
      
      public function set headerText(param1:String) : void
      {
         if(this._headerText == param1)
         {
            return;
         }
         this._headerText = param1;
         this.InvalidateColumns();
      }
      
      public function get dataEditable() : Boolean
      {
         return this._dataEditable;
      }
      
      public function set dataEditable(param1:Boolean) : void
      {
         if(this._dataEditable == param1)
         {
            return;
         }
         this._dataEditable = param1;
         this.InvalidateColumns();
      }
      
      public function get itemRendererClass() : Class
      {
         if(this._itemRendererClass == null)
         {
            this._itemRendererClass = ListTextField;
         }
         return this._itemRendererClass;
      }
      
      public function set itemRendererClass(param1:Class) : void
      {
         if(this._itemRendererClass == param1)
         {
            return;
         }
         this._itemRendererClass = param1;
         this.InvalidateColumns();
      }
      
      public function get itemRendererDataChangeFunction() : Function
      {
         return this._itemRendererDataChangeFunction;
      }
      
      public function set itemRendererDataChangeFunction(param1:Function) : void
      {
         if(this._itemRendererDataChangeFunction == param1)
         {
            return;
         }
         this._itemRendererDataChangeFunction = param1;
         this.InvalidateColumns();
      }
      
      public function get itemRendererCreatedFunction() : Function
      {
         return this._itemRendererCreatedFunction;
      }
      
      public function set itemRendererCreatedFunction(param1:Function) : void
      {
         if(this._itemRendererCreatedFunction == param1)
         {
            return;
         }
         this._itemRendererCreatedFunction = param1;
         this.InvalidateColumns();
      }
      
      public function get itemRendererDisposeFunction() : Function
      {
         return this._itemRendererDisposeFunction;
      }
      
      public function set itemRendererDisposeFunction(param1:Function) : void
      {
         if(this._itemRendererDisposeFunction == param1)
         {
            return;
         }
         this._itemRendererDisposeFunction = param1;
         this.InvalidateColumns();
      }
      
      private function _itemRendererCreatingFunctionDefault(param1:int, param2:int, param3:Class) : IListItemRenderer
      {
         return new param3() as IListItemRenderer;
      }
      
      public function get itemRendererCreatingFunction() : Function
      {
         return this._itemRendererCreatingFunction;
      }
      
      public function set itemRendererCreatingFunction(param1:Function) : void
      {
         if(this._itemRendererCreatingFunction == param1)
         {
            return;
         }
         this._itemRendererCreatingFunction = param1;
         this.hasCreatingFunction = true;
         this.InvalidateColumns();
      }
      
      public function get headerClass() : Class
      {
         if(this._headerClass == null)
         {
            this._headerClass = ListTextField;
         }
         return this._headerClass;
      }
      
      public function set headerClass(param1:Class) : void
      {
         if(this._headerClass == param1)
         {
            return;
         }
         this._headerClass = param1;
         this.InvalidateColumns();
      }
      
      private function _headerCreatingFunctionDefault(param1:int, param2:Class) : IListItemRenderer
      {
         return new param2() as IListItemRenderer;
      }
      
      public function get headerCreatingFunction() : Function
      {
         return this._headerCreatingFunction;
      }
      
      public function set headerCreatingFunction(param1:Function) : void
      {
         if(this._headerCreatingFunction == param1)
         {
            return;
         }
         this._headerCreatingFunction = param1;
         this.hasHeaderCreatingFunction = true;
         this.InvalidateColumns();
      }
   }
}
