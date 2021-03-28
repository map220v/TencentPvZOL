package com.qq.modules.td.view.game.ui
{
   import asgui.containers.HBox;
   import asgui.controls.Image;
   import com.qq.display.QCanvas;
   import com.qq.templates.font.FontNormal;
   import com.qq.utils.UrlManager;
   import org.robotlegs.extend.command.RobotlegExtendCmd;
   
   public class TDGameMenuPanel extends QCanvas
   {
       
      
      public var pauseBtn:Image;
      
      public var resetBtn:Image;
      
      public var exitBtn:Image;
      
      public var box:HBox;
      
      public function TDGameMenuPanel()
      {
         super();
      }
      
      override public function InitializeComponent() : void
      {
         super.InitializeComponent();
         this.box = new HBox();
         this.box.width = 108;
         this.box.height = 31;
         this.addChild(this.box);
         this.pauseBtn = new Image();
         this.pauseBtn.source = UrlManager.getUrl(0,"swf/td/ui/pause.swf");
         this.pauseBtn.toolTip = FontNormal.TD_Btn_Pause;
         this.box.addChild(this.pauseBtn);
         this.resetBtn = new Image();
         this.resetBtn.source = UrlManager.getUrl(0,"swf/td/ui/reset.swf");
         this.resetBtn.toolTip = FontNormal.TD_Btn_Restart;
         this.box.addChild(this.resetBtn);
         this.exitBtn = new Image();
         this.exitBtn.source = UrlManager.getUrl(0,"swf/td/ui/exit.swf");
         this.exitBtn.toolTip = FontNormal.TD_Btn_Ext;
         this.box.addChild(this.exitBtn);
         RobotlegExtendCmd.registerMapView(TDGameMenuPanel,TDGameMenuPanelMediator);
         RobotlegExtendCmd.createMediator(this);
      }
      
      override public function Dispose() : void
      {
         RobotlegExtendCmd.removeMediatorByView(this);
         super.Dispose();
      }
   }
}
