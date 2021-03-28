package com.qq.modules.td.logic.unit.object
{
   import com.qq.CommandName;
   import com.qq.constant.td.TDConstant;
   import com.qq.modules.basic.event.CommonEvent;
   import com.qq.modules.td.command.game.TDGameObjectCmd;
   import com.qq.modules.td.data.map.TDMapTileData;
   import com.qq.modules.td.logic.numeric.TDCheckCollision;
   import com.qq.modules.td.logic.talent.TalentFactory;
   import com.qq.modules.td.logic.talent.TalentManager;
   import com.qq.modules.td.logic.unit.basic.IGameObject;
   import com.qq.modules.td.model.TDGameInfo;
   import com.qq.utils.CommandDispatcher;
   import flash.geom.Rectangle;
   
   public class TDNutsShield extends TDNormalObject
   {
       
      
      private var _m_columnIndex:int;
      
      public function TDNutsShield()
      {
         super();
      }
      
      override public function init(param1:Boolean = false, param2:Boolean = false) : void
      {
         super.init(param1,param2);
         var _loc3_:Number = TalentManager.instance.getPlantSomeAbilityPromotion(TDConstant.PlantType_Nuts,TalentFactory.ABILITY_PROMOTION_TYPE_NUTS_SHIELD);
         this.objectModel.maxHp.set(this.objectModel.maxHp.get() * (1 + _loc3_ / 100));
         this.objectModel.curHp.set(this.objectModel.curHp.get() * (1 + _loc3_ / 100));
         CommandDispatcher._dispatcher.addEventListener(CommandName.TD_Damage_SwitchTo_NutsShield,this.switchDamageHandler);
      }
      
      private function switchDamageHandler(param1:CommonEvent) : void
      {
         var _loc2_:Array = param1.param as Array;
         var _loc3_:TDNutsShield = _loc2_[0];
         if(_loc3_.uid == this.uid)
         {
            this.changeHp(_loc2_[1],_loc2_[2],_loc2_[3],_loc2_[4]);
         }
      }
      
      override public function changeHp(param1:int, param2:int, param3:int, param4:IGameObject) : Boolean
      {
         super.changeHp(param1,param2,param3,param4);
         if(this.objectModel.curHp.get() <= 0)
         {
            this.Dispose();
            return true;
         }
         return false;
      }
      
      override public function Dispose() : void
      {
         var _loc5_:int = 0;
         var _loc6_:TDMapTileData = null;
         var _loc7_:Rectangle = null;
         var _loc8_:int = 0;
         var _loc9_:IGameObject = null;
         var _loc10_:IGameObject = null;
         CommandDispatcher._dispatcher.removeEventListener(CommandName.TD_Damage_SwitchTo_NutsShield,this.switchDamageHandler);
         var _loc1_:Array = TDGameInfo.getInstance().getZombieList(null,0,false,true,false);
         var _loc2_:int = _loc1_.length;
         var _loc3_:Array = TDGameInfo.getInstance().getGameObjectMapByCatalgAndType(TDConstant.UnitCatalog_Object,TDConstant.UnitType_QuickSand);
         var _loc4_:int = TDGameInfo.getInstance().minRow;
         while(_loc4_ <= TDGameInfo.getInstance().maxRow)
         {
            _loc5_ = 0;
            while(_loc5_ <= 1)
            {
               if(!((_loc6_ = TDGameInfo.getInstance().getRoadTileInf(this.columnIndex - _loc5_,_loc4_)) == null || !_loc6_.hasState(TDConstant.RoadTileState_forbidCropPlant_Temporary)))
               {
                  _loc7_ = _loc6_.rect;
                  _loc8_ = 0;
                  while(_loc8_ < _loc2_)
                  {
                     _loc9_ = _loc1_[_loc8_];
                     if(_loc7_.contains(_loc9_.x,_loc9_.y))
                     {
                        _loc9_.objectModel.addBuff(TDConstant.TDBuffID_Convey,_loc9_);
                        _loc9_.objectModel.addBuff(TDConstant.TDBuffID_UsedConvey,_loc9_);
                        for each(_loc10_ in _loc3_)
                        {
                           if(TDCheckCollision.isCollision(_loc10_,_loc10_.attackArea,_loc9_,_loc9_.damageArea))
                           {
                              if(_loc5_ == 1)
                              {
                                 TDGameObjectCmd.addConveyEffect(_loc9_,_loc10_.uid,_loc7_.x - _loc7_.width);
                              }
                              else
                              {
                                 TDGameObjectCmd.addConveyEffect(_loc9_,_loc10_.uid,_loc7_.x);
                              }
                              break;
                           }
                        }
                     }
                     _loc8_++;
                  }
               }
               _loc5_++;
            }
            _loc4_++;
         }
         super.Dispose();
      }
      
      public function get columnIndex() : int
      {
         return this._m_columnIndex;
      }
      
      public function set columnIndex(param1:int) : void
      {
         this._m_columnIndex = param1;
      }
   }
}
