package com.qq.modules.td.model
{
   import PVZ.Cmd.Dto_PlantInfo;
   import com.qq.modules.levelselect.model.templates.LSLevelTemplateFactory;
   import com.qq.modules.td.model.templates.ce.DailyTDInfoTemplateCE;
   import com.qq.modules.td.model.vo.TDEndlessMapVO;
   import com.qq.modules.yetiTD.model.templates.ce.YetiTDMapTemplateCE;
   import com.qq.modules.yetiTD.model.templates.ce.YetiTDTemplateFactory;
   import com.qq.utils.UrlManager;
   import com.qq.utils.data.PData;
   
   public class TDStartParam
   {
      
      public static const Normal:int = 0;
      
      public static const Daily:int = 1;
      
      public static const Endless:int = 2;
      
      public static const Yeti:int = 3;
       
      
      public var gameType:int;
      
      public var stageID:int;
      
      public var levelID:int;
      
      public var subLevelId:int;
      
      public var challengeLevelId:int;
      
      public var achievementList:Vector.<int>;
      
      public var startGameImmediately:Boolean;
      
      public var plantList:Vector.<Dto_PlantInfo>;
      
      public var mapUrl:String;
      
      public var talentIdList:Array;
      
      public var dailyStageID:int;
      
      public var dailyMapID:int;
      
      public var _dailyLeftFuel:PData;
      
      public var dailyToyCar:Array;
      
      public var _dailyExtraSun:PData;
      
      private var _rainValueData:PData;
      
      public var endlessTDRecord:Object;
      
      private var _isInitial:Boolean;
      
      private var _endlessMapInfo:TDEndlessMapVO;
      
      private var _yetiModeID:int;
      
      private var _wishID:int;
      
      public function TDStartParam()
      {
         super();
      }
      
      public function initNormalData(param1:int, param2:int, param3:int, param4:int, param5:Vector.<int>, param6:Boolean, param7:Vector.<Dto_PlantInfo>, param8:Object) : void
      {
         this.gameType = Normal;
         this.stageID = param1;
         this.levelID = param2;
         this.subLevelId = param3;
         this.challengeLevelId = param4;
         this.achievementList = param5;
         this.startGameImmediately = param6;
         this.plantList = param7;
         if(param8 != null)
         {
            this.talentIdList = param8.talentIdList;
         }
         if(param4 == 0)
         {
            this.mapUrl = param1 + "-" + param2 + "-" + param3;
            this.mapUrl += ".bl";
            this.mapUrl = UrlManager.getInstance().getUrl(UrlManager.Url_TDMapFile,this.mapUrl);
         }
         else
         {
            this.mapUrl = param1 + "-" + param2 + "-" + param3 + "-" + param4;
            this.mapUrl += ".bl";
            this.mapUrl = UrlManager.getInstance().getUrl(UrlManager.Url_TDMapFile,"challengeTDMap/" + this.mapUrl);
         }
      }
      
      public function initDaliyTD(param1:int, param2:int, param3:Vector.<Dto_PlantInfo>, param4:Array, param5:int, param6:int, param7:Array) : void
      {
         this._dailyLeftFuel = new PData();
         this._dailyExtraSun = new PData();
         this.dailyStageID = param1;
         this.dailyMapID = param2;
         this.gameType = Daily;
         this.plantList = param3;
         this.talentIdList = param4;
         this._dailyLeftFuel.set(param5);
         this._dailyExtraSun.set(param6);
         this.dailyToyCar = param7;
         var _loc8_:DailyTDInfoTemplateCE = LSLevelTemplateFactory.instance.getDailyTDInfo(this.dailyMapID);
         var _loc9_:String = "dailyTDMap/" + _loc8_.mapUrl
         _loc9_ = _loc9_ + ".bl";
         this.mapUrl = UrlManager.getInstance().getUrl(UrlManager.Url_TDMapFile,_loc9_);
      }
      
      public function get isInitial() : Boolean
      {
         return this._isInitial;
      }
      
      public function get endlessMapInfo() : TDEndlessMapVO
      {
         return this._endlessMapInfo;
      }
      
      public function initEndlessTD(param1:Boolean, param2:TDEndlessMapVO, param3:Vector.<Dto_PlantInfo>, param4:Array, param5:int, param6:Object = null) : void
      {
         this._isInitial = param1;
         this._endlessMapInfo = param2;
         this.gameType = Endless;
         var _loc7_:String = "endlessTDMap/" + param2.level + "-" + param2.mapID
         _loc7_ = _loc7_ + ".bl";
         this.mapUrl = UrlManager.getInstance().getUrl(UrlManager.Url_TDMapFile,_loc7_);
         this.plantList = param3;
         this.talentIdList = param4;
         this._rainValueData = new PData();
         this._rainValueData.set(param5);
         this.endlessTDRecord = param6;
      }
      
      public function get yetiModeID() : int
      {
         return this._yetiModeID;
      }
      
      public function get wishID() : int
      {
         return this._wishID;
      }
      
      public function initYetiTD(param1:int, param2:int, param3:int, param4:Vector.<Dto_PlantInfo>, param5:Array) : void
      {
         this.gameType = Yeti;
         this._yetiModeID = param1;
         this._wishID = param2;
         var _loc6_:YetiTDMapTemplateCE = YetiTDTemplateFactory.instance.getMapTemplate(param3);
         var _loc7_:String = "yetiTDMap/" + _loc6_.mapPath
         _loc7_ = _loc7_ + ".bl";
         this.mapUrl = UrlManager.getInstance().getUrl(UrlManager.Url_TDMapFile,_loc7_);
         this.plantList = param4;
         this.talentIdList = param5;
      }
      
      public function get dailyLeftFuel() : int
      {
         return this._dailyLeftFuel.get();
      }
      
      public function get dailyExtraSun() : int
      {
         return this._dailyExtraSun.get();
      }
      
      public function get rainValue() : int
      {
         return this._rainValueData.get();
      }
   }
}
