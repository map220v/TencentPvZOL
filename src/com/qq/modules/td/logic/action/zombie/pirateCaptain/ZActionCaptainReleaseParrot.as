package com.qq.modules.td.logic.action.zombie.pirateCaptain
{
   import com.qq.constant.td.TDConstant;
   import com.qq.modules.td.command.game.TDGameObjectCmd;
   import com.qq.modules.td.logic.action.zombie.BasicZombieAction;
   import com.qq.modules.td.logic.unit.zombie.PirateCaptainZombie;
   import com.qq.modules.td.model.TDGameInfo;
   import flash.events.Event;
   
   public class ZActionCaptainReleaseParrot extends BasicZombieAction
   {
       
      
      public function ZActionCaptainReleaseParrot()
      {
         super();
      }
      
      override public function enterState(param1:Array = null) : void
      {
         super.enterState(param1);
         this.zombieCaptain.animation.addEventListener(Event.COMPLETE,this.onFinish);
         this.zombieCaptain.animation.gotoAndPlay("parrot_release",1);
      }
      
      override public function leaveState() : void
      {
         this.zombieCaptain.animation.removeEventListener(Event.COMPLETE,this.onFinish);
         super.leaveState();
      }
      
      private function onFinish(param1:Event) : void
      {
         this.zombieCaptain.setTimeRecord(TDConstant.TimeRecord_ZombieDuration,TDGameInfo.getInstance().getCurGameTime());
         this.zombieCaptain.animation.removeEventListener(Event.COMPLETE,this.onFinish);
         this.zombieCaptain.setAction();
         this.zombieCaptain.setBoneVisible("parrot_*",false);
         this.zombieCaptain.isHaveParrot = false;
         TDGameObjectCmd.addGameObjectByPos(TDConstant.UnitCatalog_Zombie,TDConstant.ZombieType_Parrot,this.zombieCaptain.x - 50,this.zombieCaptain.y - 20);
      }
      
      public function get zombieCaptain() : PirateCaptainZombie
      {
         return _zombie as PirateCaptainZombie;
      }
   }
}
