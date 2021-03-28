package com.qq.modules.td.data.map
{
   import com.qq.constant.td.TDConstant;
   import com.qq.constant.td.TDObjTypeID;
   import com.qq.modules.td.command.game.TDGameObjectCmd;
   import com.qq.modules.td.data.TDDataFactory;
   import com.qq.modules.td.data.game.unit.TDPlantStaticInfo;
   import com.qq.modules.td.logic.TDFactory;
   import com.qq.modules.td.logic.unit.basic.IGameObject;
   import com.qq.modules.td.logic.unit.plant.BasicPlant;
   import com.qq.modules.td.model.TDGameInfo;
   import flash.geom.Rectangle;
   import flash.utils.Dictionary;
   import org.as3commons.logging.api.getLogger;
   
   public class TDMapTileData
   {
       
      
      public var type:int;
      
      public var rect:Rectangle;
      
      public var index:int;
      
      public var roadIndex:int;
      
      private var _plantList:Array;
      
      public var roadRow:int;
      
      public var roadCol:int;
      
      private var _state:int;
      
      private var _forbidCropPlant:Boolean;
      
      private var _effectDic:Dictionary;
      
      public function TDMapTileData(param1:int, param2:int, param3:int, param4:int, param5:int, param6:Boolean)
      {
         super();
         this._forbidCropPlant = param6;
         this.rect = new Rectangle(param1,param2,param3,param4);
         this.index = param5;
         this.reset();
      }
      
      public function reset() : void
      {
         if(this._forbidCropPlant)
         {
            this.setState(TDConstant.RoadTileState_Has_ForbidPlant);
         }
         this.cleanState(TDConstant.RoadTileState_Poison);
         this._plantList = new Array();
         this._effectDic = new Dictionary();
      }
      
      public function addPlantType(param1:int) : void
      {
         var _loc2_:int = this._plantList.indexOf(param1);
         if(_loc2_ == -1)
         {
            this._plantList.push(param1);
            this.autoUpdatePlantState();
         }
         else
         {
            getLogger("TD").debug("地块移除植物失败，该植物已存在");
         }
      }
      
      public function removePlantType(param1:int) : void
      {
         var _loc2_:int = this._plantList.indexOf(param1);
         if(_loc2_ != -1)
         {
            this._plantList.splice(_loc2_,1);
            this.autoUpdatePlantState();
         }
         else
         {
            getLogger("TD").debug("地块移除植物失败，没有该植物存在");
         }
      }
      
      private function autoUpdatePlantState() : void
      {
         var _loc3_:int = 0;
         var _loc4_:TDPlantStaticInfo = null;
         this.cleanState(TDConstant.RoadTileState_Has_Plant);
         this.cleanState(TDConstant.RoadTileState_Has_Container);
         this.cleanState(TDConstant.RoadTileState_Has_Armor);
         var _loc1_:int = this._plantList.length;
         var _loc2_:int = 0;
         while(_loc2_ < _loc1_)
         {
            _loc3_ = this._plantList[_loc2_];
            if(_loc4_ = TDDataFactory.instance.getPlantInfoByID(_loc3_))
            {
               if(_loc4_.baseInfo.usefulness == TDConstant.PlantUsefulness_Plant && !this.hasState(TDConstant.RoadTileState_Has_Plant))
               {
                  this.setState(TDConstant.RoadTileState_Has_Plant);
               }
               if(_loc4_.baseInfo.usefulness == TDConstant.PlantUsefulness_Container && !this.hasState(TDConstant.RoadTileState_Has_Container))
               {
                  this.setState(TDConstant.RoadTileState_Has_Container);
               }
               if(_loc4_.baseInfo.usefulness == TDConstant.PlantUsefulness_Protected && !this.hasState(TDConstant.RoadTileState_Has_Armor))
               {
                  this.setState(TDConstant.RoadTileState_Has_Armor);
               }
            }
            _loc2_++;
         }
      }
      
      public function isContainPlant(param1:int) : Boolean
      {
         var _loc2_:int = this._plantList.indexOf(param1);
         return _loc2_ != -1;
      }
      
      public function constainsPlantHeight(param1:int) : Boolean
      {
         var _loc2_:int = 0;
         var _loc3_:Array = null;
         var _loc4_:BasicPlant = null;
         for each(_loc2_ in this._plantList)
         {
            _loc3_ = TDGameInfo.getInstance().getGameObjectMapByCatalgAndType(TDConstant.UnitCatalog_Plant,_loc2_);
            for each(_loc4_ in _loc3_)
            {
               if(_loc4_.objectModel.tileIndex == this.index)
               {
                  if(_loc4_.plantData.plantHeight == param1)
                  {
                     return true;
                  }
               }
            }
         }
         return false;
      }
      
      public function setState(param1:uint) : void
      {
         this.setStateEffect(param1);
         this._state |= param1;
      }
      
      public function hasState(param1:uint) : Boolean
      {
         return param1 == (this._state & param1);
      }
      
      public function cleanState(param1:uint) : void
      {
         var _loc2_:* = 0;
         if(this.hasState(param1))
         {
            this.cleanStateEffect(param1);
            _loc2_ = this._state ^ param1;
            this._state = _loc2_;
         }
      }
      
      private function setStateEffect(param1:uint) : void
      {
         var _loc2_:IGameObject = null;
         if(!this.hasState(param1) && this._effectDic && this._effectDic[param1] == null)
         {
            switch(param1)
            {
               case TDConstant.RoadTileState_Supply_Oxygen:
                  TDGameObjectCmd.addGameObjectByPos(TDConstant.UnitCatalog_Object,TDObjTypeID.Obj_Supply_Oxygen_Effect,this.rect.x + 0.5 * this.rect.width,this.rect.y + 0.5 * this.rect.height + 21);
                  _loc2_ = TDGameInfo.getInstance().getGameObjctByUID(TDFactory.getLastUnitUin());
                  _loc2_.animation.gotoAndPlay("animation",true);
            }
            if(_loc2_)
            {
               this._effectDic[param1] = _loc2_;
            }
         }
      }
      
      private function cleanStateEffect(param1:uint) : void
      {
         var _loc2_:IGameObject = null;
         if(this._effectDic)
         {
            _loc2_ = this._effectDic[param1];
            if(_loc2_)
            {
               _loc2_.Dispose();
            }
            delete this._effectDic[param1];
         }
      }
   }
}
