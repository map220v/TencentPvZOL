package asgui.containers
{
   import asgui.core.Container;
   import asgui.strings.SS;
   import asgui.styles.StyleManager;
   import asgui.styles.StyleSkin;
   import flash.text.TextField;
   import flash.text.TextFieldAutoSize;
   
   public class Panel extends Container
   {
      
      public static const STYLE:String = "Panel";
       
      
      protected var textFiledTitle:TextField;
      
      private var _title:String;
      
      private var titleChanged:Boolean;
      
      protected var $headerBackgroundSkin:StyleSkin;
      
      public function Panel()
      {
         super();
         absoluteLayout = true;
         mouseBackground = true;
      }
      
      override public function Dispose() : void
      {
         this.$headerBackgroundSkin = null;
         super.Dispose();
      }
      
      override public function InitializeComponent() : void
      {
         super.InitializeComponent();
      }
      
      override protected function get $defaultStyleName() : String
      {
         return STYLE;
      }
      
      protected function CheckTitleTextCreated() : void
      {
         if(this.textFiledTitle != null)
         {
            return;
         }
         if(this.title == null || this.title == "" || styleDeclaration.headerHeight == 0)
         {
            return;
         }
         this.textFiledTitle = new TextField();
         styleDeclaration.SetTextFieldStyle(this.textFiledTitle,false);
         this.$addChild(this.textFiledTitle);
      }
      
      public function get title() : String
      {
         return this._title;
      }
      
      public function set title(param1:String) : void
      {
         if(this._title != param1)
         {
            this._title = param1;
            this.titleChanged = true;
            InvalidateProperties();
            InvalidateSize();
         }
      }
      
      override public function ValidateSize() : void
      {
         if(invalidateSizeFlag)
         {
            if(this.textFiledTitle != null)
            {
               this.textFiledTitle.autoSize = TextFieldAutoSize.LEFT;
               this.textFiledTitle.y = styleDeclaration.headerPaddingTop + styleDeclaration.textPaddingTop;
               switch(styleDeclaration.headerAlign.toLowerCase())
               {
                  case "left":
                     this.textFiledTitle.x = this.styleDeclaration.headerPaddingLeft;
                     break;
                  case "center":
                     this.textFiledTitle.x = (this.width - this.textFiledTitle.width) / 2;
                     break;
                  case "right":
                     this.textFiledTitle.x = this.width - this.textFiledTitle.width - this.styleDeclaration.headerPaddingRight;
               }
            }
         }
         super.ValidateSize();
      }
      
      override public function ValidateProperties() : void
      {
         if(this.titleChanged)
         {
            this.CheckTitleTextCreated();
            if(this.textFiledTitle != null)
            {
               this.textFiledTitle.text = SS.$(this.title);
            }
            this.titleChanged = false;
         }
         super.ValidateProperties();
      }
      
      override public function ValidateSkin() : void
      {
         if(styleDeclaration.headerBackgroundSkin != null)
         {
            this.$headerBackgroundSkin = StyleManager.GetStyleSkin(styleDeclaration.headerBackgroundSkin);
         }
         super.ValidateSkin();
      }
      
      override protected function $DrawNormal() : void
      {
         if(this.textFiledTitle != null)
         {
            this.textFiledTitle.textColor = this.styleDeclaration.color;
         }
      }
      
      override protected function $Render() : void
      {
         super.$Render();
         if(this.$headerBackgroundSkin != null)
         {
            this.$headerBackgroundSkin.Draw(this.graphics,width,styleDeclaration.headerHeight,true);
         }
      }
   }
}
