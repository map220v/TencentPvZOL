package com.qq.modules.td.logic.action.zombie.boss
{
   import asgui.events.FrameEvent;
   import com.greensock.TweenMax;
   import com.qq.CommandName;
   import com.qq.constant.td.TDConstant;
   import com.qq.modules.td.command.game.TDGameCmd;
   import com.qq.modules.td.command.game.TDGameObjectCmd;
   import com.qq.modules.td.logic.action.basic.BasicAction;
   import com.qq.modules.td.model.TDStageInfo;
   import com.qq.utils.CommandDispatcher;
   import flash.events.Event;
   
   public class ZActionBossSphinxDeath extends BasicAction
   {
       
      
      private var _popZombieList:Array;
      
      private var _popStartCol:int;
      
      private var _popEndCol:int;
      
      public function ZActionBossSphinxDeath()
      {
         super();
      }
      
      override public function enterState(param1:Array = null) : void
      {
         var _loc3_:String = null;
         super.enterState(param1);
         var _loc2_:XML = _gameObject.getRunningProp(TDConstant.Gameobject_Prop_InitParamXml);
         if(_loc2_ != null)
         {
            _loc3_ = _loc2_.popZombie.@value;
            this._popZombieList = _loc3_.split(";");
            this._popStartCol = int(_loc2_.popZombie.@startCol);
            this._popEndCol = int(_loc2_.popZombie.@endCol);
         }
         _gameObject.animation.addEventListener(FrameEvent.MOVEMENT_FRAME_EVENT,this.onShake);
         _gameObject.animation.addEventListener(Event.COMPLETE,this.onComplete);
         _gameObject.animation.gotoAndPlay("die");
      }
      
      override public function leaveState() : void
      {
         _gameObject.animation.removeEventListener(FrameEvent.MOVEMENT_FRAME_EVENT,this.onShake);
         _gameObject.animation.removeEventListener(Event.COMPLETE,this.onComplete);
         super.leaveState();
      }
      
      override public function runningState() : void
      {
         super.runningState();
      }
      
      private function onComplete(param1:Event) : void
      {
         _gameObject.animation.removeEventListener(Event.COMPLETE,this.onComplete);
         if(TDStageInfo.getInstance().challengeLevelID > 0)
         {
            TDGameCmd.ImmediatelyWinGame();
         }
         TweenMax.to(_gameObject,0.3,{
            "alpha":0,
            "delay":1,
            "onComplete":this.onFinishDisappear
         });
      }
      
      private function onFinishDisappear() : void
      {
         if(_gameObject == null || !_gameObject.isVaild)
         {
            return;
         }
         _gameObject.setAction(TDConstant.ZAction_Disappear,null,true);
      }
      
      private function onShake(param1:FrameEvent) : void
      {
         if(param1.frameLabel == "shake")
         {
            CommandDispatcher.send(CommandName.TD_PlayShakeEffect);
            TDGameObjectCmd.popZombieInArea(this._popZombieList,_gameObject.x,_gameObject.y,this._popStartCol,this._popEndCol);
         }
      }
   }
}
