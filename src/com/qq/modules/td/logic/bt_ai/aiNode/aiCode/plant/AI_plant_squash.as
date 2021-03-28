package com.qq.modules.td.logic.bt_ai.aiNode.aiCode.plant
{
   import com.qq.constant.td.TDChallengeScoreType;
   import com.qq.constant.td.TDConstant;
   import com.qq.modules.td.data.map.TDMapTileData;
   import com.qq.modules.td.logic.TDChallengeScoreManager;
   import com.qq.modules.td.logic.bt_ai.aiNode.BaseNodePvz;
   import com.qq.modules.td.logic.bt_ai.aiNode.executeNode.plant.ExePlantAttack;
   import com.qq.modules.td.logic.bt_ai.aiNode.executeNode.plant.ExePlantIdle;
   import com.qq.modules.td.logic.bt_ai.aiNode.requireNode.ReqPlantDurationExpire;
   import com.qq.modules.td.logic.bt_ai.aiUtils.TDSearchTargetUtils;
   import com.qq.modules.td.logic.unit.basic.IGameObject;
   import com.qq.modules.td.logic.unit.plant.BasicPlant;
   import com.qq.modules.td.model.TDGameInfo;
   import flash.geom.Rectangle;
   
   public class AI_plant_squash extends BaseNodePvz
   {
       
      
      public function AI_plant_squash(param1:int = 30)
      {
         super(param1);
         TDChallengeScoreManager.instance.addScoreByType(TDChallengeScoreType.Use_Squash);
      }
      
      override public function calculate() : Boolean
      {
         var _loc1_:Vector.<IGameObject> = null;
         if(ReqPlantDurationExpire.calculate(selfObj))
         {
            _loc1_ = TDSearchTargetUtils.searchTargetForPlant(selfObj as BasicPlant,[this.checkArea],[selfObj.objectModel.roadIndex],true,[TDConstant.ZombieCatalog_Normal]);
            if(_loc1_.length > 0)
            {
               selfObj.setAttackTarget(_loc1_[0]);
               ExePlantAttack.calculate(selfObj,TDConstant.PSquashAction_Attack);
            }
            else
            {
               ExePlantIdle.calculate(selfObj,TDConstant.PlantAction_Idle);
            }
         }
         return true;
      }
      
      private function get checkArea() : Rectangle
      {
         var _loc1_:Rectangle = new Rectangle();
         var _loc2_:TDMapTileData = TDGameInfo.getInstance().getRoadTileByIndex(selfObj.objectModel.tileIndex);
         if(_loc2_ != null)
         {
            _loc1_.x = _loc2_.rect.left - _loc2_.rect.width;
            _loc1_.y = _loc2_.rect.top - 20;
            _loc1_.width = _loc2_.rect.width * 3;
            _loc1_.height = _loc2_.rect.height * 0.6;
         }
         return _loc1_;
      }
   }
}
