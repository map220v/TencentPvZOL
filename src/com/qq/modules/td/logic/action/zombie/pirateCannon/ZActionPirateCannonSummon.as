package com.qq.modules.td.logic.action.zombie.pirateCannon
{
   import asgui.events.FrameEvent;
   import com.qq.constant.td.TDConstant;
   import com.qq.modules.td.command.game.TDGameObjectCmd;
   import com.qq.modules.td.logic.action.zombie.BasicZombieAction;
   import com.qq.modules.td.model.TDGameInfo;
   import flash.events.Event;
   import tencent.base.utils.ArrayUtil;
   
   public class ZActionPirateCannonSummon extends BasicZombieAction
   {
       
      
      private var _maxPopCnt:int;
      
      public function ZActionPirateCannonSummon()
      {
         super();
      }
      
      override public function enterState(param1:Array = null) : void
      {
         super.enterState(param1);
         _zombie.setFrozenAI(true);
         _zombie.animation.gotoAndPlay("prep");
         _zombie.animation.addEventListener(Event.COMPLETE,this.onCompletePrep);
         this._maxPopCnt = _zombie.zombieData.zombiestaticInfo.getParam(TDConstant.Zombie_Param_Pirate_Shannon_PopCounts);
      }
      
      protected function onCompletePrep(param1:Event) : void
      {
         _zombie.animation.removeEventListener(Event.COMPLETE,this.onCompletePrep);
         _zombie.animation.gotoAndPlay("fire");
         _zombie.animation.addEventListener(FrameEvent.MOVEMENT_FRAME_EVENT,this.onShoot);
         _zombie.animation.addEventListener(Event.COMPLETE,this.onCompleteFire);
      }
      
      protected function onShoot(param1:FrameEvent) : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:Array = null;
         var _loc5_:int = 0;
         if(param1.frameLabel == "shoot")
         {
            _zombie.animation.removeEventListener(FrameEvent.MOVEMENT_FRAME_EVENT,this.onShoot);
            _loc2_ = _zombie.getRunningProp(TDConstant.Gameobject_Prop_Pirate_Cannon_Summon_Times);
            _loc3_ = this.getRandomCol();
            if(_loc2_ < this._maxPopCnt)
            {
               TDGameObjectCmd.popZombieInArea([TDConstant.ZombieType_ImpPirate],_gameObject.x - 30,_gameObject.y - 60,_loc3_,_loc3_,[_zombie.objectModel.roadIndex]);
            }
            else
            {
               _loc4_ = [];
               _loc5_ = TDGameInfo.getInstance().minRow;
               while(_loc5_ <= TDGameInfo.getInstance().maxRow)
               {
                  _loc4_.push(_loc5_);
                  _loc5_++;
               }
               _loc4_ = ArrayUtil.shuffle(_loc4_);
               _loc5_ = 0;
               while(_loc5_ < 4)
               {
                  TDGameObjectCmd.popZombieInArea([TDConstant.ZombieType_ImpPirate],_gameObject.x - 30,_gameObject.y - 60,_loc3_,_loc3_,[_loc4_.shift() as int]);
                  _loc5_++;
               }
               _zombie.animation.removeEventListener(Event.COMPLETE,this.onCompleteFire);
               _zombie.changeHp(-int.MAX_VALUE,TDConstant.AttackType_Normal,TDConstant.AttackMode_Normal,_zombie);
            }
            _gameObject.setTimeRecord(TDConstant.TimeRecord_ZombieDuration,TDGameInfo.getInstance().getCurGameTime());
            _zombie.setRunningProp(TDConstant.Gameobject_Prop_Pirate_Cannon_Summon_Times,_loc2_ + 1);
         }
      }
      
      private function getRandomCol() : int
      {
         var _loc1_:Number = Math.random();
         if(_loc1_ < 0.5)
         {
            return TDGameInfo.getInstance().minCol + 5;
         }
         return TDGameInfo.getInstance().minCol + 6;
      }
      
      protected function onCompleteFire(param1:Event) : void
      {
         _zombie.animation.removeEventListener(Event.COMPLETE,this.onCompleteFire);
         _zombie.setFrozenAI(false);
         _zombie.setAction();
      }
      
      override public function leaveState() : void
      {
         _zombie.animation.removeEventListener(FrameEvent.MOVEMENT_FRAME_EVENT,this.onShoot);
         _zombie.animation.removeEventListener(Event.COMPLETE,this.onCompletePrep);
         _zombie.animation.removeEventListener(Event.COMPLETE,this.onCompleteFire);
         super.leaveState();
      }
   }
}
