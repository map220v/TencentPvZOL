package asgui.controls
{
   import asgui.core.IListItemRenderer;
   import flash.text.TextField;
   
   public class Text extends Label implements IListItemRenderer
   {
      
      public static const STYLE:String = "Text";
       
      
      public function Text(param1:Boolean = true)
      {
         this.multiline = param1;
         super();
      }
      
      override protected function get $defaultStyleName() : String
      {
         return STYLE;
      }
      
      override protected function CheckTextFieldCreated() : void
      {
         if(textField != null)
         {
            return;
         }
         textField = new TextField();
         styleDeclaration.SetTextStyle(textField,multiline);
         this.addChild(textField);
      }
      
      override protected function SetText(param1:String) : void
      {
         if(textField)
         {
            textField.htmlText = param1;
         }
      }
      
      override public function CheckTruncation() : void
      {
      }
      
      override protected function $DrawNormal() : void
      {
         super.$DrawNormal();
         if(text != null)
         {
            textField.htmlText = text;
         }
      }
      
      override public function set visible(param1:Boolean) : void
      {
         super.visible = param1;
         if(param1)
         {
            if(text == null)
            {
               return;
            }
            this.SetText(text);
         }
      }
   }
}
