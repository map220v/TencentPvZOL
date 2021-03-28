package com.qq.modules.td.view.chooseCard.friendCard
{
   import asgui.containers.Tile;
   import org.robotlegs.extend.command.RobotlegExtendCmd;
   
   public class TDFriendCardListPanel extends Tile
   {
       
      
      public function TDFriendCardListPanel()
      {
         super();
         RobotlegExtendCmd.registerMapView(TDFriendCardListPanel,TDFriendCardListPanelMediator);
         RobotlegExtendCmd.createMediator(this);
      }
      
      override public function InitializeComponent() : void
      {
         super.InitializeComponent();
         height = 281;
         SetStyle("horizontalGap","16");
         SetStyle("verticalGap","2");
         SetStyle("paddingTop","15");
      }
      
      override public function Dispose() : void
      {
         RobotlegExtendCmd.removeMediatorByView(this);
         super.Dispose();
      }
   }
}
