package
{
   import asgui.core.ByteLoader;
   import asgui.managers.LoaderCollection;
   import asgui.managers.LoaderManager;
   import asgui.managers.LoaderManagerStatus;
   import com.greensock.TweenLite;
   import com.qq.ConstGlobal;
   import com.qq.modules.main.logic.initData.IGameLoader;
   import com.qq.utils.GameDataReport;
   import flash.display.DisplayObject;
   import flash.display.Loader;
   import flash.display.LoaderInfo;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.display.StageAlign;
   import flash.display.StageScaleMode;
   import flash.events.Event;
   import flash.events.IOErrorEvent;
   import flash.events.SecurityErrorEvent;
   import flash.events.TimerEvent;
   import flash.net.URLRequest;
   import flash.system.LoaderContext;
   import flash.system.Security;
   import flash.text.TextField;
   import flash.utils.ByteArray;
   import flash.utils.Timer;

   [SWF(width="1440", height="900", backgroundColor="0", frameRate="30")]
   //[SWF(width="960", height="640", backgroundColor="0", frameRate="30")] //For ModuleTD
   public class GameLoader extends Sprite implements IGameLoader
   {
      
      public static var StartLoadingProgressClass:Class = GameLoader_StartLoadingProgressClass;
      
      private static const Param_ConfigFile:int = 1;
      
      private static const Param_FileVer:int = 2;
      
      private static const Param_Game:int = 3;
      
      private static const Param_IsStage3D:int = 5;
      
      private static const Param_Logging:int = 6;
      
      private static const Param_MsgCheck:int = 7;
       
      
      private var _screenW:int;
      
      private var _screenH:int;
      
      private var _params:Array;
      
      private var _isDevelopMode:Boolean;
      
      private var _isNormalMode:Boolean = true;
      
      private var mcProgress:Object;
      
      private var gameSwf:MovieClip;
      
      private var logoLoader:Loader;
      
      private var _bgDisplayObjList:Array;
      
      private var _bgLoaderList:Array;
      
      private var _bgContainer:Sprite;
      
      private var _bgColor:uint;
      
      private var _bgSwitchTimer:Timer;
      
      private var _loadFileUrlList:Array;
      
      private var _parseFunList:Array;
      
      private var _isFinishShowLogo:Boolean;
      
      private var _isFinishLoad:Boolean;
      
      private var _loadGameSwf:MovieClip;
      
      private var _bgUrlList:Array;
      
      private var _bgLoadID:int = -1;
      
      private var _switchCounter:int = 0;
      
      private var _curBg:DisplayObject;
      
      private var _list:Array;
      
      private var _curFlag:int = 1;
      
      private var _curPercent:int;

      //private var loaderContext: LoaderContext = new LoaderContext();
      
      public function GameLoader()
      {
         //loaderContext.allowLoadBytesCodeExecution = true;
         //loaderContext.allowCodeImport = true;

         var _loc1_:String = null;
         this._params = new Array();
         this._bgUrlList = ["image/loadingbg.jpg","image/loadingbg2.jpg"];
         this._list = ["Game.swf"];
         super();
         stage.align = StageAlign.TOP_LEFT;
         stage.scaleMode = StageScaleMode.NO_SCALE;
         Security.allowDomain("*");
         this._screenW = stage.stageWidth;
         this._screenH = stage.stageHeight;
         this._bgColor = 0;
         this._isDevelopMode = true;
         if(this.loaderInfo.parameters.hasOwnProperty("mode"))
         {
            _loc1_ = this.loaderInfo.parameters.mode;
            if(_loc1_ != "normal")
            {
               this._isNormalMode = false;
            }
         }
         ExternalVars.initialize(loaderInfo);
         this._loadFileUrlList = new Array();
         this._parseFunList = new Array();
         this._parseFunList[Param_ConfigFile] = this.parseConfigFile;
         this._parseFunList[Param_FileVer] = this.parseVerFile;
         this.initUI();
         stage.addEventListener(Event.RESIZE,this.onResizeScreen);
         this.start();
         this._isFinishShowLogo = false;
         this._isFinishLoad = false;
      }
      
      private function initUI() : void
      {
         this.logoLoader = new Loader();
         this.logoLoader.load(new URLRequest(this.getUrl("image/logo.jpg")));
         this.logoLoader.contentLoaderInfo.addEventListener(Event.COMPLETE,this.onFinishLoadLogo);
         this.mcProgress = new StartLoadingProgressClass();
         this.mcProgress.mc.stop();
         this.mcProgress.addEventListener(Event.ENTER_FRAME,this.checkProgress);
         this.resizeUI();
      }
      
      private function onFinishLoadLogo(param1:Event) : void
      {
         this.logoLoader.contentLoaderInfo.removeEventListener(Event.COMPLETE,this.onFinishLoadLogo);
         addChildAt(this.logoLoader,0);
         this.onShowLogo();
         this.initBgLoader();
         this.resizeUI();
      }
      
      private function initBgLoader() : void
      {
         if(this._bgContainer == null)
         {
            this._bgContainer = new Sprite();
         }
         this._bgDisplayObjList = new Array();
         this._bgLoaderList = new Array();
         if(true)
         {
            if(this._bgSwitchTimer == null)
            {
               this._bgSwitchTimer = new Timer(1000,0);
               this._bgSwitchTimer.addEventListener(TimerEvent.TIMER,this.onSwitchBGTimer);
               this._bgSwitchTimer.start();
            }
            this.loadNextBG();
         }
      }
      
      private function loadNextBG() : void
      {
         if(this._bgLoadID + 1 >= this._bgUrlList.length)
         {
            return;
         }
         ++this._bgLoadID;
         var bgLoader:Loader = new Loader();
         var lc:LoaderContext = new LoaderContext(true);
         bgLoader.load(new URLRequest(this.getUrl(this._bgUrlList[this._bgLoadID])),lc);
         this._bgLoaderList.push(bgLoader);
         bgLoader.contentLoaderInfo.addEventListener(Event.COMPLETE,this.onFinishLoadBG,false,0,true);
         bgLoader.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR,function(param1:Event):void
         {
         },false,0,true);
         bgLoader.contentLoaderInfo.addEventListener(SecurityErrorEvent.SECURITY_ERROR,function(param1:Event):void
         {
         },false,0,true);
      }
      
      private function onFinishLoadBG(param1:Event) : void
      {
         var _loc3_:DisplayObject = null;
         var _loc2_:LoaderInfo = param1.currentTarget as LoaderInfo;
         if(_loc2_.hasEventListener(Event.COMPLETE))
         {
            _loc2_.removeEventListener(Event.COMPLETE,this.onFinishLoadBG);
         }
         if(_loc2_.content != null)
         {
            _loc3_ = _loc2_.content;
            _loc3_.visible = false;
            this._bgContainer.addChild(_loc3_);
            this._bgDisplayObjList.push(_loc3_);
         }
         this.loadNextBG();
         if(this._curBg == null)
         {
            this.switchBg();
         }
      }
      
      private function onSwitchBGTimer(param1:Event) : void
      {
         if(this._switchCounter > 5)
         {
            this._switchCounter = 0;
            this.switchBg();
         }
         else
         {
            ++this._switchCounter;
         }
      }
      
      private function switchBg() : void
      {
         var _loc1_:DisplayObject = null;
         var _loc2_:DisplayObject = null;
         if(this._bgDisplayObjList.length == 2)
         {
            if(this._curBg != null)
            {
               this._curBg.visible = true;
               TweenLite.to(this._curBg,0.5,{"alpha":0});
            }
            for each(_loc1_ in this._bgDisplayObjList)
            {
               if(this._curBg != _loc1_)
               {
                  this._curBg = _loc1_;
                  this._curBg.visible = true;
                  this._curBg.alpha = 0;
                  TweenLite.to(this._curBg,1,{"alpha":1});
                  break;
               }
            }
         }
         else if(this._bgDisplayObjList.length == 1)
         {
            _loc2_ = this._bgDisplayObjList[0];
            _loc2_.visible = true;
            this._curBg = _loc2_;
         }
         this.resizeUI();
      }
      
      private function onShowLogo() : void
      {
         this.logoLoader.alpha = 1;
         TweenLite.to(this.logoLoader,0.5,{
            "delay":1,
            "alpha":0,
            "onComplete":this.onFadeLogo
         });
      }
      
      private function onFadeLogo() : void
      {
         this.showLoadUI();
         this._isFinishShowLogo = true;
      }
      
      private function showLoadUI() : void
      {
         this._bgColor = 0;
         addChild(this.mcProgress as DisplayObject);
         addChildAt(this._bgContainer,0);
         if(this._isFinishLoad)
         {
            this.startGame(this._loadGameSwf,this._params);
         }
         this.resizeUI();
      }
      
      public function cleanUI() : void
      {
         var _loc1_:Loader = null;
         this._loadGameSwf = null;
         removeEventListener(Event.ENTER_FRAME,this.onProgressLoadGameRes);
         if(this.mcProgress != null)
         {
            this.mcProgress.removeEventListener(Event.ENTER_FRAME,this.checkProgress);
            if(this.mcProgress.parent != null)
            {
               this.mcProgress.parent.removeChild(this.mcProgress);
            }
            this.mcProgress = null;
         }
         if(this.logoLoader != null)
         {
            this.logoLoader.contentLoaderInfo.removeEventListener(Event.COMPLETE,this.onFinishLoadLogo);
            if(this.logoLoader.parent != null)
            {
               this.logoLoader.parent.removeChild(this.logoLoader);
            }
            this.logoLoader = null;
         }
         if(this._bgSwitchTimer != null)
         {
            this._bgSwitchTimer.reset();
            this._bgSwitchTimer.removeEventListener(TimerEvent.TIMER,this.onSwitchBGTimer);
            this._bgSwitchTimer = null;
            this._bgDisplayObjList = null;
         }
         while(this._bgContainer.numChildren > 0)
         {
            this._bgContainer.removeChildAt(0);
         }
         if(this._bgContainer.parent != null)
         {
            this._bgContainer.parent.removeChild(this._bgContainer);
         }
         this._bgContainer = null;
         while(this._bgLoaderList.length > 0)
         {
            _loc1_ = this._bgLoaderList.pop();
            if(_loc1_ != null && _loc1_.contentLoaderInfo != null)
            {
               _loc1_.contentLoaderInfo.removeEventListener(Event.COMPLETE,this.onFinishLoadBG);
            }
         }
         this._curBg = null;
         graphics.clear();
         stage.removeEventListener(Event.RESIZE,this.onResizeScreen);
      }
      
      private function resizeUI() : void
      {
         this.mcProgress.x = stage.stageWidth * 0.5;
         this.mcProgress.y = stage.stageHeight - 88;
         if(this._bgContainer != null)
         {
            if(this._curBg)
            {
               this._bgContainer.x = (stage.stageWidth - this._curBg.width) * 0.5;
               this._bgContainer.y = (stage.stageHeight - this._curBg.height) * 0.5;
            }
         }
         if(this.logoLoader != null)
         {
            this.logoLoader.x = (stage.stageWidth - 1440) * 0.5;
            this.logoLoader.y = (stage.stageHeight - 900) * 0.5;
         }
         graphics.clear();
         graphics.beginFill(this._bgColor);
         graphics.drawRect(0,0,this._screenW,this._screenH);
         graphics.endFill();
      }
      
      private function start() : void
      {
         var _loc2_:* = null;
         var _loc3_:String = null;
         GameDataReport.getInstance().report(GameDataReport.Data_Start_Load);
         var _loc1_:Array = new Array();
         _loc1_[Param_ConfigFile] = "config.xml";
         _loc1_[Param_FileVer] = "fileVer.xml";
         LoaderManager.impl.addEventListener(Event.CLOSE,this.onFinishLoadConfigFile);
         for(_loc2_ in _loc1_)
         {
            _loc3_ = _loc1_[_loc2_] + "?" + Math.random();
            this._loadFileUrlList[_loc2_] = _loc3_;
            LoaderManager.GetLoaderCollection(_loc3_);
         }
      }
      
      private function startGame(param1:MovieClip, param2:Array) : void
      {
         addChild(param1);
         this.gameSwf = param1;
         this.gameSwf["init"](param2);
      }
      
      private function getFileInfo(param1:String, param2:Boolean = false) : Array
      {
         var str:String = null;
         var searchFileName:String = null;
         var suffix:String = null;
         var index:int = 0;
         var fileName:String = param1;
         var isIgnoreMode:Boolean = param2;
         var ver:String = "";
         var size:int = 0;
         if(this._isDevelopMode)
         {
            isIgnoreMode = true;
         }
         var fileVerXml:XML = this._params[Param_FileVer];
         if(fileVerXml != null)
         {
            str = fileName.replace("/","\\");
            index = this._list.indexOf(str);
            if(index != -1)
            {
               suffix = "n";
               searchFileName = fileName.replace(".swf","_" + suffix + ".swf");
            }
            else
            {
               searchFileName = fileName;
            }
            ver = fileVerXml.file.(@name == searchFileName).@ver;
            size = fileVerXml.file.(@name == searchFileName).@size;
            if(size <= 0)
            {
               size = 100;
            }
            if(!isIgnoreMode)
            {
               if(suffix != null && suffix.length > 0)
               {
                  fileName = fileName.replace(".swf","_" + suffix + ".swf");
               }
               if(ver != null && ver.length > 0)
               {
                  fileName = fileName.replace(".swf","_" + ver + ".swf");
               }
            }
         }
         return [fileName,size];
      }
      
      private function onResizeScreen(param1:Event) : void
      {
         this._screenW = stage.stageWidth;
         this._screenH = stage.stageHeight;
         this.resizeUI();
      }
      
      private function parseConfigFile(param1:LoaderCollection) : void
      {
         var _loc2_:XML = XML(param1.data);
         this._params[Param_ConfigFile] = _loc2_;
         ConstGlobal.gameVersion = _loc2_.ver[0];
      }
      
      private function parseVerFile(param1:LoaderCollection) : void
      {
         var _loc2_:XML = XML(param1.data);
         this._params[Param_FileVer] = _loc2_;
      }
      
      private function onFinishLoadConfigFile(param1:Event) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc4_:Function = null;
         var _loc5_:LoaderCollection = null;
         var _loc6_:String = null;
         var _loc7_:Array = null;
         var _loc8_:Boolean = false;
         LoaderManager.impl.removeEventListener(Event.CLOSE,this.onFinishLoadConfigFile);
         for(_loc2_ in this._parseFunList)
         {
            _loc4_ = this._parseFunList[_loc2_];
            _loc5_ = LoaderManager.GetLoaderCollection(this._loadFileUrlList[_loc2_]);
            if(_loc4_ != null && _loc5_ != null)
            {
               _loc4_(_loc5_);
            }
         }
         this._params[Param_IsStage3D] = false;
         LoaderManager.impl.addEventListener(Event.CLOSE,this.onFinishLoadGameRes);
         addEventListener(Event.ENTER_FRAME,this.onProgressLoadGameRes);
         this._loadFileUrlList = new Array();
         this._loadFileUrlList[Param_Game] = "Game.swf";
         this._loadFileUrlList[Param_MsgCheck] = "Msgcheck.swf";
         for(_loc3_ in this._loadFileUrlList)
         {
            _loc6_ = this._loadFileUrlList[_loc3_];
            _loc6_ = (_loc7_ = this.getFileInfo(_loc6_))[0];
            this._loadFileUrlList[_loc3_] = _loc6_;
            _loc8_ = false;
            if(int(_loc3_) == Param_Logging)
            {
               _loc8_ = true;
            }
            if(int(_loc3_) == Param_Logging)
            {
               LoaderManager.GetLoaderCache(_loc6_,true);
            }
            else
            {
               LoaderManager.GetByteLoader(_loc6_);
            }
         }
      }
      
      private function onFinishLoadGameRes(param1:Event) : void
      {
         var _loc3_:ByteArray = null;
         var _loc4_:Loader = null;
         this._curFlag = 2;
         GameDataReport.getInstance().report(GameDataReport.Data_Finish_Load_MainFile);
         LoaderManager.impl.removeEventListener(Event.CLOSE,this.onFinishLoadGameRes);
         if(this._loadFileUrlList[Param_Logging] != null)
         {
            if(LoaderManager.GetLoaderCache(this._loadFileUrlList[Param_Logging]) != null)
            {
               this._params[Param_Logging] = LoaderManager.GetLoaderCache(this._loadFileUrlList[Param_Logging],true);
            }
         }
         var _loc2_:ByteLoader = LoaderManager.GetByteLoader(this._loadFileUrlList[Param_MsgCheck]);
         if(_loc2_ != null)
         {
            _loc2_.data.position = 0;
            _loc3_ = _loc2_.data;
            _loc3_.position = 0;
            (_loc4_ = new Loader()).contentLoaderInfo.addEventListener(Event.COMPLETE,this.onFinishLoadMsgCheckFile);
            _loc4_.loadBytes(_loc3_/*, loaderContext*/);
         }
      }
      
      private function onFinishLoadMsgCheckFile(param1:Event) : void
      {
         var _loc4_:ByteArray = null;
         var _loc5_:Loader = null;
         var _loc2_:Loader = (param1.target as LoaderInfo).loader;
         _loc2_.contentLoaderInfo.removeEventListener(Event.COMPLETE,this.onFinishLoadMsgCheckFile);
         this._params[Param_MsgCheck] = _loc2_.content as MovieClip;
         var _loc3_:ByteLoader = LoaderManager.GetByteLoader(this._loadFileUrlList[Param_Game]);
         if(_loc3_ != null)
         {
            _loc3_.data.position = 0;
            (_loc4_ = _loc3_.data).position = 0;
            (_loc5_ = new Loader()).contentLoaderInfo.addEventListener(Event.COMPLETE,this.onFinishLoadMainFile);
            _loc5_.loadBytes(_loc4_/*,loaderContext*/);
            LoaderManager.impl.ClearCache();
         }
         this._loadFileUrlList = null;
      }
      
      private function onFinishLoadMainFile(param1:Event) : void
      {
         var _loc2_:Loader = (param1.target as LoaderInfo).loader;
         _loc2_.contentLoaderInfo.removeEventListener(Event.COMPLETE,this.onFinishLoadMainFile);
         this._loadGameSwf = _loc2_.content as MovieClip;
         this._isFinishLoad = true;
         if(this._isFinishShowLogo)
         {
            this.startGame(this._loadGameSwf,this._params);
         }
      }
      
      private function onProgressLoadGameRes(param1:Event) : void
      {
         var _loc2_:LoaderManagerStatus = LoaderManager.impl.GetStatus();
         var _loc3_:Number = _loc2_.percent;
         this.setProgress(_loc3_,this._curFlag,_loc2_.getPercentDesc());
      }
      
      public function setProgress(param1:int, param2:int, param3:String) : void
      {
         if(param2 == 1)
         {
            param1 *= 0.3;
         }
         else if(param2 == 2)
         {
            param1 = param1 * 0.2 + 30;
         }
         else if(param2 == 3)
         {
            param1 = param1 * 0.1 + 50;
         }
         else if(param2 == 4)
         {
            param1 = param1 * 0.4 + 60;
         }
         if(param1 < 1)
         {
            param1 = 1;
         }
         if(this._curPercent < param1)
         {
            this._curPercent = param1;
         }
         if(param3 != null && param3.length > 0)
         {
            (this.mcProgress.getChildAt(0) as TextField).text = param3;
         }
      }
      
      private function checkProgress(param1:Event) : void
      {
         var _loc2_:int = this._curPercent / 100 * this.mcProgress.mc.totalFrames;
         if(this._curFlag != 4 && this._curPercent >= 60)
         {
            this._curFlag = 4;
            this.gameSwf["start"]();
         }
         if(this._curFlag != 4)
         {
            if(this.mcProgress.mc.currentFrame >= _loc2_)
            {
               this.mcProgress.mc.stop();
            }
            else
            {
               this.mcProgress.mc.play();
            }
         }
         else
         {
            this.mcProgress.mc.gotoAndStop(_loc2_);
         }
      }
      
      public function finishGameLoad() : void
      {
         this.cleanUI();
      }
      
      private function getUrl(param1:String) : String
      {
         return param1;
      }
   }
}
