package com.qq.modules.td.command.debug
{
   import asgui.managers.PopUpManager;
   import com.qq.CommandName;
   import com.qq.constant.td.TDConstant;
   import com.qq.data.DataCacheManager;
   import com.qq.modules.main.server.PvzSocketService;
   import com.qq.modules.td.command.game.TDGameCmd;
   import com.qq.modules.td.command.game.TDGameFlowCmd;
   import com.qq.modules.td.command.game.TDGameObjectCmd;
   import com.qq.modules.td.data.game.unit.TDPlantBaseStaticInfo;
   import com.qq.modules.td.data.map.TDMapRoadData;
   import com.qq.modules.td.data.map.TDMapTileData;
   import com.qq.modules.td.logic.TDCropUtil;
   import com.qq.modules.td.logic.TDFactory;
   import com.qq.modules.td.logic.unit.basic.IGameObject;
   import com.qq.modules.td.model.TDGameInfo;
   import com.qq.modules.td.model.TDStageInfo;
   import com.qq.modules.td.view.debug.TDDebugChooseStage;
   import com.qq.utils.CommandDispatcher;
   import com.qq.utils.DMath;
   import com.qq.utils.db.ClientDBTableName;
   import org.robotlegs.extend.command.StrongRobotlegCommand;
   
   public class TDDebugCommand extends StrongRobotlegCommand
   {
       
      
      [Inject]
      public var server:PvzSocketService;
      
      public function TDDebugCommand()
      {
         super();
      }
      
      public function startGameImmediately() : void
      {
         CommandDispatcher.send(CommandName.TD_ResetGameInfoPanelBG);
         CommandDispatcher.send(CommandName.TD_UnlockScreen);
         TDGameFlowCmd.readyTDGame();
      }
      
      public function changeGameSpeed(param1:Number) : void
      {
         var _loc3_:Array = null;
         var _loc4_:IGameObject = null;
         var _loc2_:Number = param1;
         TDGameInfo.speedRatio = _loc2_;
         for each(_loc3_ in TDGameInfo.getInstance().gameobjectMap)
         {
            for each(_loc4_ in _loc3_)
            {
               if(_loc4_.isVaild)
               {
                  _loc4_.updateTimeScale();
               }
            }
         }
      }
      
      public function changeSun(param1:int) : void
      {
         TDGameCmd.changeSun(param1);
      }
      
      public function changeFuel(param1:int) : void
      {
         TDGameCmd.changeFuel(param1);
      }
      
      public function skipCurStage() : void
      {
      }
      
      public function gotoStage(param1:int, param2:int) : void
      {
      }
      
      public function addPlant(param1:int) : void
      {
         var _loc5_:TDMapRoadData = null;
         var _loc6_:int = 0;
         var _loc7_:TDPlantBaseStaticInfo = null;
         var _loc8_:TDMapTileData = null;
         var _loc9_:int = 0;
         var _loc10_:int = 0;
         var _loc11_:int = 0;
         var _loc2_:Array = new Array();
         var _loc3_:int = TDGameInfo.getInstance().normalCardsData.totalSlotNum();
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            _loc6_ = TDGameInfo.getInstance().normalCardsData.getPlantTypeByIndex(_loc4_);
            if((_loc7_ = DataCacheManager.getInstance().getTemplateDataById(ClientDBTableName.Table_PlantTypeInfo,_loc6_,TDPlantBaseStaticInfo)) != null && _loc7_.prePlantType == 0)
            {
               _loc2_.push(_loc6_);
            }
            _loc4_++;
         }
         if(_loc2_.length == 0)
         {
            return;
         }
         for each(_loc5_ in TDGameInfo.getInstance().roadList)
         {
            for each(_loc8_ in _loc5_.tileList)
            {
               if(param1 == 0)
               {
                  return;
               }
               _loc9_ = DMath.randNum(0,_loc2_.length - 1);
               _loc10_ = _loc2_[_loc9_];
               if((_loc11_ = TDCropUtil.isPermitAddPlant(_loc10_,_loc8_)) == TDConstant.PermitAddPlant_OK)
               {
                  param1--;
                  TDGameObjectCmd.addPlant(_loc10_,_loc8_,false);
               }
            }
         }
      }
      
      public function addZombie(param1:int) : void
      {
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:IGameObject = null;
         var _loc7_:int = 0;
         var _loc2_:Array = TDStageInfo.getInstance().getAppearUnitListByType(TDConstant.UnitCatalog_Zombie);
         if(_loc2_.length == 0)
         {
            return;
         }
         var _loc3_:int = 0;
         while(_loc3_ < param1)
         {
            _loc4_ = DMath.randNum(0,_loc2_.length - 1);
            _loc5_ = _loc2_[_loc4_];
            _loc6_ = TDFactory.createBT_Zombie(_loc5_);
            _loc7_ = DMath.randNum(1,TDGameInfo.getInstance().getRoadNum());
            CommandDispatcher.send(CommandName.TD_StartZombieWalk,{
               "object":_loc6_,
               "roadIndex":_loc7_
            });
            _loc3_++;
         }
      }
      
      public function showChooseStagePanel() : void
      {
         var _loc1_:TDDebugChooseStage = new TDDebugChooseStage();
         PopUpManager.AddPopUp(_loc1_,null,true);
      }
      
      public function openPlantTalentPanel() : void
      {
      }
   }
}
