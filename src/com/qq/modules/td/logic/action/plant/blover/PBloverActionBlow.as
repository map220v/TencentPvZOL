package com.qq.modules.td.logic.action.plant.blover
{
   import asgui.events.FrameEvent;
   import com.qq.constant.td.TDConstant;
   import com.qq.constant.td.TDSoundID;
   import com.qq.modules.td.command.game.sound.TDSoundCmd;
   import com.qq.modules.td.logic.action.plant.BasicPlantAction;
   import com.qq.modules.td.logic.unit.basic.GameObject;
   import com.qq.modules.td.logic.unit.zombie.BasicZombie;
   import com.qq.modules.td.model.TDGameInfo;
   import flash.events.Event;
   
   public class PBloverActionBlow extends BasicPlantAction
   {
       
      
      public function PBloverActionBlow()
      {
         super();
      }
      
      override public function enterState(param1:Array = null) : void
      {
         super.enterState(param1);
         _plant.animation.gotoAndPlay(TDConstant.PlantAnmi_Attack);
         _plant.animation.addEventListener(Event.COMPLETE,this.onComplete);
         _plant.animation.addEventListener(FrameEvent.MOVEMENT_FRAME_EVENT,this.onBlow);
      }
      
      private function onBlow(param1:FrameEvent) : void
      {
         var _loc2_:Array = null;
         var _loc3_:GameObject = null;
         if(param1.frameLabel == "blow")
         {
            _loc2_ = TDGameInfo.getInstance().getZombieList(null,0,true,true,true,null,[TDConstant.ZombieCatalog_Boss]);
            for each(_loc3_ in _loc2_)
            {
               if(_loc3_.objectModel.isFlying)
               {
                  _loc3_.setAction(TDConstant.ObjectAction_BlowAway);
                  if(_loc3_ is BasicZombie)
                  {
                     (_loc3_ as BasicZombie).lootItem();
                  }
               }
            }
            TDSoundCmd.playSound(TDSoundID.Blover);
         }
      }
      
      override public function leaveState() : void
      {
         _plant.animation.removeEventListener(FrameEvent.MOVEMENT_FRAME_EVENT,this.onBlow);
         _plant.animation.removeEventListener(Event.COMPLETE,this.onComplete);
      }
      
      private function onComplete(param1:Event) : void
      {
         _plant.dispose();
      }
   }
}
