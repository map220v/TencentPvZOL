package com.qq.modules.td.logic.action.object.effect
{
   import com.qq.modules.td.logic.action.zombie.BasicZombieAction;
   import com.qq.modules.td.model.TDGameInfo;
   
   public class TDZombieFixedAction extends BasicZombieAction
   {
       
      
      private var _endTime:int;
      
      public function TDZombieFixedAction()
      {
         super();
      }
      
      override public function enterState(param1:Array = null) : void
      {
         var _loc2_:int = param1[0];
         var _loc3_:int = TDGameInfo.getInstance().getCurGameTime();
         this._endTime = _loc3_ + _loc2_;
         super.enterState(param1);
         _zombie.setFrozenAI(true);
         _zombie.animation.stop();
      }
      
      override public function runningState() : void
      {
         var _loc1_:int = TDGameInfo.getInstance().getCurGameTime();
         if(_loc1_ >= this._endTime)
         {
            _zombie.setFrozenAI(false);
         }
         super.runningState();
      }
   }
}
