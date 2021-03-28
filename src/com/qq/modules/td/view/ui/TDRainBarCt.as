package com.qq.modules.td.view.ui
{
   import asgui.controls.Label;
   import asgui.resources.AssetManager;
   import com.qq.display.QCanvas;
   import com.qq.templates.font.FontNormal;
   import flash.display.DisplayObject;
   
   public class TDRainBarCt extends QCanvas
   {
       
      
      public var rainTF:Label;
      
      public function TDRainBarCt()
      {
         super(TDRainBarCtMediator);
      }
      
      override public function InitializeComponent() : void
      {
         super.InitializeComponent();
         var _loc1_:DisplayObject = AssetManager.instance.GetNewClass("TDUI_WaterValueBar") as DisplayObject;
         addChild(_loc1_);
         this.rainTF = new Label();
         this.rainTF.x = 25;
         this.rainTF.y = 14;
         this.rainTF.text = "0";
         this.rainTF.styleName = ".TXT_ArialBd_14";
         this.rainTF.width = 60;
         addChild(this.rainTF);
         this.toolTip = FontNormal.TD_Str_RainBarTooltip;
      }
   }
}
