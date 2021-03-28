package com.qq.modules.td.logic.bt_ai.aiNode.aiCode.zombie
{
   import com.qq.constant.td.TDConstant;
   import com.qq.modules.td.data.map.TDMapTileData;
   import com.qq.modules.td.logic.bt_ai.aiNode.BaseZombieNodePvz;
   import com.qq.modules.td.logic.bt_ai.aiNode.executeNode.ExeDoAction;
   import com.qq.modules.td.logic.bt_ai.aiNode.requireNode.ReqAttackTarget;
   import com.qq.modules.td.logic.bt_ai.aiNode.requireNode.ReqZombieDurationExpire;
   import com.qq.modules.td.logic.unit.zombie.BasicZombie;
   import com.qq.modules.td.model.TDGameInfo;
   
   public class AI_Zombie_Mech_Gargantuar extends BaseZombieNodePvz
   {
       
      
      public function AI_Zombie_Mech_Gargantuar()
      {
         super();
      }
      
      override public function calculate() : Boolean
      {
         if(this.isBelowHalfHp() && !this.isCrossTargetTileColumn() && this.selfObj.getRunningProp(TDConstant.Gameobject_Prop_Mech_Gargantuar_Has_Summoned) == null)
         {
            ExeDoAction.calculateStatic(selfObj,TDConstant.ZAction_Mech_Gargantuar_Summon);
         }
         else if(ReqZombieDurationExpire.calculateStatic(selfObj,true))
         {
            ExeDoAction.calculateStatic(selfObj,TDConstant.ZAction_Mech_Gargantuar_Laser);
         }
         else if(ReqAttackTarget.calculateStatic(true,selfObj))
         {
            ExeDoAction.calculateStatic(selfObj,TDConstant.ZAction_Mech_Gargantuar_Hammer);
         }
         else
         {
            ExeDoAction.calculateStatic(selfObj,TDConstant.ZAction_Mech_Gargantuar_Walk);
         }
         return true;
      }
      
      private function isBelowHalfHp() : Boolean
      {
         return this.selfObj.objectModel.curHp.get() <= this.selfObj.objectModel.maxHp.get() * 0.5;
      }
      
      private function isCrossTargetTileColumn() : Boolean
      {
         var _loc1_:TDMapTileData = TDGameInfo.getInstance().getRoadTileByGamePos(selfObj.x,selfObj.y);
         var _loc2_:int = TDGameInfo.getInstance().maxCol - (selfObj as BasicZombie).zombieData.zombiestaticInfo.getParam(TDConstant.Zombie_Param_Speedup_TileColumn);
         if(_loc1_ && _loc1_.roadCol >= _loc2_ - 1)
         {
            return true;
         }
         return false;
      }
   }
}
