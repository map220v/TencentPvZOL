package com.qq.modules.td.logic.action.plant.wintermelon
{
   import asgui.events.FrameEvent;
   import com.qq.constant.td.TDConstant;
   import com.qq.modules.td.command.game.TDFireBulletCmd;
   import com.qq.modules.td.command.game.sound.TDSoundCmd;
   import com.qq.modules.td.logic.action.plant.basic.PlantSpecialSkillAction;
   import com.qq.modules.td.logic.bt_ai.aiUtils.TDSearchTargetUtils;
   import com.qq.modules.td.logic.unit.basic.IGameObject;
   import com.qq.utils.DMath;
   import flash.events.Event;
   
   public class PWintermelonActionSpecialSkill extends PlantSpecialSkillAction
   {
       
      
      public function PWintermelonActionSpecialSkill()
      {
         super();
      }
      
      override public function enterState(param1:Array = null) : void
      {
         super.enterState(param1);
         _plant.animation.gotoAndPlay(TDConstant.PlantAnmi_Plantfood);
         _plant.animation.addEventListener(Event.COMPLETE,this.onFinishPlantfood);
         _plant.animation.addEventListener(FrameEvent.MOVEMENT_FRAME_EVENT,this.onShoot);
      }
      
      private function getAttackTarget() : IGameObject
      {
         var _loc1_:Vector.<IGameObject> = new Vector.<IGameObject>();
         var _loc2_:Array = TDSearchTargetUtils.getZombieList(_plant,null,true,null,null,true);
         if(_loc2_.length == 0)
         {
            return null;
         }
         var _loc3_:int = DMath.randNum(0,_loc2_.length - 1);
         return _loc2_[_loc3_];
      }
      
      private function onShoot(param1:FrameEvent) : void
      {
         if(param1.frameLabel == "shoot")
         {
            this.shootMelon();
         }
      }
      
      private function shootMelon() : void
      {
         var _loc1_:IGameObject = this.getAttackTarget();
         if(_loc1_ && _loc1_.isVaild)
         {
            TDFireBulletCmd.shoot(_plant,_loc1_,_plant.plantData.plantStaticInfo.baseInfo.getSpecialSkillParam(TDConstant.SpecialSkill_Param_ShootBulletType),null,0,-50,1,true);
            TDSoundCmd.playPlantSpecialAttack(_gameObject.objectModel.staticInfo.type);
         }
      }
      
      private function onFinishPlantfood(param1:Event) : void
      {
         _plant.animation.removeEventListener(Event.COMPLETE,this.onFinishPlantfood);
         finishSpecialSkill();
      }
      
      override public function leaveState() : void
      {
         super.leaveState();
         _plant.animation.removeEventListener(Event.COMPLETE,this.onFinishPlantfood);
         _plant.animation.removeEventListener(FrameEvent.MOVEMENT_FRAME_EVENT,this.onShoot);
      }
   }
}
