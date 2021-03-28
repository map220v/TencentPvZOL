package com.qq.modules.td.logic.action.basic
{
   import com.qq.modules.td.logic.unit.basic.IGameObject;
   
   public class BasicAction implements IAction
   {
       
      
      protected var _actionID:String;
      
      protected var _params:Array;
      
      protected var _gameObject:IGameObject;
      
      public function BasicAction()
      {
         super();
      }
      
      public function setGameObject(param1:IGameObject, param2:String) : void
      {
         this._gameObject = param1;
         this._actionID = param2;
      }
      
      public function enterState(param1:Array = null) : void
      {
         this._params = param1;
      }
      
      public function update() : void
      {
         this.runningState();
      }
      
      public function runningState() : void
      {
      }
      
      public function leaveState() : void
      {
      }
      
      public function dispose() : void
      {
         this._params = null;
         this._gameObject = null;
      }
      
      public function readParams(param1:int, param2:int) : int
      {
         if(this._params == null || this._params[param1] == null)
         {
            return param2;
         }
         return this._params[param1];
      }
      
      public function readObjectParams(param1:int) : Object
      {
         if(this._params == null)
         {
            return null;
         }
         return this._params[param1];
      }
   }
}
