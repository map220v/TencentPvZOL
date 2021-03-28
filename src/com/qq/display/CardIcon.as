package com.qq.display
{
   import asgui.controls.Image;
   import com.qq.constant.bag.BagItemUtil;
   import com.qq.modules.card.model.templates.CardChestAvatarTemp;
   import com.qq.modules.card.model.templates.CardTemplateFactory;
   import com.qq.modules.main.model.SettingsModel;
   import com.qq.modules.main.model.settings.battle.ce.BattleLineupCardTemp;
   import com.qq.modules.td.data.game.unit.TDPlantStaticInfo;
   import flash.display.DisplayObject;
   import flash.display.Loader;
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.filters.DropShadowFilter;
   import flash.filters.GlowFilter;
   import flash.utils.getQualifiedClassName;
   
   public class CardIcon extends Image
   {
       
      
      private var hidePartList:Array;
      
      private var iconId:int;
      
      public var autoUpdatePosition:Boolean = true;
      
      private var avatarTemplate:CardChestAvatarTemp;
      
      private var _iconFilters:Array;
      
      private var cardType:int;
      
      public function CardIcon()
      {
         super();
      }
      
      override public function InitializeComponent() : void
      {
         super.InitializeComponent();
         addEventListener(Event.COMPLETE,this.loadedHandler);
         this.cacheAsBitmap = true;
         this.ifRemovePreChildWhenChangeSource = true;
      }
      
      override public function Dispose() : void
      {
         super.Dispose();
         removeEventListener(Event.COMPLETE,this.loadedHandler);
      }
      
      protected function loadedHandler(param1:Event) : void
      {
         if(this.hidePartList && mcHolder is Loader)
         {
            this.hidePart((mcHolder as Loader).content as MovieClip);
         }
      }
      
      public function setCardIconByPlantId(param1:int, param2:int = 0) : void
      {
         var _loc4_:Array = null;
         if(this.avatarTemplate && this.avatarTemplate.id == param2)
         {
            return;
         }
         var _loc3_:TDPlantStaticInfo = SettingsModel.instance.TDPlantSetting.getPlantInfoByID(param1);
         this.iconId = _loc3_.baseInfo.iconID;
         this.setCardIcon(CardItemFactory.getIconURL(this.iconId,param2),1);
         if(param2 == 0)
         {
            this.setAvatar(CardTemplateFactory.instance.getPlantAvatarByTdPlantId(param1));
         }
         else
         {
            this.setAvatar(CardTemplateFactory.instance.getPlantAvatarByAvatarId(param2));
         }
      }
      
      public function setCardIconByBattleCardId(param1:int, param2:int = 0) : void
      {
         var _loc4_:CardChestAvatarTemp = null;
         var _loc3_:BattleLineupCardTemp = SettingsModel.instance.battleCardSettings.getBattleCardTempById(param1);
         this.iconId = _loc3_.icon;
         this.setCardIcon(CardItemFactory.getIconURL(this.iconId,param2),0);
         if(param2 != 0)
         {
            _loc4_ = CardTemplateFactory.instance.getPlantAvatarByAvatarId(param2);
         }
         else
         {
            _loc4_ = CardTemplateFactory.instance.getPlantAvatarByTdPlantId(_loc3_.tdId);
         }
         if(_loc4_ != null)
         {
            this.setAvatar(_loc4_);
         }
      }
      
      public function get offsetY() : int
      {
         return !!this.avatarTemplate ? int(this.avatarTemplate.offsetY) : 0;
      }
      
      public function setAvatar(param1:CardChestAvatarTemp) : void
      {
         if(!param1 || this.avatarTemplate == param1)
         {
            return;
         }
         this.avatarTemplate = param1;
         var _loc2_:BattleLineupCardTemp = SettingsModel.instance.battleCardSettings.getBattleCardTempByTDID(param1.tdPlantId);
         if(_loc2_ != null)
         {
            this.iconId = _loc2_.icon;
         }
         var _loc3_:Array = param1.hidePartCardList;
         this.setHidePart(_loc3_);
         if(CardItemFactory.useImg)
         {
            this.setCardIcon(CardItemFactory.getIconURL(this.iconId,param1.id),0);
         }
         this.updatePos();
      }
      
      protected function updatePos() : void
      {
         var _loc1_:int = 0;
         if(this.autoUpdatePosition)
         {
            _loc1_ = !!this.avatarTemplate ? int(this.avatarTemplate.offsetY) : 0;
            switch(this.cardType)
            {
               case 1:
                  this.scaleX = this.scaleY = 0.5;
                  this.x = -3;
                  this.y = 2 + _loc1_ * this.scaleY;
                  break;
               default:
                  this.scaleX = this.scaleY = 0.6;
                  this.x = -3;
                  this.y = 5 + _loc1_ * this.scaleY;
            }
         }
      }
      
      private function setHidePart(param1:Array) : void
      {
         if(CardItemFactory.useImg)
         {
            return;
         }
         this.hidePartList = param1;
         if(this.hidePartList && mcHolder && mcHolder is Loader)
         {
            this.hidePart((mcHolder as Loader).content as MovieClip);
         }
      }
      
      public function setCardIcon(param1:String, param2:int = 0, param3:int = 0) : void
      {
         this.cardType = param2;
         this.source = param1;
         this.scrollRectEnabled = false;
         this.updatePos();
         if(param3 != 0)
         {
            this.setHidePart(BagItemUtil.getBagCardItemHidePart(param3));
         }
         this.cacheAsBitmap = true;
      }
      
      private function hidePart(param1:MovieClip) : void
      {
         var _loc4_:DisplayObject = null;
         var _loc2_:int = param1.numChildren;
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            if((_loc4_ = param1.getChildAt(_loc3_)) is MovieClip)
            {
               _loc4_.visible = true;
               this.checkHide(_loc4_ as MovieClip);
               this.hidePart(_loc4_ as MovieClip);
            }
            _loc3_++;
         }
      }
      
      private function checkHide(param1:MovieClip) : void
      {
         var _loc2_:String = getQualifiedClassName(param1);
         _loc2_ = _loc2_.substr(_loc2_.lastIndexOf("::") + 1);
         var _loc3_:int = this.hidePartList.length;
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            if(_loc2_ == this.hidePartList[_loc4_])
            {
               param1.visible = false;
               break;
            }
            _loc4_++;
         }
      }
      
      public function getIconFilters() : Array
      {
         var _loc1_:GlowFilter = null;
         var _loc2_:DropShadowFilter = null;
         var _loc3_:GlowFilter = null;
         if(!this._iconFilters)
         {
            _loc1_ = new GlowFilter();
            _loc1_.blurX = 1;
            _loc1_.blurY = 1;
            _loc1_.color = 1703936;
            _loc1_.strength = 300;
            _loc2_ = new DropShadowFilter();
            _loc2_.blurX = 4;
            _loc2_.blurY = 4;
            _loc2_.distance = 2;
            _loc3_ = new GlowFilter();
            _loc3_.blurX = 2;
            _loc3_.blurY = 2;
            _loc3_.color = 1703936;
            this._iconFilters = [_loc1_,_loc3_];
         }
         return this._iconFilters;
      }
   }
}
