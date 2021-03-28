package com.qq.modules.td.logic.action.zombie.supervisor
{
   import asgui.events.FrameEvent;
   import com.qq.CommandName;
   import com.qq.constant.td.TDConstant;
   import com.qq.modules.td.data.TDDataFactory;
   import com.qq.modules.td.data.game.unit.TDPlantStaticInfo;
   import com.qq.modules.td.data.map.TDMapTileData;
   import com.qq.modules.td.logic.action.zombie.basic.ZombieActionEat;
   import com.qq.modules.td.logic.numeric.TDCheckCollision;
   import com.qq.modules.td.logic.numeric.TDDamageCaculete;
   import com.qq.modules.td.logic.unit.basic.IGameObject;
   import com.qq.modules.td.logic.unit.plant.BasicPlant;
   import com.qq.modules.td.model.TDGameInfo;
   import com.qq.utils.CommandDispatcher;
   
   public class ZombieActionSupervisorEat extends ZombieActionEat
   {
       
      
      public function ZombieActionSupervisorEat()
      {
         super();
      }
      
      override public function enterState(param1:Array = null) : void
      {
         super.enterState(param1);
         _zombie.animation.addEventListener(FrameEvent.MOVEMENT_FRAME_EVENT,this.onFrameHandler);
      }
      
      private function onFrameHandler(param1:FrameEvent) : void
      {
         var _loc2_:Array = null;
         var _loc3_:IGameObject = null;
         if(param1.frameLabel == "whip")
         {
            _loc2_ = this.searchScenePlant(_zombie);
         }
         if(_loc2_.length > 0)
         {
            for each(_loc3_ in _loc2_)
            {
               TDDamageCaculete.caculateZombieDamage(_zombie,_loc3_);
               CommandDispatcher.send(CommandName.TD_ZombieEatPlant,[_loc3_,_zombie]);
            }
         }
      }
      
      public function searchScenePlant(param1:IGameObject) : Array
      {
         var _loc2_:IGameObject = null;
         var _loc4_:Array = null;
         var _loc5_:BasicPlant = null;
         var _loc6_:TDPlantStaticInfo = null;
         var _loc7_:TDMapTileData = null;
         var _loc3_:Array = new Array();
         if(param1.objectModel.camp != TDConstant.TDCamp_Self)
         {
            _loc4_ = TDGameInfo.getInstance().getGameObjectMapByCatalg(TDConstant.UnitCatalog_Plant);
            for each(_loc5_ in _loc4_)
            {
               if(_loc5_.plantData.isPermitAttack())
               {
                  if(_loc5_.plantData.isAlive())
                  {
                     if(_loc5_.objectModel.isPermitNormalAttack())
                     {
                        if((_loc6_ = TDDataFactory.instance.getPlantInfoByID(_loc5_.plantData.plantStaticInfo.id)).baseInfo.usefulness == TDConstant.PlantUsefulness_Container)
                        {
                           _loc7_ = TDGameInfo.getInstance().getRoadTileByIndex(_loc5_.plantData.tileIndex);
                           if(TDGameInfo.getInstance().hasNomalPlantInRoadTile(_loc7_))
                           {
                              continue;
                           }
                        }
                        if(TDCheckCollision.isCollision(param1,param1.attackArea,_loc5_,_loc5_.damageArea))
                        {
                           if(_loc5_.plantData.getProtectedPlantUID() != -1)
                           {
                              _loc2_ = TDGameInfo.getInstance().getGameObjctByUID(_loc5_.plantData.getProtectedPlantUID());
                           }
                           else
                           {
                              _loc2_ = _loc5_;
                           }
                           _loc3_.push(_loc2_);
                        }
                     }
                  }
               }
            }
         }
         return _loc3_;
      }
   }
}
