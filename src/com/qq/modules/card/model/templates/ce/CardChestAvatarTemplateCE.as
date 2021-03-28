package com.qq.modules.card.model.templates.ce
{
   public class CardChestAvatarTemplateCE
   {
       
      
      protected var _id:Number;
      
      protected var _forgeType:Number;
      
      protected var _tdPlantId:Number;
      
      protected var _avatarCatalog:Number;
      
      protected var _unLockItemStr:String;
      
      protected var _unLockDec:String;
      
      protected var _order:Number;
      
      public function CardChestAvatarTemplateCE()
      {
         super();
      }
      
      public function load(param1:Object) : void
      {
         this._id = param1.id;
         this._forgeType = param1.forgeType;
         this._tdPlantId = param1.tdPlantId;
         this._avatarCatalog = param1.avatarCatalog;
         this._unLockItemStr = param1.unLockItemStr;
         this._unLockDec = param1.unLockDec;
         this._order = param1.order;
      }
      
      public function get id() : Number
      {
         return this._id;
      }
      
      public function get forgeType() : Number
      {
         return this._forgeType;
      }
      
      public function get tdPlantId() : Number
      {
         return this._tdPlantId;
      }
      
      public function get avatarCatalog() : Number
      {
         return this._avatarCatalog;
      }
      
      public function get unLockItemStr() : String
      {
         return this._unLockItemStr;
      }
      
      public function get unLockDec() : String
      {
         return this._unLockDec;
      }
      
      public function get order() : Number
      {
         return this._order;
      }
   }
}
