package com.qq.modules.hole.model.templates.ce
{
   public class HoleBuyLightTemplateCE
   {
       
      
      protected var _id:Number;
      
      protected var _originalCost:String;
      
      protected var _originalItem:String;
      
      public function HoleBuyLightTemplateCE()
      {
         super();
      }
      
      public function load(param1:Object) : void
      {
         this._id = param1.id;
         this._originalCost = param1.originalCost;
         this._originalItem = param1.originalItem;
      }
      
      public function get id() : Number
      {
         return this._id;
      }
      
      public function get originalCost() : String
      {
         return this._originalCost;
      }
      
      public function get originalItem() : String
      {
         return this._originalItem;
      }
   }
}
