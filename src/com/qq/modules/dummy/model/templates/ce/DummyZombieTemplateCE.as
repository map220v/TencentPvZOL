package com.qq.modules.dummy.model.templates.ce
{
   public class DummyZombieTemplateCE
   {
       
      
      protected var _id:Number;
      
      protected var _name:String;
      
      protected var _resName:String;
      
      protected var _type:Number;
      
      protected var _isEnemy:Number;
      
      protected var _rarity:Number;
      
      protected var _activeSkillId:Number;
      
      protected var _passiveSkillId:Number;
      
      protected var _pieceID:Number;
      
      protected var _isShow:Number;
      
      protected var _isComposite:Number;
      
      protected var _compositeStar:Number;
      
      protected var _compositeQuilty:Number;
      
      protected var _iconID:String;
      
      public function DummyZombieTemplateCE()
      {
         super();
      }
      
      public function load(param1:Object) : void
      {
         this._id = param1.id;
         this._name = param1.name;
         this._resName = param1.resName;
         this._type = param1.type;
         this._isEnemy = param1.isEnemy;
         this._rarity = param1.rarity;
         this._activeSkillId = param1.activeSkillId;
         this._passiveSkillId = param1.passiveSkillId;
         this._pieceID = param1.pieceID;
         this._isShow = param1.isShow;
         this._isComposite = param1.isComposite;
         this._compositeStar = param1.compositeStar;
         this._compositeQuilty = param1.compositeQuilty;
         this._iconID = param1.iconID;
      }
      
      public function get id() : Number
      {
         return this._id;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function get resName() : String
      {
         return this._resName;
      }
      
      public function get type() : Number
      {
         return this._type;
      }
      
      public function get isEnemy() : Number
      {
         return this._isEnemy;
      }
      
      public function get rarity() : Number
      {
         return this._rarity;
      }
      
      public function get activeSkillId() : Number
      {
         return this._activeSkillId;
      }
      
      public function get passiveSkillId() : Number
      {
         return this._passiveSkillId;
      }
      
      public function get pieceID() : Number
      {
         return this._pieceID;
      }
      
      public function get isShow() : Number
      {
         return this._isShow;
      }
      
      public function get isComposite() : Number
      {
         return this._isComposite;
      }
      
      public function get compositeStar() : Number
      {
         return this._compositeStar;
      }
      
      public function get compositeQuilty() : Number
      {
         return this._compositeQuilty;
      }
      
      public function get iconID() : String
      {
         return this._iconID;
      }
   }
}
