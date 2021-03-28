package com.qq.modules.td.logic.bt_ai.aiNode.aiCode.plant
{
   import com.qq.constant.td.TDConstant;
   import com.qq.modules.td.command.game.TDGameObjectCmd;
   import com.qq.modules.td.logic.bt_ai.aiNode.BasePlantNodePvz;
   import com.qq.modules.td.logic.bt_ai.aiNode.executeNode.ExeDoAction;
   import com.qq.modules.td.logic.bt_ai.aiNode.requireNode.ReqPlantCurAction;
   import com.qq.modules.td.logic.bt_ai.aiNode.requireNode.ReqPlantDurationExpire;
   import com.qq.modules.td.logic.talent.TalentManager;
   import com.qq.modules.td.logic.unit.plant.BasicPlant;
   
   public class AI_plant_coconutCannon extends BasePlantNodePvz
   {
       
      
      private var castTimes:int = 0;
      
      public function AI_plant_coconutCannon()
      {
         super();
      }
      
      override public function calculate() : Boolean
      {
         var _loc1_:Boolean = false;
         if(this.castTimes == 0 && TalentManager.instance.getCastSkillAfterPlantTimes((selfObj as BasicPlant).plantData.plantStaticInfo,selfObj.uid) == 0)
         {
            ++this.castTimes;
            TDGameObjectCmd.releaseSpecialSkill(selfObj.uid,false);
         }
         else
         {
            _loc1_ = selfObj.getRunningProp(TDConstant.Gameobject_Prop_IsSleeping);
            if(_loc1_)
            {
               if(ReqPlantDurationExpire.calculate(selfObj))
               {
                  ExeDoAction.calculateStatic(selfObj,TDConstant.PlantAction_WakeUp);
               }
               else
               {
                  ExeDoAction.calculateStatic(selfObj,TDConstant.PlantAction_Sleep);
               }
            }
            else if(ReqPlantCurAction.calculate(selfObj,false,TDConstant.PCoconutCannonAction_Shoot))
            {
               ExeDoAction.calculateStatic(selfObj,TDConstant.PCoconutCannonAction_Idle);
            }
         }
         return true;
      }
   }
}
