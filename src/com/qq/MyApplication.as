package com.qq
{
   import asgui.blit.bone.BlitBoneAnimRenderAnalyzer;
   import asgui.blit.bone.BlitBoneManager;
   import asgui.blit.data.BlitDataManager;
   import asgui.containers.Canvas;
   import asgui.controls.Alert;
   import asgui.controls.Button;
   import asgui.controls.Image;
   import asgui.controls.TextInput;
   import asgui.controls.ToolTip;
   import asgui.core.Application;
   import asgui.core.UIComponentGlobals;
   import asgui.events.SystemWatcherEvent;
   import asgui.managers.ConfigManager;
   import asgui.managers.ISystemManager;
   import asgui.managers.PopUpManager;
   import asgui.managers.SystemManager;
   import asgui.managers.ToolTipManager;
   import asgui.managers.tooltips.NoneToolTipEffect;
   import asgui.resources.AssetManager;
   import asgui.simples.CanvasSimple;
   import asgui.styles.StyleManager;
   import asgui.utils.WorldClock;
   import com.qq.constant.SystemConstant;
   import com.qq.display.QAlert;
   import com.qq.display.QPopUpManagerImpl;
   import com.qq.managers.QDragStatus;
   import com.qq.modules.actPlantCarnival.command.ActPlantCarnivalViewCmd;
   import com.qq.modules.bag.command.BagViewCmd;
   import com.qq.modules.dummy.command.DummyViewCmd;
   import com.qq.modules.guide.command.GuideCmd;
   import com.qq.modules.main.MainContext;
   import com.qq.modules.main.command.GameFlowCmd;
   import com.qq.modules.sound.command.UISoundCmd;
   import com.qq.templates.font.FontHKHB;
   import com.qq.utils.KeyManager;
   import com.qq.utils.MoveManager;
   import com.qq.utils.QDisplayUtil;
   import com.qq.utils.QStyleDecorating;
   import com.qq.utils.UrlManager;
   import com.qq.utils.external.QExternalUtil;
   import flash.display.Sprite;
   import flash.display.StageDisplayState;
   import flash.events.KeyboardEvent;
   import flash.events.MouseEvent;
   import flash.ui.Keyboard;
   import org.allencuilib.Utils;
   import org.allencuilib.map.tiled.TiledResource;
   import org.as3commons.logging.api.getLogger;
   import org.robotlegs.extend.command.StrongRobotlegCommandEvent;
   import org.robotlegs.extend.module.RobotlegModuleLoaderHelper;
   import org.robotlegs.extend.module.RobotlegModuleLoaderManager;
   import tencent.manager.SleepModeManager;
   
   public class MyApplication extends Application implements IMyApplication
   {
       
      
      private var _mainLayer:CanvasSimple;
      
      private var _uiLayer:Canvas;
      
      private var _bg:Image;
      
      public var textTmp:TextInput;
      
      private var isMouseCtrl:Boolean;
      
      public function MyApplication(param1:ISystemManager = null)
      {
         super(param1);
         this.checkSizeDispatchTime = 0;
      }
      
      public function get mainLayer() : CanvasSimple
      {
         return this._mainLayer;
      }
      
      public function get uiLayer() : Canvas
      {
         return this._uiLayer;
      }
      
      public function get bg() : Image
      {
         return this._bg;
      }
      
      public function get topEffectLayer() : Sprite
      {
         return SystemManager.instance.maskLayer;
      }
      
      override protected function OnAddedToStage() : void
      {
         var _loc1_:Array = null;
         super.OnAddedToStage();
         if(systemManager)
         {
            _loc1_ = systemManager["data"];
            if(_loc1_)
            {
               this.init(_loc1_);
               this.preStart();
            }
         }
      }
      
      public function init(param1:Array) : void
      {
         var param:Array = param1;
         this.maxWidth = 1440;
         this.maxHeight = 900;
         this.minWidth = 900;
         this.minHeight = 200;
         QStyleDecorating.updatingStyle();
         UIComponentGlobals.buttonClickCallBack = UISoundCmd.play_button_click;
         this._bg = new Image();
         this._bg.visible = false;
         this._bg.source = UrlManager.getUrl(0,"swf/loading/time_tunnel.jpg");
         this._bg.vcenter = this._bg.hcenter = 0;
         this.addChild(this._bg);
         this._mainLayer = new CanvasSimple();
         this._mainLayer.name = "mainLayer";
         this._mainLayer.left = 0;
         this._mainLayer.right = 0;
         this._mainLayer.top = 0;
         this._mainLayer.bottom = 0;
         this.addChild(this._mainLayer);
         this._uiLayer = new Canvas();
         this._uiLayer.name = "uiLayer";
         this._uiLayer.left = 0;
         this._uiLayer.right = 0;
         this._uiLayer.top = 0;
         this._uiLayer.bottom = 0;
         this._uiLayer.visible = false;
         this.addChild(this._uiLayer);
         MoveManager.initlize(this);
         this.textTmp = new TextInput();
         this.textTmp.visible = false;
         this.textTmp.width = 200;
         this.textTmp.height = 30;
         this.textTmp.right = 0;
         this.textTmp.top = 0;
         this._uiLayer.addChild(this.textTmp);
         if(param[SystemConstant.Param_IsStage3D])
         {
            GameGloble.isStalingMode = true;
         }
         getLogger().debug("Game Main Module Initializing");
         GameGloble.stage = stage;
         GameGloble.root = this;
         KeyManager.getInstance().init(GameGloble.stage);
         SleepModeManager.init(GameGloble.stage);
         PopUpManager._impl = new QPopUpManagerImpl();
         QDragStatus.instance;
         ToolTipManager.impl.toolTipEffect = new NoneToolTipEffect();
         ToolTipManager.showDelay = 500;
         Alert.defaultWidth = 300;
         Alert.defaultHeight = 190;
         Alert.createButtonFunction = function():Button
         {
            var _loc1_:Button = new Button();
            _loc1_.width = 100;
            _loc1_.styleName = ".GreenButton";
            return _loc1_;
         };
         Alert.yesLabel = FontHKHB.YES;
         Alert.noLabel = FontHKHB.NO;
         TiledResource.urlChangeFunc = StyleManager.urlChangeFunc = AssetManager.instance.urlChangeFunction = function defaultUrlChangeFunc(param1:String):String
         {
            return UrlManager.getUrl(0,param1);
         };
         WorldClock.clock.enabled = false;
         ToolTip.defaultTextWidth = 300;
      }
      
      private function simulateLogin() : void
      {
      }
      
      private function preStart() : void
      {
         //if(ExternalVars.UIN != null && ConstGlobal.useSourceUrlInDevelopMode)
         //{
            this.start();
         //}
      }
      
      public function start() : void
      {
         getLogger().debug("Main Game Module Starts...");
         QExternalUtil.addListener();
         GameGloble.context = new MainContext(this);
         CheckSize();
         this.initModules();
      }
      
      private function initModules() : void
      {
         RobotlegModuleLoaderManager.impl.setModuleInitParamByConfigModuleXmlInfos(ConfigManager.configModuleXmlInfos);
         var helper:RobotlegModuleLoaderHelper = RobotlegModuleLoaderManager.impl.getModuleHelper(UrlManager.getUrl(UrlManager.Url_Module,"ModuleMap.swf"));
         helper.autoInitModule = false;
         helper.initFunction = function(param1:StrongRobotlegCommandEvent):Boolean
         {
            var _loc5_:int = 0;
            var _loc2_:int = GameGloble.actorModel.getOpenMapNeedLevelNotSatified();
            if(_loc2_ > 0)
            {
               QAlert.Show("需要" + _loc2_ + "级才能进入地图");
               return false;
            }
            var _loc3_:Object = param1.map[0];
            var _loc4_:String;
            if((_loc4_ = _loc3_.name) == "cameraToCell")
            {
               _loc5_ = _loc3_.arg[1];
               GameFlowCmd.gotoMap(_loc5_);
            }
            else
            {
               GameFlowCmd.gotoMap();
            }
            return true;
         };
         helper = RobotlegModuleLoaderManager.impl.getModuleHelper(UrlManager.getUrl(UrlManager.Url_Module,"ModuleCard.swf"));
         helper.autoInitModule = true;
         helper.initFunction = function(param1:StrongRobotlegCommandEvent):Boolean
         {
            GameFlowCmd.gotoMyHome();
            return true;
         };
      }
      
      protected function keyHandler(param1:KeyboardEvent) : void
      {
         if(!param1.ctrlKey || !param1.altKey)
         {
            return;
         }
         switch(param1.keyCode)
         {
            case 77:
               DummyViewCmd.openFubenWindow();
               break;
            case 65:
               break;
            case 66:
               GuideCmd.showDebugWd();
               break;
            case 67:
               break;
            case 68:
               GameFlowCmd.gotoSuperArena();
               break;
            case 69:
               ActPlantCarnivalViewCmd.openWindow();
               break;
            case 70:
               BagViewCmd.openChooseBagWindow(1);
               break;
            case 71:
               break;
            case 72:
               break;
            case Keyboard.UP:
               getLogger("STAT").info("------------  显示列表  --------------" + stage.width + ", " + stage.height);
               Utils.count = 0;
               getLogger("STAT").info(Utils.getAllChildrenDesc(SystemManager.instance));
               getLogger("STAT").info("显示对象：" + Utils.count);
               getLogger("STAT").info("------------  BlitBone统计  --------------");
               getLogger("STAT").info(XML(BlitBoneManager.impl.getChildrenUrlStatistic().GetAmountCountBy("url")));
               getLogger("STAT").info("------------  纹理统计  --------------");
               getLogger("STAT").info(XML(BlitDataManager.impl.GetExternalBitmapMapStatistics().GetXmlString()));
               getLogger("STAT").info("------------  BlitBoneAnim计算统计  --------------");
               getLogger("STAT").info(XML(BlitBoneAnimRenderAnalyzer.instance.GetStatistics().GetXmlString()));
               break;
            case Keyboard.DOWN:
               getLogger("STAT").info("------------  BlitBoneAnim计算开始统计  --------------");
               BlitBoneAnimRenderAnalyzer.instance.startRecord();
               break;
            case Keyboard.RIGHT:
               stage.displayState = StageDisplayState.FULL_SCREEN;
               break;
            case Keyboard.LEFT:
               stage.displayState = StageDisplayState.NORMAL;
         }
      }
      
      private function checkApplicationRoot(param1:Object) : Boolean
      {
         var _loc2_:IMyApplication = null;
         if(param1 == _application)
         {
            return true;
         }
         _loc2_ = _application as IMyApplication;
         if(_loc2_)
         {
            return param1 == _loc2_.mainLayer || param1 == _loc2_.uiLayer;
         }
         return false;
      }
      
      public function checkRootLayer(param1:Object) : Boolean
      {
         var _loc2_:Object = null;
         if(param1 == this)
         {
            return true;
         }
         if(this.checkApplicationRoot(param1))
         {
            return true;
         }
         for each(_loc2_ in SystemManager.instance.m_aryRootLayer)
         {
            if(_loc2_ == param1)
            {
               return true;
            }
         }
         return false;
      }
      
      protected function mouseMoveHandler(param1:MouseEvent) : void
      {
         this.isMouseCtrl = param1.ctrlKey;
      }
      
      protected function clickHandler(param1:MouseEvent) : void
      {
      }
      
      protected function onSystemWatcherEvent(param1:SystemWatcherEvent) : void
      {
         if(!this.isMouseCtrl)
         {
            return;
         }
         var _loc2_:String = QDisplayUtil.DisplayListToCode(param1.displayObjectList);
         getLogger("watcher").info(_loc2_ + " :: " + QDisplayUtil.CodeToDisplay(_loc2_));
      }
   }
}
