package com.qq.modules.hole.model.templates
{
   import com.qq.modules.bag.model.vo.ItemVO;
   import com.qq.modules.hole.model.templates.ce.HoleBuyLightTemplateCE;
   
   public class HoleBuyLightTemplate extends HoleBuyLightTemplateCE
   {
       
      
      private var m_costItem:ItemVO;
      
      private var m_buyItem:ItemVO;
      
      public function HoleBuyLightTemplate()
      {
         super();
      }
      
      public function get costItem() : ItemVO
      {
         if(this.m_costItem == null)
         {
            this.m_costItem = ItemVO.createByString(originalCost,":");
         }
         return this.m_costItem;
      }
      
      public function get buyItem() : ItemVO
      {
         if(this.m_buyItem == null)
         {
            this.m_buyItem = ItemVO.createByString(originalItem,":");
         }
         return this.m_buyItem;
      }
   }
}
