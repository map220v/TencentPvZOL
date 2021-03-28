package com.qq.modules.fuben.model.templates.ce
{
   public class HDFubenTemplateCE
   {
       
      
      protected var _id:Number;
      
      protected var _mode:Number;
      
      protected var _level:Number;
      
      protected var _headIcon:Number;
      
      protected var _bonusRequired:String;
      
      protected var _bonusOptional:String;
      
      protected var _battleMapId:Number;
      
      public function HDFubenTemplateCE()
      {
         super();
      }
      
      public function load(param1:Object) : void
      {
         this._id = param1.id;
         this._mode = param1.mode;
         this._level = param1.level;
         this._headIcon = param1.headIcon;
         this._bonusRequired = param1.bonusRequired;
         this._bonusOptional = param1.bonusOptional;
         this._battleMapId = param1.battleMapId;
      }
      
      public function get id() : Number
      {
         return this._id;
      }
      
      public function get mode() : Number
      {
         return this._mode;
      }
      
      public function get level() : Number
      {
         return this._level;
      }
      
      public function get headIcon() : Number
      {
         return this._headIcon;
      }
      
      public function get bonusRequired() : String
      {
         return this._bonusRequired;
      }
      
      public function get bonusOptional() : String
      {
         return this._bonusOptional;
      }
      
      public function get battleMapId() : Number
      {
         return this._battleMapId;
      }
   }
}
