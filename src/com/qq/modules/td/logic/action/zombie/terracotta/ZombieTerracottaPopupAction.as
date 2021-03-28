package com.qq.modules.td.logic.action.zombie.terracotta
{
   import com.qq.constant.td.TDConstant;
   import com.qq.modules.td.logic.action.zombie.BasicZombieAction;
   import com.qq.modules.td.logic.unit.zombie.TerracottaZombie;
   import com.qq.modules.td.model.TDGameInfo;
   import com.qq.modules.td.model.TDMiniGameTerracottaMemoryData;
   import flash.events.Event;
   
   public class ZombieTerracottaPopupAction extends BasicZombieAction
   {
       
      
      private var _enterTime:int;
      
      private var _waitCompleted:Boolean;
      
      public function ZombieTerracottaPopupAction()
      {
         super();
      }
      
      override public function enterState(param1:Array = null) : void
      {
         super.enterState(param1);
         _gameObject.setFrozenAI(true);
         this._enterTime = TDGameInfo.getInstance().getCurGameTime();
         if((_gameObject as TerracottaZombie).isCanWake)
         {
            _gameObject.animation.gotoAndStop("zomibe_bingmayong");
         }
         else
         {
            _gameObject.animation.gotoAndStop("bingmayong");
            _gameObject.setShadeVisible(false);
         }
         _gameObject.animation.addEventListener(Event.COMPLETE,this.onComplete);
      }
      
      override public function runningState() : void
      {
         super.runningState();
         if(!this._waitCompleted)
         {
            if(TDGameInfo.getInstance().getCurGameTime() >= this._enterTime + TDMiniGameTerracottaMemoryData.getInstance().watchTime)
            {
               if((_gameObject as TerracottaZombie).isCanWake)
               {
                  _gameObject.animation.gotoAndPlay("zomibe_bingmayong");
               }
               else
               {
                  _gameObject.animation.gotoAndPlay("bingmayong");
               }
               this._waitCompleted = true;
            }
            else if((_gameObject as TerracottaZombie).isCanWake)
            {
               _gameObject.animation.gotoAndStop("zomibe_bingmayong");
            }
            else
            {
               _gameObject.animation.gotoAndStop("bingmayong");
               _gameObject.setShadeVisible(false);
            }
            return;
         }
         if(TDMiniGameTerracottaMemoryData.getInstance().isAllShowReady())
         {
            _gameObject.setAction(TDConstant.ZAction_Terracotta_Lineup);
         }
      }
      
      private function onComplete(param1:Event) : void
      {
         _gameObject.animation.removeEventListener(Event.COMPLETE,this.onComplete);
         _gameObject.setShadeVisible(true);
         TDMiniGameTerracottaMemoryData.getInstance().endShow();
      }
      
      override public function leaveState() : void
      {
         _gameObject.setFrozenAI(false);
         _gameObject.animation.removeEventListener(Event.COMPLETE,this.onComplete);
         super.leaveState();
      }
   }
}
