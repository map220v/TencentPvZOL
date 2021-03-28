package com.qq.modules.td.data.game.ce
{
   public class TDGameTypeTemplateCE
   {
       
      
      protected var _id:Number;
      
      protected var _isChooseCard:Number;
      
      protected var _hasNormalCardSlot:Number;
      
      protected var _hasMovableCardSlot:Number;
      
      protected var _hasLimitCountCardSlot:Number;
      
      protected var _isCropConsumeSun:Number;
      
      protected var _isDropSun:Number;
      
      protected var _hasPlantSpecialSkill:Number;
      
      protected var _hasScorePanel:Number;
      
      protected var _hasShovelPanel:Number;
      
      protected var _hasBossHpBar:Number;
      
      protected var _loadExtraRes:String;
      
      public function TDGameTypeTemplateCE()
      {
         super();
      }
      
      public function load(param1:Object) : void
      {
         this._id = param1.id;
         this._isChooseCard = param1.isChooseCard;
         this._hasNormalCardSlot = param1.hasNormalCardSlot;
         this._hasMovableCardSlot = param1.hasMovableCardSlot;
         this._hasLimitCountCardSlot = param1.hasLimitCountCardSlot;
         this._isCropConsumeSun = param1.isCropConsumeSun;
         this._isDropSun = param1.isDropSun;
         this._hasPlantSpecialSkill = param1.hasPlantSpecialSkill;
         this._hasScorePanel = param1.hasScorePanel;
         this._hasShovelPanel = param1.hasShovelPanel;
         this._hasBossHpBar = param1.hasBossHpBar;
         this._loadExtraRes = param1.loadExtraRes;
      }
      
      public function get id() : Number
      {
         return this._id;
      }
      
      public function get isChooseCard() : Number
      {
         return this._isChooseCard;
      }
      
      public function get hasNormalCardSlot() : Number
      {
         return this._hasNormalCardSlot;
      }
      
      public function get hasMovableCardSlot() : Number
      {
         return this._hasMovableCardSlot;
      }
      
      public function get hasLimitCountCardSlot() : Number
      {
         return this._hasLimitCountCardSlot;
      }
      
      public function get isCropConsumeSun() : Number
      {
         return this._isCropConsumeSun;
      }
      
      public function get isDropSun() : Number
      {
         return this._isDropSun;
      }
      
      public function get hasPlantSpecialSkill() : Number
      {
         return this._hasPlantSpecialSkill;
      }
      
      public function get hasScorePanel() : Number
      {
         return this._hasScorePanel;
      }
      
      public function get hasShovelPanel() : Number
      {
         return this._hasShovelPanel;
      }
      
      public function get hasBossHpBar() : Number
      {
         return this._hasBossHpBar;
      }
      
      public function get loadExtraRes() : String
      {
         return this._loadExtraRes;
      }
   }
}
