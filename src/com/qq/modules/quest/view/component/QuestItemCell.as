package com.qq.modules.quest.view.component
{
   import asgui.resources.AssetManager;
   import com.qq.modules.bag.ItemType;
   import com.qq.modules.bag.model.BagItemTemplate;
   import com.qq.modules.bag.model.ItemTemplateFactory;
   import com.qq.modules.card.model.templates.CardChestAvatarTemp;
   import com.qq.modules.card.model.templates.CardTemplateFactory;
   import com.qq.modules.main.model.AddictInfo;
   import com.qq.modules.main.model.SettingsModel;
   import com.qq.modules.main.model.settings.battle.ce.BattleLineupCardTemp;
   import com.tencent.protobuf.Int64;
   import flash.display.DisplayObject;
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.utils.getQualifiedClassName;
   
   public class QuestItemCell extends QuestItemCellCE
   {
       
      
      public var itemID:int;
      
      public var num:int;
      
      public var uid:Int64;
      
      private var _isNeedBG:Boolean;
      
      private var _cardID:int;
      
      public function QuestItemCell(param1:Boolean = false)
      {
         this._isNeedBG = param1;
         super();
      }
      
      override public function InitializeComponent() : void
      {
         var _loc1_:MovieClip = null;
         super.InitializeComponent();
         this.imageLoader.mask = this.imgMask;
         this.itemID = 0;
         label_6.SetStyle("textAlign","right");
         if(this._isNeedBG)
         {
            _loc1_ = AssetManager.instance.GetNewClass("UI_Item_BG") as MovieClip;
            _loc1_.x = 5;
            _loc1_.y = 5;
            addChildAt(_loc1_,0);
         }
      }
      
      public function setData(param1:int, param2:int, param3:Int64 = null, param4:Boolean = false) : void
      {
         imageLoader.removeEventListener(Event.COMPLETE,this.onLoadCompete);
         this.itemID = param1;
         this.num = param2;
         this.uid = param3;
         var _loc5_:BagItemTemplate;
         if(!(_loc5_ = ItemTemplateFactory.instance.getBagItemTemplateById(param1)))
         {
            return;
         }
         imageLoader.source = _loc5_.iconSource;
         if(_loc5_.type == ItemType.TYPE_CARD)
         {
            this._cardID = _loc5_.cardItemId.split(":")[0];
            imageLoader.addEventListener(Event.COMPLETE,this.onLoadCompete);
         }
         if(_loc5_.type == ItemType.TYPE_CARD)
         {
            imageLoader.scaleX = imageLoader.scaleY = 0.4;
            imageLoader.scrollRectEnabled = false;
         }
         else
         {
            imageLoader.scaleX = imageLoader.scaleY = 1;
            imageLoader.scrollRectEnabled = true;
         }
         if(param4)
         {
            label_6.text = AddictInfo.getInstance().updateAddictRewardNum(param1,param2).toString();
         }
         else
         {
            label_6.text = param2.toString();
         }
         var _loc6_:String = _loc5_.name;
         if(_loc5_.desc.length > 0)
         {
            _loc6_ += "\n" + _loc5_.desc;
         }
         this.toolTip = _loc6_;
      }
      
      private function onLoadCompete(param1:Event) : void
      {
         imageLoader.removeEventListener(Event.COMPLETE,this.onLoadCompete);
         this.setNormalAvater(this._cardID);
      }
      
      public function setNumVisible(param1:Boolean) : void
      {
         label_6.visible = param1;
      }
      
      public function clean() : void
      {
         this.itemID = 0;
         this.num = 0;
      }
      
      private function setNormalAvater(param1:int) : void
      {
         var _loc4_:Array = null;
         var _loc2_:BattleLineupCardTemp = SettingsModel.instance.battleCardSettings.getBattleCardTempById(param1);
         var _loc3_:CardChestAvatarTemp = CardTemplateFactory.instance.getPlantAvatarByTdPlantId(_loc2_.tdId);
         if(_loc3_ != null)
         {
            _loc4_ = _loc3_.hidePartCardList;
            if(imageLoader.loader.content != null)
            {
               this.hidePart(imageLoader.loader.content as MovieClip,_loc4_);
            }
         }
      }
      
      private function hidePart(param1:MovieClip, param2:Array) : void
      {
         var _loc5_:DisplayObject = null;
         var _loc3_:int = param1.numChildren;
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            if((_loc5_ = param1.getChildAt(_loc4_)) is MovieClip)
            {
               _loc5_.visible = true;
               this.checkHide(_loc5_ as MovieClip,param2);
               this.hidePart(_loc5_ as MovieClip,param2);
            }
            _loc4_++;
         }
      }
      
      private function checkHide(param1:MovieClip, param2:Array) : void
      {
         var _loc3_:String = getQualifiedClassName(param1);
         _loc3_ = _loc3_.substr(_loc3_.lastIndexOf("::") + 1);
         var _loc4_:int = param2.length;
         var _loc5_:int = 0;
         while(_loc5_ < _loc4_)
         {
            if(_loc3_ == param2[_loc5_])
            {
               param1.visible = false;
               break;
            }
            _loc5_++;
         }
      }
      
      override public function Dispose() : void
      {
         if(imageLoader != null)
         {
            imageLoader.removeEventListener(Event.COMPLETE,this.onLoadCompete);
         }
         super.Dispose();
      }
   }
}
