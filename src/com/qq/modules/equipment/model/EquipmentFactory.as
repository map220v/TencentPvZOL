package com.qq.modules.equipment.model
{
   import com.qq.data.DataCacheManager;
   import com.qq.modules.equipment.model.templates.EquipmentBeadTemplate;
   import com.qq.modules.equipment.model.templates.EquipmentItemTemplate;
   import com.qq.modules.equipment.model.templates.EquipmentLevelTemplate;
   import com.qq.modules.equipment.model.templates.EquipmentPartTemplate;
   import com.qq.modules.equipment.model.templates.EquipmentPoolTemplate;
   import com.qq.modules.equipment.model.templates.EquipmentRankTemplate;
   import com.qq.utils.db.ClientDBTableName;
   
   public class EquipmentFactory
   {
      
      private static var s_instance:EquipmentFactory;
       
      
      private var m_vecEitem:Vector.<EquipmentItemTemplate>;
      
      private var m_vecEpool:Vector.<EquipmentPoolTemplate>;
      
      private var m_vecEpart:Vector.<EquipmentPartTemplate>;
      
      private var m_vecElevel:Vector.<EquipmentLevelTemplate>;
      
      private var m_vecErank:Vector.<EquipmentRankTemplate>;
      
      private var m_vecEbead:Vector.<EquipmentBeadTemplate>;
      
      private var _maxEquipmentLV:int = 0;
      
      public function EquipmentFactory()
      {
         super();
         var _loc1_:DataCacheManager = DataCacheManager.getInstance();
         this.m_vecEitem = Vector.<EquipmentItemTemplate>(_loc1_.getTemplateCacheData(ClientDBTableName.TABLE_EQUIPMENT_ITEM,EquipmentItemTemplate));
         this.m_vecEpool = Vector.<EquipmentPoolTemplate>(_loc1_.getTemplateCacheData(ClientDBTableName.TABLE_EQUIPMENT_POOL,EquipmentPoolTemplate));
         this.m_vecErank = Vector.<EquipmentRankTemplate>(_loc1_.getTemplateCacheData(ClientDBTableName.TABLE_EQUIPMENT_RANK,EquipmentRankTemplate));
         this.m_vecEbead = Vector.<EquipmentBeadTemplate>(_loc1_.getTemplateCacheData(ClientDBTableName.TABLE_EQUIPMENT_BEAD,EquipmentBeadTemplate));
      }
      
      public static function get instance() : EquipmentFactory
      {
         if(s_instance == null)
         {
            s_instance = new EquipmentFactory();
         }
         return s_instance;
      }
      
      public function get allPool() : Vector.<EquipmentPoolTemplate>
      {
         return this.m_vecEpool;
      }
      
      public function getPoolTemplateByID(param1:int) : EquipmentPoolTemplate
      {
         var _loc2_:EquipmentPoolTemplate = null;
         for each(_loc2_ in this.m_vecEpool)
         {
            if(_loc2_.id == param1)
            {
               return _loc2_;
            }
         }
         return null;
      }
      
      public function get allEquipment() : Vector.<EquipmentItemTemplate>
      {
         return this.m_vecEitem;
      }
      
      public function getCanCreateEquipment(param1:int, param2:int) : EquipmentItemTemplate
      {
         var _loc3_:EquipmentItemTemplate = null;
         for each(_loc3_ in this.m_vecEitem)
         {
            if(_loc3_.rank == 1 && _loc3_.position == param1)
            {
               if(_loc3_.plantType == 0 || _loc3_.plantType == param2)
               {
                  return _loc3_;
               }
            }
         }
         return null;
      }
      
      public function getEquipmentItemByItemID(param1:int) : EquipmentItemTemplate
      {
         var _loc2_:EquipmentItemTemplate = null;
         for each(_loc2_ in this.m_vecEitem)
         {
            if(_loc2_.id == param1)
            {
               return _loc2_;
            }
         }
         return null;
      }
      
      public function getEquipmentLevel(param1:int, param2:int) : EquipmentLevelTemplate
      {
         var _loc3_:EquipmentLevelTemplate = null;
         if(this.m_vecElevel == null)
         {
            this.m_vecElevel = Vector.<EquipmentLevelTemplate>(DataCacheManager.getInstance().getTemplateCacheData(ClientDBTableName.TABLE_EQUIPMENT_LEVEL,EquipmentLevelTemplate));
         }
         for each(_loc3_ in this.m_vecElevel)
         {
            if(_loc3_.type == param1 && _loc3_.level == param2)
            {
               return _loc3_;
            }
         }
         return null;
      }
      
      public function getEquipmentMaxLevel() : int
      {
         var _loc1_:EquipmentLevelTemplate = null;
         if(this._maxEquipmentLV == 0)
         {
            if(this.m_vecElevel == null)
            {
               this.m_vecElevel = Vector.<EquipmentLevelTemplate>(DataCacheManager.getInstance().getTemplateCacheData(ClientDBTableName.TABLE_EQUIPMENT_LEVEL,EquipmentLevelTemplate));
            }
            for each(_loc1_ in this.m_vecElevel)
            {
               if(_loc1_.level > this._maxEquipmentLV)
               {
                  this._maxEquipmentLV = _loc1_.level;
               }
            }
         }
         return this._maxEquipmentLV;
      }
      
      public function getEquipmentRank(param1:int, param2:int) : EquipmentRankTemplate
      {
         var _loc3_:EquipmentRankTemplate = null;
         for each(_loc3_ in this.m_vecErank)
         {
            if(_loc3_.type == param1 && _loc3_.rank == param2)
            {
               return _loc3_;
            }
         }
         return null;
      }
      
      public function getBeadBuyBounds() : int
      {
         return this.m_vecEbead.length;
      }
      
      public function getBeadByBuyCount(param1:int) : EquipmentBeadTemplate
      {
         var _loc2_:EquipmentBeadTemplate = null;
         for each(_loc2_ in this.m_vecEbead)
         {
            if(_loc2_.buyCount == param1)
            {
               return _loc2_;
            }
         }
         return null;
      }
      
      public function getPartByID(param1:int) : EquipmentPartTemplate
      {
         var _loc2_:EquipmentPartTemplate = null;
         if(this.m_vecEpart == null)
         {
            this.m_vecEpart = Vector.<EquipmentPartTemplate>(DataCacheManager.getInstance().getTemplateCacheData(ClientDBTableName.TABLE_EQUIPMENT_PART,EquipmentPartTemplate));
         }
         for each(_loc2_ in this.m_vecEpart)
         {
            if(_loc2_.id == param1)
            {
               return _loc2_;
            }
         }
         return null;
      }
   }
}
