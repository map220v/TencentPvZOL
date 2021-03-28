package com.qq.modules.td.logic.bt_ai.aiUtils
{
   import com.qq.constant.td.TDBulletParam;
   import com.qq.constant.td.TDConstant;
   import com.qq.constant.td.TDObjTypeID;
   import com.qq.modules.td.command.effects.TDEffectCmd;
   import com.qq.modules.td.data.TDDataFactory;
   import com.qq.modules.td.data.game.unit.TDPlantStaticInfo;
   import com.qq.modules.td.data.map.TDMapTileData;
   import com.qq.modules.td.logic.numeric.TDCheckCollision;
   import com.qq.modules.td.logic.talent.TalentManager;
   import com.qq.modules.td.logic.unit.basic.IGameObject;
   import com.qq.modules.td.logic.unit.bullet.BasicBullet;
   import com.qq.modules.td.logic.unit.object.TDNutsShield;
   import com.qq.modules.td.logic.unit.plant.BasicPlant;
   import com.qq.modules.td.logic.unit.plant.OxygenAlagePlant;
   import com.qq.modules.td.model.TDGameInfo;
   import com.qq.modules.td.view.effects.TDEffectPlayInfo;
   import com.qq.modules.td.view.game.layer.shadow.TDShadowManager;
   import flash.geom.Rectangle;
   import net.sakri.flash.math.MathUtil;
   import org.as3commons.logging.api.getLogger;
   
   public class TDSearchTargetUtils
   {
       
      
      public function TDSearchTargetUtils()
      {
         super();
      }
      
      private static function searchTargetInAreas(param1:Array, param2:Array = null, param3:Boolean = true, param4:Boolean = true, param5:Boolean = true, param6:Array = null, param7:Array = null) : Vector.<IGameObject>
      {
         var _loc10_:IGameObject = null;
         var _loc11_:Rectangle = null;
         var _loc8_:Vector.<IGameObject> = new Vector.<IGameObject>();
         var _loc9_:Array = TDGameInfo.getInstance().getZombieList(param2,TDConstant.TDCamp_Enemy,param4,param3,param5,param6,param7);
         for each(_loc10_ in _loc9_)
         {
            if(_loc10_.damageArea)
            {
               for each(_loc11_ in param1)
               {
                  if(TDCheckCollision.isIntersectRect(_loc11_,_loc10_,_loc10_.damageArea))
                  {
                     _loc8_.push(_loc10_);
                     break;
                  }
               }
            }
         }
         return _loc8_;
      }
      
      public static function searchTargetForObj(param1:IGameObject, param2:Array, param3:Array = null, param4:Boolean = true, param5:Array = null, param6:Array = null) : Vector.<IGameObject>
      {
         if(param1 is BasicPlant)
         {
            return searchTargetForPlant(param1 as BasicPlant,param2,param3,param4,param5,param6);
         }
         if(param1 is BasicBullet)
         {
            return searchTargetForBullet(param1 as BasicBullet,param2,param3,param4,param5,param6);
         }
         getLogger().error("既不是BasicPlant也不是BasicBullet");
         return null;
      }
      
      public static function searchTargetForPlant(param1:BasicPlant, param2:Array, param3:Array = null, param4:Boolean = true, param5:Array = null, param6:Array = null) : Vector.<IGameObject>
      {
         var _loc7_:* = param1.plantData.plantStaticInfo.baseInfo.isAttackFlight == 1;
         var _loc8_:* = param1.plantData.plantStaticInfo.baseInfo.isAttackObj == 1;
         return searchTargetInAreas(param2,param3,param4,_loc7_,_loc8_,param5,param6);
      }
      
      public static function searchTargetForPlantWithAttackArea(param1:BasicPlant, param2:Array = null, param3:Boolean = true, param4:Array = null, param5:Array = null) : Vector.<IGameObject>
      {
         var _loc8_:Rectangle = null;
         var _loc6_:Array = TalentManager.instance.getAttackArea(param1.objectModel.unitType,param1.attackArea);
         var _loc7_:Array = [];
         for each(_loc8_ in _loc6_)
         {
            _loc7_.push(TDCheckCollision.getNewObjRect(param1,_loc8_));
         }
         return searchTargetForPlant(param1,_loc7_,param2,param3,param4,param5);
      }
      
      public static function searchTargetForBullet(param1:BasicBullet, param2:Array, param3:Array = null, param4:Boolean = true, param5:Array = null, param6:Array = null) : Vector.<IGameObject>
      {
         var _loc7_:* = param1.bulletData.bulletStaticInfo.isHitFlight == 1;
         var _loc8_:* = param1.bulletData.bulletStaticInfo.isHitObj == 1;
         return searchTargetInAreas(param2,param3,param4,_loc7_,_loc8_,param5,param6);
      }
      
      public static function searchOneTargetByRoads(param1:IGameObject, param2:Array = null) : IGameObject
      {
         var _loc3_:IGameObject = null;
         var _loc7_:IGameObject = null;
         if(param2 == null)
         {
            param2 = [param1.objectModel.roadIndex];
         }
         var _loc4_:Array;
         var _loc5_:int = (_loc4_ = getZombieList(param1,param2)).length;
         var _loc6_:int = 0;
         for(; _loc6_ < _loc5_; _loc6_++)
         {
            _loc7_ = _loc4_[_loc6_];
            if(param1.x < _loc7_.x)
            {
               if(_loc7_.objectModel.isPermitAttack())
               {
                  _loc3_ = _loc7_;
               }
               continue;
               break;
            }
         }
         return _loc3_;
      }
      
      public static function searchTargetsByColRow(param1:int, param2:int, param3:int, param4:int, param5:BasicPlant, param6:Boolean = true, param7:Array = null, param8:Array = null) : Vector.<IGameObject>
      {
         if(param1 > param2 || param3 > param4 || param1 > TDGameInfo.getInstance().maxCol || param2 < TDGameInfo.getInstance().minCol || param3 > TDGameInfo.getInstance().maxRow || param4 < TDGameInfo.getInstance().minRow)
         {
            return null;
         }
         param1 = MathUtil.constrainNumber(param1,TDGameInfo.getInstance().minCol,TDGameInfo.getInstance().maxCol);
         param2 = MathUtil.constrainNumber(param2,TDGameInfo.getInstance().minCol,TDGameInfo.getInstance().maxCol);
         param3 = MathUtil.constrainNumber(param3,TDGameInfo.getInstance().minRow,TDGameInfo.getInstance().maxRow);
         param4 = MathUtil.constrainNumber(param4,TDGameInfo.getInstance().minRow,TDGameInfo.getInstance().maxRow);
         var _loc9_:TDMapTileData = TDGameInfo.getInstance().getRoadTileInf(param2,param3);
         var _loc10_:TDMapTileData = TDGameInfo.getInstance().getRoadTileInf(param1,param4);
         var _loc11_:Rectangle = new Rectangle(_loc9_.rect.x,_loc9_.rect.y,_loc10_.rect.right - _loc9_.rect.left,_loc10_.rect.bottom - _loc9_.rect.top);
         var _loc12_:Array = [];
         var _loc13_:int = param3;
         while(_loc13_ <= param4)
         {
            _loc12_.push(_loc13_);
            _loc13_++;
         }
         return searchTargetForPlant(param5,[_loc11_],_loc12_,param6,param7,param8);
      }
      
      public static function searchTargetsByRoad(param1:IGameObject, param2:Array = null) : Vector.<IGameObject>
      {
         var _loc7_:IGameObject = null;
         var _loc3_:Vector.<IGameObject> = new Vector.<IGameObject>();
         if(param2 == null)
         {
            param2 = [param1.objectModel.roadIndex];
         }
         var _loc4_:Array;
         var _loc5_:int = (_loc4_ = getZombieList(param1,param2)).length;
         var _loc6_:int = 0;
         while(_loc6_ < _loc5_)
         {
            _loc7_ = _loc4_[_loc6_];
            if(param1.x < _loc7_.x)
            {
               if(_loc7_.objectModel.isPermitAttack())
               {
                  _loc3_.push(_loc7_);
               }
            }
            _loc6_++;
         }
         return _loc3_;
      }
      
      public static function getOneTargetByRoad(param1:Boolean, param2:Boolean, param3:IGameObject) : IGameObject
      {
         var _loc4_:IGameObject = null;
         var _loc8_:IGameObject = null;
         var _loc5_:Array;
         var _loc6_:int = (_loc5_ = TDGameInfo.getInstance().getZombieList([param3.objectModel.roadIndex],TDConstant.TDCamp_Enemy,param1,false,param2)).length;
         var _loc7_:int = 0;
         for(; _loc7_ < _loc6_; _loc7_++)
         {
            _loc8_ = _loc5_[_loc7_];
            if(param3.x < _loc8_.x)
            {
               if(_loc8_.objectModel.isPermitAttack())
               {
                  _loc4_ = _loc8_;
               }
               continue;
               break;
            }
         }
         return _loc4_;
      }
      
      public static function searchTheLastOneTargetByRoad(param1:IGameObject) : IGameObject
      {
         var _loc2_:IGameObject = null;
         var _loc6_:IGameObject = null;
         var _loc3_:Array = getZombieList(param1,[param1.objectModel.roadIndex]);
         var _loc4_:int = _loc3_.length;
         var _loc5_:int = 0;
         while(_loc5_ < _loc4_)
         {
            _loc6_ = _loc3_[_loc5_];
            if(param1.x < _loc6_.x && _loc6_.objectModel.isPermitAttack() && (_loc2_ == null || _loc2_.x < _loc6_.x))
            {
               _loc2_ = _loc6_;
            }
            _loc5_++;
         }
         return _loc2_;
      }
      
      public static function getZombieList(param1:IGameObject, param2:Array = null, param3:Boolean = true, param4:Array = null, param5:Array = null, param6:Boolean = false) : Array
      {
         var _loc7_:* = false;
         var _loc8_:* = false;
         if(param1 is BasicPlant)
         {
            _loc7_ = (param1 as BasicPlant).plantData.plantStaticInfo.baseInfo.isAttackFlight == 1;
            _loc8_ = (param1 as BasicPlant).plantData.plantStaticInfo.baseInfo.isAttackObj == 1;
         }
         else if(param1 is BasicBullet)
         {
            _loc7_ = (param1 as BasicBullet).bulletData.bulletStaticInfo.isHitFlight == 1;
            _loc8_ = (param1 as BasicBullet).bulletData.bulletStaticInfo.isHitObj == 1;
         }
         var _loc9_:Array = TDGameInfo.getInstance().getZombieList(param2,TDConstant.TDCamp_Enemy,_loc7_,param3,_loc8_,param4,param5);
         if(param6)
         {
            return _loc9_.sort(sortZombieFirst);
         }
         return _loc9_;
      }
      
      private static function sortZombieFirst(param1:IGameObject, param2:IGameObject) : Number
      {
         if(param1.objectModel.unitCatalog == param2.objectModel.unitCatalog)
         {
            return param1.x - param2.x;
         }
         return param1.objectModel.unitCatalog == TDConstant.UnitCatalog_Zombie ? Number(-1) : Number(1);
      }
      
      public static function searchTargetPlant(param1:IGameObject, param2:Array = null, param3:Boolean = false) : IGameObject
      {
         var _loc4_:IGameObject = null;
         var _loc5_:IGameObject = null;
         var _loc7_:Array = null;
         var _loc8_:Array = null;
         var _loc9_:BasicPlant = null;
         var _loc10_:TDPlantStaticInfo = null;
         var _loc11_:TDMapTileData = null;
         var _loc12_:Array = null;
         var _loc6_:Rectangle = !!param3 ? param1.damageArea : param1.attackArea;
         if(param1.objectModel.camp == TDConstant.TDCamp_Self)
         {
            _loc7_ = TDGameInfo.getInstance().getZombieList([param1.objectModel.roadIndex],TDConstant.TDCamp_Enemy);
            for each(_loc5_ in _loc7_)
            {
               if(_loc5_.objectModel.isPermitNormalAttack())
               {
                  if(TDCheckCollision.isCollision(param1,_loc6_,_loc5_,_loc5_.damageArea))
                  {
                     _loc4_ = _loc5_;
                     break;
                  }
               }
            }
         }
         else
         {
            _loc8_ = TDGameInfo.getInstance().getGameObjectMapByCatalg(TDConstant.UnitCatalog_Plant);
            for each(_loc9_ in _loc8_)
            {
               if(_loc9_.plantData.isPermitAttack())
               {
                  if(!(!_loc9_.plantData.isAlive() && _loc9_.plantData.plantStaticInfo.id != TDConstant.PlantType_Nuts))
                  {
                     if(_loc9_.plantData.roadIndex == param1.objectModel.roadIndex)
                     {
                        if(_loc9_.objectModel.isPermitNormalAttack())
                        {
                           if(!(param2 && param2.indexOf(_loc9_.plantData.plantHeight) < 0))
                           {
                              if((_loc10_ = TDDataFactory.instance.getPlantInfoByID(_loc9_.plantData.plantStaticInfo.id)).baseInfo.usefulness == TDConstant.PlantUsefulness_Container)
                              {
                                 _loc11_ = TDGameInfo.getInstance().getRoadTileByIndex(_loc9_.plantData.tileIndex);
                                 if(TDGameInfo.getInstance().hasNomalPlantInRoadTile(_loc11_))
                                 {
                                    continue;
                                 }
                              }
                              if(TDCheckCollision.isCollision(param1,_loc6_,_loc9_,_loc9_.damageArea))
                              {
                                 if(_loc9_.plantData.getProtectedPlantUID() != -1)
                                 {
                                    _loc4_ = TDGameInfo.getInstance().getGameObjctByUID(_loc9_.plantData.getProtectedPlantUID());
                                 }
                                 else
                                 {
                                    _loc4_ = _loc9_;
                                 }
                                 if(_loc4_ != null)
                                 {
                                    break;
                                 }
                              }
                           }
                        }
                     }
                  }
               }
            }
            if(_loc4_ == null)
            {
               _loc12_ = TDGameInfo.getInstance().getZombieList([param1.objectModel.roadIndex],TDConstant.TDCamp_Self);
               for each(_loc5_ in _loc12_)
               {
                  if(_loc5_.objectModel.isPermitNormalAttack())
                  {
                     if(TDCheckCollision.isCollision(param1,_loc6_,_loc5_,_loc5_.damageArea))
                     {
                        _loc4_ = _loc5_;
                        break;
                     }
                  }
               }
            }
         }
         return _loc4_;
      }
      
      public static function searchTargetNutsShield(param1:IGameObject, param2:Boolean = false) : IGameObject
      {
         var _loc5_:IGameObject = null;
         var _loc3_:Rectangle = !!param2 ? param1.damageArea : param1.attackArea;
         var _loc4_:Array = TDGameInfo.getInstance().getGameObjectMapByCatalgAndType(TDConstant.UnitCatalog_Object,TDObjTypeID.Obj_Nuts_Shield);
         for each(_loc5_ in _loc4_)
         {
            if(TDCheckCollision.isCollision(param1,_loc3_,_loc5_,_loc5_.damageArea))
            {
               return _loc5_;
            }
         }
         return null;
      }
      
      public static function searchTargetNutsShieldByColumn(param1:int) : TDNutsShield
      {
         var _loc3_:TDNutsShield = null;
         var _loc2_:Array = TDGameInfo.getInstance().getGameObjectMapByCatalgAndType(TDConstant.UnitCatalog_Object,TDObjTypeID.Obj_Nuts_Shield);
         for each(_loc3_ in _loc2_)
         {
            if(_loc3_.columnIndex == param1)
            {
               return _loc3_;
            }
         }
         return null;
      }
      
      public static function coveredByOxygen(param1:TDMapTileData) : Boolean
      {
         var _loc3_:BasicPlant = null;
         var _loc4_:Boolean = false;
         if(param1 == null)
         {
            return false;
         }
         var _loc2_:Array = TDGameInfo.getInstance().getGameObjectMapByCatalgAndType(TDConstant.UnitCatalog_Plant,TDConstant.PlantType_Oxygenalage);
         for each(_loc3_ in _loc2_)
         {
            if(_loc3_)
            {
               if(_loc4_ = (_loc3_ as OxygenAlagePlant).isTileCovered(param1))
               {
                  return true;
               }
            }
         }
         return false;
      }
      
      public static function bulletBounce(param1:BasicBullet, param2:IGameObject) : Boolean
      {
         if(param1.bulletData.bulletStaticInfo.getParam(TDBulletParam.Bullet_Param_Bounce_By_Bengfu) > 0)
         {
            if(param1 && param2.objectModel.staticInfo.type == TDConstant.ZombieType_Bengfu && param2.getRunningProp(TDConstant.Gameobject_Prop_Bengbu_Hidden))
            {
               param1.setAction(TDConstant.BAction_Bounce,null,true);
               TDShadowManager.instance.disposeShadowByTDGameObject(param1);
               TDEffectCmd.playBlitAnimation(TDObjTypeID.Obj_Bounce_Effect,param2.x - param2.damageArea.width * 0.5,param2.y - param2.damageArea.height * 0.5,new TDEffectPlayInfo("animation"));
               return true;
            }
         }
         return false;
      }
   }
}
