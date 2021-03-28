package com.qq.modules.td.logic.bt_ai.aiNode.aiCode.plant
{
   import com.qq.constant.td.TDConstant;
   import com.qq.modules.td.command.game.TDGameObjectCmd;
   import com.qq.modules.td.logic.bt_ai.aiNode.BasePlantNodePvz;
   import com.qq.modules.td.logic.bt_ai.aiNode.executeNode.plant.ExePlantAttack;
   import com.qq.modules.td.logic.bt_ai.aiNode.executeNode.plant.ExePlantResetDuration;
   import com.qq.modules.td.logic.bt_ai.aiNode.requireNode.ReqPlantDurationExpire;
   import com.qq.modules.td.logic.talent.TalentManager;
   import com.qq.modules.td.logic.unit.plant.BasicPlant;
   import com.qq.modules.td.logic.unit.plant.NutsPlant;
   import com.qq.modules.td.model.TDGameInfo;
   
   public class AI_plant_Nuts extends BasePlantNodePvz
   {
       
      
      private var m_playedPlantIdle:Boolean = false;
      
      private var m_inited:Boolean;
      
      private var castTimes:int = 0;
      
      public function AI_plant_Nuts(param1:int = 30)
      {
         super(param1);
      }
      
      override public function calculate() : Boolean
      {
         var _loc1_:uint = 0;
         if(this.castTimes == 0 && TalentManager.instance.getCastSkillAfterPlantTimes((selfObj as BasicPlant).plantData.plantStaticInfo,selfObj.uid) == 0)
         {
            ++this.castTimes;
            TDGameObjectCmd.releaseSpecialSkill(selfObj.uid,false);
         }
         else
         {
            if(!this.m_inited)
            {
               this.m_inited = true;
               _loc1_ = TDGameInfo.getInstance().getCurGameTime();
               selfObj.setRunningProp(TDConstant.Gameobject_Prop_Nuts_Heal_Time,_loc1_);
               ExePlantResetDuration.calculate(selfObj);
            }
            if(!this.m_playedPlantIdle)
            {
               this.m_playedPlantIdle = true;
               ExePlantAttack.calculate(selfObj,TDConstant.PNuts_Plant);
            }
            else if(ReqPlantDurationExpire.calculate(selfObj) && (selfObj as NutsPlant).isSleep)
            {
               ExePlantResetDuration.calculate(selfObj);
               ExePlantAttack.calculate(selfObj,TDConstant.PNuts_Recover);
            }
            else if(!(selfObj as NutsPlant).isSleep && this.checkHealDuration())
            {
               ExePlantAttack.calculate(selfObj,TDConstant.PNuts_Recover);
            }
            else
            {
               ExePlantAttack.calculate(selfObj,TDConstant.PNuts_Idle);
            }
         }
         this.checkDamageAlphaEffect();
         return true;
      }
      
      private function checkHealDuration() : Boolean
      {
         var _loc1_:Number = 0;
         if(selfObj.getRunningProp(TDConstant.Gameobject_Prop_Nuts_Heal_Time) != null)
         {
            _loc1_ = selfObj.getRunningProp(TDConstant.Gameobject_Prop_Nuts_Heal_Time);
         }
         var _loc2_:Number = selfObj.objectModel.staticInfo.getParam(TDConstant.Plant_Param_NutsHealDuration) - TalentManager.instance.getPlusDurationTime((selfObj as BasicPlant).plantData.plantStaticInfo);
         if(TDGameInfo.getInstance().getCurGameTime() - _loc1_ > _loc2_)
         {
            return true;
         }
         return false;
      }
      
      public function checkDamageAlphaEffect() : void
      {
      }
   }
}
