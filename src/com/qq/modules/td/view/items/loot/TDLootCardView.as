package com.qq.modules.td.view.items.loot
{
   import com.qq.data.DataCacheManager;
   import com.qq.display.TDCardItem;
   import com.qq.modules.td.data.game.TDPlantBaseData;
   import com.qq.modules.td.data.game.unit.TDPlantBaseStaticInfo;
   import com.qq.utils.db.ClientDBTableName;
   import flash.display.Sprite;
   
   public class TDLootCardView extends TDLootItemView
   {
       
      
      public var plantData:TDPlantBaseData;
      
      public function TDLootCardView()
      {
         super(TDLootCardViewMediator);
      }
      
      override public function reset(param1:Object = null) : void
      {
         super.reset(param1);
         this.plantData = param1 as TDPlantBaseData;
         this.initUI();
      }
      
      private function initUI() : void
      {
         this.scrollRectEnabled = false;
         var _loc1_:TDPlantBaseStaticInfo = DataCacheManager.getInstance().getTemplateDataById(ClientDBTableName.Table_PlantTypeInfo,this.plantData.type,TDPlantBaseStaticInfo);
         if(_loc1_ == null)
         {
            return;
         }
         var _loc2_:Sprite = new Sprite();
         addChild(_loc2_);
         var _loc3_:TDCardItem = new TDCardItem();
         _loc3_.setCard(_loc1_.id);
         _loc3_.x = 3;
         _loc2_.addChild(_loc3_);
         _loc2_.x = -_loc2_.width * 0.5;
         _loc2_.y = -_loc2_.height * 0.5;
      }
   }
}
