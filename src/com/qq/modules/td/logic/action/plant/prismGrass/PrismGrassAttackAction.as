package com.qq.modules.td.logic.action.plant.prismGrass
{
   import asgui.events.FrameEvent;
   import com.qq.constant.td.TDConstant;
   import com.qq.modules.td.command.game.TDFireBulletCmd;
   import com.qq.modules.td.command.game.TDGameCmd;
   import com.qq.modules.td.command.game.sound.TDSoundCmd;
   import com.qq.modules.td.logic.action.plant.BasicPlantAction;
   import com.qq.modules.td.logic.talent.TalentManager;
   import com.qq.modules.td.logic.trigger.TDTrigConst;
   import com.qq.modules.td.logic.trigger.events.TriggerEvent;
   import com.qq.utils.CommandDispatcher;
   import flash.events.Event;
   
   public class PrismGrassAttackAction extends BasicPlantAction
   {
       
      
      private var _costSun:int;
      
      public function PrismGrassAttackAction()
      {
         super();
      }
      
      override public function enterState(param1:Array = null) : void
      {
         super.enterState(param1);
         this._costSun = (_plant.objectModel.staticInfo.getParam(TDConstant.Plant_Param_PrismGrass_Attack_Cost) as int) - TalentManager.instance.getCostCut(_plant.plantData.plantStaticInfo);
         _plant.setFrozenAI(true);
         _plant.animation.gotoAndPlay(TDConstant.PlantAnmi_Attack);
         _plant.animation.addEventListener(FrameEvent.MOVEMENT_FRAME_EVENT,this.onShoot);
         _plant.animation.addEventListener(Event.COMPLETE,this.onComplete);
         _plant.setRunningProp(TDConstant.Gameobject_Prop_IsSleeping,true);
      }
      
      override public function runningState() : void
      {
         super.runningState();
      }
      
      protected function onShoot(param1:FrameEvent) : void
      {
         var _loc2_:int = 0;
         if(param1.frameLabel == "shoot")
         {
            _plant.animation.removeEventListener(FrameEvent.MOVEMENT_FRAME_EVENT,this.onShoot);
            _loc2_ = TalentManager.instance.getBulletType(_plant.plantData.plantStaticInfo,_plant.uid);
            TDFireBulletCmd.shoot(_plant,_plant.curAttackTarget,_loc2_,null,0,-40,1,false,null,[_gameObject.objectModel.tileIndex]);
            TDGameCmd.changeSun(-this._costSun);
            TDSoundCmd.playPlantNormalAttack(_gameObject.objectModel.staticInfo.type);
            CommandDispatcher._dispatcher.dispatchEvent(new TriggerEvent(TDTrigConst.TYPE_USE_SUN,[this._costSun]));
         }
      }
      
      protected function onComplete(param1:Event) : void
      {
         _plant.animation.removeEventListener(FrameEvent.MOVEMENT_FRAME_EVENT,this.onShoot);
         _plant.animation.removeEventListener(Event.COMPLETE,this.onComplete);
         _plant.setRunningProp(TDConstant.Gameobject_Prop_IsSleeping,false);
         _plant.setFrozenAI(false);
         _plant.setAction();
      }
   }
}
