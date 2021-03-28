package com.qq.modules.card.model.templates.ce
{
   public class CardForgeChanceTemplateCE
   {
       
      
      protected var _id:Number;
      
      protected var _forgeCardStarLv:Number;
      
      protected var _costItemID:Number;
      
      protected var _successChance:Number;
      
      public function CardForgeChanceTemplateCE()
      {
         super();
      }
      
      public function load(param1:Object) : void
      {
         this._id = param1.id;
         this._forgeCardStarLv = param1.forgeCardStarLv;
         this._costItemID = param1.costItemID;
         this._successChance = param1.successChance;
      }
      
      public function get id() : Number
      {
         return this._id;
      }
      
      public function get forgeCardStarLv() : Number
      {
         return this._forgeCardStarLv;
      }
      
      public function get costItemID() : Number
      {
         return this._costItemID;
      }
      
      public function get successChance() : Number
      {
         return this._successChance;
      }
   }
}
