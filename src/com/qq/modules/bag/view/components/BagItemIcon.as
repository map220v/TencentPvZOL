package com.qq.modules.bag.view.components
{
   import PVZ.Cmd.Dto_IdNum;
   import PVZ.Cmd.E_EquipQuality;
   import asgui.containers.Canvas;
   import asgui.controls.Image;
   import asgui.controls.Label;
   import asgui.resources.AssetManager;
   import com.qq.constant.bag.BagItemUtil;
   import com.qq.display.CardIcon;
   import com.qq.display.QCanvas;
   import com.qq.modules.bag.ItemQualityType;
   import com.qq.modules.bag.ItemType;
   import com.qq.modules.bag.model.BagItemTemplate;
   import com.qq.modules.bag.model.ItemTemplateFactory;
   import com.qq.modules.bag.model.vo.BagItemVO;
   import com.qq.modules.bag.model.vo.ItemVO;
   import com.qq.modules.equipment.model.templates.EquipmentItemTemplate;
   import com.qq.utils.GraphicsUtils;
   import com.qq.utils.UrlManager;
   import flash.display.Sprite;
   
   public class BagItemIcon extends QCanvas
   {
      
      public static const Equip_Activity:int = 5;
       
      
      private var _bg:Image;
      
      private var _itemIcon:CardIcon;
      
      private var _txtCount:Label;
      
      private var _border:Image;
      
      private var _boxStar:Canvas;
      
      private var _txtStar:Label;
      
      private var _itemData;
      
      private const starGap:int = 10;
      
      private var _itemNum:int;
      
      public function BagItemIcon(param1:Class = null)
      {
         super(param1);
      }
      
      override public function InitializeComponent() : void
      {
         super.InitializeComponent();
         this.width = 62;
         this.height = 70;
         this._bg = new Image();
         this._bg.x = 6;
         this._bg.y = 6;
         this._bg.mouseEnabled = this._bg.mouseChildren = false;
         this.addChild(this._bg);
         this._itemIcon = new CardIcon();
         this._itemIcon.x = 6;
         this._itemIcon.y = 6;
         this.addChild(this._itemIcon);
         var _loc1_:Sprite = new Sprite();
         GraphicsUtils.drawRect(_loc1_,0,0,width,height - 10,0,0);
         this.addChild(_loc1_);
         this._itemIcon.mask = _loc1_;
         this._txtCount = new Label();
         this._txtCount.width = 50;
         this._txtCount.height = 26;
         this._txtCount.bottom = 5;
         this._txtCount.right = 5;
         this._txtCount.SetStyle("textAlign","right");
         this._txtCount.mouseEnabled = false;
         this.addChild(this._txtCount);
         this._border = new Image();
         this._border.mouseEnabled = this._border.mouseChildren = false;
         this.addChild(this._border);
         this._boxStar = new Canvas();
         this._boxStar.width = 62;
         this._boxStar.height = 20;
         this._boxStar.x = 0;
         this._boxStar.y = 48;
         this._boxStar.mouseEnabled = this._boxStar.mouseChildren = false;
         this.addChild(this._boxStar);
         this._txtStar = new Label();
         this._txtStar.width = 40;
         this._txtStar.height = 24;
         this._txtStar.y = 45;
         this._txtStar.mouseEnabled = false;
         this.addChild(this._txtStar);
      }
      
      public function resetIcon() : void
      {
         this._itemIcon.x = 6;
         this._itemIcon.y = 6;
         this._itemIcon.scaleX = 1;
         this._itemIcon.scaleY = 1;
      }
      
      public function get itemData() : *
      {
         return this._itemData;
      }
      
      public function set itemData(param1:*) : void
      {
         var _loc2_:BagItemTemplate = null;
         var _loc3_:BagItemVO = null;
         var _loc4_:ItemVO = null;
         this._itemData = param1;
         if(this._itemData is BagItemVO)
         {
            _loc3_ = param1 as BagItemVO;
            if(_loc3_.template == null)
            {
               return;
            }
            if(_loc3_.template.type == ItemType.TYPE_EQUIP)
            {
               this.setTemplate(_loc3_.template,false);
               this.setEquipTemplate(_loc3_.equipmentVO.template);
               this.itemQuality = _loc3_.equipmentVO.quality;
               this.attrQuality = _loc3_.equipmentVO.quality;
            }
            else
            {
               this.setTemplate(_loc3_.template,true);
               this.attrQuality = E_EquipQuality.EquipQuality_White;
               this.starLevel = 0;
               this.setItemNum(_loc3_.count);
            }
         }
         else if(this._itemData is ItemVO)
         {
            _loc4_ = param1 as ItemVO;
            this.setTemplate(_loc4_.template);
            if(_loc4_.template.type == ItemType.TYPE_EQUIP)
            {
               this.setEquipTemplate(_loc4_.equipTemplate);
            }
            else
            {
               this.attrQuality = E_EquipQuality.EquipQuality_White;
               this.starLevel = 0;
               this.setItemNum(_loc4_.amount);
            }
         }
         else if(this._itemData is Dto_IdNum)
         {
            _loc2_ = ItemTemplateFactory.instance.getBagItemTemplateById(Dto_IdNum(this._itemData).id);
            this.setTemplate(_loc2_,true);
            this.setItemNum(Dto_IdNum(this._itemData).num);
            this.attrQuality = _loc2_.quality;
            this.starLevel = 0;
         }
         else if(int(this._itemData) > 0)
         {
            this.setTemplate(ItemTemplateFactory.instance.getBagItemTemplateById(int(this._itemData)),true);
            this.attrQuality = E_EquipQuality.EquipQuality_White;
            this.starLevel = 0;
         }
      }
      
      public function set itemQuality(param1:int) : void
      {
         switch(param1)
         {
            case ItemQualityType.UNCOMMON_TYPE:
               this._bg.source = UrlManager.getUrl(UrlManager.Url_ItemIcon,"ui/qualityUncommon_bg.png");
               break;
            case ItemQualityType.RARE_TYPE:
               this._bg.source = UrlManager.getUrl(UrlManager.Url_ItemIcon,"ui/qualityRare_bg.png");
               break;
            case ItemQualityType.EPIC_TYPE:
               this._bg.source = UrlManager.getUrl(UrlManager.Url_ItemIcon,"ui/qualityEpic_bg.png");
               break;
            case ItemQualityType.LEGENDARY_TYPE:
               this._bg.source = UrlManager.getUrl(UrlManager.Url_ItemIcon,"ui/qualityLegendary.png");
               break;
            case ItemQualityType.BEST_TYPE:
               this._bg.source = UrlManager.getUrl(UrlManager.Url_ItemIcon,"ui/qualityBest.png");
               break;
            default:
               this._bg.source = UrlManager.getUrl(UrlManager.Url_ItemIcon,"ui/qualityNormal_bg.png");
         }
      }
      
      public function set attrQuality(param1:int) : void
      {
         switch(param1)
         {
            case E_EquipQuality.EquipQuality_White:
               this._border.source = UrlManager.getUrl(UrlManager.Url_ItemIcon,"ui/borderWhite.png");
               break;
            case E_EquipQuality.EquipQuality_Green:
               this._border.source = UrlManager.getUrl(UrlManager.Url_ItemIcon,"ui/borderGreen.png");
               break;
            case E_EquipQuality.EquipQuality_Blue:
               this._border.source = UrlManager.getUrl(UrlManager.Url_ItemIcon,"ui/borderBlue.png");
               break;
            case E_EquipQuality.EquipQuality_Purple:
               this._border.source = UrlManager.getUrl(UrlManager.Url_ItemIcon,"ui/borderPurple.png");
               break;
            case Equip_Activity:
               this._border.source = UrlManager.getUrl(UrlManager.Url_ItemIcon,"ui/borderGold.png");
         }
      }
      
      public function set showBorder(param1:Boolean) : void
      {
         this._border.visible = param1;
      }
      
      public function set starLevel(param1:int) : void
      {
         var _loc2_:Image = null;
         var _loc3_:int = 0;
         if(param1 >= 6)
         {
            if(this._boxStar.numChildren == 0)
            {
               _loc2_ = new Image();
               _loc2_.source = AssetManager.GetClass("Card_star");
               this._boxStar.addChild(_loc2_);
            }
            else if(this._boxStar.numChildren > 1)
            {
               while(this._boxStar.numChildren > 1)
               {
                  this._boxStar.removeChildAt(0);
               }
               _loc2_ = this._boxStar.getChildAt(0) as Image;
            }
            _loc2_.x = 15;
            this._txtStar.x = 30;
            this._txtStar.text = "x" + param1;
         }
         else
         {
            this._txtStar.text = "";
            while(this._boxStar.numChildren > param1)
            {
               this._boxStar.removeChildAt(0);
            }
            while(this._boxStar.numChildren < param1)
            {
               _loc2_ = new Image();
               _loc2_.source = AssetManager.GetClass("Card_star");
               this._boxStar.addChild(_loc2_);
            }
            _loc3_ = 0;
            while(_loc3_ < param1)
            {
               _loc2_ = this._boxStar.getChildAt(_loc3_) as Image;
               _loc2_.x = this._boxStar.width * 0.5 + this.starGap * (_loc3_ - (param1 - 1) * 0.5) - _loc2_.width * 0.5;
               _loc3_++;
            }
         }
      }
      
      public function set needBJ(param1:Boolean) : void
      {
         this._bg.visible = param1;
      }
      
      private function set icon(param1:int) : void
      {
         this._itemIcon.source = BagItemUtil.getBagItemImageSource(param1);
      }
      
      public function setItemNum(param1:int, param2:Boolean = false) : void
      {
         this._itemNum = param1;
         this._txtCount.text = this._itemNum || param2 ? this._itemNum.toString() : "";
      }
      
      public function getItemNum() : int
      {
         return this._itemNum;
      }
      
      public function set iconPosX(param1:Number) : void
      {
         this._itemIcon.x = param1;
      }
      
      public function setTemplate(param1:BagItemTemplate, param2:Boolean = true, param3:Boolean = false) : void
      {
         this.resetIcon();
         this.data = param1.id;
         if(param2)
         {
            this.itemQuality = param1.quality;
         }
         if(param3)
         {
            this.attrQuality = param1.quality;
         }
         switch(param1.type)
         {
            case ItemType.TYPE_CARD:
               this.setIconByType(param1.iconSource,ItemType.TYPE_CARD);
               break;
            default:
               this.setIconByType(param1.id);
         }
      }
      
      public function setItemIDAndNum(param1:int, param2:int) : void
      {
         var _loc3_:BagItemTemplate = ItemTemplateFactory.instance.getBagItemTemplateById(param1);
         if(_loc3_ == null)
         {
            return;
         }
         this.setTemplate(_loc3_);
         this.setItemNum(param2);
      }
      
      public function set bgSource(param1:Object) : void
      {
         this._bg.source = param1;
      }
      
      public function setIconByType(param1:*, param2:int = 0) : void
      {
         switch(param2)
         {
            case ItemType.TYPE_CARD:
               this._itemIcon.setCardIcon(param1 as String,1);
               this._itemIcon.setCardIconByPlantId(BagItemUtil.getIconIDByImageSource(param1));
               break;
            default:
               this.icon = param1;
         }
      }
      
      public function setCountTextColorStr(param1:String) : void
      {
         this._txtCount.SetStyle("color",param1);
      }
      
      public function setEnoughEffect(param1:Boolean) : void
      {
         if(param1)
         {
            this.setCountTextColorStr("#FFFFFF");
         }
         else
         {
            this.setCountTextColorStr("#FF0000");
         }
      }
      
      public function setEquipTemplate(param1:EquipmentItemTemplate) : void
      {
         this.setItemNum(0);
      }
      
      public function get txtCount() : Label
      {
         return this._txtCount;
      }
      
      public function get itemIcon() : CardIcon
      {
         return this._itemIcon;
      }
      
      override public function Dispose() : void
      {
         super.Dispose();
      }
   }
}
