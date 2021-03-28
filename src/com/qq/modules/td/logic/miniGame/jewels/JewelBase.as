package com.qq.modules.td.logic.miniGame.jewels
{
   import com.gems.GemBase;
   import com.qq.CommandName;
   import com.qq.constant.td.TDConstant;
   import com.qq.modules.basic.event.CommonEvent;
   import com.qq.modules.sound.command.SoundCmd;
   import com.qq.modules.td.command.game.TDGameObjectCmd;
   import com.qq.modules.td.data.map.TDMapTileData;
   import com.qq.modules.td.logic.TDFactory;
   import com.qq.modules.td.logic.unit.basic.IGameObject;
   import com.qq.modules.td.logic.unit.plant.BasicPlant;
   import com.qq.modules.td.model.TDGameInfo;
   import com.qq.modules.td.model.TDMiniGameJewelsData;
   import com.qq.modules.td.view.game.layer.shadow.TDShadowManager;
   import com.qq.utils.CommandDispatcher;
   import flash.events.Event;
   import flash.geom.Point;
   
   public class JewelBase extends GemBase
   {
       
      
      private var plant:BasicPlant;
      
      private var holeObject:IGameObject;
      
      private var _isMouseOver:Boolean = false;
      
      public function JewelBase(param1:int, param2:int, param3:int, param4:int)
      {
         super(param1,param2,param3,param4);
      }
      
      override protected function updateEmpty() : void
      {
         var _loc1_:TDMapTileData = null;
         if(empty)
         {
            if(this.plant && this.plant.hasDisposed == false)
            {
               this.plant.dispose();
               this.plant = null;
            }
            _loc1_ = TDMiniGameJewelsData.instance.getMapData(idx,idy);
            this.holeObject = TDFactory.createGameobject(TDConstant.UnitCatalog_Object,TDConstant.UnitType_TD_Hole);
            TDGameObjectCmd.addNormalGameObjectByColRow(this.holeObject,_loc1_.roadCol,_loc1_.roadRow);
         }
         else if(!this.holeObject.hasDisposed)
         {
            this.holeObject.dispose();
            this.holeObject = null;
         }
      }
      
      override public function getEffectTarget() : Object
      {
         return this.plant;
      }
      
      override public function create(param1:int, param2:int, param3:Boolean = false) : void
      {
         var _loc4_:TDMapTileData = null;
         super.create(param1,param2,param3);
         if(this.plant && param3 == false)
         {
            (_loc4_ = TDGameInfo.getInstance().getRoadTileByIndex(this.plant.plantData.roadIndex)).removePlantType(this.plant.plantData.staticInfo.type);
            _loc4_ = TDMiniGameJewelsData.instance.getMapData(this.idx,this.idy);
            this.plant.plantData.loadTileData(_loc4_);
            _loc4_.addPlantType(this.plant.plantData.staticInfo.type);
            this.plant.alpha = 1;
         }
      }
      
      override protected function updateView() : void
      {
         if(this.plant)
         {
            this.plant.dispose();
            this.plant = null;
         }
         var _loc1_:TDMapTileData = TDMiniGameJewelsData.instance.getMapData(this.idx,this.idy);
         this.plant = TDFactory.createGameobject(TDConstant.UnitCatalog_Plant,type) as BasicPlant;
         var _loc2_:Point = TDGameInfo.getInstance().getPlantPos(_loc1_.index,this.plant.plantData.plantStaticInfo.id);
         this.plant.plantData.loadTileData(_loc1_);
         _loc1_.addPlantType(this.plant.plantData.plantStaticInfo.baseInfo.id);
         this.plant.revive();
         CommandDispatcher.send(CommandName.TD_Add_UnitToScreen,{
            "object":this.plant,
            "x":_loc2_.x,
            "y":_loc2_.y
         });
         CommandDispatcher._dispatcher.removeEventListener(CommandName.TD_PLANT_REMOVE,this.plantDieHandler);
         CommandDispatcher._dispatcher.addEventListener(CommandName.TD_PLANT_REMOVE,this.plantDieHandler);
      }
      
      private function plantDieHandler(param1:CommonEvent) : void
      {
         var _loc2_:int = param1.param.tileIndex;
         if(this.plant && _loc2_ == this.plant.plantData.tileIndex && (this.plant.killByZombie == true || this.plant.killBySelfExplode == true))
         {
            empty = true;
         }
      }
      
      override public function set isMove(param1:Boolean) : void
      {
         if(_isMove == param1)
         {
            return;
         }
         _isMove = param1;
         if(this.plant)
         {
            if(_isMove)
            {
               this.plant.setFrozenAI(true);
               this.plant.objectModel.addBuff(TDConstant.TDBuffID_God,this.plant);
            }
            else
            {
               this.plant.setFrozenAI(false);
               this.plant.objectModel.removeBuff(TDConstant.TDBuffID_God);
            }
         }
      }
      
      override public function onMoving() : void
      {
         if(this.plant)
         {
            TDShadowManager.instance.updateShadowByTDGameObject(this.plant);
         }
      }
      
      public function setMouseOver(param1:Boolean) : void
      {
         if(!this.plant)
         {
            return;
         }
         if(this._isMouseOver == param1)
         {
            return;
         }
         this._isMouseOver = param1;
         if(this._isMouseOver)
         {
            SoundCmd.playSound(350);
         }
      }
      
      public function playDisppearEff() : void
      {
         var eff:IGameObject = null;
         var onFinishEffectHandler:Function = null;
         var pos:Point = null;
         onFinishEffectHandler = function(param1:Event):void
         {
            eff.animation.removeEventListener(Event.COMPLETE,onFinishEffectHandler);
            eff.dispose();
         };
         var mapData:TDMapTileData = TDMiniGameJewelsData.instance.getMapData(this.idx,this.idy);
         eff = TDFactory.createGameobject(TDConstant.UnitCatalog_Object,TDConstant.UnitType_TD_JEWEL_DISPPEAR);
         if(eff)
         {
            pos = TDGameInfo.getInstance().getPlantPos(mapData.index,type);
            TDGameInfo.getInstance().addGameobjectToMap(eff);
            CommandDispatcher.send(CommandName.TD_Add_UnitToScreen,{
               "object":eff,
               "x":pos.x,
               "y":pos.y
            });
            eff.animation.gotoAndPlay(TDConstant.PlantAnmi_Idle,1);
            eff.animation.addEventListener(Event.COMPLETE,onFinishEffectHandler);
         }
      }
      
      override public function dispose() : void
      {
         this.setMouseOver(false);
         CommandDispatcher._dispatcher.removeEventListener(CommandName.TD_PLANT_REMOVE,this.plantDieHandler);
         if(!_isMove)
         {
         }
         if(this.plant)
         {
            this.plant.Dispose();
            this.plant = null;
         }
      }
   }
}
