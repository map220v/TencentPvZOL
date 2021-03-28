package com.qq.modules.mapinfo.command
{
   import asgui.containers.Canvas;
   import asgui.controls.Alert;
   import asgui.controls.Image;
   import asgui.events.CloseEvent;
   import asgui.managers.PopUpManager;
   import com.qq.SceneCenter;
   import com.qq.constant.SceneName;
   import com.qq.display.QAlert;
   import com.qq.modules.friend.model.vo.FriendRoleVo;
   import com.qq.modules.main.command.CommonCmd;
   import com.qq.modules.main.model.ActorModel;
   import com.qq.modules.main.server.PvzSocketService;
   import com.qq.modules.map.command.MapViewCmd;
   import com.qq.modules.map.model.vo.MapCityCellVO;
   import com.qq.modules.mapinfo.model.MapInfoProxy;
   import com.qq.modules.mapinfo.view.components.MapInfoDetailWnd;
   import com.qq.modules.mapinfo.view.components.MapInfoHelpArmyWD;
   import com.qq.modules.mapinfo.view.components.MapInfoMiniCt;
   import com.qq.modules.mapinfo.view.components.MapInfoMoviCityFixWnd;
   import com.qq.modules.mapinfo.view.components.MapInfoRoleWnd;
   import com.qq.modules.mapinfo.view.components.MapInfoSwitchChapterWnd;
   import com.qq.modules.mapinfo.view.history.TimemachineView;
   import com.tencent.protobuf.Int64;
   import flash.display.DisplayObject;
   import flash.display.MovieClip;
   import flash.geom.Point;
   import org.robotlegs.extend.command.StrongRobotlegCommand;
   
   public class MapInfoViewCommand extends StrongRobotlegCommand
   {
       
      
      [Inject]
      public var server:PvzSocketService;
      
      [Inject]
      public var actor:ActorModel;
      
      [Inject]
      public var proxy:MapInfoProxy;
      
      public function MapInfoViewCommand()
      {
         super();
      }
      
      public function addHistoryMiniCt(param1:Canvas) : void
      {
         var _loc2_:MapInfoMiniCt = new MapInfoMiniCt();
         param1.addChild(_loc2_);
      }
      
      public function showDetailWnd(param1:int = 0) : void
      {
         var _loc2_:MapInfoDetailWnd = null;
         if(!MapInfoDetailWnd.instance)
         {
            _loc2_ = new MapInfoDetailWnd(param1);
            PopUpManager.AddPopUp(_loc2_);
         }
      }
      
      public function showHelpArmyWD() : void
      {
         var _loc1_:MapInfoHelpArmyWD = new MapInfoHelpArmyWD();
         PopUpManager.AddPopUp(_loc1_,null,true);
      }
      
      public function showMapRoleWnd(param1:Object) : void
      {
         if(MapInfoRoleWnd.instance)
         {
            MapInfoRoleWnd.instance.Close();
         }
         var _loc2_:MapCityCellVO = param1 as MapCityCellVO;
         var _loc3_:MapInfoRoleWnd = new MapInfoRoleWnd(_loc2_);
         PopUpManager.AddPopUp(_loc3_);
      }
      
      public function showMapRoleWndByRoleId(param1:Int64 = null) : void
      {
         if(!param1)
         {
            param1 = this.actor.roleId;
         }
         if(MapInfoRoleWnd.instance)
         {
            MapInfoRoleWnd.instance.Close();
         }
         var _loc2_:MapInfoRoleWnd = new MapInfoRoleWnd(null,param1);
         PopUpManager.AddPopUp(_loc2_);
      }
      
      public function showMapRoleWndByFriendInfo(param1:Object) : void
      {
         if(MapInfoRoleWnd.instance)
         {
            MapInfoRoleWnd.instance.Close();
         }
         var _loc2_:MapInfoRoleWnd = new MapInfoRoleWnd(null,null,param1 as FriendRoleVo);
         PopUpManager.AddPopUp(_loc2_);
      }
      
      public function showMapRoleWndByChallenge(param1:Int64, param2:Object) : void
      {
         if(MapInfoRoleWnd.instance)
         {
            MapInfoRoleWnd.instance.Close();
         }
         var _loc3_:MapInfoRoleWnd = new MapInfoRoleWnd(null,param1,null,param2);
         PopUpManager.AddPopUp(_loc3_);
      }
      
      public function showAdvancedMoveCityWnd(param1:int = 0, param2:Point = null) : void
      {
         PopUpManager.AddPopUp(new MapInfoMoviCityFixWnd(param1,param2),null,true);
      }
      
      public function showSwitchChapterWnd() : void
      {
         PopUpManager.AddPopUp(new MapInfoSwitchChapterWnd(),null,true);
      }
      
      public function showTimemachine(param1:Image, param2:MovieClip) : void
      {
         var _loc3_:TimemachineView = new TimemachineView();
         _loc3_.builderMc = param2;
         _loc3_.name = "timemachineView";
         param1.addChild(_loc3_);
      }
      
      public function removeTimemachine(param1:Image) : void
      {
         var _loc2_:DisplayObject = param1.getChildByName("timemachineView");
         if(_loc2_)
         {
            param1.removeChild(_loc2_);
            TimemachineView(_loc2_).Dispose();
         }
      }
      
      public function checkBeExiled() : void
      {
         if(this.proxy.needEnterMap)
         {
            this.proxy.needEnterMap = false;
            if(this.proxy.beExiled)
            {
               switch(SceneCenter.getInstance().currentScene)
               {
                  case SceneName.City:
                  case SceneName.MAP:
                     this.proxy.beExiled = false;
                     QAlert.Show("您的小镇被敌人攻破，已经给您随机搬迁了位置。","",Alert.YES,null,this.comfirmBeMove);
                     break;
                  default:
                     CommonCmd.txtFly("您的小镇被破坏，系统将随机安置您的小镇",NaN,NaN,0,null,true);
               }
            }
            else
            {
               MapViewCmd.cameraToCell(this.proxy.data.myPos,this.proxy.data.myAreaId);
               CommonCmd.txtFly("恭喜您迁移成功 坐标：" + this.proxy.data.myPos.x + ", " + this.proxy.data.myPos.y);
            }
         }
      }
      
      private function comfirmBeMove(param1:CloseEvent) : void
      {
         if(SceneCenter.getInstance().currentScene == SceneName.MAP)
         {
            MapViewCmd.cameraToCell(this.proxy.data.myPos,this.proxy.data.myAreaId);
         }
         CommonCmd.txtFly("您的小镇被破坏，系统将随机安置您的小镇",NaN,NaN,0,null,true);
      }
   }
}
