package asgui.controls
{
   import asgui.core.IToolTip;
   import asgui.core.UIComponent;
   import asgui.strings.SS;
   import flash.text.TextField;
   
   public class ToolTip extends UIComponent implements IToolTip
   {
      
      public static var defaultTextWidth:int;
      
      public static const STYLE:String = "ToolTip";
       
      
      protected var textField:TextField;
      
      private var _text:Object;
      
      public function ToolTip()
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
         this.textField = new TextField();
         if(defaultTextWidth > 0)
         {
            this.textField.width = defaultTextWidth;
         }
         styleDeclaration.SetTextFieldStyle(this.textField);
         this.textField.wordWrap = true;
         this.textField.multiline = true;
         this.addChild(this.textField);
      }
      
      public function get text() : Object
      {
         return this._text;
      }
      
      public function set text(param1:Object) : void
      {
         var _loc2_:String = null;
         this._text = param1;
         if(this.text is Function)
         {
            _loc2_ = (this.text as Function).call(this);
         }
         else
         {
            _loc2_ = this.text as String;
         }
         this.textField.htmlText = SS.$(_loc2_);
         this.textField.x = styleDeclaration.paddingLeft;
         this.textField.y = styleDeclaration.paddingTop;
         this.width = this.textField.textWidth + styleDeclaration.paddingLeft + styleDeclaration.paddingRight;
         this.height = this.textField.textHeight + styleDeclaration.paddingTop + styleDeclaration.paddingBottom;
         InvalidateProperties();
         InvalidateSize();
      }
      
      override public function ValidateProperties() : void
      {
         super.ValidateProperties();
      }
      
      override public function ValidateSize() : void
      {
         super.ValidateProperties();
      }
   }
}
