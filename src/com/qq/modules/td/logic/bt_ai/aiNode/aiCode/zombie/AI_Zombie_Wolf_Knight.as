package com.qq.modules.td.logic.bt_ai.aiNode.aiCode.zombie
{
   import com.qq.constant.td.TDConstant;
   import com.qq.modules.td.data.map.TDMapTileData;
   import com.qq.modules.td.logic.bt_ai.aiNode.BaseZombieNodePvz;
   import com.qq.modules.td.logic.bt_ai.aiNode.executeNode.ExeDoAction;
   import com.qq.modules.td.logic.bt_ai.aiNode.requireNode.ReqAttackTarget;
   import com.qq.modules.td.logic.bt_ai.aiUtils.TDSearchTargetUtils;
   import com.qq.modules.td.logic.unit.plant.BasicPlant;
   import com.qq.modules.td.logic.unit.zombie.BasicZombie;
   import com.qq.modules.td.model.TDGameInfo;
   
   public class AI_Zombie_Wolf_Knight extends BaseZombieNodePvz
   {
       
      
      private var m_hasSwoop:Boolean;
      
      public function AI_Zombie_Wolf_Knight()
      {
         super();
      }
      
      override public function calculate() : Boolean
      {
         var _loc1_:Boolean = false;
         if(ReqAttackTarget.calculateStatic(true,selfObj))
         {
            if(!this.m_hasSwoop && selfObj.getRunningProp(TDConstant.Gameobject_Prop_Wolf_Speedup) == true)
            {
               this.m_hasSwoop = true;
               _loc1_ = this.facePlantCrossEnable();
               ExeDoAction.calculateStatic(selfObj,TDConstant.ZAction_Wolf_Knight_Swoop,[_loc1_]);
            }
            else
            {
               ExeDoAction.calculateStatic(selfObj,TDConstant.ZAction_Eat);
            }
         }
         else if(this.isCrossAccerlateTile())
         {
            selfObj.setRunningProp(TDConstant.Gameobject_Prop_Wolf_Speedup,true);
            ExeDoAction.calculateStatic(selfObj,TDConstant.ZAction_Run);
         }
         else
         {
            ExeDoAction.calculateStatic(selfObj,TDConstant.ZAction_Walk);
         }
         return true;
      }
      
      private function isCrossAccerlateTile() : Boolean
      {
         var _loc1_:TDMapTileData = TDGameInfo.getInstance().getRoadTileByGamePos(selfObj.x,selfObj.y);
         var _loc2_:int = (selfObj as BasicZombie).zombieData.zombiestaticInfo.getParam(TDConstant.Zombie_Param_Speedup_TileColumn);
         if(_loc1_ && _loc1_.roadCol >= _loc2_ - 1)
         {
            return true;
         }
         return false;
      }
      
      private function facePlantCrossEnable() : Boolean
      {
         var _loc2_:BasicPlant = null;
         var _loc1_:TDMapTileData = TDGameInfo.getInstance().getRoadTileByGamePos(selfObj.x,selfObj.y);
         if(_loc1_)
         {
            _loc2_ = TDGameInfo.getInstance().getPlantByPos(_loc1_.roadRow,_loc1_.roadCol + 1);
            if(TDSearchTargetUtils.searchTargetNutsShieldByColumn(_loc1_.roadCol + 1) != null || TDSearchTargetUtils.searchTargetNutsShieldByColumn(_loc1_.roadCol + 2) != null || _loc2_ && _loc2_.plantData.plantHeight == TDConstant.PlantHeightType_High)
            {
               return false;
            }
         }
         return true;
      }
   }
}
