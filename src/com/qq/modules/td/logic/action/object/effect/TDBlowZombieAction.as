package com.qq.modules.td.logic.action.object.effect
{
   import com.qq.constant.td.TDConstant;
   import com.qq.modules.td.command.game.TDGameObjectCmd;
   import com.qq.modules.td.command.game.sound.TDSoundCmd;
   import com.qq.modules.td.data.map.TDMapWaveEnemyData;
   import com.qq.modules.td.logic.TDFactory;
   import com.qq.modules.td.logic.action.basic.BasicAction;
   import com.qq.modules.td.logic.unit.basic.IGameObject;
   import com.qq.modules.td.model.TDGameInfo;
   import com.qq.utils.StateMachine;
   import flash.events.Event;
   import flash.geom.Point;
   
   public class TDBlowZombieAction extends BasicAction
   {
      
      private static const BlowZombie:String = "BlowZombie";
      
      private static const BlowWaiting:String = "BlowWaiting";
      
      private static const EndBlowZombie:String = "EndBlowZombie";
       
      
      private var _blowObject:IGameObject;
      
      private var _endBlowPosX:int;
      
      private var _lastTime:Number;
      
      private var _stateMachine:StateMachine;
      
      private var _blowSpeed:int;
      
      public function TDBlowZombieAction()
      {
         super();
         this._stateMachine = new StateMachine();
         this._stateMachine.addState(BlowZombie,this.enterBlowZombie,this.runningBlowZombie);
         this._stateMachine.addState(BlowWaiting,this.enterBlowWaiting,this.runningBlowWaiting);
         this._stateMachine.addState(EndBlowZombie,this.enterEndBlowZombie);
      }
      
      override public function enterState(param1:Array = null) : void
      {
         super.enterState(param1);
         this._lastTime = TDGameInfo.getInstance().getCurGameTime();
         this._blowSpeed = _gameObject.objectModel.staticInfo.getParam(TDConstant.NormalObj_Param_BlowSpeed);
         _gameObject.animation.gotoAndPlay("loop",0);
         this._stateMachine.setState(BlowZombie);
         TDSoundCmd.sandstorm();
      }
      
      private function onOutroComplete(param1:Event) : void
      {
         _gameObject.animation.removeEventListener(Event.COMPLETE,this.onOutroComplete);
         _gameObject.dispose();
      }
      
      override public function runningState() : void
      {
         super.runningState();
         this._stateMachine.doRunningFunc();
      }
      
      override public function leaveState() : void
      {
         _gameObject.animation.removeEventListener(Event.COMPLETE,this.onOutroComplete);
         if(this._blowObject != null)
         {
            this._blowObject = null;
         }
         if(this._stateMachine != null)
         {
            this._stateMachine.clean();
            this._stateMachine = null;
         }
      }
      
      private function enterBlowZombie(param1:Array = null) : void
      {
         var _loc2_:int = _gameObject.getRunningProp(TDConstant.GameObject_Prop_BlowZombie_Type);
         this._endBlowPosX = _gameObject.getRunningProp(TDConstant.GameObject_Prop_EndBlowRow);
         var _loc3_:TDMapWaveEnemyData = new TDMapWaveEnemyData();
         this._blowObject = TDFactory.createBT_Zombie(_loc2_,null,_loc3_);
         TDGameObjectCmd.addZombieToStageByPos(this._blowObject,new Point(_gameObject.x,_gameObject.y));
         this._blowObject.setAction(TDConstant.ZAction_Idle);
         this._blowObject.setShadeVisible(false);
         this._blowObject.setFrozenAI(true);
      }
      
      private function runningBlowZombie(param1:Array = null) : void
      {
         if(this._blowObject.x < this._endBlowPosX)
         {
            this._stateMachine.setState(BlowWaiting);
            return;
         }
         if(this._blowObject.isVaild && !this._blowObject.objectModel.isPermitMove())
         {
            this._stateMachine.setState(EndBlowZombie);
            return;
         }
         if(this._blowObject.objectModel.checkState(TDConstant.TDUnitState_Frozen) || !this._blowObject.objectModel.isAlive())
         {
            this._stateMachine.setState(EndBlowZombie);
            return;
         }
         if(this._blowObject.isVaild)
         {
            this._blowObject.setLocation(_gameObject.x,_gameObject.y);
         }
         var _loc2_:Number = TDGameInfo.getInstance().getCurGameTime();
         var _loc3_:Number = (_loc2_ - this._lastTime) * 0.001;
         this._lastTime = _loc2_;
         if(this._blowObject.x - this._endBlowPosX < 100 && this._blowSpeed > 15)
         {
            this._blowSpeed -= 2;
         }
         var _loc4_:Number = this._blowSpeed * _loc3_;
         _gameObject.setLocation(_gameObject.x - _loc4_,_gameObject.y);
      }
      
      private function enterBlowWaiting(param1:Array = null) : void
      {
         this._lastTime = TDGameInfo.getInstance().getCurGameTime();
      }
      
      private function runningBlowWaiting(param1:Array = null) : void
      {
         var _loc2_:Number = TDGameInfo.getInstance().getCurGameTime();
         if(_loc2_ - this._lastTime > 1500)
         {
            this._stateMachine.setState(EndBlowZombie);
         }
      }
      
      private function enterEndBlowZombie(param1:Array = null) : void
      {
         if(this._blowObject.isVaild)
         {
            if(!this._blowObject.objectModel.checkState(TDConstant.TDUnitState_Frozen))
            {
               this._blowObject.setFrozenAI(false);
            }
            this._blowObject.setShadeVisible(true);
         }
         _gameObject.animation.gotoAndPlay("outro");
         _gameObject.animation.addEventListener(Event.COMPLETE,this.onOutroComplete);
      }
   }
}
