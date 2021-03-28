package com.qq.modules.td.view.game.layer.floor
{
   import asgui.blit.Blit;
   import asgui.blit.bone.BlitBoneAnim;
   import asgui.blit.bone.BlitBoneManager;
   import asgui.blit.data.BlitData;
   import asgui.blit.data.BlitDataManager;
   import asgui.blit.display.IBlitClip;
   import asgui.blit.display.IBlitDisplayContainer;
   import asgui.core.IDisposable;
   import com.qq.GameGloble;
   import com.qq.constant.td.TDConstant;
   import com.qq.constant.td.TDMapType;
   import com.qq.constant.td.TDObjTypeID;
   import com.qq.modules.basic.view.MixLayer;
   import com.qq.modules.td.command.effects.TDEffectCmd;
   import com.qq.modules.td.data.map.TDMapRoadData;
   import com.qq.modules.td.data.map.TDMapTileData;
   import com.qq.modules.td.logic.unit.basic.IGameObject;
   import com.qq.modules.td.logic.unit.plant.BasicPlant;
   import com.qq.modules.td.model.TDGameInfo;
   import com.qq.modules.td.model.TDStageInfo;
   import com.qq.modules.td.model.vo.TDPathPointVO;
   import com.qq.modules.td.model.vo.TDPathVO;
   import org.as3commons.logging.api.getLogger;
   
   public final class TDFloorManager implements IDisposable
   {
      
      private static var _instance:TDFloorManager;
       
      
      private var bgLayer:MixLayer;
      
      private var pathMc:IBlitDisplayContainer;
      
      private var mudMc:BlitBoneAnim;
      
      public var pathsVisible:Vector.<TDPathVO>;
      
      public var mudsAlwaysRemoving:Vector.<TDPathPointVO>;
      
      private var rowWaters:Vector.<int>;
      
      public var removedMudRowAndColumn:Vector.<TDPathPointVO>;
      
      private var pathType:int;
      
      private var _hasDisposed:Boolean;
      
      public function TDFloorManager()
      {
         this.pathsVisible = new Vector.<TDPathVO>();
         this.mudsAlwaysRemoving = new Vector.<TDPathPointVO>();
         super();
      }
      
      public static function get instance() : TDFloorManager
      {
         if(_instance == null)
         {
            _instance = new TDFloorManager();
         }
         return _instance;
      }
      
      public function get hasDisposed() : Boolean
      {
         return this._hasDisposed;
      }
      
      public function Dispose() : void
      {
         this.bgLayer = null;
         _instance = null;
         this._hasDisposed = true;
      }
      
      public function init(param1:MixLayer) : void
      {
         var _loc2_:int = 0;
         if(this.bgLayer != null)
         {
            return;
         }
         this.bgLayer = param1;
         this.pathType = TDStageInfo.getInstance().getGroundPathType();
         if(this.pathType == 3)
         {
            this.pathMc = Blit.factory.CreateBlitContainer();
            this.pathMc.mouseEnabled = false;
            this.pathMc.y = 28;
            param1.addComponentToLayer(this.pathMc);
         }
         if(this.pathType == 3 || this.pathType == 4)
         {
            this.mudMc = BlitBoneManager.impl.createBoneAnim();
            this.mudMc.data = BlitBoneManager.impl.getBoneDataByUrl(GameGloble.getMudUrl(this.pathType));
            this.mudMc.autoUpdatePosition = false;
            param1.addComponentToLayer(this.mudMc.asset);
            getLogger("td").info("ground : mudMc : data hasLoaded " + this.mudMc.data.hasLoaded);
            this.rowWaters = TDStageInfo.getInstance().watersTiles;
            getLogger("td").info("ground : floor init OK");
         }
      }
      
      public function getResourceUrls() : Vector.<String>
      {
         var _loc1_:String = GameGloble.getMudUrl(this.pathType);
         var _loc2_:Vector.<String> = new Vector.<String>();
         if(_loc1_)
         {
            _loc2_.push(_loc1_);
         }
         return _loc2_;
      }
      
      public function reset() : void
      {
         var _loc1_:int = 0;
         var _loc3_:TDPathVO = null;
         if(this.pathType == 0)
         {
            return;
         }
         if(this.bgLayer == null)
         {
            return;
         }
         this.pathsVisible = new Vector.<TDPathVO>();
         this.mudsAlwaysRemoving = new Vector.<TDPathPointVO>();
         var _loc2_:Vector.<TDPathVO> = TDStageInfo.getInstance().paths;
         _loc1_ = 0;
         while(_loc1_ < _loc2_.length)
         {
            _loc3_ = _loc2_[_loc1_];
            if(_loc3_.order == 0)
            {
               this.pathsVisible.push(_loc3_);
            }
            _loc1_++;
         }
         this.updateMuds(this.updateVisiblePath().concat(this.mudsAlwaysRemoving));
         if(this.pathType == 4)
         {
            this.addWaterEffect();
            this.updateWaterMuds();
         }
         this.updateBlankTile();
      }
      
      public function removeMuds(param1:Vector.<TDPathPointVO>, param2:int = 0) : void
      {
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc7_:TDPathPointVO = null;
         var _loc8_:TDMapTileData = null;
         if(this.hasDisposed)
         {
            return;
         }
         var _loc3_:Boolean = false;
         var _loc6_:int = param1.length;
         _loc4_ = 0;
         while(_loc4_ < _loc6_)
         {
            _loc7_ = param1[_loc4_];
            _loc5_ = 0;
            while(_loc5_ < this.mudsAlwaysRemoving.length)
            {
               if(this.mudsAlwaysRemoving[_loc5_].equals(_loc7_))
               {
                  break;
               }
               _loc5_++;
            }
            if(_loc5_ == this.mudsAlwaysRemoving.length)
            {
               this.mudsAlwaysRemoving.push(_loc7_);
               this.tryRemovePlantAt(_loc7_);
               _loc3_ = true;
               if(param2 > 0)
               {
                  _loc8_ = TDGameInfo.getInstance().getRoadTileInf(_loc7_.col,_loc7_.row);
                  TDEffectCmd.playAnimAt(GameGloble.getMudBreakingUrl(),_loc8_.rect.x,_loc8_.rect.y);
               }
            }
            _loc4_++;
         }
         if(_loc3_)
         {
            this.updateMuds(this.updateVisiblePath().concat(this.mudsAlwaysRemoving));
         }
      }
      
      public function getPathVO(param1:int) : TDPathVO
      {
         switch(param1)
         {
            case 100:
               if(this.pathsVisible.length > 0)
               {
                  return this.pathsVisible[0];
               }
               break;
         }
         return TDStageInfo.getInstance().getPathVO(param1);
      }
      
      public function removePath(param1:int, param2:int = 0) : void
      {
         var _loc4_:int = 0;
         var _loc3_:TDPathVO = this.getPathVO(param1);
         if(_loc3_)
         {
            _loc4_ = 0;
            while(_loc4_ < this.pathsVisible.length)
            {
               if(this.pathsVisible[_loc4_].pathId == _loc3_.pathId)
               {
                  this.pathsVisible.splice(_loc4_,1);
                  this.updateMuds(this.updateVisiblePath().concat(this.mudsAlwaysRemoving));
                  this.tryRemovePlantsByCells(_loc3_.pathCells);
                  break;
               }
               _loc4_++;
            }
         }
      }
      
      public function addPath(param1:int, param2:int = 0) : void
      {
         var _loc3_:int = 0;
         var _loc4_:TDPathVO = this.getPathVO(param1);
         var _loc5_:Vector.<TDPathPointVO> = new Vector.<TDPathPointVO>();
         _loc3_ = 0;
         while(_loc3_ < this.pathsVisible.length)
         {
            if(this.pathsVisible[_loc3_].pathId == _loc4_.pathId)
            {
               break;
            }
            _loc3_++;
         }
         if(_loc3_ == this.pathsVisible.length)
         {
            TDFloorPathUpdateScheduler.createPathUpdate(_loc4_,param2 > 0 ? 170 : 0);
         }
      }
      
      public function scheduleRemovePathList(param1:Vector.<TDPathPointVO>) : void
      {
         new TDFloorPathUpdateScheduler(null).removeTileList(param1);
         this.tryRemovePlantsByCells(param1);
      }
      
      public function scheduleAddPathList(param1:Vector.<TDPathPointVO>) : void
      {
         new TDFloorPathUpdateScheduler(null).addTileList(param1);
         this.tryRemovePlantsByCells(param1);
      }
      
      public function tryRemovePlantsByCells(param1:Vector.<TDPathPointVO>) : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = param1.length;
         _loc2_ = 0;
         while(_loc2_ < _loc3_)
         {
            this.tryRemovePlantAt(param1[_loc2_]);
            _loc2_++;
         }
      }
      
      public function tryRemovePlantAt(param1:TDPathPointVO) : void
      {
         var _loc3_:int = 0;
         var _loc4_:BasicPlant = null;
         var _loc5_:TDMapTileData = null;
         var _loc2_:Vector.<BasicPlant> = TDGameInfo.getInstance().getPlantsAllByPos(param1.row,param1.col);
         _loc3_ = 0;
         while(_loc3_ < _loc2_.length)
         {
            (_loc4_ = _loc2_[_loc3_]).Dispose();
            _loc3_++;
         }
         if(_loc2_.length > 0)
         {
            _loc5_ = TDGameInfo.getInstance().getRoadTileInf(param1.col,param1.row);
            TDEffectCmd.playAnimAt(GameGloble.getPlantBreakingUrl(),_loc5_.rect.x,_loc5_.rect.y,false,"top",2);
         }
      }
      
      public function updateVisiblePath(param1:Vector.<TDPathPointVO> = null) : Vector.<TDPathPointVO>
      {
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc10_:int = 0;
         var _loc11_:TDMapTileData = null;
         var _loc12_:IBlitClip = null;
         var _loc2_:int = TDStageInfo.getInstance().getGroundPathType();
         if(this.mudMc == null || _loc2_ != 3)
         {
            getLogger("td").info("ground : updateVisiblePath : mudMc is NULL");
            return new Vector.<TDPathPointVO>();
         }
         var _loc3_:Vector.<TDPathPointVO> = new Vector.<TDPathPointVO>();
         this.pathMc.RemoveAllChildren();
         getLogger("td").info("ground : updateVisiblePath : RemoveAllChildren");
         var _loc4_:String = GameGloble.getPathUrl(_loc2_);
         var _loc5_:BlitData = BlitDataManager.GetBlitDataByUrl(_loc4_);
         var _loc6_:Vector.<Vector.<int>> = TDStageInfo.getInstance().pathCells;
         TDFloorUtil.updateCellsByPaths(_loc6_,this.pathsVisible,param1);
         var _loc9_:int = _loc6_.length;
         getLogger("td").info("ground : blitData : " + _loc5_.url + " : hasContent " + _loc5_.hasContent);
         _loc7_ = 0;
         while(_loc7_ < _loc9_)
         {
            _loc8_ = 0;
            while(_loc8_ < _loc6_[_loc7_].length)
            {
               if((_loc10_ = _loc6_[_loc7_][_loc8_]) >= 2)
               {
                  if(_loc11_ = TDGameInfo.getInstance().getRoadTileInf(_loc8_,_loc7_))
                  {
                     (_loc12_ = Blit.factory.CreateBlitClip({"smooth":true})).dataProvider = _loc5_;
                     _loc12_.currentFrame = _loc10_ - 1;
                     this.pathMc.AddChild(_loc12_);
                     _loc12_.Render();
                     _loc12_.Stop();
                     _loc12_.x = _loc11_.rect.x;
                     _loc12_.y = _loc11_.rect.y;
                     _loc12_.name = "d_" + _loc7_ + "_" + (10 - _loc8_);
                     _loc3_.push(new TDPathPointVO(_loc7_,_loc8_));
                     getLogger("td").info("ground : updateVisiblePath : " + _loc12_.name + " : " + _loc12_.x + ", " + _loc12_.y);
                  }
               }
               _loc8_++;
            }
            _loc7_++;
         }
         return _loc3_;
      }
      
      private function addWaterEffect() : void
      {
         TDEffectCmd.showBgEffect(TDConstant.UnitType_WaterFoam,820,250);
         TDEffectCmd.showBgEffect(TDConstant.UnitType_WaterBreaker,820,100);
         TDEffectCmd.showBgEffect(TDConstant.UnitType_WaterBreaker,820,350);
         TDEffectCmd.showBgEffect(TDConstant.UnitType_WaterBreaker,820,600);
         TDEffectCmd.showBgEffect(TDConstant.UnitType_WaterBreaker,820,850);
      }
      
      private function updateWaterMuds() : void
      {
         var _loc1_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:String = null;
         if(!this.mudMc && this.pathType != 4)
         {
            return;
         }
         this.mudMc.clearAllBoneVisibleRules();
         var _loc2_:int = this.rowWaters.length;
         _loc1_ = 0;
         while(_loc1_ < _loc2_)
         {
            _loc3_ = this.rowWaters[_loc1_];
            _loc4_ = "d_" + _loc1_;
            this.mudMc.setBoneVisibleRule(_loc4_,_loc3_ == 0);
            getLogger("td").info("ground : setBoneVisibleRule : " + _loc4_ + " : " + _loc3_);
            _loc1_++;
         }
         if(this.mudMc.data)
         {
            this.mudMc.data.clearQuadBatchCache();
         }
         this.mudMc.render(true);
      }
      
      private function updateBlankTile() : void
      {
         var _loc4_:int = 0;
         var _loc5_:XMLList = null;
         var _loc6_:String = null;
         if(!this.mudMc)
         {
            return;
         }
         var _loc1_:XML = TDStageInfo.getInstance().stageMapXml;
         if(_loc1_ == null || _loc1_.warfield == null || _loc1_.warfield[0] == null)
         {
            return;
         }
         var _loc2_:XMLList = _loc1_.warfield[0].road;
         if(_loc2_ == null)
         {
            return;
         }
         var _loc3_:int = TDGameInfo.getInstance().minCol;
         while(_loc3_ <= TDGameInfo.getInstance().maxCol)
         {
            _loc4_ = TDGameInfo.getInstance().minRow;
            while(_loc4_ <= TDGameInfo.getInstance().maxRow)
            {
               if(_loc2_[_loc4_ - 1])
               {
                  if((_loc5_ = _loc2_[_loc4_ - 1].tile)[_loc3_] && _loc5_[_loc3_].@type.toString() == "blank")
                  {
                     _loc6_ = "d_" + _loc4_ + "_" + (TDGameInfo.getInstance().maxCol + 1 - _loc3_);
                     this.mudMc.setBoneVisibleRule(_loc6_,false);
                  }
               }
               _loc4_++;
            }
            _loc3_++;
         }
      }
      
      public function updateMudVisible(param1:TDPathPointVO, param2:Boolean) : void
      {
         if(!this.mudMc)
         {
            return;
         }
         var _loc3_:String = "d_" + param1.row + "_" + (TDGameInfo.getInstance().maxCol + 1 - param1.col);
         this.mudMc.setBoneVisibleRule(_loc3_,param2);
         var _loc4_:TDMapTileData;
         if(_loc4_ = TDGameInfo.getInstance().getRoadTileInf(param1.col,param1.row))
         {
            if(param2)
            {
               _loc4_.type = TDConstant.TileType_Grass;
            }
            else
            {
               _loc4_.type = TDConstant.TileType_Blank;
            }
         }
      }
      
      public function updateMuds(param1:Vector.<TDPathPointVO>) : void
      {
         var _loc2_:int = 0;
         var _loc4_:TDPathPointVO = null;
         var _loc5_:String = null;
         if(!this.mudMc && this.pathType != 3)
         {
            return;
         }
         this.removedMudRowAndColumn = param1;
         var _loc3_:int = param1.length;
         this.mudMc.clearAllBoneVisibleRules();
         _loc2_ = 0;
         while(_loc2_ < _loc3_)
         {
            _loc4_ = param1[_loc2_];
            _loc5_ = "d_" + _loc4_.row + "_" + (10 - _loc4_.col);
            this.mudMc.setBoneVisibleRule(_loc5_,false);
            getLogger("td").info("ground : setBoneVisibleRule : " + _loc5_);
            _loc2_++;
         }
         this.mudMc.render(true);
      }
      
      public function hasRemovedMudAt(param1:int, param2:int) : Boolean
      {
         var _loc3_:int = 0;
         if(this.removedMudRowAndColumn == null)
         {
            return false;
         }
         var _loc4_:int = this.removedMudRowAndColumn.length;
         _loc3_ = 0;
         while(_loc3_ < _loc4_)
         {
            if(this.removedMudRowAndColumn[_loc3_].row == param1 && this.removedMudRowAndColumn[_loc3_].col == param2)
            {
               return true;
            }
            _loc3_++;
         }
         return false;
      }
      
      public function hasPathAt(param1:int, param2:int) : Boolean
      {
         return TDStageInfo.getInstance().pathCells[param1][param2];
      }
      
      public function hasWaterAt(param1:int, param2:int) : Boolean
      {
         var _loc3_:Vector.<int> = TDStageInfo.getInstance().watersTiles;
         if(_loc3_.length <= param1 || _loc3_[param1] == 0)
         {
            return false;
         }
         return param2 < 5;
      }
      
      public function hasSpringboard(param1:int, param2:int) : Boolean
      {
         var _loc3_:Vector.<int> = null;
         if(TDStageInfo.getInstance().mapID == TDMapType.MapID_Pirate)
         {
            _loc3_ = TDStageInfo.getInstance().watersTiles;
            return _loc3_[param1] == 0 && param2 < 5;
         }
         return false;
      }
      
      public function getUsefulTile(param1:Array) : Vector.<TDMapTileData>
      {
         var _loc3_:Array = null;
         var _loc4_:int = 0;
         var _loc5_:TDMapTileData = null;
         var _loc2_:Vector.<TDMapTileData> = new Vector.<TDMapTileData>();
         for each(_loc4_ in param1)
         {
            _loc3_ = TDGameInfo.getInstance().getRoadInfo(_loc4_).tileList;
            for each(_loc5_ in _loc3_)
            {
               if(!this.hasWaterAt(_loc5_.roadIndex,_loc5_.roadCol))
               {
                  _loc2_.push(_loc5_);
               }
            }
         }
         return _loc2_;
      }
      
      public function getPowerTileType(param1:int, param2:int) : int
      {
         var _loc4_:IGameObject = null;
         var _loc3_:Array = TDGameInfo.getInstance().getGameObjectMapByCatalg(TDConstant.UnitCatalog_Object);
         for each(_loc4_ in _loc3_)
         {
            if(_loc4_.objectModel.column == param1 && _loc4_.objectModel.roadIndex == param2 && TDObjTypeID.POWER_TILE_TYPE_ARR.indexOf(_loc4_.objectModel.unitType) >= 0)
            {
               return _loc4_.objectModel.unitType;
            }
         }
         return 0;
      }
      
      public function getIsPowerTile(param1:int, param2:int) : Boolean
      {
         return this.getPowerTileType(param1,param2) > 0;
      }
      
      public function getLinkPowerTile(param1:int, param2:int) : Vector.<TDMapTileData>
      {
         var _loc5_:TDMapTileData = null;
         var _loc6_:Array = null;
         var _loc7_:TDMapRoadData = null;
         var _loc8_:TDMapTileData = null;
         var _loc3_:Vector.<TDMapTileData> = new Vector.<TDMapTileData>();
         var _loc4_:int;
         if(_loc4_ = this.getPowerTileType(param1,param2))
         {
            if(_loc5_ = TDGameInfo.getInstance().getRoadTileInf(param1,param2))
            {
               _loc6_ = TDGameInfo.getInstance().roadList;
               for each(_loc7_ in _loc6_)
               {
                  for each(_loc8_ in _loc7_.tileList)
                  {
                     if(this.getPowerTileType(_loc8_.roadCol,_loc8_.roadRow) == _loc4_ && _loc8_.index != _loc5_.index)
                     {
                        _loc3_.push(_loc8_);
                     }
                  }
               }
            }
         }
         return _loc3_;
      }
   }
}
