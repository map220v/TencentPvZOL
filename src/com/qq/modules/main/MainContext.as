package com.qq.modules.main
{
   import asgui.blit.Blit;
   import asgui.core.Application;
   import asgui.managers.SystemManager;
   import com.qq.ConstGlobal;
   import com.qq.GameGloble;
   import com.qq.display.ScreenViewContainer;
   import com.qq.modules.main.command.GameFlowCmd;
   import com.qq.modules.main.command.MainStartupCommand;
   import com.qq.modules.main.view.PopupLayerMediator;
   import com.qq.modules.main.view.PopupLayerView;
   import com.qq.utils.blit.QBlitDisplayFactory;
   import flash.display.DisplayObjectContainer;
   import flash.ui.ContextMenu;
   import flash.ui.ContextMenuItem;
   import org.robotlegs.base.ContextEvent;
   import org.robotlegs.extend.ExtendContext;
   
   public class MainContext extends ExtendContext
   {
       
      
      public function MainContext(param1:DisplayObjectContainer = null, param2:Boolean = true)
      {
         super(param1,param2);
      }
      
      override public function startup() : void
      {
         Blit.instance.factory = new QBlitDisplayFactory();
         Blit.instance.factory.CreateStage(Application.application.width,Application.application.height);
         GameGloble.injector = _injector;
         this.registerCommand();
         this.registerView();
         super.startup();
         ScreenViewContainer.getInstance().setContainer(contextView as Application);
         GameFlowCmd.startLoad();
         this.initContextMenu();
      }
      
      private function initContextMenu() : void
      {
         var _loc1_:String = ConstGlobal.gameVersion;
         var _loc2_:ContextMenu = new ContextMenu();
         _loc2_.hideBuiltInItems();
         var _loc3_:String = "debug-" + _loc1_;
         _loc3_ = "final-" + _loc1_;
         _loc2_.customItems.push(new ContextMenuItem(_loc3_,false,false));
         var _loc4_:String = "basic";
         _loc2_.customItems.push(new ContextMenuItem(_loc4_,false,false));
         SystemManager.instance.contextMenu = _loc2_;
      }
      
      protected function registerCommand() : void
      {
         commandMap.mapEvent(ContextEvent.STARTUP_COMPLETE,MainStartupCommand,ContextEvent,true);
      }
      
      protected function registerView() : void
      {
         mediatorMap.mapView(PopupLayerView,PopupLayerMediator);
      }
   }
}
