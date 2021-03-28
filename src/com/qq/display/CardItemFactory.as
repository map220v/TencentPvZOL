package com.qq.display
{
   import PVZ.Cmd.Dto_ItemInfo;
   import com.qq.constant.CardQuality;
   import com.qq.modules.bag.ItemType;
   import com.qq.modules.bag.model.BagItemTemplate;
   import com.qq.modules.card.model.templates.CardTemplateFactory;
   import com.qq.modules.main.model.SettingsModel;
   import com.qq.modules.main.view.newcard.BaseCardView;
   import com.qq.modules.main.view.newcard.IBaseCardView;
   import com.qq.modules.main.view.newcard.ItemCardView;
   import com.qq.utils.UrlManager;
   
   public class CardItemFactory
   {
      
      public static const useImg:Boolean = false;
       
      
      public function CardItemFactory()
      {
         super();
      }
      
      public static function getIconURL(param1:int, param2:int = 0) : String
      {
         var _loc3_:String = null;
         if(useImg)
         {
            if(param2 == 0)
            {
               param2 = CardTemplateFactory.instance.getDefaultAvatarIDByIconId(param1);
            }
            _loc3_ = UrlManager.getUrl(UrlManager.Url_Card_icon,param1 + "_" + param2 + ".png");
         }
         else
         {
            _loc3_ = UrlManager.getUrl(UrlManager.Url_Card_icon,"card_icon_" + param1 + ".swf");
         }
         return _loc3_;
      }
      
      public static function createNewCardView(param1:int, param2:int) : BaseCardView
      {
         var _loc3_:BaseCardView = null;
         var _loc4_:BagItemTemplate;
         if((_loc4_ = SettingsModel.instance.itemSetting.getBagItemTemplateById(param1)).type != ItemType.TYPE_CARD)
         {
            if(_loc4_.type != ItemType.TYPE_EQUIP)
            {
               _loc3_ = new ItemCardView();
            }
         }
         updateNewCardView(_loc3_,param1,param2);
         return _loc3_;
      }
      
      public static function updateNewCardView(param1:IBaseCardView, param2:int, param3:int) : void
      {
         if(param1 is ItemCardView)
         {
            param1.resetCardForItem(param2,param3);
         }
      }
      
      public static function createCardItemByBagItemId(param1:int, param2:int, param3:Dto_ItemInfo = null) : CardItem
      {
         var _loc4_:CardItem = new CardItem();
         updateCardItemByBagItemId(_loc4_,param1,param2,param3);
         return _loc4_;
      }
      
      public static function updateCardItemByBagItemId(param1:CardItem, param2:int, param3:int, param4:Dto_ItemInfo = null) : void
      {
         var _loc6_:int = 0;
         param1.resetView();
         var _loc5_:BagItemTemplate;
         if((_loc5_ = SettingsModel.instance.itemSetting.getBagItemTemplateById(param2)).type == ItemType.TYPE_CARD)
         {
            _loc6_ = _loc5_.cardItemId.split(":")[0];
            param1.setDataByCardId(_loc6_);
            param1.setStrengthLv(0);
            param1.setQuiltyLvNum(1,0);
            param1.setQuality(CardQuality.WHITE);
            if(param4)
            {
               param1.setBagEquipItem(param4);
            }
            else
            {
               param1.setBagCardItem(param2);
            }
         }
         else if(_loc5_.type == ItemType.TYPE_EQUIP)
         {
            param1.setCardIcon(_loc5_.iconSource,true);
            if(param4)
            {
               param1.setQuality(param4.equip.quality);
               param1.setBagEquipItem(param4);
            }
            else
            {
               param1.setStar(_loc5_.quality,0);
               param1.setQuality(CardQuality.WHITE);
               param1.setBagCardItem(param2);
            }
         }
         else
         {
            param1.setCardIcon(_loc5_.iconSource,true);
            param1.setNum(param3);
            param1.setStar(0,0);
            param1.setQuality(_loc5_.quality);
            param1.setBagCardItem(param2);
         }
      }
   }
}
