package com.qq.modules.td.logic.action.plant.boomerang
{
   import com.qq.modules.td.command.game.TDFireBulletCmd;
   import com.qq.modules.td.logic.unit.basic.IGameObject;
   import tencent.tools.planMachine.ICallBack;
   import tencent.tools.planMachine.Plan;
   
   public class PlanShootBullet extends Plan
   {
       
      
      private var shooter:Object;
      
      private var target:Object;
      
      private var bulletType:int;
      
      private var offsetX:int;
      
      private var offsetY:int;
      
      private var shootDir:int;
      
      public function PlanShootBullet(param1:Object, param2:Object, param3:int, param4:int = 0, param5:int = 0, param6:int = 1)
      {
         super();
         this.shooter = param1;
         this.target = param2;
         this.bulletType = param3;
         this.offsetX = param4;
         this.offsetY = param5;
         this.shootDir = param6;
      }
      
      override public function doPlan(param1:ICallBack) : void
      {
         var _loc2_:String = null;
         super.doPlan(param1);
         if(this.shooter is IGameObject)
         {
            _loc2_ = (this.shooter as IGameObject).objectModel.staticInfo.firePosBoneName;
         }
         TDFireBulletCmd.shoot(this.shooter,this.target,this.bulletType,_loc2_,this.offsetX,this.offsetY,this.shootDir);
         setComplete();
      }
      
      override protected function dispose() : void
      {
         this.shooter = null;
         this.target = null;
      }
   }
}
