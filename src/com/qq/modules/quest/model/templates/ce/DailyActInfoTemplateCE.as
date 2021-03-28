package com.qq.modules.quest.model.templates.ce
{
   public class DailyActInfoTemplateCE
   {
       
      
      protected var _id:Number;
      
      protected var _name:String;
      
      protected var _order:Number;
      
      protected var _tipType:Number;
      
      protected var _finishCondition:String;
      
      public function DailyActInfoTemplateCE()
      {
         super();
      }
      
      public function load(param1:Object) : void
      {
         this._id = param1.id;
         this._name = param1.name;
         this._order = param1.order;
         this._tipType = param1.tipType;
         this._finishCondition = param1.finishCondition;
      }
      
      public function get id() : Number
      {
         return this._id;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function get order() : Number
      {
         return this._order;
      }
      
      public function get tipType() : Number
      {
         return this._tipType;
      }
      
      public function get finishCondition() : String
      {
         return this._finishCondition;
      }
   }
}
