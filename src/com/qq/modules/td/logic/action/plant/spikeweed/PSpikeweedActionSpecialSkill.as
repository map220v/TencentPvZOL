package com.qq.modules.td.logic.action.plant.spikeweed
{
   import com.qq.constant.td.TDConstant;
   import com.qq.modules.td.command.effects.TDEffectCmd;
   import com.qq.modules.td.data.game.unit.TDZombieData;
   import com.qq.modules.td.data.map.TDMapTileData;
   import com.qq.modules.td.logic.action.plant.basic.PlantSpecialSkillAction;
   import com.qq.modules.td.logic.bt_ai.aiUtils.TDSearchTargetUtils;
   import com.qq.modules.td.logic.numeric.TDCheckCollision;
   import com.qq.modules.td.logic.numeric.TDDamageCaculete;
   import com.qq.modules.td.logic.unit.basic.IGameObject;
   import com.qq.modules.td.model.TDGameInfo;
   import com.qq.modules.td.view.effects.TDEffectPlayInfo;
   import com.qq.modules.td.view.game.layer.floor.TDFloorManager;
   
   public class PSpikeweedActionSpecialSkill extends PlantSpecialSkillAction
   {
      
      private static const ATTACK_INTERVAL:int = 500;
      
      private static const MOVE_SPEED:int = 5;
      
      private static const TOTAL_TIME:int = 5000;
       
      
      private var _enterTime:int;
      
      private var _lastAttackTime:int;
      
      public function PSpikeweedActionSpecialSkill()
      {
         super();
      }
      
      override public function enterState(param1:Array = null) : void
      {
         var _loc3_:TDMapTileData = null;
         var _loc4_:int = 0;
         super.enterState(param1);
         this._enterTime = TDGameInfo.getInstance().getCurGameTime();
         _plant.animation.gotoAndPlay(TDConstant.PlantAnmi_Plantfood,true);
         var _loc2_:Vector.<TDMapTileData> = TDFloorManager.instance.getUsefulTile([_plant.objectModel.roadIndex]);
         for each(_loc3_ in _loc2_)
         {
            _loc4_ = _plant.plantData.plantStaticInfo.baseInfo.getSpecialSkillParam(TDConstant.SpecialSkill_Param_ObjectID);
            TDEffectCmd.playBlitAnimation(_loc4_,_loc3_.rect.x + _loc3_.rect.width * 0.5,_loc3_.rect.bottom - 20,new TDEffectPlayInfo(null,0,TOTAL_TIME));
         }
      }
      
      override public function runningState() : void
      {
         var _loc2_:int = 0;
         var _loc3_:IGameObject = null;
         var _loc4_:Array = null;
         super.runningState();
         var _loc1_:int = TDGameInfo.getInstance().getCurGameTime();
         if(this._enterTime + TOTAL_TIME > _loc1_)
         {
            if(_plant)
            {
               _loc4_ = TDSearchTargetUtils.getZombieList(_plant,[_plant.objectModel.roadIndex]);
               if(this._lastAttackTime + ATTACK_INTERVAL < _loc1_)
               {
                  this._lastAttackTime = _loc1_;
                  for each(_loc3_ in _loc4_)
                  {
                     if(_loc3_.objectModel.staticInfo.getParam(TDConstant.GameObject_Param_IsRolling) > 0)
                     {
                        if(_plant)
                        {
                           TDDamageCaculete.executeDamage(_loc3_,int.MIN_VALUE,TDConstant.AttackType_Normal,TDConstant.AttackMode_Normal,_plant);
                        }
                     }
                     else if(_plant)
                     {
                        TDDamageCaculete.caculatePlantAttckDamage(_plant,_loc3_,0,true);
                     }
                     if(_loc3_.objectModel.unitCatalog == TDConstant.UnitCatalog_Zombie)
                     {
                        if(_plant)
                        {
                           _loc3_.objectModel.addBuff(TDConstant.TDBuffID_SpikeStun,_plant);
                        }
                     }
                  }
               }
            }
            for each(_loc3_ in _loc4_)
            {
               if(_loc3_.objectModel.unitCatalog == TDConstant.UnitCatalog_Zombie && _loc3_.isVaild && (_loc3_.objectModel as TDZombieData).pathId == 0 && (_loc3_.objectModel as TDZombieData).zombiestaticInfo.catalog != TDConstant.ZombieCatalog_Boss && _plant && !TDCheckCollision.isCollision(_loc3_,_loc3_.damageArea,_plant,_plant.attackArea))
               {
                  _loc2_ = _loc3_.x < _plant.x ? int(MOVE_SPEED) : int(-MOVE_SPEED);
                  _loc3_.setLocation(_loc3_.x + _loc2_,_loc3_.y);
               }
            }
         }
         else
         {
            finishSpecialSkill();
         }
      }
      
      override public function leaveState() : void
      {
         super.leaveState();
      }
   }
}
