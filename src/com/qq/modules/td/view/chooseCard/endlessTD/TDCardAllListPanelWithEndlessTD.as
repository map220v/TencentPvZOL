package com.qq.modules.td.view.chooseCard.endlessTD
{
   import asgui.containers.Tile;
   import asgui.core.ScrollPolicy;
   import org.robotlegs.extend.command.RobotlegExtendCmd;
   
   public class TDCardAllListPanelWithEndlessTD extends Tile
   {
       
      
      public function TDCardAllListPanelWithEndlessTD()
      {
         super();
         RobotlegExtendCmd.registerMapView(TDCardAllListPanelWithEndlessTD,TDCardAllListPanelWithEndlessTDMediator);
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
