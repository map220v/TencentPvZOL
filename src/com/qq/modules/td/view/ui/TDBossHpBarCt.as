package com.qq.modules.td.view.ui
{
   import asgui.resources.AssetManager;
   import com.qq.display.QCanvas;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.geom.Rectangle;
   
   public class TDBossHpBarCt extends QCanvas
   {
       
      
      private var barOriginWidth:int;
      
      private var barOriginHeight:int;
      
      private var barMc:MovieClip;
      
      private var _hpMc:Sprite;
      
      public function TDBossHpBarCt()
      {
         super(TDBossHpBarCtMediator);
      }
      
      override public function InitializeComponent() : void
      {
         super.InitializeComponent();
         this.barMc = AssetManager.instance.GetNewClass("TDUI_BossHpBar") as MovieClip;
         this._hpMc = this.barMc["hp_mc"] as Sprite;
         this.barOriginWidth = this._hpMc.width;
         this.barOriginHeight = this._hpMc.height;
         addChild(this.barMc);
      }
      
      public function setValue(param1:int, param2:int) : void
      {
         this._hpMc.scrollRect = new Rectangle(0,0,this.barOriginWidth * param1 / param2,this.barOriginHeight);
      }
      
      override public function Dispose() : void
      {
         super.Dispose();
      }
   }
}
