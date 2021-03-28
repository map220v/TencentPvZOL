package com.qq.modules.td.logic.mouseAction
{
   import asgui.resources.AssetManager;
   import com.qq.CommandName;
   import com.qq.GameGloble;
   import com.qq.constant.td.TDConstant;
   import com.qq.modules.td.command.game.drag.TDMouseActionCmd;
   import com.qq.modules.td.command.game.sound.TDSoundCmd;
   import com.qq.modules.td.data.map.TDMapTileData;
   import com.qq.modules.td.logic.TDUILayerManager;
   import com.qq.modules.td.logic.numeric.TDCheckCollision;
   import com.qq.modules.td.logic.unit.plant.BasicPlant;
   import com.qq.modules.td.model.TDGameInfo;
   import com.qq.utils.CommandDispatcher;
   import com.qq.utils.UtilsManager;
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import org.as3commons.logging.api.getLogger;
   
   public class TDUseShovelAction implements ITDBaiscMouseAction
   {
       
      
      public var lastShowTileData:TDMapTileData;
      
      public var shovel:MovieClip;
      
      private var _counter:int;
      
      private var _selectedPlant:BasicPlant;
      
      private var _point:Point;
      
      public function TDUseShovelAction()
      {
         super();
      }
      
      public function start(param1:Array = null) : void
      {
         TDSoundCmd.pickupShovel();
         if(this.shovel == null)
         {
            this.shovel = AssetManager.instance.GetNewClass("TD_UI_Shovel_New") as MovieClip;
            this.shovel.mouseChildren = false;
            this.shovel.mouseEnabled = false;
            TDUILayerManager.topEffectLayer.dragSp.addChild(this.shovel);
         }
         this._counter = 0;
         GameGloble.stage.addEventListener(MouseEvent.CLICK,this.onMouseClick);
         GameGloble.stage.addEventListener(MouseEvent.MOUSE_MOVE,this.onMouseMove);
         this.onMouseMove(null);
      }
      
      public function onMouseMove(param1:MouseEvent) : void
      {
         var _loc3_:BasicPlant = null;
         if(!TDUILayerManager.effectLayer)
         {
            return;
         }
         if(this._point == null)
         {
            this._point = new Point();
         }
         this._point.x = GameGloble.stage.mouseX;
         this._point.y = GameGloble.stage.mouseY;
         this.shovel.x = this._point.x;
         this.shovel.y = this._point.y;
         this.shovel.scaleX = this.shovel.scaleY = GameGloble.scaleCurrent;
         this._point = TDUILayerManager.effectLayer.globalToLocal(this._point);
         var _loc2_:TDMapTileData = TDGameInfo.getInstance().getRoadTileByScreenPos(this._point.x,this._point.y);
         if(_loc2_ != null)
         {
            if(this.lastShowTileData == null)
            {
               this.lastShowTileData = _loc2_;
            }
            else if(this.lastShowTileData.index != _loc2_.index)
            {
               this.lastShowTileData = _loc2_;
            }
            _loc3_ = this.getShovelSelectedPlant(_loc2_.index,this._point.x,this._point.y);
            if(_loc3_ != this._selectedPlant)
            {
               if(this._selectedPlant != null)
               {
                  this._selectedPlant.removeShovelEffect();
               }
               this._selectedPlant = _loc3_;
               if(this._selectedPlant != null)
               {
                  this._selectedPlant.addShovelEffect();
               }
            }
         }
      }
      
      public function onMouseClick(param1:MouseEvent) : void
      {
         var _loc4_:BasicPlant = null;
         if(this._counter == 0)
         {
            this._counter = 1;
            return;
         }
         getLogger("TD").info("铲子准备铲除植物");
         var _loc2_:Point = new Point(param1.stageX,param1.stageY);
         _loc2_ = TDUILayerManager.effectLayer.globalToLocal(_loc2_);
         var _loc3_:TDMapTileData = TDGameInfo.getInstance().getRoadTileByScreenPos(_loc2_.x,_loc2_.y);
         if(_loc3_ != null)
         {
            if((_loc4_ = this.getShovelSelectedPlant(_loc3_.index,_loc2_.x,_loc2_.y)) != null)
            {
               _loc4_.dispose();
            }
         }
         TDSoundCmd.cleanPlant();
         TDMouseActionCmd.endUseShovel();
      }
      
      private function getShovelSelectedPlant(param1:int, param2:int, param3:int) : BasicPlant
      {
         var _loc5_:BasicPlant = null;
         param2 += GameGloble.xForScene * (1 - GameGloble.scaleCurrent);
         param2 /= GameGloble.scaleCurrent;
         param3 /= GameGloble.scaleCurrent;
         var _loc4_:Array;
         (_loc4_ = TDGameInfo.getInstance().getPlantByTileIndex(param1)).sort(this.sortPlantByUsefulness);
         for each(_loc5_ in _loc4_)
         {
            if(TDCheckCollision.isContainPoint(_loc5_,_loc5_.damageArea,param2,param3))
            {
               if(_loc5_.plantData.plantStaticInfo.baseInfo.usefulness != TDConstant.PlantUsefulness_Container)
               {
                  if(_loc5_.plantData.plantStaticInfo.baseInfo.usefulness == TDConstant.PlantUsefulness_Gravebuster)
                  {
                     return null;
                  }
               }
               if(_loc4_.length == 1)
               {
                  return _loc5_;
               }
               continue;
               return _loc5_;
            }
         }
         return null;
      }
      
      private function sortPlantByUsefulness(param1:BasicPlant, param2:BasicPlant) : int
      {
         if(param1.plantData.plantStaticInfo.baseInfo.usefulness < param2.plantData.plantStaticInfo.baseInfo.usefulness)
         {
            return 1;
         }
         if(param1.plantData.plantStaticInfo.baseInfo.usefulness > param2.plantData.plantStaticInfo.baseInfo.usefulness)
         {
            return -1;
         }
         return 0;
      }
      
      public function Dispose() : void
      {
         CommandDispatcher.send(CommandName.TD_Show_Shovel);
         if(this._selectedPlant != null)
         {
            this._selectedPlant.removeShovelEffect();
            this._selectedPlant = null;
         }
         this.lastShowTileData = null;
         GameGloble.stage.removeEventListener(MouseEvent.CLICK,this.onMouseClick);
         GameGloble.stage.removeEventListener(MouseEvent.MOUSE_MOVE,this.onMouseMove);
         if(this.shovel != null)
         {
            UtilsManager.removeFromContainer(this.shovel);
            this.shovel = null;
         }
      }
      
      public function get hasDisposed() : Boolean
      {
         return true;
      }
   }
}
