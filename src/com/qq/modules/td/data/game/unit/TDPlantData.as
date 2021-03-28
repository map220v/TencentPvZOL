package com.qq.modules.td.data.game.unit
{
   import com.qq.constant.td.TDConstant;
   import com.qq.modules.td.data.TDDataFactory;
   import com.qq.modules.td.data.game.unit.basic.TDGameObjectData;
   import com.qq.modules.td.logic.talent.TalentManager;
   import com.qq.modules.td.logic.talent.TalentPData;
   import com.qq.modules.td.logic.unit.plant.BasicPlant;
   import com.tencent.protobuf.Int64;
   
   public class TDPlantData extends TDGameObjectData
   {
       
      
      public var roleID:Int64;
      
      public var plantStaticInfo:TDPlantStaticInfo;
      
      public var isCoolDown:Boolean = false;
      
      private var _plantHeight:int;
      
      private var _durationPlus:Number = 1;
      
      private var _protectedPlantUID:int = -1;
      
      public function TDPlantData(param1:int, param2:int)
      {
         super(param1,param2);
      }
      
      override public function init() : void
      {
         this.plantStaticInfo = TDDataFactory.instance.getPlantInfoByID(unitType);
         staticInfo = this.plantStaticInfo.baseInfo;
         this._plantHeight = this.plantStaticInfo.baseInfo.bodyHeight;
         super.init();
         maxHp = new TalentPData(this.plantStaticInfo);
         curHp.set(maxHp.get());
         camp = TDConstant.TDCamp_Self;
      }
      
      public function setProtectedPlant(param1:BasicPlant) : void
      {
         if(param1 != null)
         {
            this._protectedPlantUID = param1.uid;
         }
         else
         {
            this._protectedPlantUID = -1;
         }
      }
      
      public function getProtectedPlantUID() : int
      {
         return this._protectedPlantUID;
      }
      
      public function get duration() : int
      {
         return (this.plantStaticInfo.baseInfo.duration + TalentManager.instance.getPlusDurationTime(this.plantStaticInfo)) * this._durationPlus;
      }
      
      public function addDurationPlus(param1:Number) : void
      {
         this._durationPlus *= 1 + param1;
      }
      
      public function resetDuration() : void
      {
         this._durationPlus = 1;
      }
      
      override protected function getSortValue() : int
      {
         var _loc1_:int = this.plantStaticInfo.baseInfo.getParam(TDConstant.NormalObj_Param_DEPTH_ADD);
         var _loc2_:int = 0;
         switch(this.plantStaticInfo.baseInfo.usefulness)
         {
            case TDConstant.PlantUsefulness_Other:
               _loc2_ = 4000;
               break;
            case TDConstant.PlantUsefulness_Protected:
               _loc2_ = 3000;
               break;
            case TDConstant.PlantUsefulness_Plant:
            case TDConstant.PlantUsefulness_Gravebuster:
               _loc2_ = 2000;
               break;
            case TDConstant.PlantUsefulness_Container:
               _loc2_ = -1000;
         }
         return _loc2_ + _loc1_;
      }
      
      public function get plantHeight() : int
      {
         return this._plantHeight;
      }
      
      public function set plantHeight(param1:int) : void
      {
         this._plantHeight = param1;
      }
      
      override public function isAlive() : Boolean
      {
         if(!isVaild)
         {
            return false;
         }
         return curHp.get() > 0;
      }
   }
}
