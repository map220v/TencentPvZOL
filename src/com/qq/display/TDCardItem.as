package com.qq.display
{
   import asgui.controls.Image;
   import asgui.controls.Label;
   import asgui.resources.AssetManager;
   import com.qq.GameGloble;
   import com.qq.modules.plantTalent.model.PlantTalentModel;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.events.Event;
   import flash.filters.GlowFilter;
   import flash.geom.Matrix;
   
   public class TDCardItem extends QCanvas
   {
       
      
      public var bg:Image;
      
      private var icon:CardIcon;
      
      public var cardButtomBar:Image;
      
      private var _selected:Boolean;
      
      private var img_selected:Image;
      
      private var isBig:Boolean = false;
      
      public var txt_name:Label;
      
      public function TDCardItem()
      {
         super();
      }
      
      public function get selected() : Boolean
      {
         return this.img_selected.visible;
      }
      
      public function set selected(param1:Boolean) : void
      {
         this.img_selected.visible = param1;
      }
      
      override public function Dispose() : void
      {
         if(this.img_selected)
         {
            this.img_selected.Dispose();
         }
         super.Dispose();
      }
      
      override public function InitializeComponent() : void
      {
         super.InitializeComponent();
         this.width = 54;
         this.height = 72;
         this.bg = new Image();
         this.bg.ifRemovePreChildWhenChangeSource = true;
         this.bg.scaleContent = true;
         this.setCardBJ("TD_UI_CardBG1");
         addChild(this.bg);
         this.icon = new CardIcon();
         addChild(this.icon);
         this.icon.scaleX = this.icon.scaleY = 0.6;
         this.icon.x = -4;
         this.icon.y = 5;
         this.icon.scrollRectEnabled = false;
         this.cardButtomBar = new Image();
         addChild(this.cardButtomBar);
         this.cardButtomBar.source = AssetManager.GetClass("TD_UI_CardBar");
         this.cardButtomBar.bottom = 3;
         this.cardButtomBar.x = 3;
         this.txt_name = new Label();
         addChild(this.txt_name);
         this.txt_name.left = -4;
         this.txt_name.right = 0;
         this.txt_name.y = 70;
         this.txt_name.styleName = ".TXT_HKHB_14_White_Gray";
         this.img_selected = new Image();
         $addChild(this.img_selected);
         this.img_selected.source = AssetManager.GetClass("Card_selected");
         this.img_selected.x = -4;
         this.img_selected.y = -3;
         this.img_selected.visible = false;
      }
      
      public function setMaskBarVisible(param1:Boolean) : void
      {
         this.cardButtomBar.visible = param1;
      }
      
      public function setCardBJ(param1:String) : void
      {
         this.bg.source = AssetManager.GetClass(param1);
      }
      
      public function setCard(param1:int, param2:int = 0) : void
      {
         var _loc3_:PlantTalentModel = null;
         var _loc4_:int = 0;
         this.icon.setCardIconByPlantId(param1,param2);
         if(!this.isBig)
         {
            this.icon.scaleX = this.icon.scaleY = 0.5;
         }
         else
         {
            this.setBigIcon();
         }
         if(GameGloble.injector.hasMapping(PlantTalentModel))
         {
            _loc3_ = GameGloble.injector.getInstance(PlantTalentModel);
            if((_loc4_ = _loc3_.getTalentLevelByPlant(param1)) == 0)
            {
               this.setCardBJ("TD_UI_CardBG1");
            }
            else
            {
               switch(_loc4_)
               {
                  case 1:
                     this.setCardBJ("TD_UI_CardBG5");
                     break;
                  case 2:
                     this.setCardBJ("TD_UI_CardBG6");
                     break;
                  case 3:
                     this.setCardBJ("TD_UI_CardBG7");
                     break;
                  case 4:
                     this.setCardBJ("TD_UI_CardBG4");
               }
            }
         }
      }
      
      public function drawSelfToBitmap() : void
      {
         var bmp:Bitmap = null;
      }
      
      public function callBackBitmapData(param1:Function, param2:Number = 1, param3:Number = 1) : void
      {
         var b:BitmapData = null;
         var callBack:Function = param1;
         var scaleX:Number = param2;
         var scaleY:Number = param3;
         if(this.icon.mcHolder)
         {
            b = new BitmapData(this.width * scaleX,this.height * scaleY,true,0);
            b.draw(this,new Matrix(scaleX,0,0,scaleY));
            b.draw(this);
            callBack(b);
         }
         else
         {
            this.icon.addEventListener(Event.COMPLETE,function():void
            {
               callBackBitmapData(callBack,scaleX,scaleY);
            },false,0,true);
         }
      }
      
      public function setBig() : void
      {
         this.isBig = true;
         width = 70;
         height = 90;
         this.bg.width = 70;
         this.bg.height = 90;
         var _loc1_:GlowFilter = new GlowFilter();
         _loc1_.blurX = 5;
         _loc1_.blurY = 5;
         _loc1_.color = 3355443;
         _loc1_.inner = true;
         _loc1_.strength = 10;
         this.bg.filters = [_loc1_];
         this.setBigIcon();
      }
      
      private function setBigIcon() : void
      {
         this.icon.scaleX = this.icon.scaleY = 0.6;
         this.icon.y = this.icon.offsetY * this.icon.scaleY;
      }
   }
}
