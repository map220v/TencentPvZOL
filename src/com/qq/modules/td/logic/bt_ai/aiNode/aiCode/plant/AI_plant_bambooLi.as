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
   import com.qq.modules.td.logic.unit.basic.IGameObject;
   import com.qq.modules.td.logic.unit.plant.BasicPlant;
   import com.qq.modules.td.logic.unit.zombie.BasicZombie;
   import com.qq.modules.td.model.TDGameInfo;
   import flash.geom.Rectangle;
   
   public class AI_plant_bambooLi extends BaseNodePvz
   {
       
      
      private var castTimes:int = 0;
      
      public function AI_plant_bambooLi()
      {
         super();
      }
      
      override public function calculate() : Boolean
      {
         var _loc1_:IGameObject = null;
         if(this.castTimes == 0 && TalentManager.instance.getCastSkillAfterPlantTimes((selfObj as BasicPlant).plantData.plantStaticInfo,selfObj.uid) == 0)
         {
            ++this.castTimes;
            TDGameObjectCmd.releaseSpecialSkill(selfObj.uid,false);
         }
         else
         {
            if(ReqPlantCurAction.calculate(selfObj,true,TDConstant.BambooLiAttckAction))
            {
               return true;
            }
            if(ReqPlantDurationExpire.calculate(selfObj))
            {
               _loc1_ = this.getZombieInAttackArea();
               if(_loc1_ != null)
               {
                  ExePlantResetDuration.calculate(selfObj);
                  selfObj.setAttackTarget(_loc1_);
                  ExePlantAttack.calculate(selfObj,TDConstant.BambooLiAttckAction);
                  return true;
               }
            }
            ExePlantIdle.calculate(selfObj,TDConstant.PlantAction_Idle);
         }
         return true;
      }
      
      public function getAttackAreas() : Array
      {
         var _loc1_:Array = [];
         var _loc2_:TDMapTileData = TDGameInfo.getInstance().getRoadTileByIndex(selfObj.objectModel.tileIndex);
         _loc1_.push(new Rectangle(_loc2_.rect.x,_loc2_.rect.y,_loc2_.rect.width,_loc2_.rect.height));
         _loc1_.push(new Rectangle(_loc2_.rect.x - _loc2_.rect.width * 1.25,_loc2_.rect.y - _loc2_.rect.height,_loc2_.rect.width,_loc2_.rect.height * 3));
         _loc1_.push(new Rectangle(_loc2_.rect.x + _loc2_.rect.width * 1.25,_loc2_.rect.y - _loc2_.rect.height,_loc2_.rect.width,_loc2_.rect.height * 3));
         return _loc1_;
      }
      
      private function getZombieInAttackArea() : IGameObject
      {
         var _loc1_:IGameObject = null;
         var _loc4_:Number = NaN;
         var _loc5_:IGameObject = null;
         var _loc2_:Array = [selfObj.objectModel.roadIndex - 1,selfObj.objectModel.roadIndex,selfObj.objectModel.roadIndex + 1];
         var _loc3_:Vector.<IGameObject> = TDSearchTargetUtils.searchTargetForPlant(selfObj as BasicPlant,this.getAttackAreas(),_loc2_);
         if(_loc3_.length > 0)
         {
            _loc4_ = int.MAX_VALUE;
            for each(_loc5_ in _loc3_)
            {
               if(_loc5_ is BasicZombie && _loc5_.x < _loc4_)
               {
                  _loc4_ = _loc5_.x;
                  _loc1_ = _loc5_;
               }
            }
            if(_loc1_ == null)
            {
               _loc1_ = _loc3_[0];
            }
         }
         return _loc1_;
      }
   }
}
