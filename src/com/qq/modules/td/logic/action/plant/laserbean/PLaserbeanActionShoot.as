package com.qq.modules.td.logic.action.plant.laserbean
{
   import asgui.events.FrameEvent;
   import com.qq.constant.td.TDConstant;
   import com.qq.constant.td.TDSoundID;
   import com.qq.modules.td.command.game.sound.TDSoundCmd;
   import com.qq.modules.td.logic.action.plant.BasicPlantAction;
   import com.qq.modules.td.logic.bt_ai.aiUtils.TDSearchTargetUtils;
   import com.qq.modules.td.logic.numeric.TDDamageCaculete;
   import com.qq.modules.td.logic.unit.basic.IGameObject;
   import flash.events.Event;
   
   public class PLaserbeanActionShoot extends BasicPlantAction
   {
       
      
      public function PLaserbeanActionShoot()
      {
         super();
      }
      
      override public function enterState(param1:Array = null) : void
      {
         super.enterState(param1);
         _gameObject.animation.gotoAndPlay(TDConstant.PlantAnmi_Attack);
         _gameObject.animation.addEventListener(FrameEvent.MOVEMENT_FRAME_EVENT,this.onAttack);
         _gameObject.animation.addEventListener(Event.COMPLETE,this.onCompleteAttack);
      }
      
      private function onAttack(param1:FrameEvent) : void
      {
         var _loc2_:Vector.<IGameObject> = null;
         var _loc3_:IGameObject = null;
         if(param1.frameLabel == "shoot")
         {
            _loc2_ = TDSearchTargetUtils.searchTargetsByRoad(_plant);
            for each(_loc3_ in _loc2_)
            {
               TDDamageCaculete.caculatePlantAttckDamage(_plant,_loc3_);
            }
            TDSoundCmd.playSound(TDSoundID.LaserBean);
         }
      }
      
      private function onCompleteAttack(param1:Event) : void
      {
         _gameObject.animation.removeEventListener(Event.COMPLETE,this.onCompleteAttack);
         _gameObject.animation.removeEventListener(FrameEvent.MOVEMENT_FRAME_EVENT,this.onAttack);
         _gameObject.setAction();
      }
      
      override public function leaveState() : void
      {
         _gameObject.animation.removeEventListener(FrameEvent.MOVEMENT_FRAME_EVENT,this.onAttack);
         _gameObject.animation.removeEventListener(Event.COMPLETE,this.onCompleteAttack);
         super.leaveState();
      }
   }
}
