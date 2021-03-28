package com.qq.modules.td.logic.action.object.sunBomb
{
   import com.qq.modules.td.logic.action.basic.BasicAction;
   import com.qq.modules.td.logic.unit.basic.IGameObject;
   import com.qq.modules.td.logic.unit.object.TDSunBomb;
   
   public class BasicSunBombAction extends BasicAction
   {
       
      
      protected var _sunBomb:TDSunBomb;
      
      public function BasicSunBombAction()
      {
         super();
      }
      
      override public function setGameObject(param1:IGameObject, param2:String) : void
      {
         super.setGameObject(param1,param2);
         this._sunBomb = param1 as TDSunBomb;
      }
      
      override public function enterState(param1:Array = null) : void
      {
         super.enterState(param1);
      }
      
      override public function runningState() : void
      {
      }
      
      override public function leaveState() : void
      {
      }
      
      override public function dispose() : void
      {
         this._sunBomb = null;
         super.dispose();
      }
   }
}
