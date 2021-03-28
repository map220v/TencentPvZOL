package com.qq.modules.card.model.templates
{
   import com.qq.modules.card.model.templates.ce.CardPieceDropTemplateCE;
   
   public class CardPieceDropTemplate extends CardPieceDropTemplateCE
   {
       
      
      private var m_vecDrop:Vector.<int>;
      
      public function CardPieceDropTemplate()
      {
         super();
      }
      
      public function get dropList() : Vector.<int>
      {
         var _loc1_:Array = null;
         var _loc2_:int = 0;
         if(this.m_vecDrop == null)
         {
            this.m_vecDrop = new Vector.<int>();
            if(originalDrop && originalDrop.length > 0)
            {
               _loc1_ = originalDrop.split(",");
               for each(_loc2_ in _loc1_)
               {
                  this.m_vecDrop.push(_loc2_);
               }
            }
         }
         return this.m_vecDrop;
      }
   }
}
