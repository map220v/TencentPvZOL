package com.qq.modules.main.model.settings.plantTalent
{
   import com.qq.modules.main.model.settings.plantTalent.ce.PlantTalentTemplateCE;
   
   public class PlantTalentSetting extends PlantTalentTemplateCE
   {
       
      
      public function PlantTalentSetting()
      {
         super();
      }
      
      public function getConditionType() : int
      {
         var _loc1_:Array = advancedCond.split(";");
         if(_loc1_.length > 0)
         {
            return parseInt(_loc1_[0]);
         }
         return 0;
      }
   }
}
