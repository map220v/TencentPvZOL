package com.qq.modules.td.logic.action.object.electricBubble
{
   import com.qq.constant.td.TDConstant;
   import com.qq.modules.td.logic.action.basic.BasicAction;
   import com.qq.modules.td.logic.buff.TDBuffInfo;
   import com.qq.modules.td.logic.numeric.TDDamageCaculete;
   import com.qq.modules.td.logic.unit.basic.IGameObject;
   import flash.events.Event;
   
   public class ElectricBubbleExplode extends BasicAction
   {
       
      
      private var _target:IGameObject;
      
      private var _damageValue:Number;
      
      public function ElectricBubbleExplode()
      {
         super();
      }
      
      override public function enterState(param1:Array = null) : void
      {
         var _loc2_:TDBuffInfo = null;
         var _loc3_:TDBuffInfo = null;
         super.enterState(param1);
         this._target = param1[0];
         this._damageValue = param1[1];
         _gameObject.animation.gotoAndPlay("shake");
         _gameObject.animation.addEventListener(Event.COMPLETE,this.onShakeComplete);
         if(this._target)
         {
            _loc2_ = this._target.objectModel.getBuffByID(TDConstant.TDBuffID_BubbleSround);
            if(_loc2_)
            {
               _loc2_.setDynamicParam(TDConstant.TDBuffParam_electric,true);
            }
            this._target.objectModel.removeBuff(TDConstant.TDBuffID_BubbleSround);
            _loc3_ = this._target.objectModel.getBuffByID(TDConstant.TDBuffID_Special_BubbleSround);
            if(_loc3_)
            {
               _loc3_.setDynamicParam(TDConstant.TDBuffParam_electric,true);
            }
            this._target.objectModel.removeBuff(TDConstant.TDBuffID_Special_BubbleSround);
         }
      }
      
      protected function onShakeComplete(param1:Event) : void
      {
         _gameObject.animation.removeEventListener(Event.COMPLETE,this.onShakeComplete);
         _gameObject.animation.gotoAndPlay("explode");
         _gameObject.animation.addEventListener(Event.COMPLETE,this.onExplodeComplete);
         if(this._target)
         {
            TDDamageCaculete.executeDamage(this._target,0 - this._damageValue,TDConstant.AttackType_Normal,TDConstant.AttackMode_Normal,null);
         }
      }
      
      protected function onExplodeComplete(param1:Event) : void
      {
         _gameObject.animation.removeEventListener(Event.COMPLETE,this.onExplodeComplete);
         _gameObject.Dispose();
      }
      
      override public function runningState() : void
      {
         if(this._target)
         {
            _gameObject.setLocation(this._target.x,this._target.y - this._target.damageArea.height * 0.5);
         }
         else
         {
            _gameObject.Dispose();
         }
         super.runningState();
      }
      
      override public function leaveState() : void
      {
         _gameObject.animation.removeEventListener(Event.COMPLETE,this.onShakeComplete);
         _gameObject.animation.removeEventListener(Event.COMPLETE,this.onExplodeComplete);
         super.leaveState();
      }
   }
}
