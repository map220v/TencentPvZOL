package com.qq.constant
{
   import asgui.resources.AssetManager;
   import com.qq.modules.main.model.templates.CardHealthTemplate;
   import com.qq.modules.main.model.templates.CardHealthTemplateFactory;
   
   public class BattleCardStatus
   {
      
      public static const FORMATION_NO:int = 0;
      
      public static const FORMATION_HOME:int = 1;
      
      public static const FORMATION_DEFENCE:int = 2;
      
      public static const FORMATION_OUT:int = 3;
       
      
      public function BattleCardStatus()
      {
         super();
      }
      
      public static function getCardHealthIcon(param1:int) : Object
      {
         var _loc2_:CardHealthTemplate = CardHealthTemplateFactory.instance.getCardHealthInfo(param1);
         if(_loc2_)
         {
            return AssetManager.GetClass("battle_ui_health_leaf" + _loc2_.id);
         }
         return AssetManager.GetClass("battle_ui_health_leaf1");
      }
      
      public static function getCardHealthColor(param1:int) : uint
      {
         if(param1 < 80)
         {
            return 16711680;
         }
         return 16777215;
      }
   }
}
