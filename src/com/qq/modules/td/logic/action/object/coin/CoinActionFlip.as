package com.qq.modules.td.logic.action.object.coin
{
   import com.qq.constant.td.TDConstant;
   import com.qq.modules.td.logic.action.basic.BasicAction;
   import com.qq.modules.td.model.TDGameInfo;
   import flash.events.MouseEvent;
   
   public class CoinActionFlip extends BasicAction
   {
       
      
      private var _lastUpdateTime:Number;
      
      private var _existTime:int;
      
      public function CoinActionFlip()
      {
         super();
      }
      
      override public function enterState(param1:Array = null) : void
      {
         super.enterState(param1);
         _gameObject.animation.gotoAndPlay(TDConstant.Coin_flip,true);
         _gameObject.addMouseEventListener(MouseEvent.ROLL_OVER,this.onRollOver);
         this._existTime = _gameObject.objectModel.staticInfo.getParam(TDConstant.NormalObj_Param_ExistTime);
         this._lastUpdateTime = TDGameInfo.getInstance().getCurGameTime();
      }
      
      override public function runningState() : void
      {
         var _loc1_:Number = TDGameInfo.getInstance().getCurGameTime();
         if(_loc1_ - this._lastUpdateTime > this._existTime)
         {
            _gameObject.setAction(TDConstant.ObjectAction_Disappear);
         }
      }
      
      override public function leaveState() : void
      {
         _gameObject.removeMouseEventListener(MouseEvent.ROLL_OVER,this.onRollOver);
         super.leaveState();
      }
      
      private function onRollOver() : void
      {
         _gameObject.setAction(TDConstant.CoinAction_Collect,[TDGameInfo.getInstance().coinTargetX,TDGameInfo.getInstance().coinTargetY]);
      }
   }
}
