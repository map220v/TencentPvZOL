package com.qq.modules.td.view.ui
{
   import asgui.containers.Canvas;
   import asgui.controls.Image;
   import asgui.controls.Label;
   import com.qq.display.QCanvas;
   import com.qq.utils.UrlManager;
   
   public class TDAchievementCt extends QCanvas
   {
       
      
      public var img:Image;
      
      public var txt:Label;
      
      private var curMode:int = 1;
      
      private var achievementId:int;
      
      private var _toolTip:String;
      
      public function TDAchievementCt(param1:Class = null)
      {
         super(param1);
      }
      
      public function setData(param1:int, param2:String, param3:int = 1) : void
      {
         this.curMode = param3;
         this._toolTip = param2;
         this.achievementId = param1;
         if(this.curMode == 1)
         {
            this.mode1UI();
         }
         else
         {
            this.mode2UI();
         }
      }
      
      override public function InitializeComponent() : void
      {
         super.InitializeComponent();
      }
      
      private function mode1UI() : void
      {
         var _loc1_:Image = new Image();
         _loc1_.source = UrlManager.getUrl(0,"image/td/achievement/bj.png");
         this.addChild(_loc1_);
         _loc1_.x = 27;
         _loc1_.y = 15;
         this.img = new Image();
         this.img.source = UrlManager.getUrl(0,"image/td/achievement/" + this.achievementId + ".png");
         this.addChild(this.img);
         this.txt = new Label();
         addChild(this.txt);
         this.txt.x = 36;
         this.txt.y = 10;
         this.txt.height = 20;
         this.txt.styleName = ".TXT_HKHB_14_White_Shadow";
         this.txt.SetStyle("color","#61FF7F");
         this.txt.width = 120;
         this.toolTip = this._toolTip;
      }
      
      private function mode2UI() : void
      {
         var _loc1_:Canvas = new Canvas();
         _loc1_.styleName = ".Container_Gray";
         this.addChild(_loc1_);
         _loc1_.x = 50;
         _loc1_.y = 5;
         this.img = new Image();
         this.img.source = UrlManager.getUrl(0,"image/td/achievement/" + this.achievementId + ".png");
         this.addChild(this.img);
         this.txt = new Label();
         addChild(this.txt);
         this.txt.x = 50;
         this.txt.y = 10;
         this.txt.styleName = ".TXT_HKHB_14_White_Shadow";
         this.txt.SetStyle("color","#61FF7F");
         this.txt.text = this._toolTip;
         this.txt.width = 120;
      }
   }
}
