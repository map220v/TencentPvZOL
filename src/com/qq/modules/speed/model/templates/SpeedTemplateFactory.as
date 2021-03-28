package com.qq.modules.speed.model.templates
{
   import com.qq.data.DataCacheManager;
   import com.qq.modules.speed.model.templates.ce.SpeedEquipmentTemplateCE;
   import com.qq.modules.speed.model.templates.ce.SpeedNutritionTemplateCE;
   import com.qq.modules.speed.model.templates.ce.SpeedPlantLevelTemplateCE;
   import com.qq.modules.speed.model.templates.ce.SpeedWorldTreeTemplateCE;
   import com.qq.utils.db.ClientDBTableName;
   
   public class SpeedTemplateFactory
   {
      
      private static var s_instance:SpeedTemplateFactory;
       
      
      private var m_vecPlantLevel:Vector.<SpeedPlantLevelTemplateCE>;
      
      private var m_vecWorldTree:Vector.<SpeedWorldTreeTemplateCE>;
      
      private var m_vecNutrition:Vector.<SpeedNutritionTemplateCE>;
      
      private var m_vecEquipment:Vector.<SpeedEquipmentTemplateCE>;
      
      public function SpeedTemplateFactory()
      {
         super();
         var _loc1_:DataCacheManager = DataCacheManager.getInstance();
         this.m_vecPlantLevel = Vector.<SpeedPlantLevelTemplateCE>(_loc1_.getTemplateCacheData(ClientDBTableName.TABLE_SPEED_PLANTLEVEL,SpeedPlantLevelTemplateCE));
         this.m_vecWorldTree = Vector.<SpeedWorldTreeTemplateCE>(_loc1_.getTemplateCacheData(ClientDBTableName.TABLE_SPEED_WORLDTREE,SpeedWorldTreeTemplateCE));
         this.m_vecEquipment = Vector.<SpeedEquipmentTemplateCE>(_loc1_.getTemplateCacheData(ClientDBTableName.TABLE_SPEED_EQUIPMENT,SpeedEquipmentTemplateCE));
         this.m_vecNutrition = Vector.<SpeedNutritionTemplateCE>(_loc1_.getTemplateCacheData(ClientDBTableName.TABLE_SPEED_NUTRITION,SpeedNutritionTemplateCE));
      }
      
      public static function get instance() : SpeedTemplateFactory
      {
         if(s_instance == null)
         {
            s_instance = new SpeedTemplateFactory();
         }
         return s_instance;
      }
      
      public function getSpeedForPlant(param1:int) : int
      {
         var _loc2_:SpeedPlantLevelTemplateCE = null;
         for each(_loc2_ in this.m_vecPlantLevel)
         {
            if(_loc2_.level == param1)
            {
               return _loc2_.speed;
            }
         }
         return 0;
      }
      
      public function getSpeedForWorldTree(param1:int) : int
      {
         var _loc2_:SpeedWorldTreeTemplateCE = null;
         for each(_loc2_ in this.m_vecWorldTree)
         {
            if(_loc2_.level == param1)
            {
               return _loc2_.speed;
            }
         }
         return 0;
      }
      
      public function getSpeedForEquipment(param1:int) : int
      {
         var _loc2_:SpeedEquipmentTemplateCE = null;
         for each(_loc2_ in this.m_vecEquipment)
         {
            if(_loc2_.level == param1)
            {
               return _loc2_.speed;
            }
         }
         return 0;
      }
      
      public function getSpeedForNutrition(param1:int, param2:int) : int
      {
         var _loc3_:SpeedNutritionTemplateCE = null;
         for each(_loc3_ in this.m_vecNutrition)
         {
            if(_loc3_.level == param1 && _loc3_.quality == param2)
            {
               return _loc3_.speed;
            }
         }
         return 0;
      }
   }
}
