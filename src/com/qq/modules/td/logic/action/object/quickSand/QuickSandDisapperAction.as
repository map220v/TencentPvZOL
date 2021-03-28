package com.qq.modules.td.logic.action.object.quickSand
{
   import com.greensock.TweenMax;
   import com.qq.modules.td.logic.action.basic.BasicAction;
   import com.qq.modules.td.model.TDGameInfo;
   
   public class QuickSandDisapperAction extends BasicAction
   {
       
      
      private var _time:Number;
      
      private var _isDisappering:Boolean;
      
      public function QuickSandDisapperAction()
      {
         super();
      }
      
      override public function enterState(param1:Array = null) : void
      {
         super.enterState(param1);
         this._isDisappering = false;
         this._time = TDGameInfo.getInstance().getCurGameTime();
      }
      
      override public function dispose() : void
      {
         TweenMax.killTweensOf(_gameObject);
         super.dispose();
      }
      
      override public function runningState() : void
      {
         var _loc1_:Number = NaN;
         super.runningState();
         if(!this._isDisappering)
         {
            _loc1_ = TDGameInfo.getInstance().getCurGameTime();
            if(_loc1_ - this._time > 4000)
            {
               this._isDisappering = true;
               TweenMax.to(_gameObject,0.3,{
                  "alpha":0,
                  "delay":1,
                  "onComplete":this.onFinishDisappear
               });
            }
         }
      }
      
      private function onFinishDisappear() : void
      {
         _gameObject.dispose();
      }
   }
}
