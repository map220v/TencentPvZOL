package com.qq.modules.battle.planMachine.plan
{
   import com.qq.modules.sound.command.SoundCmd;
   import tencent.tools.planMachine.ICallBack;
   
   public class ActorPlaySound extends BattleBasePlan
   {
       
      
      public var soundId:int;
      
      public function ActorPlaySound()
      {
         super();
      }
      
      override public function setDynamicParams(param1:Array) : void
      {
         super.setDynamicParams(param1);
         this.soundId = param1[0];
      }
      
      override public function doPlan(param1:ICallBack) : void
      {
         super.doPlan(param1);
         SoundCmd.playSound(this.soundId);
         setComplete();
      }
   }
}
