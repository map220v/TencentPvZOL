package com.qq.modules.td.logic.action.basic
{
   import com.qq.modules.td.logic.unit.basic.IGameObject;
   
   public interface IAction
   {
       
      
      function setGameObject(param1:IGameObject, param2:String) : void;
      
      function enterState(param1:Array = null) : void;
      
      function update() : void;
      
      function runningState() : void;
      
      function leaveState() : void;
      
      function dispose() : void;
   }
}
