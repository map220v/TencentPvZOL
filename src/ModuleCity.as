package
{
   import asgui.blit.bone.BlitBoneManager;
   import asgui.managers.CursorManager;
   import com.qq.GameGloble;
   import com.qq.display.QAlert;
   import com.qq.modules.basic.BaseModule;
   import com.qq.modules.city.CityGlobals;
   import com.qq.modules.city.command.CityCommand;
   import com.qq.modules.city.command.CityViewCmd;
   import com.qq.modules.city.command.CityViewCommand;
   import com.qq.modules.city.view.components.CityMapView;
   import com.qq.modules.city.view.components.newUI.NewCityToolBar;
   import com.qq.modules.friend.command.FriendViewCmd;
   import com.qq.modules.guide.GuideSceneType;
   import com.qq.modules.guide.command.GuideCmd;
   import com.qq.modules.luckystar.command.LuckyStarCmd;
   import com.qq.modules.mapinfo.command.MapInfoViewCmd;
   import com.qq.modules.sound.command.CitySoundCmd;
   import com.qq.modules.sound.command.CitySoundCommand;
   import com.qq.modules.sound.command.UISoundCmd;
   import com.qq.templates.font.FontNormal;
   import com.qq.utils.CommandDispatcher;
   import com.qq.utils.GraphicsUtils;
   import flash.events.Event;
   import flash.utils.clearInterval;
   import flash.utils.clearTimeout;
   import flash.utils.setInterval;
   import flash.utils.setTimeout;
   import org.robotlegs.extend.command.StrongRobotlegCommandEvent;
   import tencent.base.utils.StringUtil;
   
   public class ModuleCity extends BaseModule
   {
      
      private static const BUILDER_STATE_UPDATE_TIME:uint = 5 * 60000;
       
      
      private var _buildStateTimer:uint;
      
      private var _firstGetBuildState:uint;
      
      public function ModuleCity()
      {
         super(true);
      }
      
      override protected function init() : void
      {
         super.init();
         registerCommandList("CityViewCommand",CityViewCommand,StrongRobotlegCommandEvent);
         registerCommandList("CitySoundCommand",CitySoundCommand,StrongRobotlegCommandEvent);
         registerCommandList(CityCommand.NAME,CityCommand,StrongRobotlegCommandEvent);
         this.id = "moduleCity";
      }
      
      override protected function initUI() : void
      {
         super.initUI();
         this.left = 0;
         this.right = 0;
         this.top = 0;
         this.bottom = 0;
         var _loc1_:CityMapView = new CityMapView();
         this.addChild(_loc1_);
         var _loc2_:NewCityToolBar = new NewCityToolBar();
         this.addChild(_loc2_);
         CitySoundCmd.playBGSound();
         GameGloble.stage.addEventListener(Event.RESIZE,this.onResize);
         this.onResize(null);
         UISoundCmd.play_button_backCity();
         CityViewCmd.moveMapByCenter(1575 * 0.5 + 320,675 * 0.5 + 156,NaN,false);
         MapInfoViewCmd.checkBeExiled();
         if(GameGloble.sunExchangeCoin > 0)
         {
            QAlert.Show(StringUtil.substitute(FontNormal.ExchangeSunTip,GameGloble.sunExchangeCoin),"提示",4,null,null,null,null,null,null,320,200);
            GameGloble.sunExchangeCoin = 0;
         }
         addEventListener(Event.ADDED_TO_STAGE,this.onAddToStage);
         LuckyStarCmd.tryShowMainWd();
      }
      
      override public function set data(param1:Object) : void
      {
         super.data = param1;
         CityViewCmd.initBuilding();
         CommandDispatcher.send(CityGlobals.CITY_DATA_INITED);
         GuideCmd.checkProgressGuide(GuideSceneType.CITY_SCENE);
         this._buildStateTimer = setInterval(CityViewCmd.initBuildState,BUILDER_STATE_UPDATE_TIME);
         this._firstGetBuildState = setTimeout(CityViewCmd.initBuildState,3000);
      }
      
      private function onResize(param1:Event) : void
      {
         GraphicsUtils.cleanContainer(this);
         GraphicsUtils.drawRect(this,0,0,GameGloble.stage.stageWidth,GameGloble.stage.stageHeight,0,1);
      }
      
      private function onAddToStage(param1:Event) : void
      {
         if(parent != null)
         {
            parent.addChildAt(this,0);
         }
      }
      
      override public function Unload() : void
      {
         CursorManager.currentCursorID = CursorManager.NO_CURSOR;
         removeEventListener(Event.ADDED_TO_STAGE,this.onAddToStage);
         GameGloble.stage.removeEventListener(Event.RESIZE,this.onResize);
         FriendViewCmd.removeFriendIm();
         BlitBoneManager.impl.clearAllChildren();
         clearInterval(this._buildStateTimer);
         clearTimeout(this._firstGetBuildState);
         super.Unload();
      }
   }
}
