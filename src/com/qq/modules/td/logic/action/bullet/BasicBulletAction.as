package com.qq.modules.td.logic.action.bullet
{
   import com.qq.modules.td.logic.action.basic.BasicAction;
   import com.qq.modules.td.logic.unit.basic.IGameObject;
   import com.qq.modules.td.logic.unit.bullet.BasicBullet;
   
   public class BasicBulletAction extends BasicAction
   {
       
      
      protected var _bullet:BasicBullet;
      
      public function BasicBulletAction()
      {
         super();
      }
      
      override public function setGameObject(param1:IGameObject, param2:String) : void
      {
         super.setGameObject(param1,param2);
         this._bullet = param1 as BasicBullet;
      }
      
      override public function dispose() : void
      {
         this._bullet = null;
         super.dispose();
      }
   }
}
