package com.qq.constant.bag
{
   import com.qq.display.CardItemFactory;
   import com.qq.modules.bag.ItemType;
   import com.qq.modules.bag.model.BagItemTemplate;
   import com.qq.modules.bag.model.ItemTemplateFactory;
   import com.qq.modules.card.model.templates.CardChestAvatarTemp;
   import com.qq.modules.card.model.templates.CardTemplateFactory;
   import com.qq.modules.main.model.SettingsModel;
   import com.qq.modules.main.model.settings.battle.BattleLineupTemplateFactory;
   import com.qq.modules.main.model.settings.battle.ce.BattleLineupCardTemp;
   import com.qq.modules.td.data.TDDataFactory;
   import com.qq.modules.td.data.game.unit.TDPlantStaticInfo;
   import com.qq.utils.UrlManager;
   
   public class BagItemUtil
   {
       
      
      public function BagItemUtil()
      {
         super();
      }
      
      public static function getBagItemImageSource(param1:int) : String
      {
         var _loc3_:int = 0;
         var _loc4_:BattleLineupCardTemp = null;
         var _loc2_:BagItemTemplate = ItemTemplateFactory.instance.getBagItemTemplateById(param1);
         if(_loc2_ == null)
         {
            return "";
         }
         if(_loc2_.type == ItemType.TYPE_CARD)
         {
            _loc3_ = _loc2_.cardItemId.split(":")[0];
            _loc4_ = SettingsModel.instance.battleCardSettings.getBattleCardTempById(_loc3_);
            return CardItemFactory.getIconURL(_loc4_.icon);
         }
         return UrlManager.getUrl(UrlManager.Url_ItemIcon,_loc2_.icon + ".png");
      }
      
      public static function getBattleCardTempWithItemId(param1:int) : BattleLineupCardTemp
      {
         var _loc3_:int = 0;
         var _loc4_:BattleLineupCardTemp = null;
         var _loc2_:BagItemTemplate = ItemTemplateFactory.instance.getBagItemTemplateById(param1);
         if(_loc2_.type == ItemType.TYPE_CARD)
         {
            _loc3_ = _loc2_.cardItemId.split(":")[0];
            return SettingsModel.instance.battleCardSettings.getBattleCardTempById(_loc3_);
         }
         return null;
      }
      
      public static function getIconIDByImageSource(param1:String) : int
      {
         var _loc2_:String = param1.substring(param1.indexOf("card_icon_") + "card_icon_".length);
         _loc2_ = (_loc2_.split(".")[0] as String).split("_")[0];
         var _loc3_:int = int(_loc2_);
         var _loc4_:TDPlantStaticInfo;
         return (_loc4_ = TDDataFactory.instance.getPlantInfoByIconID(_loc3_)).id;
      }
      
      public static function getBagCardItemHidePart(param1:int) : Array
      {
         var _loc3_:int = 0;
         var _loc4_:BattleLineupCardTemp = null;
         var _loc5_:CardChestAvatarTemp = null;
         var _loc2_:BagItemTemplate = ItemTemplateFactory.instance.getBagItemTemplateById(param1);
         if(_loc2_.type == ItemType.TYPE_CARD)
         {
            _loc3_ = _loc2_.cardItemId.split(":")[0];
            if((_loc4_ = BattleLineupTemplateFactory.instance.getBattleLineupCardTemplateById(_loc3_)) != null)
            {
               _loc5_ = CardTemplateFactory.instance.getPlantAvatarByTdPlantId(_loc4_.tdId);
            }
            if(_loc5_ && _loc5_.hidePartCardList)
            {
               return _loc5_.hidePartCardList;
            }
         }
         return [];
      }
   }
}
