package com.qq.modules.td.logic.bt_ai.aiNode.aiCode.plant
{
   import com.qq.constant.td.TDConstant;
   import com.qq.modules.td.data.map.TDMapTileData;
   import com.qq.modules.td.logic.bt_ai.aiNode.BaseNodePvz;
   import com.qq.modules.td.logic.bt_ai.aiNode.executeNode.plant.ExePlantAttack;
   import com.qq.modules.td.logic.bt_ai.aiNode.executeNode.plant.ExePlantIdle;
   import com.qq.modules.td.logic.bt_ai.aiNode.requireNode.ReqPlantCurAction;
   import com.qq.modules.td.logic.bt_ai.aiNode.requireNode.ReqPlantDurationExpire;
   import com.qq.modules.td.logic.bt_ai.aiUtils.TDSearchTargetUtils;
   import com.qq.modules.td.logic.unit.basic.IGameObject;
   import com.qq.modules.td.logic.unit.plant.BasicPlant;
   import com.qq.modules.td.logic.unit.zombie.BasicZombie;
   import com.qq.modules.td.model.TDGameInfo;
   import flash.geom.Rectangle;
   
   public class AI_plant_flytrap extends BaseNodePvz
   {
       
      
      public function AI_plant_flytrap(param1:int = 30)
      {
         super(param1);
      }
      
      override public function calculate() : Boolean
      {
         var _loc1_:IGameObject = null;
         if(ReqPlantCurAction.calculate(selfObj,true,TDConstant.PFlytrapAction_Eat))
         {
            return true;
         }
         if(ReqPlantDurationExpire.calculate(selfObj))
         {
            _loc1_ = this.searchAttackTarget();
            if(_loc1_)
            {
               selfObj.setAttackTarget(_loc1_);
               ExePlantAttack.calculate(selfObj,TDConstant.PFlytrapAction_Eat);
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
            _loc1_.x = _loc2_.rect.left;
            _loc1_.y = _loc2_.rect.top + _loc2_.rect.height * 0.2;
            _loc1_.width = _loc2_.rect.width * 2;
            _loc1_.height = _loc2_.rect.height * 0.6;
         }
         return _loc1_;
      }
      
      private function searchAttackTarget() : IGameObject
      {
         var _loc2_:IGameObject = null;
         var _loc1_:Vector.<IGameObject> = TDSearchTargetUtils.searchTargetForPlant(selfObj as BasicPlant,[this.checkArea],[selfObj.objectModel.roadIndex],true,[TDConstant.ZombieCatalog_Normal]);
         for each(_loc2_ in _loc1_)
         {
            if(!(_loc2_ as BasicZombie).zombieData.hasBuffByType(TDConstant.TDBuffType_Stun))
            {
               return _loc2_;
            }
         }
         return null;
      }
   }
}
