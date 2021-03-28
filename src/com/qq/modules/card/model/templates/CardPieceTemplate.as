package com.qq.modules.card.model.templates
{
   import com.qq.modules.card.model.templates.ce.CardPieceTemplateCE;
   
   public class CardPieceTemplate extends CardPieceTemplateCE
   {
       
      
      private var m_vecPos:Vector.<uint>;
      
      public function CardPieceTemplate()
      {
         super();
      }
      
      public function get posList() : Vector.<uint>
      {
         var _loc1_:Array = null;
         var _loc2_:String = null;
         if(this.m_vecPos == null)
         {
            this.m_vecPos = new Vector.<uint>();
            _loc1_ = originalPos.split(",");
            for each(_loc2_ in _loc1_)
            {
               if(_loc2_ != "")
               {
                  this.m_vecPos.push(parseInt(_loc2_));
               }
            }
         }
         return this.m_vecPos;
      }
   }
}
