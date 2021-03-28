package com.qq.modules.td.logic
{
   import com.qq.GameGloble;
   import com.qq.constant.td.TDConstant;
   import com.qq.data.DataCacheManager;
   import com.qq.modules.td.data.TDDataFactory;
   import com.qq.modules.td.data.game.ITDStaticData;
   import com.qq.modules.td.data.game.unit.TDBulletStaticInfo;
   import com.qq.modules.td.data.game.unit.TDNormalObjectStaticInfo;
   import com.qq.modules.td.data.game.unit.TDPlantBaseStaticInfo;
   import com.qq.modules.td.data.game.unit.TDPlantStaticInfo;
   import com.qq.modules.td.data.game.unit.TDZombieStaticInfo;
   import com.qq.modules.td.logic.unit.object.TDNormalObject;
   import com.qq.modules.td.logic.unit.plant.BasicPlant;
   import com.qq.modules.td.model.TDGameInfo;
   import com.qq.utils.UrlManager;
   import com.qq.utils.db.ClientDBTableName;
   
   public class TDResourceUtil
   {
      
      private static var _checkArr:Array;
       
      
      public function TDResourceUtil()
      {
         super();
      }
      
      private static function checkEndlessLoop(param1:int, param2:int, param3:Boolean) : Boolean
      {
         var _loc4_:String = param1 + "_" + param2 + "_" + param3;
         if(_checkArr.indexOf(_loc4_) >= 0)
         {
            return true;
         }
         _checkArr.push(_loc4_);
         return false;
      }
      
      public static function checkExtraRes(param1:int, param2:int, param3:Boolean = false) : Array
      {
         _checkArr = [];
         var _loc4_:Array = [];
         switch(param1)
         {
            case TDConstant.UnitCatalog_Object:
               _loc4_ = checkNormalObjectExtraRes(param2,param3);
               break;
            case TDConstant.UnitCatalog_Plant:
               _loc4_ = checkPlantExtraRes(param2,param3);
               break;
            case TDConstant.UnitCatalog_Zombie:
               _loc4_ = checkZombieRes(param2,param3);
               break;
            case TDConstant.UnitCatalog_Bullet:
               _loc4_ = checkBulletRes(param2,param3);
         }
         return _loc4_;
      }
      
      private static function checkNormalObjectExtraRes(param1:int, param2:Boolean = true) : Array
      {
         var _loc5_:Array = null;
         var _loc3_:Array = [];
         if(checkEndlessLoop(TDConstant.UnitCatalog_Object,param1,param2))
         {
            return _loc3_;
         }
         var _loc4_:TDNormalObjectStaticInfo;
         if(_loc4_ = DataCacheManager.getInstance().getTemplateDataById(ClientDBTableName.Table_ObjectInfo,param1,TDNormalObjectStaticInfo))
         {
            if(param2)
            {
               _loc3_.push([TDConstant.UnitCatalog_Object,param1]);
            }
            if(_loc4_.itemResIDList.length > 0)
            {
               _loc5_ = _loc4_.itemResIDList.split("|");
               _loc3_ = _loc3_.concat(parseExtraRes(_loc5_));
            }
         }
         return _loc3_;
      }
      
      private static function checkBulletRes(param1:int, param2:Boolean = true) : Array
      {
         var _loc5_:int = 0;
         var _loc3_:Array = new Array();
         if(checkEndlessLoop(TDConstant.UnitCatalog_Bullet,param1,param2))
         {
            return _loc3_;
         }
         var _loc4_:TDBulletStaticInfo;
         if(_loc4_ = TDDataFactory.instance.getBulletInfoByID(param1))
         {
            if(param2)
            {
               _loc3_.push([TDConstant.UnitCatalog_Bullet,param1]);
            }
            if(_loc4_ != null)
            {
               for each(_loc5_ in _loc4_.hitEffectIDList)
               {
                  _loc3_.push([TDConstant.UnitCatalog_Object,_loc5_]);
               }
               if(_loc4_.fireEffectID)
               {
                  _loc3_.push([TDConstant.UnitCatalog_Object,_loc4_.fireEffectID]);
               }
            }
         }
         return _loc3_;
      }
      
      private static function checkPlantExtraRes(param1:int, param2:Boolean = true) : Array
      {
         var _loc5_:int = 0;
         var _loc6_:Array = null;
         var _loc3_:Array = [];
         if(checkEndlessLoop(TDConstant.UnitCatalog_Plant,param1,param2))
         {
            return _loc3_;
         }
         var _loc4_:TDPlantBaseStaticInfo;
         if((_loc4_ = TDDataFactory.instance.getPlantBaseInfoByID(param1)) != null)
         {
            if(param2)
            {
               _loc3_.push([TDConstant.UnitCatalog_Plant,param1]);
            }
            if(_loc4_.itemResIDList.length > 0)
            {
               _loc6_ = _loc4_.itemResIDList.split("|");
               _loc3_ = _loc3_.concat(parseExtraRes(_loc6_));
            }
            if(_loc4_.bulletType != 0)
            {
               _loc3_ = _loc3_.concat(checkBulletRes(_loc4_.bulletType));
            }
            if((_loc5_ = _loc4_.getSpecialSkillParam(TDConstant.SpecialSkill_Param_ShootBulletType)) != 0)
            {
               _loc3_ = _loc3_.concat(checkBulletRes(_loc5_));
            }
         }
         return _loc3_;
      }
      
      private static function checkZombieRes(param1:int, param2:Boolean = true) : Array
      {
         var _loc5_:Array = null;
         var _loc6_:Array = null;
         var _loc3_:Array = [];
         if(checkEndlessLoop(TDConstant.UnitCatalog_Zombie,param1,param2))
         {
            return _loc3_;
         }
         var _loc4_:TDZombieStaticInfo;
         if((_loc4_ = TDDataFactory.instance.getZombieInfoByID(param1)) != null)
         {
            if(param2)
            {
               _loc3_.push([TDConstant.UnitCatalog_Zombie,param1]);
            }
            if(_loc4_.charredType != 0)
            {
               _loc3_.push([TDConstant.UnitCatalog_Object,_loc4_.charredType]);
            }
            for each(_loc5_ in _loc4_.lootList)
            {
               _loc3_.push([TDConstant.UnitCatalog_Object,_loc5_[1]]);
            }
            if(_loc4_.itemResIDList.length > 0)
            {
               _loc6_ = _loc4_.itemResIDList.split("|");
               _loc3_ = _loc3_.concat(parseExtraRes(_loc6_));
            }
         }
         return _loc3_;
      }
      
      private static function parseExtraRes(param1:Array) : Array
      {
         var _loc4_:String = null;
         var _loc5_:Array = null;
         var _loc6_:int = 0;
         var _loc2_:Array = [];
         var _loc3_:int = 0;
         while(_loc3_ < param1.length)
         {
            if((_loc4_ = param1[_loc3_]).length != 0)
            {
               _loc5_ = _loc4_.split(":");
               for each(_loc6_ in _loc5_)
               {
                  switch(_loc3_)
                  {
                     case 0:
                        _loc2_ = _loc2_.concat(checkZombieRes(_loc6_));
                        break;
                     case 1:
                        _loc2_ = _loc2_.concat(checkNormalObjectExtraRes(_loc6_));
                        break;
                     case 2:
                        _loc2_ = _loc2_.concat(checkBulletRes(_loc6_));
                        break;
                     case 3:
                        _loc2_ = _loc2_.concat(checkPlantExtraRes(_loc6_));
                        break;
                  }
               }
            }
            _loc3_++;
         }
         return _loc2_;
      }
      
      public static function getResUrl(param1:int, param2:int) : String
      {
         var _loc7_:String = null;
         var _loc8_:TDPlantStaticInfo = null;
         if(TDConstant.UnitCatalog_Plant == param1)
         {
            if((_loc8_ = DataCacheManager.getInstance().getTemplateDataById(ClientDBTableName.Table_PlantInfo,param2,TDPlantStaticInfo)) != null)
            {
               param2 = _loc8_.type;
            }
         }
         var _loc3_:String = getTableName(param1);
         var _loc4_:Class = getTableClass(param1);
         var _loc5_:int = getUrlKey(param1);
         var _loc6_:ITDStaticData;
         if((_loc6_ = DataCacheManager.getInstance().getTemplateDataById(_loc3_,param2,_loc4_)) == null)
         {
            return null;
         }
         if(_loc6_.resFileName.length > 0)
         {
            _loc7_ = UrlManager.getInstance().getUrl(_loc5_,_loc6_.resFileName + "." + GameGloble.BONE_FILE_EXT);
         }
         return _loc7_;
      }
      
      public static function getTableName(param1:int) : String
      {
         var _loc2_:String = null;
         switch(param1)
         {
            case TDConstant.UnitCatalog_Zombie:
               _loc2_ = ClientDBTableName.Table_ZombieInfo;
               break;
            case TDConstant.UnitCatalog_Bullet:
               _loc2_ = ClientDBTableName.Table_BulletInfo;
               break;
            case TDConstant.UnitCatalog_Object:
               _loc2_ = ClientDBTableName.Table_ObjectInfo;
               break;
            case TDConstant.UnitCatalog_Plant:
               _loc2_ = ClientDBTableName.Table_PlantTypeInfo;
               break;
            default:
               throw new Error("塔防加载未知类型");
         }
         return _loc2_;
      }
      
      public static function getTableClass(param1:int) : Class
      {
         var _loc2_:Class = null;
         switch(param1)
         {
            case TDConstant.UnitCatalog_Zombie:
               _loc2_ = TDZombieStaticInfo;
               break;
            case TDConstant.UnitCatalog_Bullet:
               _loc2_ = TDBulletStaticInfo;
               break;
            case TDConstant.UnitCatalog_Object:
               _loc2_ = TDNormalObjectStaticInfo;
               break;
            case TDConstant.UnitCatalog_Plant:
               _loc2_ = TDPlantBaseStaticInfo;
               break;
            default:
               throw new Error("塔防加载未知类型");
         }
         return _loc2_;
      }
      
      public static function getUrlKey(param1:int) : int
      {
         var _loc2_:int = 0;
         switch(param1)
         {
            case TDConstant.UnitCatalog_Zombie:
               _loc2_ = UrlManager.Url_TDZombieAnmi;
               break;
            case TDConstant.UnitCatalog_Bullet:
               _loc2_ = UrlManager.Url_TDBulletAnmi;
               break;
            case TDConstant.UnitCatalog_Object:
               _loc2_ = UrlManager.Url_TDObjectAnmi;
               break;
            case TDConstant.UnitCatalog_Plant:
               _loc2_ = UrlManager.Url_TDPlantAnmi;
               break;
            default:
               throw new Error("塔防加载未知类型");
         }
         return _loc2_;
      }
      
      public static function getPlantAndObjectInSceneUrls() : Vector.<String>
      {
         var _loc1_:int = 0;
         var _loc5_:String = null;
         var _loc6_:Array = null;
         var _loc7_:Array = null;
         var _loc8_:String = null;
         var _loc9_:BasicPlant = null;
         var _loc10_:TDNormalObject = null;
         var _loc2_:Vector.<String> = new Vector.<String>();
         var _loc3_:Array = TDGameInfo.getInstance().getGameObjectMapByCatalg(TDConstant.UnitCatalog_Plant);
         var _loc4_:Array = TDGameInfo.getInstance().getGameObjectMapByCatalg(TDConstant.UnitCatalog_Object);
         _loc1_ = 0;
         while(_loc1_ < _loc3_.length)
         {
            if(_loc3_[_loc1_])
            {
               _loc9_ = _loc3_[_loc1_];
               _loc5_ = TDResourceUtil.getResUrl(TDConstant.UnitCatalog_Plant,_loc9_.plantData.plantStaticInfo.type);
               _loc2_.push(_loc5_);
               _loc6_ = TDResourceUtil.checkExtraRes(TDConstant.UnitCatalog_Plant,_loc9_.plantData.plantStaticInfo.type);
               for each(_loc7_ in _loc6_)
               {
                  _loc8_ = TDResourceUtil.getResUrl(_loc7_[0],_loc7_[1]);
                  _loc2_.push(_loc8_);
               }
            }
            _loc1_++;
         }
         _loc1_ = 0;
         while(_loc1_ < _loc4_.length)
         {
            if(_loc4_[_loc1_])
            {
               _loc10_ = _loc4_[_loc1_];
               _loc5_ = TDResourceUtil.getResUrl(TDConstant.UnitCatalog_Object,_loc10_.objData.objectStaticInfo.type);
               _loc2_.push(_loc5_);
               _loc6_ = TDResourceUtil.checkExtraRes(TDConstant.UnitCatalog_Object,_loc10_.objData.objectStaticInfo.type);
               for each(_loc7_ in _loc6_)
               {
                  _loc8_ = TDResourceUtil.getResUrl(_loc7_[0],_loc7_[1]);
                  _loc2_.push(_loc8_);
               }
            }
            _loc1_++;
         }
         return _loc2_;
      }
   }
}
