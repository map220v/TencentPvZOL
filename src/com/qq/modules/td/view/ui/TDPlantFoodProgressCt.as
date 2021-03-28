package com.qq.modules.td.view.ui
{
   import asgui.controls.Image;
   import asgui.managers.ToolTipManager;
   import com.qq.display.QCanvas;
   import com.qq.templates.font.FontNormal;
   import com.qq.utils.UrlManager;
   import flash.display.DisplayObject;
   import flash.display.Loader;
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   import flash.events.Event;
   
   public class TDPlantFoodProgressCt extends QCanvas
   {
      
      public static const LOAD_COMPLETE:String = "Load Complete";
       
      
      public var img:Image;
      
      private var mc:MovieClip;
      
      public var btnAdd:SimpleButton;
      
      public var flashEffect:MovieClip;
      
      private var value:int = 0;
      
      private var total:int = 5;
      
      public function TDPlantFoodProgressCt()
      {
         super(TDPlantFoodProgressCtMediator);
      }
      
      override public function InitializeComponent() : void
      {
         super.InitializeComponent();
         this.img = new Image();
         this.img.source = UrlManager.getUrl(0,"swf/td/ui/plant_food_progress.swf");
         this.addChild(this.img);
         if(this.img.mcHolder)
         {
            this.init();
         }
         else
         {
            this.img.addEventListener(Event.COMPLETE,this.init);
         }
      }
      
      private function init(param1:Event = null) : void
      {
         this.img.removeEventListener(Event.COMPLETE,this.init);
         this.mc = (this.img.mcHolder as Loader).content as MovieClip;
         this.btnAdd = this.mc["btnAdd"];
         this.flashEffect = this.mc["mcFireEffect"];
         this.flashEffect.mouseChildren = this.flashEffect.mouseEnabled = false;
         this.setProgress(this.value,this.total);
         var _loc2_:DisplayObject = this.mc.getChildAt(0);
         ToolTipManager.RegisterToolTip(_loc2_,FontNormal.TD_Str_FuelBarTooltip);
         this.dispatchEvent(new Event(LOAD_COMPLETE));
      }
      
      public function setProgress(param1:int, param2:int) : void
      {
         this.total = param2;
         this.value = param1;
         if(this.mc == null)
         {
            return;
         }
         this.mc.gotoAndStop(param2 - 2);
         var _loc3_:MovieClip = this.mc.getChildAt(0) as MovieClip;
         _loc3_.gotoAndStop(param1 + 1);
      }
      
      override public function Dispose() : void
      {
         super.Dispose();
      }
   }
}
