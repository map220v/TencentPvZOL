package com.qq.modules.td.logic.talent.talentEffect
{
   import com.qq.modules.td.data.game.unit.TDPlantBaseStaticInfo;
   import com.qq.modules.td.data.game.unit.TDPlantStaticInfo;
   import org.robotlegs.mvcs.Actor;
   
   public class TalentEffect extends Actor implements ITalentEffect
   {
       
      
      protected var _plantType:int;
      
      protected var params:Array;
      
      public function TalentEffect()
      {
         super();
      }
      
      public function setData(param1:Array) : void
      {
         this.params = param1;
      }
      
      public function get plantType() : int
      {
         return this._plantType;
      }
      
      public function set plantType(param1:int) : void
      {
         this._plantType = param1;
      }
      
      protected function hasSamePlantType2(param1:TDPlantBaseStaticInfo) : Boolean
      {
         var _loc2_:int = param1.prePlantType == 0 ? int(param1.type) : int(param1.prePlantType);
         if(_loc2_ == this.plantType)
         {
            return true;
         }
         return false;
      }
      
      protected function hasSamePlantType(param1:TDPlantStaticInfo) : Boolean
      {
         var _loc2_:int = param1.baseInfo.prePlantType == 0 ? int(param1.baseInfo.id) : int(param1.baseInfo.prePlantType);
         if(_loc2_ == this.plantType)
         {
            return true;
         }
         return false;
      }
      
      public function dispose() : void
      {
      }
   }
}
