package com.qq.modules.td.view.ui
{
   import asgui.controls.Label;
   import asgui.managers.ToolTipManager;
   import asgui.resources.AssetManager;
   import com.qq.display.QCanvas;
   import com.qq.templates.font.FontNormal;
   import flash.display.DisplayObject;
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   
   public class TDSunBarCt extends QCanvas
   {
       
      
      public var sunTF:Label;
      
      public var btnAdd:SimpleButton;
      
      public var fireEffect:MovieClip;
      
      public function TDSunBarCt()
      {
         super(TDSunBarCtMediator);
      }
      
      override public function InitializeComponent() : void
      {
         var _loc1_:DisplayObject = null;
         super.InitializeComponent();
         _loc1_ = AssetManager.instance.GetNewClass("TDUI_SunValueBar") as DisplayObject;
         addChild(_loc1_);
         this.btnAdd = _loc1_["btnAdd"];
         this.fireEffect = _loc1_["mcFireEffect"];
         this.fireEffect.mouseChildren = this.fireEffect.mouseEnabled = false;
         this.sunTF = new Label();
         this.sunTF.x = 35;
         this.sunTF.y = 14;
         this.sunTF.text = "0";
         this.sunTF.styleName = ".TXT_ArialBd_14";
         this.sunTF.width = 60;
         addChild(this.sunTF);
         ToolTipManager.RegisterToolTip(_loc1_["mcSun"],FontNormal.TD_Str_SunBarTooltip);
         ToolTipManager.RegisterToolTip(_loc1_["mcBar"],FontNormal.TD_Str_SunBarTooltip);
      }
   }
}
