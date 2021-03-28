package com.qq.modules.td.logic.action.object.magnetArmor
{
   import com.qq.CommandName;
   import com.qq.modules.td.logic.action.basic.BasicAction;
   import com.qq.modules.td.logic.unit.basic.IGameObject;
   import com.qq.modules.td.logic.unit.object.TDZombieMagnetArmor;
   import com.qq.modules.td.model.TDGameInfo;
   import com.qq.utils.CommandDispatcher;
   import com.qq.utils.DMath;
   
   public class ZombieItemActionMagnet extends BasicAction
   {
       
      
      public var targetX:int;
      
      public var targetY:int;
      
      private var _lastUpdateTime:Number;
      
      protected var _isWaitDisappear:Boolean;
      
      private var _speed:int;
      
      private var _acc:int;
      
      public function ZombieItemActionMagnet()
      {
         super();
      }
      
      override public function setGameObject(param1:IGameObject, param2:String) : void
      {
         super.setGameObject(param1,param2);
         var _loc3_:TDZombieMagnetArmor = param1 as TDZombieMagnetArmor;
         this.targetX = _loc3_.targetX;
         this.targetY = _loc3_.targetY;
         this._isWaitDisappear = false;
         this._speed = 200;
         this._acc = 30;
      }
      
      protected function disappear() : void
      {
         _gameObject.dispose();
      }
      
      override public function enterState(param1:Array = null) : void
      {
         super.enterState(param1);
         this._lastUpdateTime = TDGameInfo.getInstance().getCurGameTime();
         CommandDispatcher.send(CommandName.TD_AddObjectToScreen,{"object":_gameObject});
      }
      
      override public function runningState() : void
      {
         var _loc2_:Number = NaN;
         var _loc3_:Number = NaN;
         var _loc4_:Number = NaN;
         var _loc5_:int = 0;
         var _loc6_:Number = NaN;
         var _loc7_:Number = NaN;
         var _loc8_:Number = NaN;
         var _loc9_:Number = NaN;
         var _loc1_:Number = TDGameInfo.getInstance().getCurGameTime();
         if(!this._isWaitDisappear)
         {
            _loc2_ = this.targetY - _gameObject.y;
            _loc3_ = this.targetX - _gameObject.x;
            _loc4_ = Math.atan2(_loc2_,_loc3_);
            _loc6_ = (_loc5_ = _loc1_ - this._lastUpdateTime) / 1000 * this._speed;
            _loc7_ = Math.sin(_loc4_) * _loc6_;
            _loc8_ = Math.cos(_loc4_) * _loc6_;
            _gameObject.x += _loc8_;
            _gameObject.y += _loc7_;
            if((_loc9_ = DMath.getDistance(_gameObject.x,_gameObject.y,this.targetX,this.targetY)) < 10)
            {
               this._isWaitDisappear = true;
               _gameObject.x = this.targetX;
               _gameObject.y = this.targetY;
            }
            this._speed += this._acc;
            this._lastUpdateTime = _loc1_;
         }
         else if(_loc1_ - this._lastUpdateTime > 1000)
         {
            this.disappear();
         }
      }
   }
}
