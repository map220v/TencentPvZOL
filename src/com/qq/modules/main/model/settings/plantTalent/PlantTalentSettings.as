package com.qq.modules.main.model.settings.plantTalent
{
   import com.qq.data.DataCacheManager;
   import com.qq.modules.main.model.settings.plantTalent.ce.PlantTalentTipTemplateCE;
   import com.qq.modules.td.data.TDDataFactory;
   import com.qq.utils.db.ClientDBTableName;
   
   public class PlantTalentSettings
   {
       
      
      private var plantTalentTips:Array;
      
      public function PlantTalentSettings()
      {
         super();
      }
      
      public function getPlantTalentSetById(param1:int) : PlantTalentSetting
      {
         return DataCacheManager.getInstance().getTemplateDataById(ClientDBTableName.Table_PlantTalentInfo,param1,PlantTalentSetting);
      }
      
      public function getPlantTalentListByPlantId(param1:int) : Vector.<PlantTalentSetting>
      {
         var _loc7_:PlantTalentSetting = null;
         var _loc2_:Vector.<PlantTalentSetting> = new Vector.<PlantTalentSetting>();
         var _loc3_:int = 0;
         var _loc4_:Array;
         var _loc5_:int = (_loc4_ = DataCacheManager.getInstance().getTemplateCacheData(ClientDBTableName.Table_PlantTalentInfo,PlantTalentSetting)).length;
         var _loc6_:int = 0;
         while(_loc6_ < _loc5_)
         {
            if((_loc7_ = _loc4_[_loc6_]).plantId == param1)
            {
               _loc2_[_loc3_] = _loc7_;
               _loc3_++;
            }
            _loc6_++;
         }
         _loc2_.sort(this.sortOnTalentIndex);
         return _loc2_;
      }
      
      public function getPlantByStageId(param1:int) : Array
      {
         var _loc5_:PlantTalentSetting = null;
         var _loc2_:Array = [];
         var _loc3_:Array = [];
         var _loc4_:Array = DataCacheManager.getInstance().getTemplateCacheData(ClientDBTableName.Table_PlantTalentInfo,PlantTalentSetting);
         for each(_loc5_ in _loc4_)
         {
            if(_loc5_.stageId == param1 && _loc3_.indexOf(_loc5_.plantId) < 0)
            {
               _loc3_.push(_loc5_.plantId);
               _loc2_.push(TDDataFactory.instance.getPlantInfoByID(_loc5_.plantId));
            }
         }
         return _loc2_;
      }
      
      private function sortOnTalentIndex(param1:PlantTalentSetting, param2:PlantTalentSetting) : Number
      {
         var _loc3_:Number = param1.talentIndex;
         var _loc4_:Number = param2.talentIndex;
         if(_loc3_ > _loc4_)
         {
            return 1;
         }
         if(_loc3_ < _loc4_)
         {
            return -1;
         }
         return 0;
      }
      
      public function getRandomBubbleTip() : String
      {
         if(this.plantTalentTips == null)
         {
            this.plantTalentTips = DataCacheManager.getInstance().getTemplateCacheData(ClientDBTableName.Table_PlantTalentTip,PlantTalentTipTemplateCE);
         }
         var _loc1_:PlantTalentTipTemplateCE = this.plantTalentTips[int(Math.random() * this.plantTalentTips.length)];
         if(_loc1_)
         {
            return _loc1_.content;
         }
         return "";
      }
   }
}
