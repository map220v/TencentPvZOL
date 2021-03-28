package com.qq.modules.td.logic.bt_ai.aiNode.aiCode.plant
{
   import com.qq.constant.td.TDConstant;
   import com.qq.modules.td.command.game.TDGameObjectCmd;
   import com.qq.modules.td.data.map.TDMapTileData;
   import com.qq.modules.td.logic.bt_ai.aiNode.BasePlantNodePvz;
   import com.qq.modules.td.logic.bt_ai.aiNode.executeNode.ExeDoAction;
   import com.qq.modules.td.logic.bt_ai.aiNode.requireNode.ReqPlantDurationExpire;
   import com.qq.modules.td.logic.bt_ai.aiUtils.TDSearchTargetUtils;
   import com.qq.modules.td.logic.talent.TalentManager;
   import com.qq.modules.td.logic.unit.basic.IGameObject;
   import com.qq.modules.td.logic.unit.plant.BasicPlant;
   import com.qq.modules.td.model.TDGameInfo;
   import flash.geom.Rectangle;
   
   public class AI_plant_springBean extends BasePlantNodePvz
   {
       
      
      private var castTimes:int = 0;
      
      public function AI_plant_springBean(param1:int = 30)
      {
         super(param1);
      }
      
      override public function calculate() : Boolean
      {
         var _loc1_:Boolean = false;
         var _loc2_:Boolean = false;
         var _loc3_:Vector.<IGameObject> = null;
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
            else if(TDSearchTargetUtils.searchTargetForPlant(selfObj as BasicPlant,[this.getAlertArea()],[selfObj.objectModel.roadIndex]).length > 0)
            {
               _loc2_ = selfObj.getRunningProp(TDConstant.Gameobject_Prop_IsReadyToAttack);
               if(_loc2_)
               {
                  _loc3_ = TDSearchTargetUtils.searchTargetForPlantWithAttackArea(plant,[selfObj.objectModel.roadIndex]);
                  if(_loc3_.length > 0)
                  {
                     selfObj.setAttackTarget(_loc3_[0]);
                     ExeDoAction.calculateStatic(selfObj,TDConstant.PSpringbeanAction_Attack);
                  }
                  else
                  {
                     ExeDoAction.calculateStatic(selfObj,TDConstant.PlantAction_AttackIdle);
                  }
               }
               else
               {
                  ExeDoAction.calculateStatic(selfObj,TDConstant.PlantAction_Arm);
               }
            }
            else
            {
               ExeDoAction.calculateStatic(selfObj,TDConstant.PlantAction_Idle);
            }
         }
         return true;
      }
      
      private function getAlertArea() : Rectangle
      {
         var _loc1_:Rectangle = new Rectangle();
         var _loc2_:TDMapTileData = TDGameInfo.getInstance().getRoadTileByIndex(selfObj.objectModel.tileIndex);
         if(_loc2_ != null)
         {
            _loc1_.x = _loc2_.rect.left;
            _loc1_.y = _loc2_.rect.top;
            _loc1_.width = _loc2_.rect.width * 2;
            _loc1_.height = _loc2_.rect.height;
         }
         return _loc1_;
      }
   }
}
