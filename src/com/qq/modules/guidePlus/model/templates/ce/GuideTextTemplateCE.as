package com.qq.modules.guidePlus.model.templates.ce
{
   public class GuideTextTemplateCE
   {
       
      
      protected var _id:Number;
      
      protected var _text:String;
      
      public function GuideTextTemplateCE()
      {
         super();
      }
      
      public function load(param1:Object) : void
      {
         this._id = param1.id;
         this._text = param1.text;
      }
      
      public function get id() : Number
      {
         return this._id;
      }
      
      public function get text() : String
      {
         return this._text;
      }
   }
}
