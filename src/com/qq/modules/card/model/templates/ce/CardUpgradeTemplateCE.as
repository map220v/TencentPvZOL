package com.qq.modules.card.model.templates.ce
{
   public class CardUpgradeTemplateCE
   {
       
      
      protected var _id:Number;
      
      protected var _levelNeed:Number;
      
      protected var _forgeLvNeed:Number;
      
      protected var _costItemID:Number;
      
      protected var _costItemNum:Number;
      
      protected var _costCoinNum:Number;
      
      protected var _newCardId:Number;
      
      public function CardUpgradeTemplateCE()
      {
         super();
      }
      
      public function load(param1:Object) : void
      {
         this._id = param1.id;
         this._levelNeed = param1.levelNeed;
         this._forgeLvNeed = param1.forgeLvNeed;
         this._costItemID = param1.costItemID;
         this._costItemNum = param1.costItemNum;
         this._costCoinNum = param1.costCoinNum;
         this._newCardId = param1.newCardId;
      }
      
      public function get id() : Number
      {
         return this._id;
      }
      
      public function get levelNeed() : Number
      {
         return this._levelNeed;
      }
      
      public function get forgeLvNeed() : Number
      {
         return this._forgeLvNeed;
      }
      
      public function get costItemID() : Number
      {
         return this._costItemID;
      }
      
      public function get costItemNum() : Number
      {
         return this._costItemNum;
      }
      
      public function get costCoinNum() : Number
      {
         return this._costCoinNum;
      }
      
      public function get newCardId() : Number
      {
         return this._newCardId;
      }
   }
}
