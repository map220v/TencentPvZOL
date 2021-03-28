package com.qq.modules.main.model.settings.achievement.ce
{
   public class TDAchievementInfoTemplateCE
   {
       
      
      protected var _id:Number;
      
      protected var _desc:String;
      
      protected var _name:String;
      
      public function TDAchievementInfoTemplateCE()
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
