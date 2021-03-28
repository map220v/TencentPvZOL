package com.qq.modules.td.view.chooseCard.endlessTD
{
   import asgui.containers.Tile;
   import com.qq.display.QCanvas;
   import org.robotlegs.extend.command.RobotlegExtendCmd;
   
   public class TDCardChoosenListPanelWithEndlessTD extends QCanvas
   {
       
      
      public var cardBox:Tile;
      
      public function TDCardChoosenListPanelWithEndlessTD(param1:Class = null)
      {
         super();
         this.initUI();
         RobotlegExtendCmd.registerMapView(TDCardChoosenListPanelWithEndlessTD,TDCardChoosenListPanelWithEndlessTDMediator);
         RobotlegExtendCmd.createMediator(this);
      }
      
      private function initUI() : void
      {
         this.height = 105;
         styleName = ".HBox_Gray_With_Leaves";
         this.cardBox = new Tile();
         this.cardBox.left = 12;
         this.cardBox.right = 12;
         this.cardBox.top = 3;
         this.cardBox.SetStyle("horizontalGap","1");
         addChild(this.cardBox);
      }
      
      override public function Dispose() : void
      {
         RobotlegExtendCmd.removeMediatorByView(this);
         super.Dispose();
      }
   }
}
