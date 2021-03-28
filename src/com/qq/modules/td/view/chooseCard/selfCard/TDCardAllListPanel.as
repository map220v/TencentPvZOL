package com.qq.modules.td.view.chooseCard.selfCard
{
   import asgui.containers.Tile;
   import asgui.core.ScrollPolicy;
   import org.robotlegs.extend.command.RobotlegExtendCmd;
   
   public class TDCardAllListPanel extends Tile
   {
       
      
      public function TDCardAllListPanel()
      {
         super();
         RobotlegExtendCmd.registerMapView(TDCardAllListPanel,TDCardAllListPanelMediator);
         RobotlegExtendCmd.createMediator(this);
      }
      
      override public function InitializeComponent() : void
      {
         super.InitializeComponent();
         SetStyle("horizontalGap","0");
         SetStyle("verticalGap","2");
         this.verticalScrollPolicy = ScrollPolicy.AUTO;
      }
      
      override public function Dispose() : void
      {
         RobotlegExtendCmd.removeMediatorByView(this);
         super.Dispose();
      }
   }
}
