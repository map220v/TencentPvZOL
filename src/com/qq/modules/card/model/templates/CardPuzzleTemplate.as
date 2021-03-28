package com.qq.modules.card.model.templates
{
   import com.qq.modules.bag.model.vo.ItemVO;
   import com.qq.modules.card.model.templates.ce.CardPuzzleTemplateCE;
   
   public class CardPuzzleTemplate extends CardPuzzleTemplateCE
   {
       
      
      private var m_vecCostItem:Vector.<ItemVO>;
      
      private var m_vecAttribute:Vector.<CardPuzzleAttribute>;
      
      private var m_finishAttribute:CardPuzzleAttribute;
      
      public function CardPuzzleTemplate()
      {
         super();
      }
      
      public function get bounds() : int
      {
         return puzzleWidth * puzzleHeight;
      }
      
      public function get costItem() : Vector.<ItemVO>
      {
         var _loc1_:Array = null;
         var _loc2_:String = null;
         var _loc3_:Array = null;
         var _loc4_:int = 0;
         if(this.m_vecCostItem == null)
         {
            this.m_vecCostItem = new Vector.<ItemVO>(this.bounds,true);
            _loc1_ = super.originalCostItem.split(";");
            _loc4_ = 0;
            while(_loc4_ < this.bounds)
            {
               _loc2_ = _loc1_[_loc4_];
               if(_loc2_)
               {
                  _loc3_ = _loc2_.split(":");
                  if(_loc3_ && _loc3_.length == 2)
                  {
                     this.m_vecCostItem[_loc4_] = new ItemVO(_loc3_[0],_loc3_[1]);
                  }
               }
               _loc4_++;
            }
         }
         return this.m_vecCostItem;
      }
      
      public function getAttribute(param1:int) : CardPuzzleAttribute
      {
         var _loc2_:String = null;
         var _loc3_:Object = null;
         var _loc4_:CardPuzzleAttribute = null;
         var _loc5_:Array = null;
         var _loc6_:Array = null;
         var _loc7_:int = 0;
         var _loc8_:String = null;
         if(this.m_vecAttribute == null)
         {
            this.m_vecAttribute = new Vector.<CardPuzzleAttribute>(this.bounds,true);
            _loc3_ = this;
            _loc7_ = 0;
            while(_loc7_ < this.bounds)
            {
               _loc2_ = _loc3_["originalAttribute_" + (_loc7_ + 1)];
               _loc5_ = _loc2_.split(";");
               _loc4_ = new CardPuzzleAttribute();
               this.m_vecAttribute[_loc7_] = _loc4_;
               for each(_loc8_ in _loc5_)
               {
                  _loc6_ = _loc8_.split(":");
                  _loc4_.setAttribute(_loc6_[0],_loc6_[1]);
               }
               _loc7_++;
            }
         }
         return this.m_vecAttribute[param1];
      }
      
      public function get finishAttribute() : CardPuzzleAttribute
      {
         var _loc1_:Array = null;
         var _loc2_:Array = null;
         var _loc3_:String = null;
         if(this.m_finishAttribute == null)
         {
            this.m_finishAttribute = new CardPuzzleAttribute();
            _loc1_ = originalFinishAttribute.split(",");
            for each(_loc3_ in _loc1_)
            {
               _loc2_ = _loc3_.split(":");
               this.m_finishAttribute.setAttribute(_loc2_[0],_loc2_[1]);
            }
         }
         return this.m_finishAttribute;
      }
   }
}
