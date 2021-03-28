package com.qq.modules.td.logic
{
   import com.gems.GemNode;
   import com.qq.constant.td.TDConstant;
   import com.qq.constant.td.TDObjTypeID;
   import com.qq.modules.td.data.TDDataFactory;
   import com.qq.modules.td.data.game.unit.TDPlantStaticInfo;
   import com.qq.modules.td.data.map.TDMapTileData;
   import com.qq.modules.td.logic.miniGame.jewels.TDMiniGameJewelsControler;
   import com.qq.modules.td.logic.talent.TalentManager;
   import com.qq.modules.td.model.TDGameInfo;
   import com.qq.modules.td.model.TDMiniGameJewelsData;
   import com.qq.modules.td.model.TDStageInfo;
   import com.qq.modules.td.view.game.layer.floor.TDFloorManager;
   import com.tencent.protobuf.Int64;
   import org.as3commons.logging.api.getLogger;
   
   public class TDCropUtil
   {
       
      
      public function TDCropUtil()
      {
         super();
      }
      
      public static function isPermitAddPlant(param1:int, param2:TDMapTileData) : int
      {
         var _loc7_:Vector.<GemNode> = null;
         var _loc8_:GemNode = null;
         var _loc9_:TDMapTileData = null;
         var _loc10_:int = 0;
         var _loc3_:TDPlantStaticInfo = TDDataFactory.instance.getPlantInfoByID(param1);
         var _loc4_:int = _loc3_.baseInfo.usefulness;
         var _loc5_:int = TDGameInfo.getInstance().getRoadTileState(param2);
         var _loc6_:*;
         if((_loc6_ = param2.type == TDConstant.TileType_Blank) || _loc5_ & TDConstant.RoadTileState_Has_ForbidPlant || _loc5_ & TDConstant.RoadTileState_Has_WATER || _loc5_ & _loc3_.baseInfo.forbidTileState || _loc5_ & TDConstant.RoadTileState_Planted_Nuts)
         {
            return TDConstant.PermitAddPlant_Forbid;
         }
         if(_loc5_ & TDConstant.RoadTileState_Has_Tomb)
         {
            if(_loc3_.baseInfo.usefulness == TDConstant.PlantUsefulness_Gravebuster)
            {
               if(TDGameInfo.getInstance().countTombNum(param2.index) > 0)
               {
                  return TDConstant.PermitAddPlant_OK;
               }
               return TDConstant.PermitAddPlant_Forbid;
            }
            return TDConstant.PermitAddPlant_Forbid;
         }
         if(TDStageInfo.getInstance().tdGameType == TDConstant.TDGameType_Jewels)
         {
            _loc7_ = TDMiniGameJewelsControler.instance.gemWar.getEmptyGemNode();
            for each(_loc8_ in _loc7_)
            {
               if(_loc8_)
               {
                  if((_loc9_ = TDMiniGameJewelsData.instance.getMapData(_loc8_.idx,_loc8_.idy)) && _loc9_.index == param2.index)
                  {
                     return TDConstant.PermitAddPlant_Forbid;
                  }
               }
            }
         }
         if(_loc3_.baseInfo.roadTileState == TDConstant.RoadTileState_Nomal && _loc5_ & TDConstant.RoadTileState_Has_UNMUD && !(_loc5_ & TDConstant.RoadTileState_Has_Container) && _loc3_.baseInfo.prePlantType == 0)
         {
            return TDConstant.PermitAddPlant_Forbid;
         }
         if(_loc3_.baseInfo.roadTileState == TDConstant.RoadTileState_Has_UNMUD)
         {
            if(_loc5_ & TDConstant.RoadTileState_Has_UNMUD && !(_loc5_ & getRoadStateKeyByPlantUsefulness(TDConstant.PlantUsefulness_Container)))
            {
               return TDConstant.PermitAddPlant_OK;
            }
            return TDConstant.PermitAddPlant_Forbid;
         }
         if(_loc3_.baseInfo.roadTileState == TDConstant.RoadTileState_Has_PATH)
         {
            if((_loc5_ & TDConstant.RoadTileState_Has_PATH) == 0)
            {
               return TDConstant.PermitAddPlant_Forbid;
            }
         }
         if(_loc4_ == TDConstant.PlantUsefulness_Plant)
         {
            if(_loc3_.baseInfo.prePlantType != 0)
            {
               if(_loc5_ & getRoadStateKeyByPlantUsefulness(TDConstant.PlantUsefulness_Plant) && param2.isContainPlant(_loc3_.baseInfo.prePlantType))
               {
                  return TDConstant.PermitAddPlant_OK;
               }
               return TDConstant.PermitAddPlant_NotPreplant;
            }
            if(_loc5_ == TDConstant.RoadTileState_Has_Plant)
            {
               if((_loc10_ = TalentManager.instance.getMeragePlanType(_loc3_)) != 0 && param2.isContainPlant(_loc3_.baseInfo.id))
               {
                  return TDConstant.PermitAddPlant_OK_LEVEL_UP;
               }
            }
            return !(_loc5_ & getRoadStateKeyByPlantUsefulness(TDConstant.PlantUsefulness_Plant)) ? int(TDConstant.PermitAddPlant_OK) : int(TDConstant.PermitAddPlant_Forbid);
         }
         if(_loc4_ == TDConstant.PlantUsefulness_PowerTile)
         {
            return TDFloorManager.instance.getPowerTileType(param2.roadCol,param2.roadRow) == 0 ? int(TDConstant.PermitAddPlant_OK) : int(TDConstant.PermitAddPlant_Forbid);
         }
         if(_loc4_ == TDConstant.PlantUsefulness_Container)
         {
            return !(_loc5_ & getRoadStateKeyByPlantUsefulness(TDConstant.PlantUsefulness_Container)) && !(_loc5_ & getRoadStateKeyByPlantUsefulness(TDConstant.PlantUsefulness_Plant)) && !(_loc5_ & getRoadStateKeyByPlantUsefulness(TDConstant.PlantUsefulness_Protected)) ? 1 : 0;
         }
         if(_loc4_ == TDConstant.PlantUsefulness_Protected)
         {
            return !(_loc5_ & getRoadStateKeyByPlantUsefulness(TDConstant.PlantUsefulness_Protected)) ? int(TDConstant.PermitAddPlant_OK) : int(TDConstant.PermitAddPlant_Forbid);
         }
         if(_loc4_ == TDConstant.PlantUsefulness_Other)
         {
            return TDConstant.PermitAddPlant_OK;
         }
         return 0;
      }
      
      public static function getRoadStateKeyByPlantUsefulness(param1:int) : int
      {
         switch(param1)
         {
            case TDConstant.PlantUsefulness_Plant:
               return TDConstant.RoadTileState_Has_Plant;
            case TDConstant.PlantUsefulness_Container:
               return TDConstant.RoadTileState_Has_Container;
            case TDConstant.PlantUsefulness_Protected:
               return TDConstant.RoadTileState_Has_Armor;
            default:
               getLogger("TD").debug("未知的植物用途" + param1);
               return 0;
         }
      }
      
      public static function isPermitCropPlant(param1:TDMapTileData) : Boolean
      {
         if(param1 == null)
         {
            return false;
         }
         var _loc2_:int = TDGameInfo.getInstance().getRoadTileState(param1);
         return _loc2_ == 0;
      }
      
      public static function isPlantUsable(param1:int) : int
      {
         var _loc3_:Array = null;
         var _loc2_:TDPlantStaticInfo = TDDataFactory.instance.getPlantInfoByID(param1);
         if(_loc2_ == null)
         {
            return TDConstant.Reason_NoPlant;
         }
         if(_loc2_.baseInfo.prePlantType != 0)
         {
            _loc3_ = TDGameInfo.getInstance().getPlantByType(_loc2_.baseInfo.prePlantType);
            if(_loc3_.length == 0)
            {
               return TDConstant.Reason_NeedPreplant;
            }
         }
         if(getPlantSunCost(_loc2_) > TDGameInfo.getInstance().sun.get())
         {
            return TDConstant.Reason_NotEnoughSun;
         }
         return 0;
      }
      
      public static function getPlantSunCost(param1:TDPlantStaticInfo, param2:Int64 = null) : int
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         switch(param1.id)
         {
            case TDObjTypeID.Plant_TileTurnip:
               if((_loc4_ = TDGameInfo.getInstance().getGameObjectMapByCatalgAndType(TDConstant.UnitCatalog_Object,TDObjTypeID.Obj_PowerTile5).length) > 0)
               {
                  _loc3_ = 250 * Math.pow(2,_loc4_ - 1) * TalentManager.instance.getGrowPlantSunCostDiscount(param1);
               }
               break;
            default:
               _loc3_ = TalentManager.instance.getGrowPlantSunCost(param1);
         }
         return _loc3_;
      }
   }
}
