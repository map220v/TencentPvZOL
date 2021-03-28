package com.qq.modules.td.logic.action.plant.iceburg
{
   import asgui.events.FrameEvent;
   import com.qq.CommandName;
   import com.qq.constant.td.TDChallengeScoreType;
   import com.qq.constant.td.TDConstant;
   import com.qq.modules.td.command.game.TDExplodeCmd;
   import com.qq.modules.td.command.game.sound.TDSoundCmd;
   import com.qq.modules.td.logic.TDChallengeScoreManager;
   import com.qq.modules.td.logic.action.plant.BasicPlantAction;
   import com.qq.modules.td.logic.bt_ai.aiUtils.TDSearchTargetUtils;
   import com.qq.modules.td.logic.numeric.TDCheckCollision;
   import com.qq.modules.td.logic.talent.TalentManager;
   import com.qq.modules.td.logic.unit.basic.IGameObject;
   import com.qq.modules.td.model.TDGameInfo;
   import com.qq.utils.CommandDispatcher;
   import flash.events.Event;
   
   public class PIceburgActionFrozen extends BasicPlantAction
   {
       
      
      public function PIceburgActionFrozen()
      {
         super();
      }
      
      override public function enterState(param1:Array = null) : void
      {
         super.enterState(param1);
         _plant.animation.gotoAndPlay(TDConstant.PlantAnmi_Attack,false);
         _plant.animation.addEventListener(FrameEvent.MOVEMENT_FRAME_EVENT,this.onShoot);
         _plant.animation.addEventListener(Event.COMPLETE,this.onFinishAttack);
      }
      
      override public function leaveState() : void
      {
         _plant.animation.removeEventListener(Event.COMPLETE,this.onFinishAttack);
         super.leaveState();
      }
      
      protected function onFinishAttack(param1:Event) : void
      {
         _plant.animation.removeEventListener(FrameEvent.MOVEMENT_FRAME_EVENT,this.onShoot);
         _plant.animation.removeEventListener(Event.COMPLETE,this.onFinishAttack);
         _plant.killBySelfExplode = true;
         _plant.dispose();
      }
      
      protected function onShoot(param1:FrameEvent) : void
      {
         var _loc2_:Array = null;
         var _loc3_:Array = null;
         var _loc4_:Array = null;
         var _loc5_:IGameObject = null;
         var _loc6_:IGameObject = null;
         if(param1.frameLabel == "shoot")
         {
            _plant.animation.removeEventListener(FrameEvent.MOVEMENT_FRAME_EVENT,this.onShoot);
            if(_plant.curAttackTarget)
            {
               if(_plant.curAttackTarget.objectModel.checkState(TDConstant.TDUnitState_HasTorch))
               {
                  CommandDispatcher.send(CommandName.TD_PutoutFire);
               }
               TDSoundCmd.icebergBoom();
               if(TalentManager.instance.getIceNum(_plant.plantData.plantStaticInfo) > 1)
               {
                  _loc3_ = [];
                  _loc4_ = TDSearchTargetUtils.getZombieList(_plant,[_plant.plantData.roadIndex]);
                  for each(_loc5_ in _loc4_)
                  {
                     if(TDCheckCollision.isCollision(_loc5_,_loc5_.damageArea,_plant,_plant.attackArea))
                     {
                        _loc5_.objectModel.addBuff(TDConstant.TDBuffID_fressze,_plant);
                     }
                  }
               }
               else
               {
                  _plant.curAttackTarget.objectModel.addBuff(TDConstant.TDBuffID_fressze,_plant);
               }
               _loc2_ = TDGameInfo.getInstance().getGameObjectMapByCatalgAndType(TDConstant.UnitCatalog_Bullet,TDConstant.BulletType_FireBall);
               if(_loc2_.length > 0)
               {
                  for each(_loc6_ in _loc2_)
                  {
                     if(TDCheckCollision.isCollision(_loc6_,_loc6_.attackArea,_gameObject,_gameObject.attackArea))
                     {
                        _loc6_.dispose();
                        TDChallengeScoreManager.instance.addScoreByType(TDChallengeScoreType.Desert_Boss_Iceburg_Remove_Fire);
                     }
                  }
               }
               TDExplodeCmd.explodeForPlant(_plant,TalentManager.instance.getPlusAttackNum(_plant.plantData.plantStaticInfo));
               _plant.setAttackTarget(null);
            }
         }
      }
   }
}
