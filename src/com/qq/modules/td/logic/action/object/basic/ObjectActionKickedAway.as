package com.qq.modules.td.logic.action.object.basic
{
   import com.qq.modules.td.logic.action.basic.BasicAction;
   import com.qq.modules.td.logic.unit.zombie.BasicZombie;
   import com.qq.modules.td.model.TDGameInfo;
   
   public class ObjectActionKickedAway extends BasicAction
   {
       
      
      private const _moveSpeed:int = 40;
      
      private var _xSpeed:int;
      
      private var _ySpeed:int;
      
      public function ObjectActionKickedAway()
      {
         super();
      }
      
      override public function enterState(param1:Array = null) : void
      {
         super.enterState(param1);
         _gameObject.isVaild = false;
         var _loc2_:Number = Math.PI * (Math.random() - 0.5);
         this._xSpeed = this._moveSpeed * Math.cos(_loc2_);
         this._ySpeed = this._moveSpeed * Math.sin(_loc2_);
         _gameObject.setFrozenAI(true);
         if(_gameObject is BasicZombie)
         {
            (_gameObject as BasicZombie).lootItem();
         }
      }
      
      override public function runningState() : void
      {
         super.runningState();
         _gameObject.setLocation(_gameObject.x + this._xSpeed,_gameObject.y + this._ySpeed);
         _gameObject.rotation += 5;
         if(!TDGameInfo.getInstance().isInScreen(_gameObject.x,_gameObject.y))
         {
            _gameObject.Dispose();
         }
      }
      
      override public function leaveState() : void
      {
         _gameObject.rotation = 0;
         super.leaveState();
      }
   }
}
