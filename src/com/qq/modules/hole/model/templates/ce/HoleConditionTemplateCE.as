package com.qq.modules.hole.model.templates.ce
{
   public class HoleConditionTemplateCE
   {
       
      
      protected var _id:Number;
      
      protected var _openLevel:Number;
      
      public function HoleConditionTemplateCE()
      {
         super();
      }
      
      public function load(param1:Object) : void
      {
         this._id = param1.id;
         this._openLevel = param1.openLevel;
      }
      
      public function get id() : Number
      {
         return this._id;
      }
      
      public function get openLevel() : Number
      {
         return this._openLevel;
      }
   }
}
