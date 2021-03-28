package com.qq.modules.td.logic.action.zombie.pirateZomboss
{
   import asgui.events.FrameEvent;
   import com.qq.constant.td.TDConstant;
   import com.qq.modules.td.command.game.TDGameObjectCmd;
   import com.qq.modules.td.data.map.TDMapTileData;
   import com.qq.modules.td.logic.action.zombie.BasicZombieAction;
   import com.qq.modules.td.model.TDGameInfo;
   import flash.events.Event;
   import net.sakri.flash.math.MathUtil;
   
   public class ZActionPirateZombossRocketLaunch extends BasicZombieAction
   {
       
      
      private var _impLaunchCount:int;
      
      public function ZActionPirateZombossRocketLaunch()
      {
         super();
      }
      
      override public function enterState(param1:Array = null) : void
      {
         super.enterState(param1);
         _gameObject.setFrozenAI(true);
         _gameObject.animation.addEventListener(Event.COMPLETE,this.onFinishMissileStart);
         _gameObject.animation.gotoAndPlay("missile_start",1);
      }
      
      override public function leaveState() : void
      {
         _gameObject.animation.removeEventListener(Event.COMPLETE,this.onFinishMissileStart);
         _gameObject.animation.removeEventListener(Event.COMPLETE,this.onFinishLaunchStart);
         _gameObject.animation.removeEventListener(Event.COMPLETE,this.onFinishLanuchLoop);
         _gameObject.animation.removeEventListener(Event.COMPLETE,this.onAllFinish);
         _gameObject.animation.removeEventListener(FrameEvent.MOVEMENT_FRAME_EVENT,this.onShoot);
         super.leaveState();
      }
      
      private function onFinishMissileStart(param1:Event) : void
      {
         _gameObject.animation.removeEventListener(Event.COMPLETE,this.onFinishMissileStart);
         _gameObject.animation.addEventListener(Event.COMPLETE,this.onFinishLaunchStart);
         _gameObject.animation.gotoAndPlay("rocket_launch_start",1);
      }
      
      private function onFinishLaunchStart(param1:Event) : void
      {
         _gameObject.animation.removeEventListener(Event.COMPLETE,this.onFinishLaunchStart);
         _gameObject.animation.addEventListener(Event.COMPLETE,this.onFinishLanuchLoop);
         this._impLaunchCount = MathUtil.getRandomUintInRange(3,5);
         _gameObject.animation.gotoAndPlay("rocket_launch_loop",this._impLaunchCount);
      }
      
      private function onFinishLanuchLoop(param1:Event) : void
      {
         _gameObject.animation.removeEventListener(Event.COMPLETE,this.onFinishLanuchLoop);
         _gameObject.animation.addEventListener(Event.COMPLETE,this.onAllFinish);
         _gameObject.animation.addEventListener(FrameEvent.MOVEMENT_FRAME_EVENT,this.onShoot);
         _gameObject.animation.gotoAndPlay("rocket_launch_fire",1);
      }
      
      private function onAllFinish(param1:Event) : void
      {
         _gameObject.animation.removeEventListener(Event.COMPLETE,this.onAllFinish);
         _gameObject.setFrozenAI(false);
         _gameObject.setAction();
      }
      
      private function onShoot(param1:FrameEvent) : void
      {
         var _loc2_:TDMapTileData = null;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:Array = null;
         var _loc7_:int = 0;
         if(param1.frameLabel == "fire")
         {
            _loc2_ = TDGameInfo.getInstance().getRoadTileByGamePos(_gameObject.x,_gameObject.y);
            _loc3_ = 0;
            _loc4_ = 4;
            if(_loc2_)
            {
               _loc3_ = Math.min(_loc2_.roadCol + 2,TDGameInfo.getInstance().maxCol);
               _loc4_ = Math.min(_loc2_.roadCol + 4,TDGameInfo.getInstance().maxCol);
            }
            _loc5_ = _gameObject.objectModel.staticInfo.getParam(TDConstant.Zombie_Param_BulletType);
            _loc6_ = [];
            _loc7_ = 0;
            while(_loc7_ < this._impLaunchCount)
            {
               _loc6_.push(_loc5_);
               _loc7_++;
            }
            TDGameObjectCmd.popZombieInArea(_loc6_,_gameObject.x + 55,_gameObject.y - 170,_loc3_,_loc4_);
         }
      }
   }
}
