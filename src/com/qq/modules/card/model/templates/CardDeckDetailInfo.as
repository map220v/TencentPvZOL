package com.qq.modules.card.model.templates
{
   public class CardDeckDetailInfo
   {
       
      
      public var cardId:int;
      
      public var deckId:int;
      
      public var componentPlants:Array;
      
      public var attributePromote:Array;
      
      public var featureIds:Array;
      
      public var skillId:int;
      
      public function CardDeckDetailInfo()
      {
         this.componentPlants = [];
         this.attributePromote = [];
         this.featureIds = [];
         super();
      }
   }
}
