package com.qq.modules.td.view.chooseCard.selfCard
{
   import asgui.containers.Tile;
   import asgui.controls.Image;
   import com.qq.constant.ResLibID;
   import com.qq.display.QCanvas;
   import com.qq.utils.ResLibManager;
   import org.robotlegs.extend.command.RobotlegExtendCmd;
   
   public class TDExternCardChoosenListPanel extends QCanvas
   {
       
      
      public var bgImg:Image;
      
      public var cardBox:Tile;
      
      public var addImg:Image;
      
      public function TDExternCardChoosenListPanel(param1:Class = null)
      {
         super();
         this.initUI();
         RobotlegExtendCmd.registerMapView(TDExternCardChoosenListPanel,TDExternCardChoosenListPanelMediator);
         RobotlegExtendCmd.createMediator(this);
      }
      
      private function initUI() : void
      {
         this.width = 73;
         this.height = 96;
         this.bgImg = new Image();
         this.bgImg.source = ResLibManager.getInstance().getClassFromRes("TD_UI_ExternChooseCard",ResLibID.TDRes);
         this.addChild(this.bgImg);
         this.cardBox = new Tile();
         this.cardBox.left = 9;
         this.cardBox.top = 8;
         this.cardBox.SetStyle("horizontalGap","1");
         addChild(this.cardBox);
         this.addImg = new Image();
         this.addImg.source = ResLibManager.getInstance().getClassFromRes("TD_UI_Extern_Add",ResLibID.TDRes);
         this.addImg.width = this.addImg.height = 37;
         this.addImg.x = this.width * 0.5 - this.addImg.width * 0.5;
         this.addImg.y = this.height * 0.5 - this.addImg.height * 0.5 - 3;
         this.addChild(this.addImg);
         this.addImg.buttonMode = true;
      }
      
      override public function Dispose() : void
      {
         RobotlegExtendCmd.removeMediatorByView(this);
         super.Dispose();
      }
   }
}
