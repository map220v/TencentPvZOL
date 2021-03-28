package com.qq.utils.ui
{
   import flash.text.TextField;
   import flash.text.TextFormat;
   
   public class PTextField extends TextField
   {
       
      
      private var _textFormat:TextFormat;
      
      public function PTextField(param1:int, param2:int, param3:int, param4:int, param5:String = null, param6:uint = 0, param7:int = 12, param8:String = null)
      {
         super();
         if(param8 == null)
         {
            param8 = "宋体";
         }
         if(param3 != 0)
         {
            this.width = param3;
         }
         if(param4 != 0)
         {
            this.height = param4;
         }
         if(param7 != 12 || param8 != null || param5 != null)
         {
            this._textFormat = new TextFormat(param8,param7);
            if(param5 != null)
            {
               this._textFormat.align = param5;
            }
         }
         this.setSelectable(false);
         this.setTextColor(param6);
         x = param1;
         y = param2;
      }
      
      public function setTextColor(param1:uint) : void
      {
         textColor = param1;
      }
      
      public function setText(param1:String) : void
      {
         text = param1;
         if(this._textFormat != null)
         {
            setTextFormat(this._textFormat);
         }
      }
      
      public function setSelectable(param1:Boolean) : void
      {
         selectable = param1;
         mouseEnabled = param1;
      }
   }
}
