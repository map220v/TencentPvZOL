package com.qq.modules.embattle
{
   import asgui.resources.AssetManager;
   import com.qq.display.QIconWithLabel;
   import com.qq.templates.font.FontHKHB;
   
   public class EmbattleUtils
   {
       
      
      public function EmbattleUtils()
      {
         super();
      }
      
      private static function createEmbattleIconButton(param1:String, param2:String) : QIconWithLabel
      {
         var _loc3_:QIconWithLabel = null;
         _loc3_ = new QIconWithLabel(param1,AssetManager.GetClass(param2),".TXT_HKHB_16_Yellow_Shadow");
         _loc3_.labelMouseEnabled = false;
         _loc3_.width = 66;
         _loc3_.height = 66;
         _loc3_.txt.height = 24;
         _loc3_.txt.bottom = 0;
         return _loc3_;
      }
      
      public static function createDummyButton() : QIconWithLabel
      {
         return createEmbattleIconButton(FontHKHB.Dummy,"btn_embattle_dummy");
      }
      
      public static function createNutritionButton() : QIconWithLabel
      {
         return createEmbattleIconButton(FontHKHB.NUTRITION_EXCHANGE_TITLE,"btn_embattle_nutrition");
      }
      
      public static function createSetOutButton() : QIconWithLabel
      {
         return createEmbattleIconButton(FontHKHB.SET_OUT,"btn_embattle_start");
      }
      
      public static function createStartFightButton() : QIconWithLabel
      {
         return createEmbattleIconButton(FontHKHB.START_FIGHT,"btn_embattle_start");
      }
      
      public static function createHealthButton() : QIconWithLabel
      {
         return createEmbattleIconButton(FontHKHB.HEALTH,"btn_embattle_health");
      }
      
      public static function createRecoverButton() : QIconWithLabel
      {
         return createEmbattleIconButton(FontHKHB.FIX_HP,"btn_embattle_recover");
      }
      
      public static function createLeaderButton() : QIconWithLabel
      {
         return createEmbattleIconButton(FontHKHB.SET_LEADER,"btn_embattle_leader");
      }
   }
}
