package com.qq.modules.main.model.settings.plantTalent.ce
{
   public class PlantTalentTipTemplateCE
   {
       
      
      protected var _id:Number;
      
      protected var _content:String;
      
      public function PlantTalentTipTemplateCE()
      {
         super();
      }
      
      public function load(param1:Object) : void
      {
         this._id = param1.id;
         this._content = param1.content;
      }
      
      public function get id() : Number
      {
         return this._id;
      }
      
      public function get content() : String
      {
         return this._content;
      }
   }
}
