package com.qq.modules.td.view.components
{
   import asgui.containers.Canvas;
   import asgui.controls.Image;
   import asgui.resources.AssetManager;
   import com.qq.display.QCanvas;
   import com.qq.modules.td.model.vo.TDCardData;
   import com.qq.modules.td.view.game.layer.ITDLocationUpdatable;
   import flash.display.BitmapData;
   import flash.display.Sprite;
   
   public class TDRollingTrack extends QCanvas implements ITDLocationUpdatable
   {
       
      
      private const GAP:Number = 0.5;
      
      private const cTrackInitXMax:int = 5;
      
      private const cTrackInitXMin:int = -100;
      
      public var cTrack:Sprite;
      
      public var cMain:Canvas;
      
      public var image_15:Image;
      
      public var image_16:Image;
      
      public var image_17:Image;
      
      public function TDRollingTrack()
      {
         super(TDRollingTrackMediator);
      }
      
      override public function InitializeComponent() : void
      {
         super.InitializeComponent();
         this.width = 500;
         this.height = 80;
         this.left = 5;
         this.cTrack = new Sprite();
         this.cTrack.x = this.cTrackInitXMax;
         this.cTrack.y = 0;
         var _loc1_:BitmapData = AssetManager.GetNewClass("TD_ConveyorBelt") as BitmapData;
         this.cTrack.graphics.beginBitmapFill(_loc1_);
         this.cTrack.graphics.drawRect(0,0,600,72);
         this.cTrack.graphics.endFill();
         this.addChild(this.cTrack);
         this.cMain = new Canvas();
         this.cMain.x = 108;
         this.cMain.y = 17;
         this.cMain.id = "cMain";
         this.cMain.left = 5;
         this.cMain.right = 5;
         this.cMain.top = 0;
         this.cMain.bottom = 8;
         this.cMain.styleName = "Canvas";
         this.addChild(this.cMain);
         this.image_15 = new Image();
         this.image_15.width = 5;
         this.image_15.height = 127;
         this.image_15.source = AssetManager.GetNewClass("TD_ConveyorTop");
         this.image_15.x = 0;
         this.image_15.y = 0;
         this.image_15.id = "image_15";
         this.addChild(this.image_15);
         this.image_16 = new Image();
         this.image_16.width = 500;
         this.image_16.height = 8;
         this.image_16.source = AssetManager.GetNewClass("TD_ConveyorSide");
         this.image_16.x = 0;
         this.image_16.y = 51;
         this.image_16.id = "image_16";
         this.image_16.bottom = 0;
         this.addChild(this.image_16);
         this.image_17 = new Image();
         this.image_17.width = 5;
         this.image_17.height = 127;
         this.image_17.source = AssetManager.GetNewClass("TD_ConveyorTop");
         this.image_17.x = 273;
         this.image_17.y = 0;
         this.image_17.id = "image_17";
         this.image_17.right = 0;
         this.addChild(this.image_17);
      }
      
      override public function Dispose() : void
      {
         super.Dispose();
         this.cTrack = null;
         this.cMain = null;
         this.image_15 = null;
         this.image_16 = null;
         this.image_17 = null;
      }
      
      public function advanceTime(param1:Number) : void
      {
         var _loc2_:Number = -1000 * param1 * 0.001 * 0.05;
         this.cTrack.x += _loc2_;
         if(this.cTrack.x <= this.cTrackInitXMin || this.cTrack.x > this.cTrackInitXMax)
         {
            this.cTrack.x = this.cTrackInitXMax;
         }
         this.checkCardPostion(_loc2_);
      }
      
      public function addCard(param1:TDCardData) : void
      {
         var _loc2_:TDRollingCard = new TDRollingCard(param1);
         _loc2_.x = this.cMain.width;
         this.cMain.addChild(_loc2_);
      }
      
      public function updateLocation() : void
      {
      }
      
      public function checkCardPostion(param1:Number) : void
      {
         var _loc2_:int = 0;
         var _loc4_:TDRollingCard = null;
         var _loc3_:int = 0;
         _loc2_ = 0;
         while(_loc2_ < this.cMain.numChildren)
         {
            _loc4_ = this.cMain.getChildAt(_loc2_) as TDRollingCard;
            _loc4_.x += param1;
            if(_loc4_.x <= _loc3_)
            {
               _loc4_.x = _loc3_;
               _loc3_ += _loc4_.width + this.GAP;
            }
            else
            {
               _loc3_ = _loc4_.x + _loc4_.width + this.GAP;
            }
            _loc2_++;
         }
      }
   }
}
