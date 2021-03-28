package com.qq.modules.td.logic.action.plant.moteng
{
   import asgui.events.FrameEvent;
   import com.qq.constant.td.TDConstant;
   import com.qq.modules.td.command.effects.TDEffectCmd;
   import com.qq.modules.td.command.game.TDFireBulletCmd;
   import com.qq.modules.td.logic.action.plant.BasicPlantAction;
   import com.qq.modules.td.logic.numeric.TDDamageCaculete;
   import com.qq.modules.td.logic.unit.zombie.BasicZombie;
   import com.qq.modules.td.model.TDGameInfo;
   import flash.events.Event;
   
   public class PlantMotengActionShoot extends BasicPlantAction
   {
       
      
      private var hasShot:Boolean;
      
      public function PlantMotengActionShoot()
      {
         super();
      }
      
      override public function enterState(param1:Array = null) : void
      {
         super.enterState(param1);
         this.hasShot = false;
         _plant.animation.gotoAndPlay("anim_dian",false);
         _plant.animation.addEventListener(FrameEvent.MOVEMENT_FRAME_EVENT,this.onShoot);
         _plant.animation.addEventListener(Event.COMPLETE,this.onFinishAction);
         _plant.setTimeRecord(TDConstant.TimeRecord_PlantDuration,TDGameInfo.getInstance().getCurGameTime());
      }
      
      override public function leaveState() : void
      {
         _plant.setAttackTarget(null);
         _plant.animation.removeEventListener(Event.COMPLETE,this.onFinishAction);
         _plant.animation.removeEventListener(FrameEvent.MOVEMENT_FRAME_EVENT,this.onShoot);
      }
      
      private function onShoot(param1:FrameEvent) : void
      {
         if(param1.frameLabel == "shoot")
         {
            this.shoot();
         }
      }
      
      private function shoot() : void
      {
         var _loc1_:int = _plant.plantData.plantStaticInfo.type;
         switch(_loc1_)
         {
            case 2000:
               this.shootLamp();
               break;
            case 2100:
               this.shootFlash();
         }
      }
      
      private function shootFlash() : void
      {
         if(this.hasShot)
         {
            return;
         }
         if(_plant.curAttackTarget == null)
         {
            return;
         }
         this.hasShot = true;
         TDEffectCmd.playFlashToGameObject(_plant.x,_plant.y,_plant.curAttackTarget);
         TDDamageCaculete.caculatePlantAttckDamage(_plant,_plant.curAttackTarget as BasicZombie);
      }
      
      private function shootLamp() : void
      {
         if(this.hasShot)
         {
            return;
         }
         if(_plant.curAttackTarget == null)
         {
            return;
         }
         this.hasShot = true;
         TDFireBulletCmd.shoot(_plant,_plant.curAttackTarget,_plant.plantData.plantStaticInfo.baseInfo.bulletType,_plant.model.staticInfo.firePosBoneName);
      }
      
      private function onFinishAction(param1:Event) : void
      {
         if(!this.hasShot)
         {
            this.shoot();
         }
         _plant.setAction();
      }
   }
}
