package com.qq.modules.fuben.model.templates.ce
{
   public class FubenTemplateCE
   {
       
      
      protected var _id:Number;
      
      protected var _chapterId:Number;
      
      protected var _stageId:Number;
      
      protected var _mode:Number;
      
      protected var _energyCost:Number;
      
      protected var _name:String;
      
      protected var _importantloot:String;
      
      protected var _level:Number;
      
      protected var _bonusRequired:String;
      
      protected var _bonusFirst:String;
      
      protected var _bonusOptional:String;
      
      protected var _xy:String;
      
      protected var _icon:Number;
      
      public function FubenTemplateCE()
      {
         super();
      }
      
      public function load(param1:Object) : void
      {
         this._id = param1.id;
         this._chapterId = param1.chapterId;
         this._stageId = param1.stageId;
         this._mode = param1.mode;
         this._energyCost = param1.energyCost;
         this._name = param1.name;
         this._importantloot = param1.importantloot;
         this._level = param1.level;
         this._bonusRequired = param1.bonusRequired;
         this._bonusFirst = param1.bonusFirst;
         this._bonusOptional = param1.bonusOptional;
         this._xy = param1.xy;
         this._icon = param1.icon;
      }
      
      public function get id() : Number
      {
         return this._id;
      }
      
      public function get chapterId() : Number
      {
         return this._chapterId;
      }
      
      public function get stageId() : Number
      {
         return this._stageId;
      }
      
      public function get mode() : Number
      {
         return this._mode;
      }
      
      public function get energyCost() : Number
      {
         return this._energyCost;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function get importantloot() : String
      {
         return this._importantloot;
      }
      
      public function get level() : Number
      {
         return this._level;
      }
      
      public function get bonusRequired() : String
      {
         return this._bonusRequired;
      }
      
      public function get bonusFirst() : String
      {
         return this._bonusFirst;
      }
      
      public function get bonusOptional() : String
      {
         return this._bonusOptional;
      }
      
      public function get xy() : String
      {
         return this._xy;
      }
      
      public function get icon() : Number
      {
         return this._icon;
      }
   }
}
