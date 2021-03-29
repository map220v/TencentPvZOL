package com.qq.modules.td.model.templates.ce
{
   public class TDChallengeAchiTemplateCE
   {
       
      
      protected var _id:Number;
      
      protected var _desc:String;
      
      protected var _name:String;
      
      public function TDChallengeAchiTemplateCE()
      {
         super();
      }
      
      public function load(param1:Object) : void
      {
         this._id = param1.id;
         this._desc = param1.desc;
         this._name = param1.name;
      }
      
      public function get id() : Number
      {
         return this._id;
      }
      
      public function get desc() : String
      {
         return this._desc;
      }
      
      public function get name() : String
      {
         return this._name;
      }
   }
}
