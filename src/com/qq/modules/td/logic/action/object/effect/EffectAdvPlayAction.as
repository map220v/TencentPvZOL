package com.qq.modules.td.logic.action.object.effect
{
   import com.qq.constant.td.TDConstant;
   import com.qq.modules.td.logic.action.basic.BasicAction;
   import com.qq.modules.td.model.TDGameInfo;
   import com.qq.modules.td.view.effects.TDEffectPlayInfo;
   import com.qq.utils.DMath;
   import flash.events.Event;
   
   public class EffectAdvPlayAction extends BasicAction
   {
       
      
      private var _effectInitInfo:TDEffectPlayInfo;
      
      private var _isOnLoop:Boolean = true;
      
      private var _playLoop:int = 1;
      
      private var _playTime:int = 3000;
      
      private var _enterTime:int;
      
      public function EffectAdvPlayAction()
      {
         super();
      }
      
      override public function enterState(param1:Array = null) : void
      {
         var _loc2_:String = null;
         var _loc3_:Array = null;
         var _loc4_:int = 0;
         super.enterState(param1);
         if(_gameObject.hasRunningProp(TDConstant.Gameobject_Prop_InitUnitParam))
         {
            this._effectInitInfo = _gameObject.getRunningProp(TDConstant.Gameobject_Prop_InitUnitParam);
         }
         if(this._effectInitInfo)
         {
            _loc2_ = this._effectInitInfo.frameLabe;
            this._playLoop = this._effectInitInfo.loopCount;
            this._playTime = this._effectInitInfo.playTime;
            this._isOnLoop = this._effectInitInfo.isOnLoop;
         }
         if(_loc2_ == null || _loc2_ == "")
         {
            _loc3_ = _gameObject.animation.getAllLabelName();
            _loc4_ = DMath.randNum(0,_loc3_.length - 1);
            _loc2_ = _loc3_[_loc4_];
         }
         if(this._isOnLoop)
         {
            _gameObject.animation.gotoAndPlay(_loc2_,this._playLoop);
            _gameObject.animation.addEventListener(Event.COMPLETE,this.onFinishAction);
         }
         else
         {
            _gameObject.animation.gotoAndPlay(_loc2_,true);
            this._enterTime = TDGameInfo.getInstance().getCurGameTime();
         }
      }
      
      override public function runningState() : void
      {
         super.runningState();
         if(!this._isOnLoop && this._enterTime + this._playTime < TDGameInfo.getInstance().getCurGameTime())
         {
            _gameObject.dispose();
         }
      }
      
      override public function leaveState() : void
      {
         _gameObject.animation.removeEventListener(Event.COMPLETE,this.onFinishAction);
      }
      
      private function onFinishAction(param1:Event) : void
      {
         _gameObject.dispose();
      }
   }
}
