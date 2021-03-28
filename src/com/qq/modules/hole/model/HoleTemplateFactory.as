package com.qq.modules.hole.model
{
   import com.qq.data.DataCacheManager;
   import com.qq.modules.hole.model.templates.HoleBuyLightTemplate;
   import com.qq.modules.hole.model.templates.HoleUseTypeTemplate;
   import com.qq.modules.hole.model.templates.ce.HoleConditionTemplateCE;
   import com.qq.modules.hole.model.templates.ce.HoleRewardTemplateCE;
   import com.qq.utils.db.ClientDBTableName;
   
   public class HoleTemplateFactory
   {
      
      private static var s_instance:HoleTemplateFactory;
       
      
      private var m_vecHoleUseType:Vector.<HoleUseTypeTemplate>;
      
      private var m_vecHoleCondition:Vector.<HoleConditionTemplateCE>;
      
      private var m_vecHoleBuyLight:Vector.<HoleBuyLightTemplate>;
      
      private var m_vecHoleReward:Vector.<HoleRewardTemplateCE>;
      
      private var m_vecCostItem:Vector.<int>;
      
      private var m_buyLightLimit:int;
      
      public function HoleTemplateFactory()
      {
         var _loc2_:HoleUseTypeTemplate = null;
         super();
         var _loc1_:DataCacheManager = DataCacheManager.getInstance();
         this.m_vecHoleUseType = Vector.<HoleUseTypeTemplate>(_loc1_.getTemplateCacheData(ClientDBTableName.TABLE_HOLE_USE_TYPE,HoleUseTypeTemplate));
         this.m_vecHoleBuyLight = Vector.<HoleBuyLightTemplate>(_loc1_.getTemplateCacheData(ClientDBTableName.TABLE_HOLE_BUY_LIGHT,HoleBuyLightTemplate));
         this.m_vecHoleCondition = Vector.<HoleConditionTemplateCE>(_loc1_.getTemplateCacheData(ClientDBTableName.TABLE_HOLE_CONDITION,HoleConditionTemplateCE));
         this.m_vecHoleReward = Vector.<HoleRewardTemplateCE>(_loc1_.getTemplateCacheData(ClientDBTableName.TABLE_HOLE_REWARD,HoleRewardTemplateCE));
         this.m_buyLightLimit = this.m_vecHoleBuyLight.length;
         this.m_vecCostItem = new Vector.<int>();
         for each(_loc2_ in this.m_vecHoleUseType)
         {
            if(this.m_vecCostItem.indexOf(_loc2_.useItemID) < 0)
            {
               this.m_vecCostItem.push(_loc2_.useItemID);
            }
         }
      }
      
      public static function get instance() : HoleTemplateFactory
      {
         if(s_instance == null)
         {
            s_instance = new HoleTemplateFactory();
         }
         return s_instance;
      }
      
      public function getCostItemList() : Vector.<int>
      {
         return this.m_vecCostItem;
      }
      
      public function getHoleTypeByItemID(param1:int) : Vector.<HoleUseTypeTemplate>
      {
         var _loc3_:HoleUseTypeTemplate = null;
         var _loc2_:Vector.<HoleUseTypeTemplate> = new Vector.<HoleUseTypeTemplate>();
         for each(_loc3_ in this.m_vecHoleUseType)
         {
            if(_loc3_.useItemID == param1)
            {
               _loc2_.push(_loc3_);
            }
         }
         return _loc2_.sort(HoleUseTypeTemplate.sortByCostTime);
      }
      
      public function getBuyTemplate(param1:int) : HoleBuyLightTemplate
      {
         var _loc2_:HoleBuyLightTemplate = null;
         for each(_loc2_ in this.m_vecHoleBuyLight)
         {
            if(_loc2_.id == param1)
            {
               return _loc2_;
            }
         }
         return null;
      }
      
      public function get buyLightLimit() : int
      {
         return this.m_buyLightLimit;
      }
      
      public function getHoleOpenLevel(param1:int) : int
      {
         var _loc2_:HoleConditionTemplateCE = null;
         for each(_loc2_ in this.m_vecHoleCondition)
         {
            if(_loc2_.id == param1)
            {
               return _loc2_.openLevel;
            }
         }
         return 0;
      }
      
      public function getHoleType(param1:int) : HoleUseTypeTemplate
      {
         var _loc2_:HoleUseTypeTemplate = null;
         for each(_loc2_ in this.m_vecHoleUseType)
         {
            if(_loc2_.id == param1)
            {
               return _loc2_;
            }
         }
         return null;
      }
      
      public function getReward(param1:int) : HoleRewardTemplateCE
      {
         var _loc3_:HoleRewardTemplateCE = null;
         var _loc2_:int = this.m_vecHoleReward.length;
         var _loc4_:int = _loc2_ - 1;
         while(_loc4_ >= 0)
         {
            _loc3_ = this.m_vecHoleReward[_loc4_];
            if(param1 >= _loc3_.id)
            {
               return _loc3_;
            }
            _loc4_--;
         }
         return null;
      }
   }
}
