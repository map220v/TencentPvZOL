package com.qq.modules.td.logic.bt_ai.aiNode.aiCode.plant
{
   import com.qq.constant.td.TDConstant;
   import com.qq.modules.td.data.map.TDMapTileData;
   import com.qq.modules.td.logic.bt_ai.aiNode.BaseNodePvz;
   import com.qq.modules.td.logic.bt_ai.aiNode.executeNode.plant.ExePlantAttack;
   import com.qq.modules.td.logic.bt_ai.aiNode.requireNode.ReqPlantCurAction;
   import com.qq.modules.td.logic.unit.plant.BasicPlant;
   import com.qq.modules.td.model.TDGameInfo;
   import com.qq.modules.td.model.TDStageInfo;
   import com.qq.modules.td.model.vo.TDPathPointVO;
   import com.qq.modules.td.model.vo.TDPathVO;
   import com.qq.utils.DMath;
   
   public class AI_plant_waxgourd extends BaseNodePvz
   {
       
      
      public function AI_plant_waxgourd()
      {
         super();
      }
      
      override public function calculate() : Boolean
      {
         if(ReqPlantCurAction.calculate(selfObj,true,TDConstant.WaxgourdRollAction))
         {
            return true;
         }
         if(ReqPlantCurAction.calculate(selfObj,true,TDConstant.PlantAction_FadeOut))
         {
            return true;
         }
         ExePlantAttack.calculate(selfObj,TDConstant.WaxgourdRollAction,[this.getAttackPath(),this.getSpeed()]);
         return true;
      }
      
      private function getAttackPath() : TDPathVO
      {
         var _loc4_:TDPathVO = null;
         var _loc5_:int = 0;
         var _loc6_:Object = null;
         var _loc7_:TDPathVO = null;
         var _loc8_:uint = 0;
         var _loc9_:uint = 0;
         var _loc10_:TDPathPointVO = null;
         var _loc1_:BasicPlant = selfObj as BasicPlant;
         var _loc2_:TDMapTileData = TDGameInfo.getInstance().getRoadTileByIndex(_loc1_.plantData.tileIndex);
         var _loc3_:Array = new Array();
         for each(_loc4_ in TDStageInfo.getInstance().paths)
         {
            _loc8_ = _loc4_.pathCells.length;
            _loc9_ = 0;
            while(_loc9_ < _loc8_)
            {
               if((_loc10_ = _loc4_.pathCells[_loc9_]).row == _loc2_.roadRow && _loc10_.col == _loc2_.roadCol)
               {
                  _loc3_.push({
                     "pVO":_loc4_,
                     "pIndex":_loc9_
                  });
                  break;
               }
               _loc9_++;
            }
         }
         _loc5_ = DMath.randNum(0,_loc3_.length - 1);
         _loc6_ = _loc3_[_loc5_];
         _loc7_ = new TDPathVO();
         _loc4_ = _loc6_.pVO;
         _loc7_.order = _loc4_.order;
         _loc7_.pathId = _loc4_.pathId;
         _loc7_.roadIndex = _loc4_.roadIndex;
         _loc7_.vectorType = _loc4_.vectorType;
         _loc8_ = _loc4_.pathCells.length;
         _loc9_ = 0;
         while(_loc9_ <= _loc6_.pIndex)
         {
            _loc7_.pathCells.push(_loc4_.pathCells[_loc9_]);
            _loc9_++;
         }
         return _loc7_;
      }
      
      private function getSpeed() : Number
      {
         var _loc1_:BasicPlant = selfObj as BasicPlant;
         return _loc1_.plantData.plantStaticInfo.baseInfo.getParam(21);
      }
   }
}
