package com.qq.modules.battle.planMachine.plan
{
   import com.greensock.TweenLite;
   import com.qq.modules.battle.model.BattleFightModel;
   import com.qq.modules.battle.model.BattleUnitModel;
   import flash.display.Sprite;
   import tencent.tools.planMachine.ICallBack;
   
   public class ScreanColorPlan extends BattleBasePlan
   {
       
      
      private var time:Number;
      
      private var color:uint;
      
      private var fromAlpha:int;
      
      private var toAlpha:int;
      
      private var tween:TweenLite;
      
      private var sp:Sprite;
      
      public function ScreanColorPlan()
      {
         super();
      }
      
      override protected function dispose() : void
      {
         if(this.tween)
         {
            BattleUnitModel.getInstance().battleTimer.removeTweenLite(this.tween);
            this.tween.kill();
            this.tween = null;
         }
         if(this.sp)
         {
            BattleFightModel.getInstance().cacheScene.removeChild(this.sp);
            this.sp = null;
         }
         super.dispose();
      }
      
      override public function setDynamicParams(param1:Array) : void
      {
         super.setDynamicParams(param1);
         this.time = Number(param1[0]);
         this.fromAlpha = Number(param1[1]);
         this.toAlpha = Number(param1[2]);
         this.color = Number(param1[3]);
      }
      
      override public function doPlan(param1:ICallBack) : void
      {
         super.doPlan(param1);
         this.sp = new Sprite();
         this.sp.graphics.beginFill(this.color,1);
         this.sp.graphics.drawRect(0,0,BattleFightModel.getInstance().cacheScene.width,BattleFightModel.getInstance().cacheScene.height);
         BattleFightModel.getInstance().cacheScene.addChild(this.sp);
         this.sp.alpha = this.fromAlpha;
         this.tween = new TweenLite(this.sp,this.time / 1000,{
            "alpha":this.toAlpha,
            "onComplete":this.completeHandler
         });
         BattleUnitModel.getInstance().battleTimer.addTweenLite(this.tween);
      }
      
      private function completeHandler() : void
      {
         setComplete();
      }
   }
}
