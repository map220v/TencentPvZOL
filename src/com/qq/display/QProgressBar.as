package com.qq.display
{
   import asgui.controls.Image;
   import asgui.resources.AssetManager;
   import com.greensock.TweenMax;
   
   public class QProgressBar extends QCanvas
   {
       
      
      private var bj:Image;
      
      public var bar:Image;
      
      public var tweenTime:Number = 2;
      
      private var maskBar:Image;
      
      private var tweenBar:Image;
      
      private var topBar:Image;
      
      private var _percent:Number;
      
      private var tween:TweenMax;
      
      public function QProgressBar()
      {
         super();
      }
      
      override public function InitializeComponent() : void
      {
         super.InitializeComponent();
         this.width = 100;
         this.height = 10;
      }
      
      public function setSkin(param1:String, param2:String, param3:String, param4:String) : void
      {
         if(param1 != "")
         {
            this.bj = new Image();
            this.bj.source = AssetManager.GetClass(param1);
            addChild(this.bj);
         }
         if(param3 != null && param3 != "")
         {
            this.tweenBar = new Image();
            this.tweenBar.source = AssetManager.GetClass(param3);
            addChild(this.tweenBar);
         }
         if(param2 != "")
         {
            this.bar = new Image();
            this.bar.source = AssetManager.GetClass(param2);
            addChild(this.bar);
            this.maskBar = new Image();
            this.maskBar.source = AssetManager.GetClass(param2);
            addChild(this.maskBar);
            this.bar.mask = this.maskBar;
         }
         if(param4 != null && param4 != "")
         {
            this.topBar = new Image();
            this.topBar.source = AssetManager.GetClass(param4);
            addChild(this.topBar);
         }
         if(param1)
         {
            this.width = this.bj.contentWidth;
            this.height = this.bj.contentHeight;
         }
         else if(param2)
         {
            this.width = this.bar.contentWidth;
            this.height = this.bar.contentHeight;
         }
      }
      
      public function setWAndH(param1:Number, param2:Number) : void
      {
         this.width = param1;
         this.height = param2;
         if(this.bj)
         {
            this.bj.width = param1;
            this.bj.height = param2;
         }
         if(this.tweenBar)
         {
            this.tweenBar.width = param1;
            this.tweenBar.height = param2;
         }
         if(this.bar)
         {
            this.bar.width = param1;
            this.bar.height = param2;
            this.maskBar.width = param1;
            this.maskBar.height = param2;
         }
         if(this.topBar)
         {
            this.topBar.width = param1;
            this.topBar.height = param2;
         }
      }
      
      public function setPercent(param1:Number, param2:Boolean = true) : void
      {
         this._percent = param1;
         if(this.bar)
         {
            this.maskBar.scaleX = param1;
         }
         if(this.tweenBar)
         {
            if(param2)
            {
               this.tween = TweenMax.to(this.tweenBar,this.tweenTime,{"scaleX":param1});
            }
            else
            {
               this.tweenBar.scaleX = param1;
            }
         }
      }
      
      public function set percent(param1:Number) : void
      {
         this.setPercent(param1);
      }
      
      public function get percent() : Number
      {
         return this._percent;
      }
      
      override public function Dispose() : void
      {
         if(this.tween)
         {
            this.tween.kill();
            this.tween = null;
         }
         super.Dispose();
      }
   }
}
