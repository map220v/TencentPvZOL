package asgui.controls
{
   public class LinkButton extends Button
   {
      
      public static const STYLE:String = "LinkButton";
       
      
      public function LinkButton()
      {
         this.textFiledAutoSize = true;
         super();
      }
      
      override protected function get $defaultStyleName() : String
      {
         return STYLE;
      }
      
      override protected function $StyleChanged() : void
      {
         this.$listenMouseOver = this.styleDeclaration.textRollOverColor != -1;
         this.$listenMouseDown = this.styleDeclaration.textSelectedColor != -1;
         super.$StyleChanged();
      }
      
      override public function ValidateProperties() : void
      {
         super.ValidateProperties();
         if(textField != null)
         {
            if(isNaN(this._width))
            {
               this._width = textField.width;
            }
            if(isNaN(this._height))
            {
               this._height = textField.height;
            }
         }
      }
      
      override public function ValidateSize() : void
      {
         super.ValidateSize();
      }
   }
}
