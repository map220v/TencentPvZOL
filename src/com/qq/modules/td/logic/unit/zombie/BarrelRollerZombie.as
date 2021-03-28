package com.qq.modules.td.logic.unit.zombie
{
   import com.qq.constant.td.TDConstant;
   import com.qq.modules.td.command.game.TDGameObjectCmd;
   import com.qq.modules.td.logic.TDFactory;
   import com.qq.modules.td.logic.unit.basic.IGameObject;
   import com.qq.modules.td.model.TDGameInfo;
   
   public class BarrelRollerZombie extends BasicZombie
   {
       
      
      private var _barrel:IGameObject;
      
      public function BarrelRollerZombie()
      {
         super();
      }
      
      public function get barrel() : IGameObject
      {
         return this._barrel;
      }
      
      override public function revive(param1:Array = null) : void
      {
         TDGameObjectCmd.addNormalGameObjectByPos(TDConstant.UnitType_Barrel,this.x,this.y);
         this._barrel = TDGameInfo.getInstance().getGameObjctByUID(TDFactory.getLastUnitUin());
         this._barrel.setRunningProp(TDConstant.Gameobject_Prop_Die_Popup_Zombie,true);
         this.setLocation(this.x,this.y);
         super.revive(param1);
      }
      
      override public function setLocation(param1:Number, param2:Number) : void
      {
         super.setLocation(param1,param2);
         if(this.barrel && this.barrel.isVaild)
         {
            this._barrel.setLocation(this.x - 70,this.y);
         }
      }
      
      override public function dispose(param1:Boolean = true) : void
      {
         super.dispose(param1);
         this._barrel = null;
      }
   }
}
