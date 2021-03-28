package com.qq.modules.td.logic.action.object.nutsShield
{
   import com.qq.modules.td.logic.action.basic.BasicAction;
   
   public class NutsShieldIdleAction extends BasicAction
   {
       
      
      private var _lastCurHp:Number;
      
      private var _lastLabelName:String;
      
      public function NutsShieldIdleAction()
      {
         super();
      }
      
      override public function enterState(param1:Array = null) : void
      {
         super.enterState(param1);
         this._lastCurHp = -1;
         this.updateState();
      }
      
      override public function runningState() : void
      {
         if(this._lastCurHp == -1)
         {
            this._lastCurHp = _gameObject.objectModel.curHp.get();
         }
         var _loc1_:Number = _gameObject.objectModel.curHp.get();
         if(this._lastCurHp != _loc1_)
         {
            this.updateState();
         }
      }
      
      public function updateState() : void
      {
         var _loc2_:String = null;
         var _loc1_:Number = _gameObject.objectModel.curHp.get() / _gameObject.objectModel.maxHp.get();
         if(_loc1_ > 0.75)
         {
            _loc2_ = "plantfood_shieldIdle";
         }
         else if(_loc1_ > 0.5)
         {
            _loc2_ = "plantfood_shieldIdle_damage1";
         }
         else
         {
            _loc2_ = "plantfood_shieldIdle_damage2";
         }
         if(this._lastLabelName != _loc2_)
         {
            _gameObject.animation.gotoAndPlay(_loc2_,true);
            this._lastLabelName = _loc2_;
         }
      }
   }
}
