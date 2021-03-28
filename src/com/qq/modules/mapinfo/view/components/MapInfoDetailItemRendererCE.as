package com.qq.modules.mapinfo.view.components
{
   import asgui.containers.HBox;
   import asgui.controls.Image;
   import asgui.controls.Label;
   import asgui.controls.Text;
   import com.qq.display.QCanvas;
   
   public class MapInfoDetailItemRendererCE extends QCanvas
   {
       
      
      public var imgBack:Image;
      
      public var box:HBox;
      
      public var imgIcon:Image;
      
      public var txtName:Text;
      
      public var txtAlliance:Label;
      
      public var txtStatus:Label;
      
      public var txtTarget:Label;
      
      public var txtTime:Label;
      
      public var boxBtns:HBox;
      
      public function MapInfoDetailItemRendererCE(param1:Class = null, param2:Boolean = true)
      {
         super(!!param2 ? (!!param1 ? param1 : MapInfoDetailItemRendererMediator) : null);
      }
      
      override public function InitializeComponent() : void
      {
         super.InitializeComponent();
         this.width = 530;
         this.height = 32;
         this.styleName = ".Canvas_List_ItemRenderer";
         this.imgBack = new Image();
         this.imgBack.width = 19;
         this.imgBack.height = 30;
         this.imgBack.left = 0;
         this.imgBack.right = 0;
         this.imgBack.x = 0;
         this.imgBack.y = 0;
         this.imgBack.id = "imgBack";
         this.addChild(this.imgBack);
         this.box = new HBox();
         this.box.width = 100;
         this.box.height = 30;
         this.box.left = 0;
         this.box.right = 0;
         this.box.x = 0;
         this.box.y = 6;
         this.box.id = "box";
         this.imgIcon = new Image();
         this.imgIcon.width = 19;
         this.imgIcon.height = 19;
         this.imgIcon.x = 6;
         this.imgIcon.y = 6;
         this.imgIcon.id = "imgIcon";
         this.box.addChild(this.imgIcon);
         this.txtName = new Text();
         this.txtName.x = 30;
         this.txtName.y = 6;
         this.txtName.width = 90;
         this.txtName.height = 24;
         this.txtName.id = "txtName";
         this.txtName.text = "攻方镇长";
         this.txtName.styleName = ".TXT_HKHB_13_Yellow";
         this.box.addChild(this.txtName);
         this.txtAlliance = new Label();
         this.txtAlliance.x = 130;
         this.txtAlliance.y = 6;
         this.txtAlliance.width = 80;
         this.txtAlliance.height = 24;
         this.txtAlliance.id = "txtAlliance";
         this.txtAlliance.text = "所属联盟";
         this.txtAlliance.styleName = ".TXT_HKHB_13_Yellow";
         this.box.addChild(this.txtAlliance);
         this.txtStatus = new Label();
         this.txtStatus.x = 130;
         this.txtStatus.y = 6;
         this.txtStatus.width = 50;
         this.txtStatus.height = 24;
         this.txtStatus.id = "txtStatus";
         this.txtStatus.text = "状态";
         this.txtStatus.styleName = ".TXT_HKHB_13_Yellow";
         this.box.addChild(this.txtStatus);
         this.txtTarget = new Label();
         this.txtTarget.text = "目的地";
         this.txtTarget.styleName = ".TXT_HKHB_13_Yellow";
         this.txtTarget.x = 220;
         this.txtTarget.y = 6;
         this.txtTarget.width = 120;
         this.txtTarget.height = 24;
         this.txtTarget.id = "txtTarget";
         this.box.addChild(this.txtTarget);
         this.txtTime = new Label();
         this.txtTime.text = "剩余时间";
         this.txtTime.styleName = ".TXT_HKHB_13_Yellow";
         this.txtTime.x = 330;
         this.txtTime.y = 6;
         this.txtTime.width = 100;
         this.txtTime.height = 24;
         this.txtTime.id = "txtTime";
         this.box.addChild(this.txtTime);
         this.boxBtns = new HBox();
         this.boxBtns.width = 160;
         this.boxBtns.height = 24;
         this.boxBtns.x = 430;
         this.boxBtns.y = 4;
         this.boxBtns.id = "boxBtns";
         this.box.addChild(this.boxBtns);
         this.addChild(this.box);
      }
      
      override public function Dispose() : void
      {
         this.imgBack = null;
         this.box = null;
         super.Dispose();
      }
   }
}
