package com.qq.modules.td.logic.action.plant.thunderPine
{
   import asgui.events.FrameEvent;
   import com.qq.constant.td.TDConstant;
   import com.qq.constant.td.TDSoundID;
   import com.qq.modules.sound.command.SoundCmd;
   import com.qq.modules.td.command.game.TDFireBulletCmd;
   import com.qq.modules.td.logic.TDFactory;
   import com.qq.modules.td.logic.action.plant.basic.PlantSpecialSkillAction;
   import com.qq.modules.td.logic.unit.basic.IGameObject;
   import com.qq.modules.td.logic.unit.bullet.BasicBullet;
   import com.qq.modules.td.model.TDGameInfo;
   import flash.events.Event;
   
   public class PThunderPineSpecialSkill extends PlantSpecialSkillAction
   {
       
      
      public function PThunderPineSpecialSkill()
      {
         super();
      }
      
      override public function enterState(param1:Array = null) : void
      {
         super.enterState(param1);
         _plant.animation.gotoAndPlay(TDConstant.PlantAnmi_Skill);
         _plant.animation.addEventListener(FrameEvent.MOVEMENT_FRAME_EVENT,this.onShoot);
         _plant.animation.addEventListener(Event.COMPLETE,this.onFinishAction);
      }
      
      protected function onShoot(param1:FrameEvent) : void
      {
         var _loc2_:int = 0;
         var _loc3_:IGameObject = null;
         if(param1.frameLabel == "shoot")
         {
            _plant.animation.removeEventListener(FrameEvent.MOVEMENT_FRAME_EVENT,this.onShoot);
            _loc2_ = _plant.plantData.plantStaticInfo.baseInfo.getSpecialSkillParam(TDConstant.SpecialSkill_Param_ShootBulletType);
            TDFireBulletCmd.addBullet(TDConstant.UnitCatalog_Bullet,_loc2_,TDConstant.TDCamp_Self,null,_plant.x + 15,_plant.y - _plant.damageArea.height,1,true);
            _loc3_ = TDGameInfo.getInstance().getGameObjctByUID(TDFactory.getLastUnitUin());
            (_loc3_ as BasicBullet).shooter = _plant;
            _loc3_.setAction(TDConstant.BAction_ForThunderPinePlantfood);
            SoundCmd.playSound(TDSoundID.Seapine_Atk_Hvy);
         }
      }
      
      protected function onFinishAction(param1:Event) : void
      {
         _plant.animation.removeEventListener(Event.COMPLETE,this.onFinishAction);
         _plant.animation.removeEventListener(FrameEvent.MOVEMENT_FRAME_EVENT,this.onShoot);
         finishSpecialSkill();
      }
      
      override public function leaveState() : void
      {
         super.leaveState();
      }
   }
}
