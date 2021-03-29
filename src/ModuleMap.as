package
{
   import PVZ.Cmd.SetoutTimesType;
   import com.qq.modules.basic.BaseModule;
   import com.qq.modules.exped.command.ExpedProxyCmd;
   import com.qq.modules.map.command.MapProxyCmd;
   import com.qq.modules.map.command.MapProxyCommand;
   import com.qq.modules.map.command.MapUIViewCommand;
   import com.qq.modules.map.command.MapViewCommand;
   import com.qq.modules.map.model.MapProxy;
   import com.qq.modules.map.view.components.MapUI;
   import com.qq.modules.map.view.map.MapView;
   import com.qq.modules.mapinfo.command.MapInfoProxyCmd;
   import org.allencuilib.map.tiled.display.TiledBackground;
   import org.robotlegs.extend.command.StrongRobotlegCommandEvent;
   
   public class ModuleMap extends BaseModule
   {
       
      
      private var bg:TiledBackground;
      
      private var map:MapView;
      
      private var ui:MapUI;
      
      public function ModuleMap()
      {
         super();
      }
      
      override public function Unload() : void
      {
         this.bg = null;
         this.map = null;
         this.ui = null;
         MapProxyCmd.sendLogOperateToSvr();
         super.Unload();
      }
      
      override protected function init() : void
      {
         super.init();
         this.left = 0;
         this.right = 0;
         this.top = 0;
         this.bottom = 0;
         this.id = "moduleMap";
      }
      
      override protected function initUI() : void
      {
         super.initUI();
         ExpedProxyCmd.queryTimes(SetoutTimesType.SetoutTimesType_City);
         MapInfoProxyCmd.queryDeclareInfo();
      }
      
      override public function set data(param1:Object) : void
      {
         super.data = param1;
         if(param1 == null)
         {
            return;
         }
         var _loc2_:int = int(param1);
         registerProxyList(MapProxy,[_loc2_]);
         registerCommandList("MapProxyCommand",MapProxyCommand,StrongRobotlegCommandEvent);
         registerCommandList("MapViewCommand",MapViewCommand,StrongRobotlegCommandEvent);
         registerCommandList("MapUIViewCommand",MapUIViewCommand,StrongRobotlegCommandEvent);
         doRegister();
         this.map = new MapView();
         this.map.right = 0;
         this.map.top = 0;
         this.map.left = 0;
         this.map.bottom = 0;
         this.addChild(this.map);
         this.map.Load1(_loc2_);
         this.ui = new MapUI(this.map.stg);
         this.ui.setFullSize();
         this.addChild(this.ui);
      }
   }
}
