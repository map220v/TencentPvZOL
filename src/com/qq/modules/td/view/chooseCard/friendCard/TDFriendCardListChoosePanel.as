package com.qq.modules.td.view.chooseCard.friendCard
{
   import asgui.containers.Tile;
   import com.qq.display.QCanvas;
   import org.robotlegs.extend.command.RobotlegExtendCmd;
   
   public class TDFriendCardListChoosePanel extends QCanvas
   {
       
      
      public var cardBox:Tile;
      
      public function TDFriendCardListChoosePanel()
      {
         super();
         this.initUI();
         RobotlegExtendCmd.registerMapView(TDFriendCardListChoosePanel,TDFriendCardListChoosePanelMediator);
         RobotlegExtendCmd.createMediator(this);
      }
      
      private function initUI() : void
      {
         this.height = 105;
         styleName = ".HBox_Gray_With_Leaves";
         this.cardBox = new Tile();
         this.cardBox.left = 25;
         this.cardBox.right = 0;
         this.cardBox.top = 3;
         this.cardBox.SetStyle("horizontalGap","1");
         this.cardBox.SetStyle("horizontalAlign","center");
         this.cardBox.graphics.beginFill(16711680,0.5);
         this.cardBox.graphics.drawRect(0,0,this.cardBox.width,this.cardBox.height);
         addChild(this.cardBox);
      }
      
      override public function Dispose() : void
      {
         RobotlegExtendCmd.removeMediatorByView(this);
         super.Dispose();
      }
   }
}
