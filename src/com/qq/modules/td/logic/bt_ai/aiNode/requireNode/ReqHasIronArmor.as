package com.qq.modules.td.logic.bt_ai.aiNode.requireNode
{
   import com.qq.constant.td.TDConstant;
   import com.qq.modules.td.logic.bt_ai.aiNode.BasePlantNodePvz;
   import com.qq.modules.td.logic.unit.zombie.BasicZombie;
   import com.qq.modules.td.model.TDGameInfo;
   import flash.geom.Rectangle;
   import tencent.tools.behaviourTrees.BehaviourTreeNodeType;
   
   public class ReqHasIronArmor extends BasePlantNodePvz
   {
       
      
      public function ReqHasIronArmor()
      {
         super(BehaviourTreeNodeType.REQUIRE);
      }
      
      override public function calculate() : Boolean
      {
         var _loc3_:BasicZombie = null;
         var _loc1_:Rectangle = TDGameInfo.getInstance().getEffectRectByRoadTile(plant.plantData.tileIndex,plant.plantData.plantStaticInfo.baseInfo.getParam(TDConstant.Plant_Param_DamageTileCol),plant.plantData.plantStaticInfo.baseInfo.getParam(TDConstant.Plant_Param_DamageTileRow));
         var _loc2_:Array = TDGameInfo.getInstance().getZombieList(null,TDConstant.TDCamp_Enemy);
         for each(_loc3_ in _loc2_)
         {
            if(_loc1_.contains(_loc3_.x,_loc3_.y) && _loc3_.hasIronArmor())
            {
               return true;
            }
         }
         return false;
      }
   }
}
