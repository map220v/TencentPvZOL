package asgui.controls
{
   import asgui.core.IListItemRenderer;
   import asgui.core.ISoftKeyboardHintClient;
   import asgui.core.UIComponent;
   import asgui.core.UIComponentAirGlobals;
   import asgui.events.AsguiEvent;
   import flash.events.Event;
   import flash.events.KeyboardEvent;
   import flash.text.TextField;
   import flash.text.TextFieldType;
   import flash.ui.Keyboard;
   
   public class TextInput extends UIComponent implements IListItemRenderer, ISoftKeyboardHintClient
   {
      
      public static const STYLE:String = "TextInput";
       
      
      public var _textField:TextField;
      
      private var _text:String;
      
      private var textChanged:Boolean = false;
      
      private var _displayAsPassword:Boolean = false;
      
      private var displayAsPasswordChanged:Boolean = false;
      
      private var _maxChars:int = 0;
      
      private var maxCharsChanged:Boolean = false;
      
      private var _restrict:String;
      
      private var restrictChanged:Boolean = false;
      
      private var _softKeyboardType:String = "default";
      
      private var _returnKeyLabel:String = "default";
      
      private var _autoCapitalize:String = "none";
      
      private var _autoCorrect:Boolean;
      
      public function TextInput()
      {
         super();
      }
      
      public function get textField() : TextField
      {
         return this._textField;
      }
      
      override protected function get $defaultStyleName() : String
      {
         return STYLE;
      }
      
      override public function InitializeComponent() : void
      {
         super.InitializeComponent();
         this._textField = new TextField();
         this.textField.type = TextFieldType.INPUT;
         this.textField.addEventListener(Event.CHANGE,this.TextChangeHandler);
         this.textField.addEventListener(KeyboardEvent.KEY_DOWN,this.KeyDownHandler);
         this.addChild(this.textField);
         if(UIComponentAirGlobals.airManager)
         {
            UIComponentAirGlobals.airManager.AddListenToEditableText(this);
         }
      }
      
      override public function Dispose() : void
      {
         if(UIComponentAirGlobals.airManager)
         {
            UIComponentAirGlobals.airManager.RemoveListenToEditableText(this);
         }
         this.textField.removeEventListener(Event.CHANGE,this.TextChangeHandler);
         this.textField.removeEventListener(KeyboardEvent.KEY_DOWN,this.KeyDownHandler);
         this.removeChild(this.textField);
         this._textField = null;
         super.Dispose();
      }
      
      public function get text() : String
      {
         return this._text;
      }
      
      public function set text(param1:String) : void
      {
         if(!param1)
         {
            param1 = "";
         }
         if(param1 != this._text)
         {
            this._text = param1;
            this.textChanged = true;
            InvalidateProperties();
         }
      }
      
      public function get displayAsPassword() : Boolean
      {
         return this._displayAsPassword;
      }
      
      public function set displayAsPassword(param1:Boolean) : void
      {
         if(param1 == this._displayAsPassword)
         {
            return;
         }
         this._displayAsPassword = param1;
         this.displayAsPasswordChanged = true;
         InvalidateProperties();
      }
      
      public function get maxChars() : int
      {
         return this._maxChars;
      }
      
      public function set maxChars(param1:int) : void
      {
         if(param1 == this._maxChars)
         {
            return;
         }
         this._maxChars = param1;
         this.maxCharsChanged = true;
         InvalidateProperties();
      }
      
      public function get restrict() : String
      {
         return this._restrict;
      }
      
      public function set restrict(param1:String) : void
      {
         if(param1 == this._restrict)
         {
            return;
         }
         this._restrict = param1;
         this.restrictChanged = true;
         InvalidateProperties();
      }
      
      override public function set data(param1:Object) : void
      {
         super.data = param1;
         if(param1 is String)
         {
            this.text = param1 as String;
         }
         else if(data.hasOwnProperty(this.dataField))
         {
            this.text = data[dataField];
         }
      }
      
      public function get textHeight() : Number
      {
         return this.textField.textHeight;
      }
      
      public function get textWidth() : Number
      {
         return this.textField.textWidth;
      }
      
      public function get softKeyboardType() : String
      {
         return this._softKeyboardType;
      }
      
      public function set softKeyboardType(param1:String) : void
      {
         this._softKeyboardType = param1;
      }
      
      public function get returnKeyLabel() : String
      {
         return this._returnKeyLabel;
      }
      
      public function set returnKeyLabel(param1:String) : void
      {
         this._returnKeyLabel = param1;
      }
      
      public function get autoCapitalize() : String
      {
         return this._autoCapitalize;
      }
      
      public function set autoCapitalize(param1:String) : void
      {
         this._autoCapitalize = param1;
      }
      
      public function get autoCorrect() : Boolean
      {
         return this._autoCorrect;
      }
      
      public function set autoCorrect(param1:Boolean) : void
      {
         this._autoCorrect = param1;
      }
      
      override protected function $StyleChanged() : void
      {
         super.$StyleChanged();
         if(this.textField)
         {
            styleDeclaration.SetTextInputStyle(this.textField);
         }
      }
      
      override public function ValidateProperties() : void
      {
         if(this.textChanged)
         {
            this.textField.text = this._text;
            this.textChanged = false;
         }
         if(this.displayAsPasswordChanged)
         {
            this.textField.displayAsPassword = this._displayAsPassword;
            this.displayAsPasswordChanged = false;
         }
         if(this.maxCharsChanged)
         {
            this.textField.maxChars = this._maxChars;
            this.maxCharsChanged = false;
         }
         if(this.restrictChanged)
         {
            this.textField.restrict = this._restrict;
            this.restrictChanged = false;
         }
         super.ValidateProperties();
      }
      
      override public function ValidateSize() : void
      {
         if(invalidateSizeFlag)
         {
            styleDeclaration.SetTextSize(this.textField,this.width,this.height);
         }
         super.ValidateSize();
      }
      
      private function TextChangeHandler(param1:Event) : void
      {
         this._text = this.textField.text;
         if(dataEditable && data != null)
         {
            data[dataField] = this.text;
            this.dispatchEvent(new AsguiEvent(AsguiEvent.DATA_CHANGE));
         }
         this.dispatchEvent(param1.clone());
      }
      
      private function KeyDownHandler(param1:KeyboardEvent) : void
      {
         if(param1.keyCode == Keyboard.ENTER)
         {
            this.dispatchEvent(new AsguiEvent(AsguiEvent.KEY_ENTER));
         }
      }
      
      public function set selectable(param1:Boolean) : void
      {
         this.textField.selectable = param1;
      }
   }
}
