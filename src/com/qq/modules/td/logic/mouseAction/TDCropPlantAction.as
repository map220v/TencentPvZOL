package com.qq.modules.td.logic.mouseAction
{
   import com.qq.CommandName;
   import com.qq.GameGloble;
   import com.qq.constant.td.TDConditionID;
   import com.qq.constant.td.TDConstant;
   import com.qq.modules.td.command.game.TDGameObjectCmd;
   import com.qq.modules.td.command.game.effect.TDTipEffectCmd;
   import com.qq.modules.td.data.TDDataFactory;
   import com.qq.modules.td.data.game.unit.TDPlantStaticInfo;
   import com.qq.modules.td.data.map.TDMapTileData;
   import com.qq.modules.td.logic.TDConditionTriggerManager;
   import com.qq.modules.td.logic.TDCropUtil;
   import com.qq.modules.td.logic.TDFactory;
   import com.qq.modules.td.logic.TDSpecialSkillTrigger;
   import com.qq.modules.td.logic.TDUILayerManager;
   import com.qq.modules.td.logic.talent.TalentManager;
   import com.qq.modules.td.logic.unit.plant.BasicPlant;
   import com.qq.modules.td.model.TDGameInfo;
   import com.qq.utils.CommandDispatcher;
   import com.qq.utils.tqos.TQOSUtils;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   
   public class TDCropPlantAction implements ITDBaiscMouseAction
   {
       
      
      public var cropPlant:BasicPlant;
      
      public var tipPlant:BasicPlant;
      
      public var tipCropPlant_LevelUp:BasicPlant;
      
      public var lastShowTileData:TDMapTileData;
      
      public var cropPlantID:int;
      
      public var cropCardID:String;
      
      public var isUseSun:Boolean;
      
      public var rangeCol:int;
      
      public var rangeRow:int;
      
      private var _point:Point;
      
      private var permitPlant:BasicPlant;
      
      public var cardSlotRect:Rectangle;
      
      public function TDCropPlantAction()
      {
         super();
      }
      
      public function start(param1:Array = null) : void
      {
         var _loc4_:Array = null;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         this.cropPlantID = param1[0];
         this.cropCardID = param1[1];
         this.cardSlotRect = param1[2];
         this.isUseSun = param1[3];
         var _loc2_:TDPlantStaticInfo = TDDataFactory.instance.getPlantInfoByID(this.cropPlantID);
         if(_loc2_ == null)
         {
            return;
         }
         if(_loc2_.baseInfo.hasParam(TDConstant.Plant_Param_DamageTileCol) && _loc2_.baseInfo.hasParam(TDConstant.Plant_Param_DamageTileRow))
         {
            this.rangeCol = _loc2_.baseInfo.getParam(TDConstant.Plant_Param_DamageTileCol);
            this.rangeRow = _loc2_.baseInfo.getParam(TDConstant.Plant_Param_DamageTileRow);
         }
         else
         {
            this.rangeCol = -1;
            this.rangeRow = -1;
         }
         this.onMouseMove(null);
         TDConditionTriggerManager.instance.removeCondition(TDConditionID.GUIDE_PLANT_CARD_GRAB_UP);
         if(TDConditionTriggerManager.instance.getCondition(TDConditionID.GUIDE_PLANT_CARD_DROP_DOWN) != true && TDConditionTriggerManager.instance.getCondition(TDConditionID.PLANT_CARD_DROP_DOWN) != true)
         {
            TDConditionTriggerManager.instance.addCondition(TDConditionID.GUIDE_PLANT_CARD_GRAB_UP,true);
         }
         else
         {
            TDConditionTriggerManager.instance.addCondition(TDConditionID.PLANT_CARD_GRAB_UP,true);
         }
         var _loc3_:int = TalentManager.instance.getMeragePlanType(_loc2_);
         if(_loc3_ != 0)
         {
            _loc5_ = (_loc4_ = TDGameInfo.getInstance().getPlantByType(this.cropPlantID)).length;
            _loc6_ = 0;
            while(_loc6_ < _loc5_)
            {
               (_loc4_[_loc6_] as BasicPlant).startLevelupTip();
               _loc6_++;
            }
         }
      }
      
      public function onMouseClick(param1:MouseEvent) : void
      {
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         if(!TDGameInfo.getInstance().isRunningGame)
         {
            return;
         }
         if(this !== GameGloble.injector.getInstance(TDCropPlantAction))
         {
            TQOSUtils.getInstance().reportMsg("TDCropPlantActionIsNotSingle!");
            this.Dispose();
            return;
         }
         if(this._point == null)
         {
            this._point = new Point();
         }
         this._point.x = param1.stageX;
         this._point.y = param1.stageY;
         if(this.cardSlotRect != null)
         {
            _loc6_ = this._point.x / GameGloble.scaleCurrent;
            _loc7_ = this._point.y / GameGloble.scaleCurrent;
            if(this.cardSlotRect.contains(_loc6_,_loc7_))
            {
               return;
            }
         }
         this._point = TDUILayerManager.effectLayer.globalToLocal(this._point);
         var _loc2_:TDMapTileData = TDGameInfo.getInstance().getRoadTileByScreenPos(this._point.x,this._point.y);
         var _loc3_:TDPlantStaticInfo = TDDataFactory.instance.getPlantInfoByID(this.cropPlantID);
         var _loc4_:int = TalentManager.instance.getMeragePlanType(_loc3_);
         var _loc5_:int = this.cropPlantID;
         if(_loc4_ != 0)
         {
            if(_loc2_ && _loc2_.isContainPlant(_loc3_.baseInfo.id))
            {
               _loc5_ = _loc4_;
            }
         }
         if(_loc2_)
         {
            TDConditionTriggerManager.instance.removeCondition(TDConditionID.GUIDE_PLANT_CARD_GRAB_UP);
            TDConditionTriggerManager.instance.removeCondition(TDConditionID.PLANT_CARD_GRAB_UP);
            if(TDConditionTriggerManager.instance.getCondition(TDConditionID.GUIDE_PLANT_CARD_DROP_DOWN) == true)
            {
               TDConditionTriggerManager.instance.removeCondition(TDConditionID.GUIDE_PLANT_CARD_DROP_DOWN);
            }
            else if(TDConditionTriggerManager.instance.getCondition(TDConditionID.PLANT_CARD_DROP_DOWN) != true)
            {
               TDConditionTriggerManager.instance.addCondition(TDConditionID.GUIDE_PLANT_CARD_DROP_DOWN,true);
            }
            if(TDConditionTriggerManager.instance.getCondition(TDConditionID.GUIDE_PLANT_CARD_DROP_DOWN) != true)
            {
               TDConditionTriggerManager.instance.removeCondition(TDConditionID.PLANT_CARD_DROP_DOWN);
               TDConditionTriggerManager.instance.addCondition(TDConditionID.PLANT_CARD_DROP_DOWN,true);
            }
         }
         TDGameInfo.getInstance().lastCropPlantID = this.cropCardID;
         TDGameObjectCmd.addPlant(_loc5_,_loc2_,this.isUseSun,this.cropCardID);
         TDSpecialSkillTrigger.getInstance().updateState(true);
      }
      
      public function onMouseMove(param1:MouseEvent) : void
      {
         var _loc5_:int = 0;
         var _loc6_:TDPlantStaticInfo = null;
         var _loc7_:int = 0;
         var _loc2_:Point = new Point(GameGloble.stage.mouseX,GameGloble.stage.mouseY);
         _loc2_ = TDUILayerManager.effectLayer.globalToLocal(_loc2_);
         this.cropPlant.x = _loc2_.x;
         this.cropPlant.y = _loc2_.y;
         this.cropPlant.scaleX = this.cropPlant.scaleY = GameGloble.scaleCurrent;
         var _loc3_:TDMapTileData = TDGameInfo.getInstance().getRoadTileByScreenPos(_loc2_.x,_loc2_.y);
         var _loc4_:Boolean = false;
         if(_loc3_ != null)
         {
            if((_loc5_ = TDCropUtil.isPermitAddPlant(this.cropPlantID,_loc3_)) == 1)
            {
               if(this.lastShowTileData == null)
               {
                  this.lastShowTileData = _loc3_;
                  _loc4_ = true;
               }
               else if(this.lastShowTileData.index != _loc3_.index)
               {
                  this.lastShowTileData = _loc3_;
                  _loc4_ = true;
               }
               _loc2_ = TDGameInfo.getInstance().getPlantPos(_loc3_.index,this.cropPlantID);
               if(this.tipPlant == null)
               {
                  this.tipPlant = TDFactory.createGameobject(TDConstant.UnitCatalog_Plant,this.cropPlantID) as BasicPlant;
                  TDUILayerManager.effectLayer.addGameObjectTolayer(this.tipPlant,true);
               }
               this.tipPlant.alpha = 0.5;
               if(this.tipPlant != null)
               {
                  this.tipPlant.setLocation(_loc2_.x,_loc2_.y);
               }
               if(this.tipCropPlant_LevelUp)
               {
                  this.tipCropPlant_LevelUp.alpha = 0;
               }
               if(this.permitPlant)
               {
                  this.permitPlant.alpha = 1;
               }
            }
            else if(_loc5_ == 2)
            {
               if(this.tipCropPlant_LevelUp == null)
               {
                  _loc6_ = TDDataFactory.instance.getPlantInfoByID(this.cropPlantID);
                  _loc7_ = TalentManager.instance.getMeragePlanType(_loc6_);
                  this.tipCropPlant_LevelUp = TDFactory.createGameobject(TDConstant.UnitCatalog_Plant,_loc7_) as BasicPlant;
                  TDUILayerManager.effectLayer.addGameObjectTolayer(this.tipCropPlant_LevelUp,true);
               }
               _loc2_ = TDGameInfo.getInstance().getPlantPos(_loc3_.index,this.cropPlantID);
               if(this.permitPlant)
               {
                  this.permitPlant.alpha = 1;
               }
               this.permitPlant = TDGameInfo.getInstance().getPlantByPos(_loc3_.roadRow,_loc3_.roadCol);
               if(this.permitPlant)
               {
                  this.permitPlant.alpha = 0.5;
               }
               if(this.tipCropPlant_LevelUp)
               {
                  this.tipCropPlant_LevelUp.setLocation(_loc2_.x,_loc2_.y);
                  this.tipCropPlant_LevelUp.alpha = 0.5;
               }
               if(this.tipPlant)
               {
                  this.tipPlant.alpha = 0;
               }
            }
            else if(this.tipPlant !== null)
            {
               this.tipPlant.alpha = 0;
            }
            if(_loc4_)
            {
               if(this.rangeCol != -1 && this.rangeRow != -1)
               {
                  CommandDispatcher.send(CommandName.TD_HideSkillArea);
                  CommandDispatcher.send(CommandName.TD_ShowSkillArea,{
                     "tileIndex":this.lastShowTileData.index,
                     "col":this.rangeCol,
                     "row":this.rangeRow
                  });
               }
            }
         }
      }
      
      public function Dispose() : void
      {
         CommandDispatcher.send(CommandName.TD_HideSkillArea);
         TDTipEffectCmd.hideAllLevelupPlantTip();
         GameGloble.stage.removeEventListener(MouseEvent.MOUSE_MOVE,this.onMouseMove);
         GameGloble.stage.removeEventListener(MouseEvent.MOUSE_UP,this.onMouseClick);
         CommandDispatcher.send(CommandName.TD_CancelUseCard);
         this.cleanCropPlantRes();
         this.cleanTipPlant();
         this.cleanPrePlantEffect();
         this.lastShowTileData = null;
         if(this.permitPlant)
         {
            this.permitPlant.alpha = 1;
         }
         this.permitPlant = null;
         this.cardSlotRect = null;
      }
      
      private function cleanCropPlantRes() : void
      {
         if(this.cropPlant != null)
         {
            this.cropPlant.dispose(false);
            this.cropPlant = null;
         }
      }
      
      private function cleanTipPlant() : void
      {
         if(this.tipPlant != null)
         {
            this.tipPlant.dispose(false);
            this.tipPlant = null;
         }
         if(this.tipCropPlant_LevelUp)
         {
            this.tipCropPlant_LevelUp.dispose(false);
            this.tipCropPlant_LevelUp = null;
         }
         if(this.lastShowTileData != null)
         {
            this.lastShowTileData = null;
         }
      }
      
      private function cleanPrePlantEffect() : void
      {
         var _loc3_:Array = null;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc1_:TDPlantStaticInfo = TDDataFactory.instance.getPlantInfoByID(this.cropPlantID);
         var _loc2_:int = TalentManager.instance.getMeragePlanType(_loc1_);
         if(_loc2_ != 0)
         {
            _loc3_ = TDGameInfo.getInstance().getPlantByType(this.cropPlantID);
            _loc4_ = _loc3_.length;
            _loc5_ = 0;
            while(_loc5_ < _loc4_)
            {
               (_loc3_[_loc5_] as BasicPlant).stopLevelUpTip();
               _loc5_++;
            }
         }
      }
      
      public function get hasDisposed() : Boolean
      {
         return true;
      }
   }
}
