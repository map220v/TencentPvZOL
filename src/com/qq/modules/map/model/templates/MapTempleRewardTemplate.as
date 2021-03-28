package com.qq.modules.map.model.templates
{
   import com.qq.modules.bag.model.vo.ItemVO;
   import com.qq.modules.map.model.templates.ce.MapTempleRewardTemplateCE;
   
   public class MapTempleRewardTemplate extends MapTempleRewardTemplateCE
   {
       
      
      private var m_reward:ItemVO;
      
      public function MapTempleRewardTemplate()
      {
         super();
      }
      
      public function get reward() : ItemVO
      {
         if(this.m_reward == null)
         {
            this.m_reward = ItemVO.createByString(originalReward,":");
         }
         return this.m_reward;
      }
   }
}
