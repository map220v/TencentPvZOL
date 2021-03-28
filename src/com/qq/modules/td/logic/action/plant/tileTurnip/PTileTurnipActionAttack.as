package com.qq.modules.td.logic.action.plant.tileTurnip
{
   import asgui.events.FrameEvent;
   import com.qq.CommandName;
   import com.qq.constant.td.TDConstant;
   import com.qq.constant.td.TDObjTypeID;
   import com.qq.constant.td.TDSoundID;
   import com.qq.modules.td.command.game.TDFloorCmd;
   import com.qq.modules.td.command.game.sound.TDSoundCmd;
   import com.qq.modules.td.logic.action.plant.BasicPlantAction;
   import com.qq.utils.CommandDispatcher;
   import flash.events.Event;
   
   public class PTileTurnipActionAttack extends BasicPlantAction
   {
       
      
      public function PTileTurnipActionAttack()
      {
         super();
      }
      
      override public function enterState(param1:Array = null) : void
      {
         super.enterState(param1);
         _plant.animation.gotoAndPlay(TDConstant.PlantAnmi_Attack);
         _plant.animation.addEventListener(Event.COMPLETE,this.onPlayCompleted);
         _plant.animation.addEventListener(FrameEvent.MOVEMENT_FRAME_EVENT,this.onExplode);
         TDSoundCmd.playSound(TDSoundID.Plant_Power_Plant_Spawn);
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
         if(param1.frameLabel == "use")
         {
            TDFloorCmd.addPowerTile(TDObjTypeID.Obj_PowerTile5,_plant.objectModel.column,_plant.objectModel.roadIndex);
            CommandDispatcher.send(CommandName.TD_RefreshCardCost);
         }
      }
      
      private function onPlayCompleted(param1:Event) : void
      {
         _plant.dispose();
      }
   }
}
