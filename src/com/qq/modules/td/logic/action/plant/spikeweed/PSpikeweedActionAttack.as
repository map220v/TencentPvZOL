package com.qq.modules.td.logic.action.plant.spikeweed
{
   import com.qq.constant.td.TDConstant;
   import com.qq.modules.td.logic.action.plant.BasicPlantAction;
   import com.qq.modules.td.logic.bt_ai.aiNode.executeNode.plant.ExePlantResetDuration;
   import com.qq.modules.td.logic.bt_ai.aiNode.requireNode.ReqPlantDurationExpire;
   import com.qq.modules.td.logic.bt_ai.aiUtils.TDSearchTargetUtils;
   import com.qq.modules.td.logic.numeric.TDDamageCaculete;
   import com.qq.modules.td.logic.talent.TalentManager;
   import com.qq.modules.td.logic.unit.basic.IGameObject;
   
   public class PSpikeweedActionAttack extends BasicPlantAction
   {
       
      
      private var _canTakeRollingHit:int;
      
      public function PSpikeweedActionAttack()
      {
         super();
      }
      
      override public function setGameObject(param1:IGameObject, param2:String) : void
      {
         super.setGameObject(param1,param2);
         this._canTakeRollingHit = _plantModel.staticInfo.getParam(TDConstant.Plant_Param_CanTakeRollingHit);
      }
      
      override public function enterState(param1:Array = null) : void
      {
         super.enterState(param1);
         _gameObject.animation.gotoAndPlay(TDConstant.PlantAnmi_Attack,true);
      }
      
      override public function runningState() : void
      {
         var _loc1_:Vector.<IGameObject> = null;
         var _loc2_:IGameObject = null;
         var _loc3_:int = 0;
         super.runningState();
         if(_plant == null)
         {
            return;
         }
         if(ReqPlantDurationExpire.calculate(_plant))
         {
            ExePlantResetDuration.calculate(_plant);
            _loc1_ = TDSearchTargetUtils.searchTargetForPlantWithAttackArea(_plant,[_plant.objectModel.roadIndex]);
            for each(_loc2_ in _loc1_)
            {
               if(_loc2_.objectModel.staticInfo.getParam(TDConstant.GameObject_Param_IsRolling) > 0)
               {
                  TDDamageCaculete.executeDamage(_loc2_,int.MIN_VALUE,TDConstant.AttackType_Normal,TDConstant.AttackMode_Normal,_plant);
                  --this._canTakeRollingHit;
                  if(this._canTakeRollingHit <= 0)
                  {
                     _plant.Dispose();
                     return;
                  }
               }
               else
               {
                  TDDamageCaculete.caculatePlantAttckDamage(_plant,_loc2_);
                  if(_plant.plantData.plantStaticInfo.type == TDConstant.PlantType_SpikeRock)
                  {
                     _loc3_ = TalentManager.instance.getAddBuffId(_plant.plantData.plantStaticInfo);
                     if(_loc3_ > 0)
                     {
                        _loc2_.objectModel.addBuff(_loc3_,_plant);
                     }
                  }
               }
            }
         }
      }
      
      override public function leaveState() : void
      {
         super.leaveState();
      }
   }
}
