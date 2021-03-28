package com.qq.modules.battle.planMachine.plan.special
{
   import asgui.controls.Image;
   import asgui.resources.AssetManager;
   import com.qq.modules.battle.constant.BattleConst;
   import com.qq.modules.battle.constant.BattleEvent;
   import com.qq.modules.battle.planMachine.plan.BattleBasePlan;
   import com.qq.utils.CommandDispatcher;
   import flash.display.MovieClip;
   import flash.events.Event;
   import tencent.tools.planMachine.ICallBack;
   
   public class GuildFightCycleAniamat extends BattleBasePlan
   {
       
      
      public var moraImg:Image;
      
      public var moraMc:MovieClip;
      
      public var leftCycle:uint;
      
      public var rightCycle:uint;
      
      public function GuildFightCycleAniamat()
      {
         super();
      }
      
      override protected function dispose() : void
      {
         super.dispose();
         if(this.moraImg)
         {
            MovieClip(this.moraImg.mcHolder).removeEventListener(Event.ENTER_FRAME,this.onEnterFrame);
            this.moraImg.Dispose();
            this.moraImg = null;
         }
      }
      
      override public function doPlan(param1:ICallBack) : void
      {
         super.doPlan(param1);
         this.moraImg = new Image();
         this.moraImg.width = 320;
         this.moraImg.scrollRectEnabled = false;
         this.moraImg.source = AssetManager.GetClass("UI_Battle_GuildFight_Mora");
         this.moraImg.hcenter = 0;
         var _loc2_:BattleEvent = new BattleEvent(BattleConst.BATTLE_ADD_TOP_EFFECT);
         _loc2_.displayEffect = this.moraImg;
         CommandDispatcher.sendEvent(_loc2_);
         MovieClip(this.moraImg.mcHolder["mc_q1"]["mc"]).gotoAndStop(this.leftCycle);
         MovieClip(this.moraImg.mcHolder["mc_q2"]["mc"]).gotoAndStop(this.rightCycle);
         MovieClip(this.moraImg.mcHolder).addEventListener(Event.ENTER_FRAME,this.onEnterFrame);
      }
      
      private function onEnterFrame(param1:Event) : void
      {
         if(MovieClip(this.moraImg.mcHolder).currentFrame == MovieClip(this.moraImg.mcHolder).totalFrames)
         {
            setComplete();
         }
      }
   }
}
