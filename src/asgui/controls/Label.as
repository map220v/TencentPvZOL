package asgui.controls
{
   import asgui.core.IListItemRenderer;
   import asgui.core.UIComponent;
   import asgui.core.UIComponentGlobals;
   import asgui.strings.SS;
   import flash.events.Event;
   import flash.text.TextField;
   
   public class Label extends UIComponent implements IListItemRenderer
   {
      
      public static const STYLE:String = "Label";
       
      
      public var multiline:Boolean;
      
      public var textField:TextField;
      
      private var _text:String;
      
      private var textChanged:Boolean = false;
      
      private var _restrict:String;
      
      private var restrictChanged:Boolean = false;
      
      private var _displayAsPassword:Boolean = false;
      
      private var displayAsPasswordChanged:Boolean = false;
      
      private var _maxChars:int = 0;
      
      private var maxCharsChanged:Boolean = false;
      
      public var ifNeedCheckTruncation:Boolean = false;
      
      public function Label()
      {
         super();
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
      
      override public function Dispose() : void
      {
         if(this.textField)
         {
            this.textField.removeEventListener(Event.CHANGE,this.TextEventHandler);
            this.textField = null;
         }
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
            if(toolTip != null && toolTip == this._text)
            {
               toolTip = null;
            }
            this._text = param1;
            this.textChanged = true;
            if(this.textField)
            {
               this.SetText(this._text);
            }
            InvalidateProperties();
            InvalidateSize();
         }
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
      
      public function get textHeight() : Number
      {
         this.CheckTextFieldCreated();
         return this.textField.textHeight;
      }
      
      public function get textWidth() : Number
      {
         this.CheckTextFieldCreated();
         return this.textField.textWidth;
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
         this.textField = new TextField();
         this.textField.addEventListener(Event.CHANGE,this.TextEventHandler);
         this.textField.multiline = this.multiline;
         this.textField.height = int(this.textField.defaultTextFormat.size) * 2;
         this.textField.width = this.displayWidth;
         this.addChild(this.textField);
      }
      
      override public function ValidateSize() : void
      {
         super.ValidateSize();
      }
      
      protected function SetText(param1:String) : void
      {
         this.textField.text = param1;
      }
      
      override public function ValidateProperties() : void
      {
         var _loc1_:String = null;
         if(invalidatePropertiesFlag)
         {
            if(this.textChanged)
            {
               this.CheckTextFieldCreated();
               if(!isNaN(_width))
               {
                  this.textField.width = this.displayWidth;
               }
               if(!isNaN(_height))
               {
                  this.textField.height = this.displayHeight;
               }
               _loc1_ = SS.$(this.text);
               this.SetText(_loc1_);
               $width = this.textField.textWidth + styleDeclaration.textPaddingLeft + styleDeclaration.textPaddingRight + 10;
               $height = this.textField.textHeight + styleDeclaration.textPaddingTop + styleDeclaration.textPaddingBottom + 10;
               this.textChanged = false;
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
            if(this.ifNeedCheckTruncation || UIComponentGlobals.labelAlwaysCheckTruncation)
            {
               this.CheckTruncation();
            }
         }
         super.ValidateProperties();
      }
      
      override public function ValidateSkin() : void
      {
         if(invalidateSkinFlag)
         {
            invalidateSkinFlag = false;
         }
         $Render();
      }
      
      public function CheckTruncation() : void
      {
         var _loc2_:Boolean = false;
         if(this.textField == null)
         {
            return;
         }
         var _loc1_:String = this.textField.text;
         if(!isNaN(_width))
         {
            _loc2_ = false;
            while(this.textField.text != "" && this.textField.textWidth > this.displayWidth)
            {
               _loc2_ = true;
               if(UIComponentGlobals.labelCheckTruncationOnlyTip)
               {
                  break;
               }
               this.textField.text = this.textField.text.substr(0,this.textField.text.length - 1);
            }
            if(_loc2_)
            {
               if(!UIComponentGlobals.labelCheckTruncationOnlyTip)
               {
                  this.textField.text = this.textField.text.substr(0,this.textField.text.length - 1) + "..";
               }
               if(toolTip == null)
               {
                  toolTip = _loc1_;
               }
            }
         }
      }
      
      override protected function $DrawDisabled() : void
      {
         if(this.textField != null)
         {
            this.styleDeclaration.SetTextFieldDisabledStyle(this.textField);
            styleDeclaration.SetTextSizeDisabled(this.textField,this.width,this.height);
         }
      }
      
      override protected function $DrawDown() : void
      {
         if(this.textField != null)
         {
            this.styleDeclaration.SetTextFieldDownStyle(this.textField);
            styleDeclaration.SetTextSizeDown(this.textField,this.width,this.height);
         }
      }
      
      override protected function $DrawOver() : void
      {
         if(this.textField != null)
         {
            this.styleDeclaration.SetTextFieldOverStyle(this.textField);
            styleDeclaration.SetTextSizeOver(this.textField,this.width,this.height);
         }
      }
      
      override protected function $DrawNormal() : void
      {
         if(this.textField != null)
         {
            this.styleDeclaration.SetTextFieldStyle(this.textField,false);
            styleDeclaration.SetTextSize(this.textField,this.width,this.height);
         }
      }
      
      private function TextEventHandler(param1:Event) : void
      {
         this.dispatchEvent(param1.clone());
      }
   }
}
