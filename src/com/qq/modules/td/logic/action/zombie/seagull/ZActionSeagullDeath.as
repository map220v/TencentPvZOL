package com.qq.modules.td.logic.action.zombie.seagull
{
   import asgui.events.FrameEvent;
   import com.greensock.TweenMax;
   import com.qq.constant.td.TDConstant;
   import com.qq.modules.td.command.effects.TDEffectCmd;
   import com.qq.modules.td.data.map.TDMapTileData;
   import com.qq.modules.td.logic.action.zombie.BasicZombieAction;
   import com.qq.modules.td.logic.unit.zombie.SeagullZombie;
   import com.qq.modules.td.model.TDGameInfo;
   import com.qq.modules.td.view.effects.TDEffectPlayInfo;
   import com.qq.modules.td.view.game.layer.floor.TDFloorManager;
   import flash.events.Event;
   
   public class ZActionSeagullDeath extends BasicZombieAction
   {
       
      
      private var _isHaveButter:Boolean;
      
      public function ZActionSeagullDeath()
      {
         super();
      }
      
      override public function enterState(param1:Array = null) : void
      {
         super.enterState(param1);
         _zombie.animation.addEventListener(Event.COMPLETE,this.onFinishAction);
         _zombie.animation.addEventListener(FrameEvent.MOVEMENT_FRAME_EVENT,this.onHitGround);
         _zombie.animation.gotoAndPlay(TDConstant.ZombieAnmi_Death);
         if(!this._seagullZombie.isHaveButter)
         {
            _zombie.animation.setBoneVisibleRule("seagull_*",false);
            _zombie.animation.setBoneVisibleRule("gull_*",false);
            TDEffectCmd.playBlitAnimation(TDConstant.UnitType_Seagull,_zombie.x,_zombie.y - 120,new TDEffectPlayInfo("die1"));
         }
      }
      
      override public function runningState() : void
      {
         super.runningState();
      }
      
      override public function leaveState() : void
      {
         _zombie.animation.removeEventListener(Event.COMPLETE,this.onFinishAction);
         _zombie.animation.removeEventListener(FrameEvent.MOVEMENT_FRAME_EVENT,this.onHitGround);
         TweenMax.killTweensOf(_zombie);
      }
      
      private function onFinishAction(param1:Event) : void
      {
         _zombie.animation.removeEventListener(Event.COMPLETE,this.onFinishAction);
         _zombie.animation.removeEventListener(FrameEvent.MOVEMENT_FRAME_EVENT,this.onHitGround);
         TweenMax.to(_zombie,0.3,{
            "alpha":0,
            "delay":1,
            "onComplete":this.onFinishDisappear
         });
      }
      
      private function onFinishDisappear() : void
      {
         if(_zombie == null || !_zombie.isVaild)
         {
            return;
         }
         _zombie.setAction(TDConstant.ZAction_Disappear,null,true);
      }
      
      private function onHitGround(param1:FrameEvent) : void
      {
         var _loc2_:TDMapTileData = null;
         if(param1.frameLabel == "hitGround")
         {
            _loc2_ = TDGameInfo.getInstance().getRoadTileByGamePos(_gameObject.x,_gameObject.y);
            if(_loc2_ && TDFloorManager.instance.hasWaterAt(_loc2_.roadRow,_loc2_.roadCol))
            {
               TDEffectCmd.showWaterSplash(_gameObject.x,_gameObject.y,false);
               this.onFinishDisappear();
            }
         }
      }
      
      private function get _seagullZombie() : SeagullZombie
      {
         return _zombie as SeagullZombie;
      }
   }
}
