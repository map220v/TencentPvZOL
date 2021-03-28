package com.qq.modules.td.command.game.drag
{
   import com.qq.CommandName;
   import com.qq.GameGloble;
   import com.qq.constant.td.TDConstant;
   import com.qq.modules.td.command.game.TDGameObjectCmd;
   import com.qq.modules.td.command.game.sound.TDSoundCmd;
   import com.qq.modules.td.data.TDDataFactory;
   import com.qq.modules.td.data.game.unit.TDPlantStaticInfo;
   import com.qq.modules.td.data.map.TDMapTileData;
   import com.qq.modules.td.logic.TDFactory;
   import com.qq.modules.td.logic.TDSpecialSkillTrigger;
   import com.qq.modules.td.logic.TDUILayerManager;
   import com.qq.modules.td.logic.mouseAction.ITDBaiscMouseAction;
   import com.qq.modules.td.logic.mouseAction.TDCropPlantAction;
   import com.qq.modules.td.logic.mouseAction.TDLayEnergyTileAction;
   import com.qq.modules.td.logic.mouseAction.TDReleaseAreaSkillAction;
   import com.qq.modules.td.logic.mouseAction.TDUseShovelAction;
   import com.qq.modules.td.logic.unit.plant.BasicPlant;
   import com.qq.modules.td.model.TDGameInfo;
   import com.qq.utils.CommandDispatcher;
   import flash.events.MouseEvent;
   import flash.geom.Rectangle;
   import org.robotlegs.extend.command.StrongRobotlegCommand;
   
   public class TDMouseActionCommand extends StrongRobotlegCommand
   {
      
      public static const TDMouseActionCommand:String = "TDMouseActionCommand";
       
      
      public function TDMouseActionCommand()
      {
         super();
      }
      
      public function cleanMouseAction() : void
      {
         if(TDGameInfo.getInstance().dragMode == -1)
         {
            return;
         }
         var _loc1_:ITDBaiscMouseAction = this.getMouseAction(TDGameInfo.getInstance().dragMode);
         if(_loc1_ != null)
         {
            _loc1_.Dispose();
         }
         TDGameInfo.getInstance().dragMode = TDConstant.MouseDragMode_None;
      }
      
      private function getMouseAction(param1:int) : ITDBaiscMouseAction
      {
         var _loc2_:ITDBaiscMouseAction = null;
         switch(param1)
         {
            case TDConstant.MouseDragMode_Crop:
               _loc2_ = GameGloble.injector.getInstance(TDCropPlantAction);
               break;
            case TDConstant.MouseDragMode_Shovel:
               _loc2_ = GameGloble.injector.getInstance(TDUseShovelAction);
               break;
            case TDConstant.MouseDragMode_Skill:
               _loc2_ = GameGloble.injector.getInstance(TDReleaseAreaSkillAction);
               break;
            case TDConstant.MouseDragMode_EnergyTile:
               _loc2_ = GameGloble.injector.getInstance(TDLayEnergyTileAction);
         }
         return _loc2_;
      }
      
      public function startUseShovel() : void
      {
         if(TDGameInfo.getInstance().isPause)
         {
            return;
         }
         if(TDGameInfo.getInstance().dragMode != TDConstant.MouseDragMode_None)
         {
            this.cleanMouseAction();
            return;
         }
         TDGameInfo.getInstance().dragMode = TDConstant.MouseDragMode_Shovel;
         var _loc1_:TDUseShovelAction = this.getMouseAction(TDGameInfo.getInstance().dragMode) as TDUseShovelAction;
         if(_loc1_ == null)
         {
            return;
         }
         _loc1_.start();
         CommandDispatcher.send(CommandName.TD_Hide_Shovel);
      }
      
      public function endUseShovel() : void
      {
         this.cleanMouseAction();
      }
      
      public function startCropPlant(param1:int, param2:String, param3:Rectangle = null, param4:Boolean = true) : void
      {
         var _loc6_:TDMapTileData = null;
         var _loc7_:TDCropPlantAction = null;
         this.cleanMouseAction();
         var _loc5_:TDPlantStaticInfo;
         if((_loc5_ = TDDataFactory.instance.getPlantInfoByID(param1)) && _loc5_.baseInfo.catalog == TDConstant.PlantCatalog_Skill)
         {
            TDGameInfo.getInstance().lastCropPlantID = param2;
            _loc6_ = TDGameInfo.getInstance().getRoadTileInf(1,1);
            TDGameObjectCmd.addPlant(param1,_loc6_,param4,param2);
            TDSpecialSkillTrigger.getInstance().updateState(true);
         }
         else
         {
            TDGameInfo.getInstance().dragMode = TDConstant.MouseDragMode_Crop;
            if((_loc7_ = this.getMouseAction(TDGameInfo.getInstance().dragMode) as TDCropPlantAction).cropPlant == null)
            {
               _loc7_.cropPlant = TDFactory.createGameobject(TDConstant.UnitCatalog_Plant,param1,null,true) as BasicPlant;
               _loc7_.cropPlant.setMouseEnable(false);
               if(_loc7_ == null)
               {
                  return;
               }
               TDUILayerManager.effectLayer.addGameObjectTolayer(_loc7_.cropPlant);
            }
            _loc7_.start([param1,param2,param3,param4]);
            GameGloble.stage.addEventListener(MouseEvent.MOUSE_UP,_loc7_.onMouseClick);
            GameGloble.stage.addEventListener(MouseEvent.MOUSE_MOVE,_loc7_.onMouseMove);
         }
      }
      
      public function endCropPlant() : void
      {
         TDSoundCmd.restorePlantCard();
         this.cleanMouseAction();
      }
      
      public function startChooseSkillArea(param1:int) : void
      {
      }
      
      public function endChooseSkillArea() : void
      {
         this.cleanMouseAction();
      }
      
      public function startLayEnergyTile(param1:uint, param2:String) : void
      {
         if(TDGameInfo.getInstance().isPause)
         {
            return;
         }
         if(TDGameInfo.getInstance().dragMode != TDConstant.MouseDragMode_None)
         {
            this.cleanMouseAction();
            return;
         }
         TDGameInfo.getInstance().dragMode = TDConstant.MouseDragMode_EnergyTile;
         var _loc3_:TDLayEnergyTileAction = this.getMouseAction(TDGameInfo.getInstance().dragMode) as TDLayEnergyTileAction;
         if(_loc3_ == null)
         {
            return;
         }
         _loc3_.energyTileType = param1;
         _loc3_.energyTileId = param2;
         _loc3_.energyTile = TDFactory.createNormalObject(param1);
         TDUILayerManager.effectLayer.addGameObjectTolayer(_loc3_.energyTile);
         _loc3_.energyTile.setMouseEnable(false);
         _loc3_.start();
         GameGloble.stage.addEventListener(MouseEvent.MOUSE_UP,_loc3_.onMouseClick);
         GameGloble.stage.addEventListener(MouseEvent.MOUSE_MOVE,_loc3_.onMouseMove);
      }
      
      public function endLayEnergyTile() : void
      {
         this.cleanMouseAction();
      }
   }
}
