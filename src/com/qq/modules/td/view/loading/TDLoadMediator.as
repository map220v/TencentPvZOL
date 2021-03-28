package com.qq.modules.td.view.loading
{
   import asgui.blit.bone.BlitBoneManager;
   import asgui.blit.data.BlitDataManager;
   import asgui.managers.LoaderCollection;
   import asgui.managers.LoaderManager;
   import asgui.managers.LoaderManagerStatus;
   import asgui.resources.AssetManager;
   import com.adobe.crypto.MD5;
   import com.qq.CommandName;
   import com.qq.GameGloble;
   import com.qq.constant.td.TDConstant;
   import com.qq.data.DataCacheManager;
   import com.qq.modules.basic.view.BasicScreenMediator;
   import com.qq.modules.endlessTD.EndlessTDConst;
   import com.qq.modules.endlessTD.model.EndlessTDPlantRecord;
   import com.qq.modules.endlessTD.model.EndlessTDStageRecord;
   import com.qq.modules.main.command.GameFlowCmd;
   import com.qq.modules.sound.model.templates.ce.SoundInfoTemplateCE;
   import com.qq.modules.td.data.game.ce.TDGameTypeTemplateCE;
   import com.qq.modules.td.logic.TDFactory;
   import com.qq.modules.td.logic.TDResourceUtil;
   import com.qq.modules.td.model.TDGameInfo;
   import com.qq.modules.td.model.TDStageInfo;
   import com.qq.modules.td.model.TDStartParam;
   import com.qq.utils.CommandDispatcher;
   import com.qq.utils.UrlManager;
   import com.qq.utils.db.ClientDBTableName;
   import flash.display.Loader;
   import flash.events.Event;
   import flash.events.IEventDispatcher;
   import flash.text.TextField;
   import flash.utils.ByteArray;
   import org.as3commons.logging.api.getLogger;
   import tencent.base.utils.ArrayUtil;
   
   public class TDLoadMediator extends BasicScreenMediator
   {
      
      private static const RES_Cache:int = 0;
      
      private static const RES_MapFile:int = 1;
      
      private static const RES_TYPE_AnmiFile:int = 2;
      
      private static const RES_SwfFile:int = 3;
      
      private static const RES_MapBG:int = 4;
      
      private static const RES_BLIT:int = 5;
      
      private static const RES_BLIT_BONE:int = 6;
      
      private static const RES_PARAM_URL:int = 0;
      
      private static const RES_PARAM_RESTYPE:int = 1;
      
      private static const RES_PARAM_RESNAME:int = 2;
      
      private static const RES_PARAM_LOADER:int = 3;
       
      
      [Inject]
      public var view:TDLoadPage;
      
      private var _loadResList:Array;
      
      private var _parseAnmiList:Array;
      
      private var _tdStartParam:TDStartParam;
      
      public function TDLoadMediator()
      {
         super();
      }
      
      override protected function init() : void
      {
         super.init();
         this.view.visible = false;
         this.initMc();
         this.view.addEventListener(Event.ENTER_FRAME,this.enterFrameHandler);
      }
      
      protected function enterFrameHandler(param1:Event) : void
      {
         var _loc2_:LoaderManagerStatus = null;
         var _loc3_:TextField = null;
         var _loc4_:Number = NaN;
         if(this.view.mc)
         {
            _loc2_ = LoaderManager.GetStatus();
            _loc3_ = this.view.mc["txt"];
            if((_loc4_ = _loc2_.queueIndex / _loc2_.queueLength) > 1)
            {
               _loc4_ = 1;
            }
            _loc3_.text = int(_loc4_ * 100) + "%";
         }
      }
      
      protected function initMc() : void
      {
         var _loc1_:int = GameGloble.stage.stageWidth;
         var _loc2_:int = GameGloble.stage.stageHeight;
         var _loc3_:* = AssetManager.instance.GetNewClass("loading");
         this.view.mc = _loc3_;
         var _loc4_:TextField;
         (_loc4_ = this.view.mc["txt"]).text = "0%";
         this.view.mc.x = (_loc1_ - this.view.mc.width) / 2;
         this.view.mc.y = (_loc2_ - this.view.mc.height) / 2;
      }
      
      override protected function initListener() : void
      {
         super.initListener();
      }
      
      override public function reset(param1:Object = null) : void
      {
         super.reset(param1);
         if(param1 == null || param1.startParam == null)
         {
            return;
         }
         this._tdStartParam = param1.startParam as TDStartParam;
         if(this._tdStartParam == null)
         {
            return;
         }
         this.startloadTD(this._tdStartParam);
         this.view.visible = GameGloble.isFinishBaseModuleLoader;
      }
      
      private function startloadTD(param1:TDStartParam) : void
      {
         TDStageInfo.getInstance().setLevel(param1);
         TDGameInfo.getInstance().achievementList = ArrayUtil.vactorToArray(param1.achievementList);
         TDStageInfo.getInstance().plantIDList = param1.plantList;
         if(param1.talentIdList != null)
         {
            TDGameInfo.getInstance().talentList = param1.talentIdList;
         }
         else
         {
            TDGameInfo.getInstance().talentList = [];
         }
         var _loc2_:LoaderCollection = LoaderManager.GetLoaderCollection(param1.mapUrl,false,0);
         if(_loc2_.hasClosed)
         {
            this.xmlLoadOk(_loc2_,true);
         }
         else
         {
            _loc2_.addEventListener(Event.COMPLETE,this.onFinishloadXml);
         }
      }
      
      private function onFinishloadXml(param1:Event) : void
      {
         (param1.currentTarget as IEventDispatcher).removeEventListener(Event.COMPLETE,this.onFinishloadXml);
         this.xmlLoadOk(param1.currentTarget as LoaderCollection,false);
      }
      
      private function xmlLoadOk(param1:LoaderCollection, param2:Boolean) : void
      {
         var _loc3_:ByteArray = param1.data;
         if(!param2)
         {
            _loc3_.uncompress();
         }
         this.parseMap(_loc3_);
         this.startLoadRes();
      }
      
      private function startLoadRes() : void
      {
         var _loc2_:Array = null;
         var _loc3_:LoaderManager = null;
         var _loc4_:int = 0;
         var _loc5_:String = null;
         var _loc1_:Vector.<String> = TDGameInfo.getInstance().loadingUrls;
         _loc1_.length = 0;
         this._loadResList = this.generateLoadResList();
         for each(_loc2_ in this._loadResList)
         {
            _loc4_ = _loc2_[RES_PARAM_RESTYPE];
            _loc5_ = _loc2_[RES_PARAM_URL];
            switch(_loc4_)
            {
               case RES_BLIT:
                  _loc2_[RES_PARAM_LOADER] = BlitDataManager.GetBlitDataByUrl(_loc5_);
                  break;
               case RES_BLIT_BONE:
                  _loc2_[RES_PARAM_LOADER] = BlitBoneManager.impl.getBoneDataByUrl(_loc5_,true);
                  break;
               default:
                  _loc2_[RES_PARAM_LOADER] = LoaderManager.GetLoader(_loc5_,0);
                  break;
            }
            _loc1_.push(_loc5_);
         }
         _loc3_ = LoaderManager.impl;
         if(_loc3_.GetStatus().isOpening)
         {
            _loc3_.addEventListener(Event.CLOSE,this.loaderCloseHandler);
         }
         else
         {
            this.loadOk();
         }
      }
      
      protected function loaderCloseHandler(param1:Event) : void
      {
         LoaderManager.impl.removeEventListener(Event.CLOSE,this.loaderCloseHandler);
         this.loadOk();
      }
      
      protected function loadOk() : void
      {
         var _loc1_:Loader = null;
         var _loc2_:Array = null;
         var _loc3_:String = null;
         var _loc4_:Loader = null;
         var _loc5_:Loader = null;
         this._parseAnmiList = new Array();
         while(this._loadResList.length > 0)
         {
            _loc2_ = this._loadResList.shift();
            _loc3_ = _loc2_[RES_PARAM_URL];
            getLogger("td").info("loadOK : " + _loc3_);
            switch(_loc2_[RES_PARAM_RESTYPE])
            {
               case RES_Cache:
                  break;
               case RES_MapFile:
                  break;
               case RES_BLIT:
                  break;
               case RES_BLIT_BONE:
                  break;
               case RES_MapBG:
                  _loc4_ = _loc2_[RES_PARAM_LOADER];
                  TDFactory.addRes(TDConstant.TDRes_MapImg,_loc4_.content,"map");
                  break;
               case RES_SwfFile:
                  if((_loc5_ = _loc2_[RES_PARAM_LOADER]) != null && _loc5_.contentLoaderInfo != null)
                  {
                     AssetManager.instance.AddContent(_loc5_.contentLoaderInfo,_loc3_);
                  }
                  break;
            }
         }
         this.onFinshLoadGame();
      }
      
      private function onFinshLoadGame() : void
      {
         GameFlowCmd.finishLoadBaseModule();
         this.view.removeEventListener(Event.ENTER_FRAME,this.enterFrameHandler);
         getLogger("TD").debug("塔防模块加载完成");
         if(this._tdStartParam.gameType == TDStartParam.Endless && !this._tdStartParam.isInitial)
         {
            CommandDispatcher.send(CommandName.TD_StartWithNoClean);
         }
         else
         {
            CommandDispatcher.send(CommandName.TD_GotoTDScreen);
         }
         this.dispose();
         mediatorMap.removeMediator(this);
      }
      
      private function parseMap(param1:ByteArray) : void
      {
         TDStageInfo.getInstance().mapFileMD5 = MD5.hashBinary(param1);
         var _loc2_:XML = XML(param1);
         TDStageInfo.getInstance().load(_loc2_);
         TDStageInfo.getInstance().addObjectToLoadList(TDConstant.UnitCatalog_Object,TDConstant.UnitType_Sun);
         TDStageInfo.getInstance().addObjectToLoadList(TDConstant.UnitCatalog_Object,TDConstant.UnitType_PlantSun);
         TDStageInfo.getInstance().addObjectToLoadList(TDConstant.UnitCatalog_Object,TDConstant.UnitType_PlantFoodEffect);
         if(TDStageInfo.getInstance().startParam.gameType == TDStartParam.Endless)
         {
            this.addEndlessTDRecordPlant();
         }
      }
      
      private function addEndlessTDRecordPlant() : void
      {
         var _loc2_:TDStageInfo = null;
         var _loc3_:EndlessTDPlantRecord = null;
         var _loc1_:EndlessTDStageRecord = EndlessTDConst.oldRecord;
         if(_loc1_ && _loc1_.level > 0)
         {
            _loc2_ = TDStageInfo.getInstance();
            for each(_loc3_ in _loc1_.allRecord)
            {
               _loc2_.addObjectToLoadList(TDConstant.UnitCatalog_Plant,_loc3_.plantID);
            }
         }
      }
      
      private function onProgressLoadRes(param1:Event) : void
      {
      }
      
      private function generateLoadResList() : Array
      {
         var _loc3_:String = null;
         var _loc4_:int = 0;
         var _loc5_:Array = null;
         var _loc6_:int = 0;
         var _loc7_:TDGameTypeTemplateCE = null;
         var _loc9_:Object = null;
         var _loc10_:String = null;
         var _loc11_:String = null;
         var _loc12_:String = null;
         var _loc13_:String = null;
         var _loc14_:SoundInfoTemplateCE = null;
         var _loc15_:String = null;
         var _loc16_:Array = null;
         var _loc17_:int = 0;
         var _loc18_:String = null;
         var _loc19_:Array = null;
         var _loc20_:* = null;
         var _loc1_:Array = new Array();
         var _loc2_:int = TDStageInfo.getInstance().mapID;
         _loc3_ = UrlManager.getInstance().getUrl(UrlManager.Url_TDMapImg,_loc2_ + ".jpg");
         this.addResDataToList(_loc1_,_loc3_,[_loc3_,RES_MapBG,_loc3_]);
         if(TDStageInfo.getInstance().getGroundPathType() == 3)
         {
            _loc10_ = GameGloble.getPathUrl(TDStageInfo.getInstance().getGroundPathType());
            this.addResDataToList(_loc1_,_loc10_,[_loc10_,RES_BLIT,_loc10_]);
            _loc11_ = GameGloble.getMudUrl(TDStageInfo.getInstance().getGroundPathType());
            this.addResDataToList(_loc1_,_loc11_,[_loc11_,RES_BLIT_BONE,_loc11_]);
            _loc12_ = GameGloble.getMudBreakingUrl();
            this.addResDataToList(_loc1_,_loc12_,[_loc12_,RES_BLIT_BONE,_loc12_]);
            _loc13_ = GameGloble.getPlantBreakingUrl();
            this.addResDataToList(_loc1_,_loc13_,[_loc13_,RES_BLIT_BONE,_loc13_]);
         }
         for each(_loc4_ in TDStageInfo.getInstance().preloadSoundIDList)
         {
            _loc14_ = DataCacheManager.getInstance().getTemplateDataById(ClientDBTableName.Table_SoundInfo,_loc4_,SoundInfoTemplateCE) as SoundInfoTemplateCE;
            _loc15_ = UrlManager.getInstance().getUrl(UrlManager.Url_Sound,_loc14_.url);
            this.addResDataToList(_loc1_,_loc15_,[_loc15_,RES_Cache,_loc15_]);
         }
         _loc5_ = [TDConstant.UnitCatalog_Zombie,TDConstant.UnitCatalog_Bullet,TDConstant.UnitCatalog_Object,TDConstant.UnitCatalog_Plant];
         for each(_loc6_ in _loc5_)
         {
            _loc16_ = TDStageInfo.getInstance().getAppearUnitListByType(_loc6_);
            for each(_loc17_ in _loc16_)
            {
               if((_loc18_ = TDResourceUtil.getResUrl(_loc6_,_loc17_)) != null)
               {
                  this.addResDataToList(_loc1_,_loc18_,[_loc18_,RES_BLIT_BONE]);
               }
            }
         }
         if((_loc7_ = DataCacheManager.getInstance().getTemplateDataById(ClientDBTableName.Table_TDGameType,TDStageInfo.getInstance().tdGameType,TDGameTypeTemplateCE) as TDGameTypeTemplateCE).loadExtraRes.length > 0)
         {
            _loc19_ = _loc7_.loadExtraRes.split(";");
            for each(_loc20_ in _loc19_)
            {
               _loc20_ += ".swf";
               _loc20_ = UrlManager.getInstance().getUrl(UrlManager.Url_TDRes,_loc20_);
               this.addResDataToList(_loc1_,_loc20_,[_loc20_,RES_SwfFile]);
            }
         }
         if(!TDStageInfo.getInstance().hasGuide)
         {
         }
         var _loc8_:Array = new Array();
         for each(_loc9_ in _loc1_)
         {
            _loc8_.push(_loc9_);
         }
         return _loc8_;
      }
      
      private function addResDataToList(param1:Array, param2:String, param3:Array) : void
      {
         if(param1[param2] == null)
         {
            param1[param2] = param3;
         }
      }
   }
}
