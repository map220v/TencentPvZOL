package com.qq.modules.td.logic.bt_ai.aiNode
{
   import com.qq.modules.td.logic.unit.zombie.BasicZombie;
   
   public class BaseZombieNodePvz extends BaseNodePvz
   {
       
      
      public var zombie:BasicZombie;
      
      public function BaseZombieNodePvz(param1:int = 30)
      {
         super(param1);
      }
      
      override public function setStaticParams(param1:Array) : void
      {
         super.setStaticParams(param1);
         this.zombie = selfObj as BasicZombie;
      }
      
      override public function dispose() : void
      {
         this.zombie = null;
         super.dispose();
      }
   }
}
