package com.qq
{
   import PVZ.Cmd.Dto_CardPosInfo;
   import PVZ.Cmd.Dto_FormationInfo;
   import PVZ.Cmd.Dto_IdNum;
   import asgui.blit.bone.BlitBoneData;
   import asgui.blit.bone.BlitBoneManager;
   import com.qq.constant.td.TDConstant;
   import com.qq.modules.activity.ActivityGlobal;
   import com.qq.modules.bag.ItemType;
   import com.qq.modules.bag.command.BagProxyCmd;
   import com.qq.modules.bag.model.BagItemTemplate;
   import com.qq.modules.bag.model.ItemTemplateFactory;
   import com.qq.modules.bag.model.vo.BagProxy;
   import com.qq.modules.card.model.CardProxy;
   import com.qq.modules.main.command.CommonCmd;
   import com.qq.modules.main.logic.initData.IGameLoader;
   import com.qq.modules.main.model.ActorModel;
   import com.qq.modules.main.model.vo.Attribute;
   import com.qq.modules.main.service.PrivilegeProxy;
   import com.qq.modules.td.view.helpers.TDResizeHelper;
   import com.qq.modules.union.model.UnionModel;
   import com.qq.utils.DateUtils;
   import com.qq.utils.UrlManager;
   import com.qq.utils.db.ShareObjectConst;
   import com.qq.utils.db.ShareObjectDB;
   import com.tencent.protobuf.Int64;
   import flash.display.Sprite;
   import flash.display.Stage;
   import flash.utils.ByteArray;
   import org.robotlegs.core.IInjector;
   import org.robotlegs.extend.ExtendContext;
   
   public class GameGloble
   {
      
      public static var isFinishInit:Boolean = false;
      
      public static var isFinishBaseModuleLoader:Boolean = false;
      
      public static var bgSoundIndex:int = -1;
      
      public static var context:ExtendContext;
      
      public static var stage:Stage;
      
      public static var loader:IGameLoader;
      
      public static var root:Sprite;
      
      public static var starling:Object;
      
      private static var _starlingContainer:Object;
      
      public static var isStalingMode:Boolean = false;
      
      public static var injector:IInjector;
      
      public static var TDScreenW:int = 900;
      
      public static var TDScreenH:int = 675;
      
      public static var TDUseAllPlant:Boolean = true;
      
      public static const groundWidth:int = 1500;
      
      private static var _resizeHelper:TDResizeHelper;
      
      public static var scaleCurrent:Number = 1;
      
      public static var xAddForUI:int = 0;
      
      public static var xForScene:int;
      
      public static var debugUIGraphics:Boolean = false;
      
      private static var _pathUrl:String;
      
      private static var _mudBreakingUrl:String;
      
      private static var _plantBreakingUrl:String;
      
      public static var checkClearNormalBoneDataFunc:Function = defaultCheckClearNormalBoneDataFunc;
      
      public static var tdBlitBoneManager:BlitBoneManager;
      
      public static var normalBlitBoneManager:BlitBoneManager;
      
      public static const BONE_FILE_EXT:String = "bbone";
      
      public static const BONE_FILE_EXT_POINT:String = "." + BONE_FILE_EXT;
      
      public static var isNew:Boolean = false;
      
      public static var isOldUI:Boolean = false;
      
      public static var actorModel:ActorModel;
      
      public static var unionModel:UnionModel;
      
      public static var privilegeProxy:PrivilegeProxy;
      
      public static var sunExchangeCoin:int = 0;
      
      public static var avatarConfigXml:XML;
      
      public static var msgCheckFunc:Function;
      
      public static var isAutoPopupDailyQuestWin:Boolean = false;
      
      public static const BBS_URL:String = "http://pvz.gamebbs.qq.com";
      
      public static const Goto_Help:String = "http://kf.qq.com";
      
      public static var isCloseAddBuildingEffect:Boolean = false;
      
      public static var isTDNeedUpdateTime:Boolean = false;
      
      public static var bagProxy:BagProxy;
      
      public static var cardProxy:CardProxy;
      
      public static var expeditionTargetCityType:int = 1;
      
      public static var isJoinExpedition:Boolean = false;
      
      private static var _expeditonLeaderList:Array;
      
      private static var _cardLeftHPList:Array;
       
      
      public function GameGloble()
      {
         super();
      }
      
      public static function getStarlingContainer() : Object
      {
         if(!GameGloble.starling)
         {
            return null;
         }
         if(_starlingContainer == null)
         {
            _starlingContainer = GameGloble.starling.root;
         }
         return _starlingContainer;
      }
      
      public static function get xAddForStarling() : int
      {
         if(!isStalingMode)
         {
            return 0;
         }
         return GameGloble.xAddForUI / GameGloble.scaleCurrent;
      }
      
      public static function get xAddForScene() : int
      {
         return GameGloble.xAddForUI - TDConstant.passWarfieldPosX * GameGloble.scaleCurrent;
      }
      
      public static function get resizeHelper() : TDResizeHelper
      {
         if(_resizeHelper == null)
         {
            _resizeHelper = new TDResizeHelper();
         }
         return _resizeHelper;
      }
      
      public static function disposeResizeHelper() : void
      {
         if(_resizeHelper)
         {
            _resizeHelper.Dispose();
         }
         _resizeHelper = null;
      }
      
      public static function isGuildTD(param1:int) : Boolean
      {
         if(param1 == 0)
         {
            return true;
         }
         return false;
      }
      
      public static function getPathUrl(param1:int) : String
      {
         if(_pathUrl == null)
         {
            _pathUrl = UrlManager.getInstance().getUrl(UrlManager.Url_TD_EFFECTS,"path/path_" + param1 + ".swf");
         }
         return _pathUrl;
      }
      
      public static function getMudUrl(param1:int) : String
      {
         if(param1 == 3 || param1 == 4)
         {
            return UrlManager.getInstance().getUrl(UrlManager.Url_TD_EFFECTS,"path/mud_" + param1 + "." + GameGloble.BONE_FILE_EXT);
         }
         return null;
      }
      
      public static function getMudBreakingUrl() : String
      {
         if(_mudBreakingUrl == null)
         {
            _mudBreakingUrl = UrlManager.getInstance().getUrl(UrlManager.Url_TD_EFFECTS,"path/mud_breaking." + GameGloble.BONE_FILE_EXT);
         }
         return _mudBreakingUrl;
      }
      
      public static function getPlantBreakingUrl() : String
      {
         if(_plantBreakingUrl == null)
         {
            _plantBreakingUrl = UrlManager.getInstance().getUrl(UrlManager.Url_TD_EFFECTS,"path/plant_breaking." + GameGloble.BONE_FILE_EXT);
         }
         return _plantBreakingUrl;
      }
      
      public static function getPowerTileUrl(param1:int) : String
      {
         return UrlManager.getInstance().getUrl(UrlManager.Url_TD_EFFECTS,"powerTile/powerTile" + param1 + "." + GameGloble.BONE_FILE_EXT);
      }
      
      public static function getGuideUrlById(param1:int) : String
      {
         switch(param1)
         {
            case 2300:
               return UrlManager.getInstance().getUrl(0,"swf/td/anmi/guide/CrazyDave_no_taco." + GameGloble.BONE_FILE_EXT);
            case 2500:
               return UrlManager.getInstance().getUrl(0,"swf/td/anmi/guide/winnie." + GameGloble.BONE_FILE_EXT);
            default:
               return null;
         }
      }
      
      private static function defaultCheckClearNormalBoneDataFunc(param1:BlitBoneData) : Boolean
      {
         if(param1.url && (param1.url.indexOf("zombie_rabbit") != -1 || param1.url.indexOf("zombie_thief_base") != -1))
         {
            return false;
         }
         if(!param1.url || param1.url.indexOf("zombie") != -1)
         {
            return true;
         }
         return false;
      }
      
      public static function encryptionMsg(param1:ByteArray) : ByteArray
      {
         if(msgCheckFunc != null)
         {
            param1 = msgCheckFunc.apply(null,param1);
         }
         return param1;
      }
      
      public static function hasTriggerToday(param1:int) : Boolean
      {
         var _loc2_:String = null;
         var _loc3_:Number = NaN;
         var _loc4_:Date = null;
         var _loc5_:Date = null;
         switch(param1)
         {
            case ActivityGlobal.VIEW_TYPE_14days:
               _loc2_ = ShareObjectConst.KEY_POPUP_14Days_Today;
         }
         if(_loc2_ != null)
         {
            if(ShareObjectDB.getInstance().hasData(_loc2_))
            {
               _loc3_ = ShareObjectDB.getInstance().readData(_loc2_) as Number;
               (_loc4_ = new Date()).setTime(_loc3_);
               if((_loc5_ = DateUtils.getInstance().getServerDate()).month == _loc4_.month && _loc5_.date == _loc4_.date)
               {
                  return true;
               }
               return false;
            }
         }
         return false;
      }
      
      public static function setTriggerToday(param1:int) : void
      {
         var _loc2_:String = null;
         var _loc3_:Date = null;
         switch(param1)
         {
            case ActivityGlobal.VIEW_TYPE_14days:
               _loc2_ = ShareObjectConst.KEY_POPUP_14Days_Today;
         }
         if(_loc2_ != null)
         {
            _loc3_ = DateUtils.getInstance().getServerDate();
            ShareObjectDB.getInstance().writeData(_loc2_,_loc3_.time);
         }
      }
      
      public static function fightPower2PropVal(param1:int, param2:Number) : Number
      {
         switch(param1)
         {
            case Attribute.ATTACK:
               param2 *= 2;
               break;
            case Attribute.HP:
               param2 *= 6;
               break;
            case Attribute.CRITICAL:
            case Attribute.DODGE:
            case Attribute.HIT:
            case Attribute.TOUGH:
               param2 *= 2;
         }
         return Math.round(param2);
      }
      
      public static function caculateFightPower(param1:int, param2:int, param3:int, param4:int, param5:int = 0, param6:int = 0, param7:int = 0, param8:int = 0, param9:Boolean = false) : int
      {
         var _loc10_:Number;
         _loc10_ = (_loc10_ = (_loc10_ = (_loc10_ = (_loc10_ = 0) + Math.floor(param1 / 2)) + param2) + Math.floor(param3 / 6)) + param4;
         if(param9)
         {
            _loc10_ /= 100;
         }
         return Number((_loc10_ = (_loc10_ = (_loc10_ += Math.floor(param5 / 2)) + Math.floor(param6 / 2)) + Math.floor(param7 / 2)) + Math.floor(param8 / 2));
      }
      
      public static function itemStrConvert(param1:String) : Array
      {
         var _loc4_:String = null;
         var _loc5_:Array = null;
         var _loc2_:Array = param1.split(";");
         var _loc3_:Array = new Array();
         for each(_loc4_ in _loc2_)
         {
            _loc5_ = _loc4_.split(":");
            _loc3_.push(_loc5_);
         }
         return _loc3_;
      }
      
      public static function autoOpenGiftBag(param1:Array, param2:Boolean = true) : void
      {
         var _loc3_:Array = null;
         var _loc6_:Dto_IdNum = null;
         var _loc7_:BagItemTemplate = null;
         var _loc4_:int = param1.length;
         var _loc5_:int = 0;
         for(; _loc5_ < _loc4_; _loc5_++)
         {
            _loc6_ = param1[_loc5_];
            if(!(_loc7_ = ItemTemplateFactory.instance.getBagItemTemplateById(_loc6_.id)))
            {
               continue;
            }
            switch(_loc7_.subType)
            {
               case ItemType.SUB_TYPE_GIFT_BAG:
               case ItemType.SUB_TYPE_TREASURE_CHEST:
                  BagProxyCmd.useItem(_loc6_.id);
                  break;
               default:
                  if(param2)
                  {
                     if(_loc3_ == null)
                     {
                        _loc3_ = new Array();
                     }
                     _loc3_.push(_loc6_);
                  }
                  break;
            }
         }
         if(_loc3_ != null)
         {
            CommonCmd.itemFly(_loc3_);
         }
      }
      
      public static function getBagTotal() : int
      {
         var _loc1_:int = 0;
         if(bagProxy == null)
         {
            return 0;
         }
         return int(bagProxy.getCurBagNum());
      }
      
      public static function setCacheExpeditionLeaderList(param1:Array) : void
      {
         _expeditonLeaderList = param1;
      }
      
      public static function isExpeditionLeader(param1:Int64) : Boolean
      {
         var _loc4_:Int64 = null;
         if(_expeditonLeaderList == null)
         {
            return false;
         }
         var _loc2_:int = _expeditonLeaderList.length;
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            if((_loc4_ = _expeditonLeaderList[_loc3_]).compare(param1))
            {
               return true;
            }
            _loc3_++;
         }
         return false;
      }
      
      public static function getEmptyPropList() : Array
      {
         var _loc1_:Array = new Array();
         _loc1_[ConstGlobal.Attr_Attack] = 0;
         _loc1_[ConstGlobal.Attr_Defense] = 0;
         _loc1_[ConstGlobal.Attr_HP] = 0;
         _loc1_[ConstGlobal.Attr_Ability] = 0;
         _loc1_[ConstGlobal.Attr_Hit] = 0;
         _loc1_[ConstGlobal.Attr_Tough] = 0;
         _loc1_[ConstGlobal.Attr_Critical] = 0;
         _loc1_[ConstGlobal.Attr_Dodge] = 0;
         return _loc1_;
      }
      
      public static function cloneBattleFormation(param1:Dto_FormationInfo) : Dto_FormationInfo
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:Dto_CardPosInfo = null;
         var _loc6_:Dto_CardPosInfo = null;
         var _loc2_:Dto_FormationInfo = new Dto_FormationInfo();
         if(param1 != null)
         {
            _loc3_ = param1.cardPos.length;
            _loc2_.cardPos = new Array();
            _loc4_ = 0;
            while(_loc4_ < _loc3_)
            {
               if((_loc5_ = param1.cardPos[_loc4_]).posIndex != 0)
               {
                  (_loc6_ = new Dto_CardPosInfo()).uid = _loc5_.uid;
                  _loc6_.posIndex = _loc5_.posIndex;
                  _loc2_.cardPos.push(_loc6_);
               }
               _loc4_++;
            }
         }
         _loc2_.formationId = param1.formationId;
         _loc2_.leaderUid = param1.leaderUid;
         _loc2_.teamId = param1.teamId;
         _loc2_.status = param1.status;
         _loc2_.recoverHpCost = param1.recoverHpCost;
         _loc2_.isDefend = param1.isDefend;
         return _loc2_;
      }
      
      public static function getPlantArmorViewID(param1:int, param2:int) : int
      {
         if(param2 == 0)
         {
            return 0;
         }
         return int(param1 * 10 + 1);
      }
      
      public static function setCommEmbattleCardLeftHP(param1:int, param2:Array) : void
      {
         var _loc6_:Object = null;
         var _loc7_:Int64 = null;
         var _loc8_:Number = NaN;
         if(_cardLeftHPList == null)
         {
            _cardLeftHPList = new Array();
         }
         var _loc3_:Array = new Array();
         _cardLeftHPList[param1] = _loc3_;
         var _loc4_:int = param2.length;
         var _loc5_:int = 0;
         while(_loc5_ < _loc4_)
         {
            _loc7_ = (_loc6_ = param2[_loc5_]).uid;
            _loc8_ = _loc6_.hpRatio;
            _loc3_.push([_loc7_,_loc8_]);
            _loc5_++;
         }
      }
      
      public static function getCommEmbattleCardLeftHPByCardUID(param1:int, param2:Int64) : Number
      {
         var _loc6_:Array = null;
         var _loc7_:Int64 = null;
         if(param2 == null)
         {
            return 0;
         }
         if(_cardLeftHPList == null)
         {
            return 0;
         }
         var _loc3_:Array = _cardLeftHPList[param1];
         if(_loc3_ == null)
         {
            return 0;
         }
         var _loc4_:int = _loc3_.length;
         var _loc5_:int = 0;
         while(_loc5_ < _loc4_)
         {
            _loc7_ = (_loc6_ = _loc3_[_loc5_])[0];
            if(param2.compare(_loc7_))
            {
               return _loc6_[1];
            }
            _loc5_++;
         }
         return 0;
      }
   }
}
