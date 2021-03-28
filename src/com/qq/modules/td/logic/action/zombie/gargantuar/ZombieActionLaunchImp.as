package com.qq.modules.td.logic.action.zombie.gargantuar
{
   import asgui.events.FrameEvent;
   import com.qq.constant.td.TDConstant;
   import com.qq.modules.td.command.game.TDGameObjectCmd;
   import com.qq.modules.td.data.map.TDMapTileData;
   import com.qq.modules.td.logic.action.zombie.BasicZombieAction;
   import com.qq.modules.td.logic.unit.zombie.GargantuarZombie;
   import com.qq.modules.td.model.TDGameInfo;
   import flash.events.Event;
   
   public class ZombieActionLaunchImp extends BasicZombieAction
   {
       
      
      public function ZombieActionLaunchImp()
      {
         super();
      }
      
      override public function enterState(param1:Array = null) : void
      {
         super.enterState(param1);
         _gameObject.setFrozenAI(true);
         _gameObject.animation.addEventListener(Event.COMPLETE,this.onFinish);
         _gameObject.animation.addEventListener(FrameEvent.MOVEMENT_FRAME_EVENT,this.onShoot);
         _gameObject.animation.gotoAndPlay("fire",1);
      }
      
      override public function leaveState() : void
      {
         _gameObject.animation.removeEventListener(Event.COMPLETE,this.onFinish);
         _gameObject.animation.removeEventListener(FrameEvent.MOVEMENT_FRAME_EVENT,this.onShoot);
         super.leaveState();
      }
      
      private function onFinish(param1:Event) : void
      {
         _gameObject.animation.removeEventListener(Event.COMPLETE,this.onFinish);
         _gameObject.setAction();
         _gameObject.setFrozenAI(false);
      }
      
      private function onShoot(param1:FrameEvent) : void
      {
         var _loc2_:TDMapTileData = null;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         if(param1.frameLabel == "shoot")
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
            TDGameObjectCmd.popZombieInArea([_loc5_],_gameObject.x + 55,_gameObject.y - 170,_loc3_,_loc4_,[this.zombieGargantuar.objectModel.roadIndex]);
            this.zombieGargantuar.isHaveImp = false;
         }
      }
      
      public function get zombieGargantuar() : GargantuarZombie
      {
         return _gameObject as GargantuarZombie;
      }
   }
}
