package com.qq.modules.td.logic.bt_ai.aiNode.aiCode.plant
{
   import com.qq.constant.td.TDConstant;
   import com.qq.modules.td.command.game.TDGameObjectCmd;
   import com.qq.modules.td.data.map.TDMapTileData;
   import com.qq.modules.td.logic.bt_ai.aiNode.BaseNodePvz;
   import com.qq.modules.td.logic.bt_ai.aiNode.executeNode.plant.ExePlantAttack;
   import com.qq.modules.td.logic.bt_ai.aiNode.executeNode.plant.ExePlantIdle;
   import com.qq.modules.td.logic.bt_ai.aiNode.executeNode.plant.ExePlantResetDuration;
   import com.qq.modules.td.logic.bt_ai.aiNode.requireNode.ReqPlantCurAction;
   import com.qq.modules.td.logic.bt_ai.aiNode.requireNode.ReqPlantDurationExpire;
   import com.qq.modules.td.logic.bt_ai.aiUtils.TDSearchTargetUtils;
   import com.qq.modules.td.logic.talent.TalentManager;
   import com.qq.modules.td.logic.unit.plant.BasicPlant;
   import com.qq.modules.td.model.TDGameInfo;
   import flash.geom.Rectangle;
   
   public class AI_plant_snapdragon extends BaseNodePvz
   {
       
      
      private var castTimes:int = 0;
      
      public function AI_plant_snapdragon(param1:int = 30)
      {
         super(param1);
      }
      
      override public function calculate() : Boolean
      {
         var _loc1_:Array = null;
         var _loc2_:Array = null;
         if(this.castTimes == 0 && TalentManager.instance.getCastSkillAfterPlantTimes((selfObj as BasicPlant).plantData.plantStaticInfo,selfObj.uid) == 0)
         {
            ++this.castTimes;
            TDGameObjectCmd.releaseSpecialSkill(selfObj.uid,false);
         }
         else if(ReqPlantCurAction.calculate(selfObj,false,TDConstant.PSnapdragonAction_Attack))
         {
            if(ReqPlantDurationExpire.calculate(selfObj))
            {
               _loc1_ = [this.checkArea];
               _loc2_ = [selfObj.objectModel.roadIndex - 1,selfObj.objectModel.roadIndex,selfObj.objectModel.roadIndex + 1];
               if(TDSearchTargetUtils.searchTargetForPlant(selfObj as BasicPlant,_loc1_,_loc2_).length > 0)
               {
                  ExePlantResetDuration.calculate(selfObj);
                  ExePlantAttack.calculate(selfObj,TDConstant.PSnapdragonAction_Attack,[_loc1_]);
               }
               else
               {
                  ExePlantIdle.calculate(selfObj,TDConstant.PlantAction_Idle);
               }
            }
            else
            {
               ExePlantIdle.calculate(selfObj,TDConstant.PlantAction_Idle);
            }
         }
         return true;
      }
      
      private function get checkArea() : Rectangle
      {
         var _loc1_:Rectangle = new Rectangle();
         var _loc2_:TDMapTileData = TDGameInfo.getInstance().getRoadTileByIndex(selfObj.objectModel.tileIndex);
         if(_loc2_ != null)
         {
            _loc1_.x = _loc2_.rect.left;
            _loc1_.y = _loc2_.rect.top - _loc2_.rect.height;
            _loc1_.width = _loc2_.rect.width * 3;
            _loc1_.height = _loc2_.rect.height * 3;
         }
         return _loc1_;
      }
   }
}
