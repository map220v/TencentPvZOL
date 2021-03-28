package com.qq.modules.td.logic.action.object.lawnMower
{
   import com.qq.constant.td.TDConstant;
   import com.qq.modules.td.logic.action.basic.BasicAction;
   import com.qq.modules.td.logic.trigger.TDTrigConst;
   import com.qq.modules.td.logic.trigger.events.TriggerEvent;
   import com.qq.modules.td.logic.unit.zombie.BasicZombie;
   import com.qq.modules.td.model.TDGameInfo;
   import com.qq.utils.CommandDispatcher;
   
   public class LawnMowerActionIdle extends BasicAction
   {
       
      
      private var _lastTime:Number;
      
      public function LawnMowerActionIdle()
      {
         super();
      }
      
      override public function enterState(param1:Array = null) : void
      {
         super.enterState(param1);
         _gameObject.animation.gotoAndPlay("idle");
         this._lastTime = TDGameInfo.getInstance().getCurGameTime();
      }
      
      override public function runningState() : void
      {
         var _loc2_:Array = null;
         var _loc3_:BasicZombie = null;
         var _loc1_:Number = TDGameInfo.getInstance().getCurGameTime();
         if(_loc1_ - this._lastTime > 100)
         {
            this._lastTime = _loc1_;
            _loc2_ = TDGameInfo.getInstance().getZombieList([_gameObject.objectModel.roadIndex],TDConstant.TDCamp_Enemy,true,true,false);
            for each(_loc3_ in _loc2_)
            {
               if(_loc3_.zombieData.isAlive())
               {
                  if(_loc3_.x + _loc3_.damageArea.x < TDGameInfo.getInstance().toycarPosX)
                  {
                     _gameObject.setAction(TDConstant.LawnMowerAction_Run);
                     CommandDispatcher._dispatcher.dispatchEvent(new TriggerEvent(TDTrigConst.TYPE_USE_CART,[]));
                     break;
                  }
               }
            }
         }
      }
      
      override public function leaveState() : void
      {
      }
   }
}
