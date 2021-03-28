package com.qq.modules.td.logic.action.plant.empeach
{
   import asgui.events.FrameEvent;
   import com.qq.constant.td.TDConstant;
   import com.qq.constant.td.TDObjTypeID;
   import com.qq.constant.td.TDSoundID;
   import com.qq.modules.td.command.effects.TDEffectCmd;
   import com.qq.modules.td.command.game.sound.TDSoundCmd;
   import com.qq.modules.td.logic.action.plant.BasicPlantAction;
   import com.qq.modules.td.logic.bt_ai.aiUtils.TDSearchTargetUtils;
   import com.qq.modules.td.logic.unit.basic.IGameObject;
   import com.qq.modules.td.logic.unit.zombie.BasicZombie;
   import com.qq.modules.td.view.effects.TDEffectPlayInfo;
   import flash.events.Event;
   
   public class PEmpeachActionExplode extends BasicPlantAction
   {
       
      
      public function PEmpeachActionExplode()
      {
         super();
      }
      
      override public function enterState(param1:Array = null) : void
      {
         super.enterState(param1);
         _plant.animation.gotoAndPlay(TDConstant.PlantAnmi_Attack);
         _plant.animation.addEventListener(Event.COMPLETE,this.onPlayCompleted);
         _plant.animation.addEventListener(FrameEvent.MOVEMENT_FRAME_EVENT,this.onExplode);
      }
      
      override public function runningState() : void
      {
         super.runningState();
      }
      
      override public function leaveState() : void
      {
         _plant.animation.removeEventListener(Event.COMPLETE,this.onPlayCompleted);
      }
      
      private function onExplode(param1:FrameEvent) : void
      {
         var _loc2_:Vector.<IGameObject> = null;
         var _loc3_:BasicZombie = null;
         if(param1.frameLabel == "explode")
         {
            TDEffectCmd.playBlitAnimation(TDObjTypeID.Obj_EmpeachBlast,_plant.x,_plant.y - 40,new TDEffectPlayInfo("animation"));
            _loc2_ = TDSearchTargetUtils.searchTargetsByColRow(_plantModel.column - 1,_plantModel.column + 1,_plantModel.roadIndex - 1,_plantModel.roadIndex + 1,_plant);
            for each(_loc3_ in _loc2_)
            {
               if(_loc3_.zombieData.zombiestaticInfo.getParam(TDConstant.Zombie_Param_IsMachine) != 1)
               {
                  continue;
               }
               if(_loc3_.getActionID() == TDConstant.ZAction_Wolf_Knight_Swoop)
               {
                  continue;
               }
               _loc3_.setAction(TDConstant.ZAction_Stun);
               switch(_loc3_.zombieData.zombiestaticInfo.id)
               {
                  case 880:
                     TDSoundCmd.playSound(TDSoundID.Future_Cone_Mvmt_Deactivate);
                     break;
                  case 890:
                     TDSoundCmd.playSound(TDSoundID.Future_Disco_Mvmt_Deactivate);
                     break;
                  case 900:
                     TDSoundCmd.playSound(TDSoundID.Future_Football_Mvmt_Deactivate);
                     break;
                  case 860:
                     TDSoundCmd.playSound(TDSoundID.Future_Protector_Deactivate);
                     break;
               }
            }
         }
      }
      
      private function onPlayCompleted(param1:Event) : void
      {
         _plant.dispose();
      }
   }
}
