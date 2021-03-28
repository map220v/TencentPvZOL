package com.qq.modules.battle.planMachine.plan
{
   import com.qq.modules.battle.model.BattleFightModel;
   import net.game_develop.animation.utils.Shake;
   import tencent.tools.planMachine.ICallBack;
   
   public class ScreanShakePlan extends BattleBasePlan
   {
       
      
      public function ScreanShakePlan()
      {
         super();
      }
      
      override protected function dispose() : void
      {
         super.dispose();
      }
      
      override public function doPlan(param1:ICallBack) : void
      {
         super.doPlan(param1);
         var _loc2_:Shake = new Shake(BattleFightModel.getInstance().cacheScene.x,BattleFightModel.getInstance().cacheScene.y,BattleFightModel.getInstance().cacheScene,4,15,50);
         _loc2_.start();
         setComplete();
      }
   }
}
