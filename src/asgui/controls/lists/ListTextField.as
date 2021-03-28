package asgui.controls.lists
{
   import asgui.core.IListItemRenderer;
   import asgui.events.AsguiEvent;
   import asgui.logger.AsguiLogger;
   import asgui.strings.SS;
   import asgui.styles.StyleDeclaration;
   import flash.events.Event;
   import flash.text.TextField;
   import flash.text.TextFieldType;
   
   public class ListTextField extends TextField implements IListItemRenderer
   {
       
      
      private var _dataField:String;
      
      private var _data:Object;
      
      private var _dataEditable:Boolean;
      
      private var _id:String;
      
      private var _text:String;
      
      public function ListTextField()
      {
         this.addEventListener(Event.CHANGE,this.ChangeHandler);
         super();
      }
      
      public function Dispose() : void
      {
         this.removeEventListener(Event.CHANGE,this.ChangeHandler);
         this._data = null;
      }
      
      public function SetStyle(param1:StyleDeclaration) : void
      {
         if(type == TextFieldType.INPUT)
         {
            param1.SetTextInputStyle(this);
         }
         else
         {
            param1.SetTextFieldStyle(this,false);
         }
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
      }
      
      public function get data() : Object
      {
         return this._data;
      }
      
      public function set data(param1:Object) : void
      {
         this._data = param1;
         if(param1 is String)
         {
            this.text = param1 as String;
         }
         else if(this.data.hasOwnProperty(this.dataField))
         {
            this.text = this.data[this.dataField];
         }
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
         this.type = !!this._dataEditable ? TextFieldType.INPUT : TextFieldType.DYNAMIC;
      }
      
      public function get id() : String
      {
         return this._id;
      }
      
      public function set id(param1:String) : void
      {
         this._id = param1;
      }
      
      override public function get text() : String
      {
         return this._text;
      }
      
      override public function set text(param1:String) : void
      {
         this._text = param1;
         super.text = SS.$(param1);
      }
      
      private function ChangeHandler(param1:Event) : void
      {
         var e:Event = param1;
         if(this.dataEditable && this._data != null)
         {
            try
            {
               this._data[this.dataField] = super.text;
            }
            catch(ex:Error)
            {
               AsguiLogger.Warn(this,ex.message);
            }
            this.dispatchEvent(new AsguiEvent(AsguiEvent.DATA_CHANGE));
         }
      }
   }
}
