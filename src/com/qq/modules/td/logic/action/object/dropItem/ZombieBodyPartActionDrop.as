package com.qq.modules.td.logic.action.object.dropItem
{
   import com.qq.modules.td.logic.action.basic.BasicAction;
   import com.qq.modules.td.logic.unit.basic.IGameObject;
   import com.qq.modules.td.logic.unit.object.TDZombieDropItem;
   import com.qq.modules.td.model.TDGameInfo;
   
   public class ZombieBodyPartActionDrop extends BasicAction
   {
       
      
      protected var _bodyPart:TDZombieDropItem;
      
      protected var _lastTime:int;
      
      public function ZombieBodyPartActionDrop()
      {
         super();
      }
      
      override public function setGameObject(param1:IGameObject, param2:String) : void
      {
         super.setGameObject(param1,param2);
         this._bodyPart = param1 as TDZombieDropItem;
      }
      
      override public function runningState() : void
      {
         this.update();
      }
      
      override public function enterState(param1:Array = null) : void
      {
         super.enterState(param1);
         this._lastTime = TDGameInfo.getInstance().getCurGameTime();
      }
      
      override public function update() : void
      {
      }
      
      protected function disappear() : void
      {
         _gameObject.dispose();
      }
   }
}
