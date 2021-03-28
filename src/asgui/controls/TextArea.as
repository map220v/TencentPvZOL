package asgui.controls
{
   import asgui.controls.scrolls.ScrollBar;
   import asgui.core.IListItemRenderer;
   import asgui.core.ISoftKeyboardHintClient;
   import asgui.core.ScrollControlBase;
   import asgui.core.UIComponentAirGlobals;
   import asgui.events.AsguiEvent;
   import asgui.strings.SS;
   import flash.events.Event;
   import flash.events.KeyboardEvent;
   import flash.text.TextField;
   import flash.text.TextFieldAutoSize;
   import flash.text.TextFieldType;
   
   public class TextArea extends ScrollControlBase implements IListItemRenderer, ISoftKeyboardHintClient
   {
      
      public static const STYLE:String = "TextArea";
       
      
      public var _textField:TextField;
      
      private var _displayAsPassword:Boolean = false;
      
      private var displayAsPasswordChanged:Boolean = false;
      
      private var _maxChars:int = 0;
      
      private var maxCharsChanged:Boolean = false;
      
      private var _restrict:String;
      
      private var restrictChanged:Boolean = false;
      
      private var _selectable:Boolean = true;
      
      private var selectableChanged:Boolean = false;
      
      private var _text:String = "";
      
      private var textChanged:Boolean = false;
      
      private var _wordWrap:Boolean = true;
      
      private var wordWrapChanged:Boolean = false;
      
      private var _editable:Boolean = false;
      
      private var editableChanged:Boolean = false;
      
      private var _htmlText:String = "";
      
      private var htmlTextChanged:Boolean = false;
      
      private var _softKeyboardType:String = "default";
      
      private var _returnKeyLabel:String = "default";
      
      private var _autoCapitalize:String = "none";
      
      private var _autoCorrect:Boolean;
      
      private var multiline:Boolean;
      
      public function TextArea(param1:Boolean = true)
      {
         this.multiline = param1;
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
         this.CheckTextFieldCreated();
      }
      
      override protected function $StyleChanged() : void
      {
         if(this.textField)
         {
            this.styleDeclaration.SetAreaTextFieldStyle(this.textField,this.multiline);
         }
         super.$StyleChanged();
      }
      
      override public function Dispose() : void
      {
         if(UIComponentAirGlobals.airManager)
         {
            UIComponentAirGlobals.airManager.RemoveListenToEditableText(this);
         }
         this.removeEventListener(Event.ENTER_FRAME,this.EnterFrameForUpdateTextRoll);
         this.textField.removeEventListener(Event.CHANGE,this.TextinputEventHandler);
         super.Dispose();
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
      
      public function get textHeight() : Number
      {
         return this.textField.textHeight;
      }
      
      public function get textWidth() : Number
      {
         return this.textField.textWidth;
      }
      
      public function get selectable() : Boolean
      {
         return this._selectable;
      }
      
      public function set selectable(param1:Boolean) : void
      {
         if(param1 == this.selectable)
         {
            return;
         }
         this._selectable = param1;
         this.selectableChanged = true;
         InvalidateProperties();
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
         this._htmlText = null;
         if(param1 != this._text)
         {
            this._text = param1;
            this.textChanged = true;
            InvalidateProperties();
            InvalidateSize();
         }
      }
      
      public function get wordWrap() : Boolean
      {
         return this._wordWrap;
      }
      
      public function set wordWrap(param1:Boolean) : void
      {
         if(param1 == this._wordWrap)
         {
            return;
         }
         this._wordWrap = param1;
         this.wordWrapChanged = true;
         InvalidateProperties();
         InvalidateDisplayList();
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
      
      override public function set dataEditable(param1:Boolean) : void
      {
         super.dataEditable = param1;
         this.editable = param1;
      }
      
      public function get editable() : Boolean
      {
         return this._editable;
      }
      
      public function set editable(param1:Boolean) : void
      {
         if(param1 == this._editable)
         {
            return;
         }
         this._editable = param1;
         this.editableChanged = true;
         InvalidateProperties();
      }
      
      public function get htmlText() : String
      {
         return this._htmlText;
      }
      
      public function set htmlText(param1:String) : void
      {
         if(!param1)
         {
            param1 = "";
         }
         this._htmlText = param1;
         this.textField.htmlText = this._htmlText;
         this.htmlTextChanged = true;
         this._text = null;
         InvalidateProperties();
         InvalidateSize();
      }
      
      public function get length() : int
      {
         return this.text != null ? int(this.text.length) : -1;
      }
      
      protected function CheckTextFieldCreated() : void
      {
         if(this.textField != null)
         {
            return;
         }
         this._textField = new TextField();
         styleDeclaration.SetAreaTextFieldStyle(this.textField,this.multiline);
         this.textField.addEventListener(Event.CHANGE,this.TextinputEventHandler);
         this.textField.addEventListener(KeyboardEvent.KEY_UP,this.KeyUpHandler);
         this.textField.addEventListener(KeyboardEvent.KEY_DOWN,this.KeyDownHandler);
         contentPane.addChild(this.textField);
         if(UIComponentAirGlobals.airManager)
         {
            UIComponentAirGlobals.airManager.AddListenToEditableText(this);
         }
      }
      
      private function KeyUpHandler(param1:KeyboardEvent) : void
      {
         this.removeEventListener(Event.ENTER_FRAME,this.EnterFrameForUpdateTextRoll);
      }
      
      private function KeyDownHandler(param1:KeyboardEvent) : void
      {
         this.addEventListener(Event.ENTER_FRAME,this.EnterFrameForUpdateTextRoll);
      }
      
      private function EnterFrameForUpdateTextRoll(param1:Event) : void
      {
         if(hasDisposed)
         {
            this.Dispose();
            return;
         }
         this.UpdateTextRoll();
      }
      
      private function UpdateTextRoll(param1:int = -2) : void
      {
         if(!scrollHandler.hasVerticalScrollBar)
         {
            return;
         }
         var _loc2_:int = maxVerticalScrollPosition + displayHeight;
         param1 = this.textField.getLineIndexOfChar(this.textField.caretIndex);
         if(param1 == -1)
         {
            param1 = this.textField.numLines + 1;
         }
         var _loc3_:Number = _loc2_ / this.textField.numLines;
         var _loc4_:int;
         if((_loc4_ = _loc3_ * param1) < verticalScrollPosition)
         {
            verticalScrollPosition = _loc4_;
         }
         else if(_loc4_ > verticalScrollPosition + displayHeight - _loc3_)
         {
            verticalScrollPosition = _loc4_ - displayHeight + _loc3_;
         }
      }
      
      private function TextinputEventHandler(param1:Event) : void
      {
         if(!this.editable)
         {
            return;
         }
         this._text = this.textField.text;
         InvalidateProperties();
         InvalidateSize();
         if(dataEditable && data != null)
         {
            data[dataField] = this.text;
            this.dispatchEvent(new AsguiEvent(AsguiEvent.DATA_CHANGE));
         }
         this.dispatchEvent(param1.clone());
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
      
      override public function ValidateSize() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         var _loc3_:ScrollBar = null;
         if(invalidateSizeFlag)
         {
            _loc1_ = displayHeight - styleDeclaration.textPaddingTop - styleDeclaration.textPaddingBottom;
            _loc2_ = displayWidth - styleDeclaration.textPaddingLeft - styleDeclaration.textPaddingRight;
            this.textField.x = styleDeclaration.textPaddingLeft;
            this.textField.y = styleDeclaration.textPaddingTop;
            this.textField.width = _loc2_;
            if(this.textField.textHeight < _loc1_)
            {
               this.textField.autoSize = TextFieldAutoSize.NONE;
               this.textField.height = _loc1_;
               this.verticalScrollPosition = 0;
            }
            else
            {
               this.textField.autoSize = TextFieldAutoSize.LEFT;
            }
            contentPane.x = styleDeclaration.paddingLeft;
            contentPane.y = styleDeclaration.paddingTop;
            contentPane.graphics.clear();
            contentPane.graphics.beginFill(0,0);
            contentPane.graphics.drawRect(0,0,displayWidth,displayHeight);
            contentPane.graphics.endFill();
            scrollHandler.UpdateContentHolderChildrenSize();
            scrollHandler.SetScrollSize(0,0,displayWidth,displayHeight);
            if(scrollHandler.hasVerticalScrollBar)
            {
               _loc3_ = scrollHandler.GetVerticalScrollBar();
               if(!scrollHandler.hasVerticalScrollBarAdded)
               {
                  addChild(_loc3_);
               }
               _loc3_.x = contentPane.x + displayWidth - _loc3_.width + styleDeclaration.scrollBarPaddingRight;
               _loc3_.y = contentPane.y;
               if(styleDeclaration.scrollBarPaddingBottom != 0)
               {
                  scrollHandler.verticalPageScrollSize = displayHeight + styleDeclaration.scrollBarPaddingBottom;
               }
            }
            else
            {
               scrollHandler.RemoveVerticalScrollBar();
            }
            if(scrollHandler.hasHorizontalScrollBar)
            {
               _loc3_ = scrollHandler.GetHorizontalScrollBar();
               if(!scrollHandler.hasHorizontalScrollBarAdded)
               {
                  addChild(_loc3_);
               }
               _loc3_.x = contentPane.x;
               _loc3_.y = contentPane.y + displayHeight - _loc3_.height;
            }
            else
            {
               scrollHandler.RemoveHorizontalScrollBar();
            }
            this.dispatchEvent(new AsguiEvent(AsguiEvent.TEXT_CHANGED));
         }
         super.ValidateSize();
      }
      
      override public function ValidateProperties() : void
      {
         if(isNaN(_width))
         {
            _width = 100 + styleDeclaration.paddingLeft + styleDeclaration.paddingRight;
         }
         if(isNaN(_height))
         {
            _height = 100 + styleDeclaration.paddingTop + styleDeclaration.paddingBottom;
         }
         if(this.textChanged)
         {
            if(this.text != null)
            {
               if(this.editable)
               {
                  this.textField.text = this.text;
               }
               else
               {
                  this.textField.text = SS.$(this.text);
               }
            }
            this.textChanged = false;
         }
         if(this.htmlTextChanged)
         {
            this.textField.htmlText = this.htmlText;
            this.htmlTextChanged = false;
         }
         if(this.displayAsPasswordChanged)
         {
            this.textField.displayAsPassword = this._displayAsPassword;
            this.displayAsPasswordChanged = false;
         }
         if(this.restrictChanged)
         {
            this.textField.restrict = this.restrict;
            this.restrictChanged = false;
         }
         if(this.maxCharsChanged)
         {
            this.textField.maxChars = this.maxChars;
            this.maxCharsChanged = false;
         }
         if(this.selectableChanged)
         {
            this.textField.selectable = this.selectable;
            this.selectableChanged = false;
         }
         if(this.wordWrapChanged)
         {
            this.textField.wordWrap = this.wordWrap;
            this.wordWrapChanged = false;
         }
         if(this.editableChanged)
         {
            this.textField.type = !!this.editable ? TextFieldType.INPUT : TextFieldType.DYNAMIC;
            this.editableChanged = false;
         }
         super.ValidateProperties();
      }
   }
}
