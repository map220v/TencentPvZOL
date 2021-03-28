package com.qq.modules.td.logic.mouseAction
{
   import com.qq.CommandName;
   import com.qq.GameGloble;
   import com.qq.constant.td.TDConstant;
   import com.qq.modules.td.command.game.TDFloorCmd;
   import com.qq.modules.td.command.game.drag.TDMouseActionCmd;
   import com.qq.modules.td.data.map.TDMapTileData;
   import com.qq.modules.td.logic.TDUILayerManager;
   import com.qq.modules.td.logic.unit.object.TDNormalObject;
   import com.qq.modules.td.model.TDGameInfo;
   import com.qq.modules.td.view.game.layer.floor.TDFloorManager;
   import com.qq.utils.CommandDispatcher;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   
   public class TDLayEnergyTileAction implements ITDBaiscMouseAction
   {
       
      
      public var energyTile:TDNormalObject;
      
      public var energyTileType:uint;
      
      public var energyTileId:String;
      
      private var m_rowTool:Sprite;
      
      private var m_columnTool:Sprite;
      
      private var m_tileWidth:Number;
      
      private var m_tileHeight:Number;
      
      public function TDLayEnergyTileAction()
      {
         super();
         this.initTileCons();
      }
      
      private function initTileCons() : void
      {
         var _loc2_:int = 0;
         var _loc3_:TDMapTileData = null;
         var _loc1_:int = TDGameInfo.getInstance().minCol;
         while(_loc1_ <= TDGameInfo.getInstance().maxCol)
         {
            _loc2_ = TDGameInfo.getInstance().minRow;
            while(_loc2_ <= TDGameInfo.getInstance().maxRow)
            {
               _loc3_ = TDGameInfo.getInstance().getRoadTileInf(_loc1_,_loc2_);
               if(_loc3_)
               {
                  this.m_tileWidth = _loc3_.rect.width;
                  this.m_tileHeight = _loc3_.rect.height;
                  break;
               }
               _loc2_++;
            }
            _loc1_++;
         }
      }
      
      public function start(param1:Array = null) : void
      {
         this.onMouseMove(null);
      }
      
      public function onMouseMove(param1:MouseEvent) : void
      {
         var _loc2_:Point = new Point(GameGloble.stage.mouseX,GameGloble.stage.mouseY);
         _loc2_ = TDUILayerManager.effectLayer.globalToLocal(_loc2_);
         this.energyTile.scaleX = this.energyTile.scaleY = GameGloble.scaleCurrent * 0.9;
         this.energyTile.x = _loc2_.x - this.energyTile.contentW * 0.5;
         this.energyTile.y = _loc2_.y - this.energyTile.contentH * 0.1;
         var _loc3_:TDMapTileData = TDGameInfo.getInstance().getRoadTileByScreenPos(_loc2_.x,_loc2_.y);
         if(_loc3_ && this.isTileAllowPlant(_loc3_) && TDGameInfo.getInstance().countTombNum(_loc3_.index) == 0 && TDFloorManager.instance.getPowerTileType(_loc3_.roadCol,_loc3_.roadRow) == 0)
         {
            this.energyTile.alpha = 1;
         }
         else
         {
            this.energyTile.alpha = 0.5;
         }
         if(_loc3_)
         {
            this.energyTile.x = _loc3_.rect.x + this.energyTile.contentW * 0.5;
            this.energyTile.y = _loc3_.rect.y + this.energyTile.contentH * 0.8;
         }
      }
      
      public function onMouseClick(param1:MouseEvent) : void
      {
         var _loc2_:Point = new Point(GameGloble.stage.mouseX,GameGloble.stage.mouseY);
         _loc2_ = TDUILayerManager.effectLayer.globalToLocal(_loc2_);
         var _loc3_:TDMapTileData = TDGameInfo.getInstance().getRoadTileByScreenPos(_loc2_.x,_loc2_.y);
         if(_loc3_ && this.isTileAllowPlant(_loc3_) && TDGameInfo.getInstance().countTombNum(_loc3_.index) == 0 && TDFloorManager.instance.getPowerTileType(_loc3_.roadCol,_loc3_.roadRow) == 0)
         {
            TDFloorCmd.addPowerTile(this.energyTileType,_loc3_.roadCol,_loc3_.roadRow);
            TDMouseActionCmd.endLayEnergyTile();
            CommandDispatcher.send(CommandName.TD_DropEnergyTile,this.energyTileId);
         }
      }
      
      public function Dispose() : void
      {
         GameGloble.stage.removeEventListener(MouseEvent.MOUSE_MOVE,this.onMouseMove);
         GameGloble.stage.removeEventListener(MouseEvent.MOUSE_UP,this.onMouseClick);
         if(this.energyTile)
         {
            this.energyTile.Dispose();
            this.energyTile = null;
         }
      }
      
      public function get hasDisposed() : Boolean
      {
         return false;
      }
      
      public function isTileAllowPlant(param1:TDMapTileData) : Boolean
      {
         var _loc2_:int = TDGameInfo.getInstance().getRoadTileState(param1);
         if(_loc2_ & TDConstant.RoadTileState_Has_ForbidPlant || _loc2_ & TDConstant.RoadTileState_Has_WATER || _loc2_ & TDConstant.RoadTileState_Has_UNMUD)
         {
            return false;
         }
         return true;
      }
      
      public function get layTileRowTool() : Sprite
      {
         if(this.m_rowTool == null)
         {
            this.m_rowTool = new Sprite();
            this.m_rowTool.graphics.beginFill(16777215,0.3);
            this.m_rowTool.graphics.drawRect(0,0,this.m_tileWidth * (TDGameInfo.getInstance().maxCol - TDGameInfo.getInstance().minCol),this.m_tileHeight);
            this.m_rowTool.graphics.endFill();
         }
         return this.m_rowTool;
      }
      
      public function get layTileColumnTool() : Sprite
      {
         if(this.m_columnTool == null)
         {
            this.m_columnTool = new Sprite();
            this.m_columnTool.graphics.beginFill(16777215,0.3);
            this.m_columnTool.graphics.drawRect(0,0,this.m_tileWidth,this.m_tileHeight * (TDGameInfo.getInstance().maxRow - TDGameInfo.getInstance().minRow));
            this.m_columnTool.graphics.endFill();
         }
         return this.m_columnTool;
      }
   }
}
