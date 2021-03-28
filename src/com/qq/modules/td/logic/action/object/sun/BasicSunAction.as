package com.qq.modules.td.logic.action.object.sun
{
   import com.qq.modules.td.logic.action.basic.BasicAction;
   import com.qq.modules.td.logic.unit.basic.IGameObject;
   import com.qq.modules.td.logic.unit.object.TDSun;
   
   public class BasicSunAction extends BasicAction
   {
       
      
      protected var _sun:TDSun;
      
      public function BasicSunAction()
      {
         super();
      }
      
      override public function setGameObject(param1:IGameObject, param2:String) : void
      {
         super.setGameObject(param1,param2);
         this._sun = param1 as TDSun;
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
         this._sun = null;
         super.dispose();
      }
   }
}
