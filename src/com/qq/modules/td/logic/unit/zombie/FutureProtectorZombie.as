package com.qq.modules.td.logic.unit.zombie
{
   import com.qq.constant.td.TDConstant;
   import com.qq.modules.td.command.game.TDGameObjectCmd;
   import com.qq.modules.td.logic.TDFactory;
   import com.qq.modules.td.logic.unit.basic.IGameObject;
   import com.qq.modules.td.model.TDGameInfo;
   
   public class FutureProtectorZombie extends BasicZombie
   {
       
      
      private var _shield:IGameObject;
      
      public function FutureProtectorZombie()
      {
         super();
      }
      
      public function get shield() : IGameObject
      {
         return this._shield;
      }
      
      public function openShield() : void
      {
         TDGameObjectCmd.addNormalGameObjectByPos(TDConstant.UnitType_ElectromagneticShield,this.x,this.y);
         this._shield = TDGameInfo.getInstance().getGameObjctByUID(TDFactory.getLastUnitUin());
         this.setLocation(this.x,this.y);
      }
      
      public function closeShield() : void
      {
         this._shield.Dispose();
      }
      
      override public function setLocation(param1:Number, param2:Number) : void
      {
         super.setLocation(param1,param2);
         if(this._shield && this._shield.isVaild)
         {
            this._shield.setLocation(this.x - 70,this.y - 50);
         }
      }
      
      override public function dispose(param1:Boolean = true) : void
      {
         super.dispose(param1);
         if(this._shield && !this._shield.hasDisposed)
         {
            this._shield.Dispose();
         }
         this._shield = null;
      }
      
      public function get isHaveShield() : Boolean
      {
         return this._shield != null && this._shield.isVaild;
      }
   }
}
