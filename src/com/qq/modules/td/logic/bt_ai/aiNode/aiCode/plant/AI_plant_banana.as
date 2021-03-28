package com.qq.modules.td.logic.bt_ai.aiNode.aiCode.plant
{
   import com.qq.constant.td.TDConstant;
   import com.qq.modules.td.command.game.TDGameObjectCmd;
   import com.qq.modules.td.data.map.TDMapTileData;
   import com.qq.modules.td.logic.bt_ai.aiNode.BaseNodePvz;
   import com.qq.modules.td.logic.bt_ai.aiNode.executeNode.plant.ExePlantAttack;
   import com.qq.modules.td.logic.bt_ai.aiNode.executeNode.plant.ExePlantResetDuration;
   import com.qq.modules.td.logic.bt_ai.aiNode.requireNode.ReqHasShootZombie;
   import com.qq.modules.td.logic.bt_ai.aiNode.requireNode.ReqPlantCurAction;
   import com.qq.modules.td.logic.bt_ai.aiNode.requireNode.ReqPlantDurationExpire;
   import com.qq.modules.td.logic.talent.TalentManager;
   import com.qq.modules.td.logic.unit.plant.BasicPlant;
   import com.qq.modules.td.model.TDGameInfo;
   
   public class AI_plant_banana extends BaseNodePvz
   {
       
      
      private var castTimes:int = 0;
      
      public function AI_plant_banana()
      {
         super();
      }
      
      override public function calculate() : Boolean
      {
         var _loc1_:TDMapTileData = null;
         var _loc2_:uint = 0;
         var _loc3_:uint = 0;
         this.checkHp();
         if(this.castTimes == 0 && TalentManager.instance.getCastSkillAfterPlantTimes((selfObj as BasicPlant).plantData.plantStaticInfo,selfObj.uid) == 0)
         {
            ++this.castTimes;
            TDGameObjectCmd.releaseSpecialSkill(selfObj.uid,false);
         }
         else if(ReqPlantCurAction.calculate(selfObj,false,TDConstant.PBananaAction_Attack))
         {
            _loc1_ = TDGameInfo.getInstance().getRoadTileByIndex(selfObj.objectModel.tileIndex);
            _loc2_ = Math.max(_loc1_.roadCol - 5,0);
            _loc3_ = Math.max(_loc1_.roadCol - 1,0);
            if(ReqPlantDurationExpire.calculate(selfObj) && ReqHasShootZombie.calculateAttackArea(selfObj as BasicPlant,_loc2_,_loc3_,_loc1_.roadRow,_loc1_.roadRow))
            {
               ExePlantResetDuration.calculate(selfObj);
               ExePlantAttack.calculate(selfObj,TDConstant.PBananaAction_Attack);
            }
            else if(selfObj.getActionID() != TDConstant.PlantAction_Idle)
            {
               if(selfObj.getRunningProp(TDConstant.Gameobject_Prop_Banana_Weak) == true)
               {
                  selfObj.setAction(TDConstant.PlantAction_Idle,[[TDConstant.PlantAnmi_Idle2]]);
               }
               else
               {
                  selfObj.setAction(TDConstant.PlantAction_Idle,[[TDConstant.PlantAnmi_Idle]]);
               }
            }
         }
         return true;
      }
      
      private function checkHp() : void
      {
         if(selfObj.objectModel.curHp.get() <= selfObj.objectModel.maxHp.get() * 0.5)
         {
            selfObj.setRunningProp(TDConstant.Gameobject_Prop_Banana_Weak,true);
         }
         else
         {
            selfObj.setRunningProp(TDConstant.Gameobject_Prop_Banana_Weak,false);
         }
      }
   }
}
