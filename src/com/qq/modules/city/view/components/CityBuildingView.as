package com.qq.modules.city.view.components
{
   import asgui.containers.Canvas;
   import asgui.controls.Image;
   import asgui.controls.Label;
   import asgui.controls.Text;
   import asgui.managers.LoaderManager;
   import asgui.resources.AssetManager;
   import com.qq.CommandName;
   import com.qq.display.CardIcon;
   import com.qq.display.QCanvas;
   import com.qq.modules.city.CityGlobals;
   import com.qq.modules.sound.command.UISoundCmd;
   import com.qq.templates.font.FontHKHB;
   import com.qq.utils.CommandDispatcher;
   import com.qq.utils.UrlManager;
   import com.qq.utils.UtilsManager;
   import flash.display.BitmapData;
   import flash.display.Loader;
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.geom.Matrix;
   import flash.geom.Point;
   
   public class CityBuildingView extends QCanvas
   {
       
      
      public var bg:Image;
      
      private var _bgOffPos:Point;
      
      public var custom:Canvas;
      
      private var _loader:Loader;
      
      public var type:int;
      
      private var bubbleBox:Canvas;
      
      private var _newBuildingEffect:MovieClip;
      
      public var shade:MovieClip;
      
      public var index:int;
      
      public var buildNameLabel:Label;
      
      public var hitTestEnabled:Boolean = true;
      
      public function CityBuildingView(param1:MovieClip = null)
      {
         super(CityBuildingViewMediator);
         this.shade = param1;
         if(param1)
         {
            param1.visible = true;
         }
         this.scrollRectEnabled = false;
      }
      
      override public function InitializeComponent() : void
      {
         super.InitializeComponent();
         this.custom = new Canvas();
         this.custom.scrollRectEnabled = false;
         this.addChild(this.custom);
         this.bg = new Image();
         this.bg.scrollRectEnabled = false;
         addChild(this.bg);
         this.buildNameLabel = new Label();
         this.buildNameLabel.styleName = ".BuildingName";
         this.buildNameLabel.width = 175;
         this.buildNameLabel.height = 30;
         this.buildNameLabel.text = "";
         addChild(this.buildNameLabel);
         this.scrollRectEnabled = false;
      }
      
      public function set bgOffPos(param1:Point) : void
      {
         if(param1)
         {
            this._bgOffPos = param1;
            this.bg.x = this._bgOffPos.x;
            this.bg.y = this._bgOffPos.y;
         }
      }
      
      override public function hitTestPoint(param1:Number, param2:Number, param3:Boolean = false) : Boolean
      {
         if(!this.hitTestEnabled)
         {
            return false;
         }
         var _loc4_:Boolean;
         if(!(_loc4_ = this.bg.hitTestPoint(param1,param2,param3)))
         {
            return false;
         }
         var _loc5_:BitmapData;
         (_loc5_ = new BitmapData(1,1,true,0)).draw(this.bg,new Matrix(1,0,0,1,-this.bg.mouseX,-this.bg.mouseY));
         var _loc6_:uint;
         return (_loc6_ = _loc5_.getPixel32(0,0)) >= 16777216;
      }
      
      override public function reset(param1:Object = null) : void
      {
         var _loc3_:int = 0;
         super.reset(param1);
         var _loc2_:Array = param1 as Array;
         this.type = _loc2_[0];
         if(CityGlobals.Is_Christmas)
         {
            _loc3_ = UrlManager.Url_CityBuilding_Christmas;
         }
         else
         {
            _loc3_ = UrlManager.Url_CityBuilding;
         }
         this.bg.source = UrlManager.getInstance().getUrl(_loc3_,"building" + this.type + ".swf");
      }
      
      private function addBubbleBoxToScreen(param1:Canvas) : void
      {
         if(param1 == null)
         {
            return;
         }
         CommandDispatcher.send(CommandName.City_AddBuildingTip,param1);
      }
      
      public function addNewTalentTip(param1:int) : void
      {
         this.bubbleBox = new Canvas();
         this.bubbleBox.mouseChildren = this.bubbleBox.mouseEnabled = false;
         this.addBubbleBoxToScreen(this.bubbleBox);
         this.bubbleBox.x = x - 150;
         this.bubbleBox.y = y - 180;
         var _loc2_:Image = new Image();
         _loc2_.source = AssetManager.GetClass("CityMap_ui_bubble");
         this.bubbleBox.width = 195;
         this.bubbleBox.height = 164;
         this.bubbleBox.addChild(_loc2_);
         var _loc3_:Image = new Image();
         this.bubbleBox.addChild(_loc3_);
         _loc3_.source = AssetManager.GetClass("TD_UI_CardBG1");
         _loc3_.x = 50;
         _loc3_.y = 35;
         _loc3_.visible = false;
         var _loc4_:CardIcon = new CardIcon();
         this.bubbleBox.addChild(_loc4_);
         _loc4_.setCardIconByPlantId(param1);
         _loc4_.scaleX = _loc4_.scaleY = 0.6;
         _loc4_.scrollRectEnabled = false;
         _loc4_.x = _loc3_.x;
         _loc4_.y = _loc3_.y;
         var _loc5_:Label = new Label();
         this.bubbleBox.addChild(_loc5_);
         _loc5_.x = 110;
         _loc5_.y = 53;
         _loc5_.text = FontHKHB.CITY_NEW_TALENT;
         _loc5_.styleName = ".TXT_HKHB_21_Yellow_Shadow";
         _loc5_.SetStyle("fontSize","14");
      }
      
      public function removeNewTalentTip() : void
      {
         if(this.bubbleBox)
         {
            UtilsManager.removeFromContainer(this.bubbleBox);
            this.bubbleBox.Dispose();
            this.bubbleBox = null;
         }
      }
      
      public function addNewCardSlotTip() : void
      {
         this.bubbleBox = new Canvas();
         this.bubbleBox.mouseChildren = this.bubbleBox.mouseEnabled = false;
         this.addBubbleBoxToScreen(this.bubbleBox);
         this.bubbleBox.x = x + 26;
         this.bubbleBox.y = y - 230;
         var _loc1_:Image = new Image();
         _loc1_.source = AssetManager.GetClass("CityMap_ui_bubble");
         this.bubbleBox.width = 195;
         this.bubbleBox.height = 164;
         this.bubbleBox.addChild(_loc1_);
         var _loc2_:Text = new Text();
         this.bubbleBox.addChild(_loc2_);
         _loc2_.x = 20;
         _loc2_.y = 53;
         _loc2_.width = 135;
         _loc2_.height = 45;
         _loc2_.text = FontHKHB.CITY_NEW_CART_SLOT;
         _loc2_.styleName = ".TXT_HKHB_21_Yellow_Shadow";
         _loc2_.SetStyle("fontSize","14");
      }
      
      public function removeNewCardSlotTip() : void
      {
         if(this.bubbleBox)
         {
            UtilsManager.removeFromContainer(this.bubbleBox);
            this.bubbleBox.Dispose();
            this.bubbleBox = null;
         }
      }
      
      public function addNewLabTechTip() : void
      {
         this.bubbleBox = new Canvas();
         this.bubbleBox.mouseChildren = this.bubbleBox.mouseEnabled = false;
         this.addBubbleBoxToScreen(this.bubbleBox);
         this.bubbleBox.x = x - 150;
         this.bubbleBox.y = y - 180;
         var _loc1_:Image = new Image();
         _loc1_.source = AssetManager.GetClass("CityMap_ui_bubble");
         this.bubbleBox.width = 195;
         this.bubbleBox.height = 164;
         this.bubbleBox.addChild(_loc1_);
         var _loc2_:Image = new Image();
         this.bubbleBox.addChild(_loc2_);
         _loc2_.x = 0;
         _loc2_.y = -20;
         _loc2_.source = UrlManager.getUrl(0,"image/lab/hint.png");
         _loc2_.scrollRectEnabled = false;
         var _loc3_:Label = new Label();
         this.bubbleBox.addChild(_loc3_);
         _loc3_.width = 120;
         _loc3_.x = 70;
         _loc3_.y = 53;
         _loc3_.text = FontHKHB.CITY_BUILDING_TIP_NEW_TECH;
         _loc3_.styleName = ".TXT_HKHB_21_Yellow_Shadow";
         _loc3_.SetStyle("fontSize","14");
      }
      
      public function removeLabTechTip() : void
      {
         if(this.bubbleBox)
         {
            UtilsManager.removeFromContainer(this.bubbleBox);
            this.bubbleBox.Dispose();
            this.bubbleBox = null;
         }
      }
      
      public function playNewBuildingEffect() : void
      {
         if(this._loader == null)
         {
            this._loader = LoaderManager.GetLoader(UrlManager.getInstance().getUrl(UrlManager.Url_CityBuilding,"cityBuildingAppearEffect.swf"));
            LoaderManager.impl.addEventListener(Event.CLOSE,this.onLoadCompleteBuildingEffect);
            this._loader.mouseChildren = false;
            this._loader.mouseEnabled = false;
         }
         addChildAt(this._loader,1);
         UISoundCmd.play_block_unlock();
      }
      
      private function onLoadCompleteBuildingEffect(param1:Event) : void
      {
         LoaderManager.impl.removeEventListener(Event.CLOSE,this.onLoadCompleteBuildingEffect);
         this._newBuildingEffect = this._loader.content as MovieClip;
         if(this._newBuildingEffect != null)
         {
            this._newBuildingEffect.effect.mc.addChild(this.bg);
            this._newBuildingEffect.addEventListener(Event.ENTER_FRAME,this.onPlayBuildingAppearEffect);
         }
      }
      
      private function onPlayBuildingAppearEffect(param1:Event) : void
      {
         if(this._newBuildingEffect.currentFrame >= this._newBuildingEffect.totalFrames)
         {
            this._newBuildingEffect.removeEventListener(Event.ENTER_FRAME,this.onPlayBuildingAppearEffect);
            this._newBuildingEffect.stop();
            addChildAt(this.bg,1);
            removeChild(this._loader);
            CommandDispatcher.send(CommandName.City_UpdateNewBuildingEffect);
            CommandDispatcher.send(CommandName.City_UpdateBuildingData);
         }
      }
      
      override public function Dispose() : void
      {
         if(this._newBuildingEffect != null)
         {
            this._newBuildingEffect.removeEventListener(Event.ENTER_FRAME,this.onPlayBuildingAppearEffect);
            this._newBuildingEffect = null;
         }
         if(this._loader != null)
         {
            this._loader = null;
         }
         this.shade = null;
         super.Dispose();
      }
   }
}
