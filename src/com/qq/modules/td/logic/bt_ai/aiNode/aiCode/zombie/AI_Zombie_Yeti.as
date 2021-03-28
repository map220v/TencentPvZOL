package com.qq.modules.td.logic.bt_ai.aiNode.aiCode.zombie
{
   import com.qq.constant.td.TDConstant;
   import com.qq.modules.td.data.map.TDMapTileData;
   import com.qq.modules.td.logic.bt_ai.aiNode.BaseZombieNodePvz;
   import com.qq.modules.td.logic.bt_ai.aiNode.executeNode.ExeDoAction;
   import com.qq.modules.td.logic.bt_ai.aiNode.requireNode.ReqAttackTarget;
   import com.qq.modules.td.logic.unit.zombie.YetiZombie;
   import com.qq.modules.td.model.TDGameInfo;
   
   public class AI_Zombie_Yeti extends BaseZombieNodePvz
   {
       
      
      private var _xValue:int;
      
      public function AI_Zombie_Yeti(param1:int = 30)
      {
         super(param1);
      }
      
      override public function calculate() : Boolean
      {
         if(ReqAttackTarget.calculateStatic(true,selfObj))
         {
            ExeDoAction.calculateStatic(selfObj,TDConstant.ZAction_Eat);
         }
         else if(this.yeti.isRunningAway)
         {
            ExeDoAction.calculateStatic(selfObj,TDConstant.ZAction_WalkBackwards);
         }
         else if(this.yeti.x < this.runAwayX)
         {
            this.yeti.isRunningAway = true;
            ExeDoAction.calculateStatic(selfObj,TDConstant.ZAction_WalkBackwards);
         }
         else
         {
            ExeDoAction.calculateStatic(selfObj,TDConstant.ZAction_Walk);
         }
         return true;
      }
      
      private function get yeti() : YetiZombie
      {
         return selfObj as YetiZombie;
      }
      
      private function get runAwayX() : int
      {
         var _loc1_:TDMapTileData = null;
         if(this._xValue == 0)
         {
            _loc1_ = TDGameInfo.getInstance().getRoadTileInf((zombie as YetiZombie).runAwayTile,1);
            this._xValue = _loc1_.rect.x;
         }
         return this._xValue;
      }
   }
}
