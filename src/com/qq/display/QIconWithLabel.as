package com.qq.display
{
   import asgui.controls.Image;
   import asgui.controls.Label;
   import com.qq.managers.FilterManager;
   import flash.events.MouseEvent;
   import flash.utils.clearTimeout;
   import flash.utils.setTimeout;
   
   public class QIconWithLabel extends QCanvas
   {
       
      
      public var img:Image;
      
      public var txt:Label;
      
      private var imgSource:Object;
      
      private var _coolDownTime:int = 0;
      
      private var coolDownUID:uint;
      
      private var _cache_enable:Boolean = true;
      
      public function QIconWithLabel(param1:String, param2:Object, param3:String = null)
      {
         super();
         this.imgSource = param2;
         this.setLabel(param1,param3);
         this.setImg(param2);
         this.addEventListener(MouseEvent.CLICK,this.clickHandler);
         this.img.scrollRectEnabled = false;
      }
      
      public function set labelMouseEnabled(param1:Boolean) : void
      {
         this.txt.mouseChildren = param1;
         this.txt.mouseEnabled = param1;
      }
      
      protected function clickHandler(param1:MouseEvent) : void
      {
         if(!enabled)
         {
            param1.stopImmediatePropagation();
         }
         else if(this.coolDownTime != 0)
         {
            this.inlineSetEnable(false);
            if(this.coolDownUID != -1)
            {
               clearTimeout(this.coolDownUID);
            }
            this.coolDownUID = setTimeout(this.CoolDownFinish,this.coolDownTime);
         }
      }
      
      override public function Dispose() : void
      {
         this.removeEventListener(MouseEvent.CLICK,this.clickHandler);
         super.Dispose();
      }
      
      public function setLabel(param1:String, param2:String = null) : void
      {
         this.txt.text = param1;
         if(param2)
         {
            this.txt.styleName = param2;
         }
      }
      
      public function setImg(param1:Object) : void
      {
         this.img.source = param1;
      }
      
      override public function InitializeComponent() : void
      {
         super.InitializeComponent();
         this.img = new Image();
         this.img.hcenter = 0;
         this.addChild(this.img);
         this.txt = new Label();
         this.txt.height = 30;
         this.txt.left = this.txt.right = 0;
         this.txt.bottom = 0;
         this.addChild(this.txt);
         this.scrollRectEnabled = false;
      }
      
      public function get coolDownTime() : int
      {
         return this._coolDownTime;
      }
      
      public function set coolDownTime(param1:int) : void
      {
         if(this._coolDownTime != param1)
         {
            this._coolDownTime = param1;
         }
      }
      
      private function CoolDownFinish() : void
      {
         this.coolDownUID = 0;
         this.enabled = this._cache_enable;
      }
      
      private function inlineSetEnable(param1:Boolean) : void
      {
         if(param1)
         {
            filters = null;
         }
         else
         {
            filters = [FilterManager.getGaryFilter()];
         }
         super.enabled = param1;
         this.img.mouseChildren = param1;
         this.img.mouseEnabled = param1;
      }
      
      override public function set enabled(param1:Boolean) : void
      {
         this._cache_enable = param1;
         if(this.coolDownUID != 0)
         {
            return;
         }
         this.inlineSetEnable(param1);
      }
      
      public function setLabelBottom(param1:Number) : void
      {
         this.txt.bottom = param1;
      }
   }
}
