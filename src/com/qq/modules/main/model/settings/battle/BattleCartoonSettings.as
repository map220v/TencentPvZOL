package com.qq.modules.main.model.settings.battle
{
   import com.qq.modules.main.model.settings.battle.planSettings.PlanSetting;
   import flash.events.Event;
   import flash.net.URLLoader;
   import flash.net.URLRequest;
   import flash.utils.ByteArray;
   import flash.utils.Dictionary;
   
   public class BattleCartoonSettings
   {
      
      private static var battle_card_cartoon:Class = BattleCartoonSettings_battle_card_cartoon;
       
      
      private var planDic:Dictionary;
      
      private var planSettingAll:XML;
      
      public function BattleCartoonSettings()
      {
         super();
         var _loc1_:ByteArray = new battle_card_cartoon() as ByteArray;
         this.planSettingAll = XML(_loc1_.readUTFBytes(_loc1_.bytesAvailable));
         this.createPlanSetting();
      }
      
      public function reloadCartoonSettings() : void
      {
         var loader:URLLoader = null;
         var loadedHandler:Function = null;
         loadedHandler = function(param1:Event):void
         {
            loader.removeEventListener(Event.COMPLETE,loadedHandler);
            planSettingAll = XML(loader.data);
            createPlanSetting();
         };
         loader = new URLLoader();
         loader.addEventListener(Event.COMPLETE,loadedHandler);
         loader.load(new URLRequest("conf/battleCartoon/battle_card_cartoon.xml"));
      }
      
      private function createPlanSetting() : void
      {
         var _loc1_:XML = null;
         this.planDic = new Dictionary();
         for each(_loc1_ in this.planSettingAll..node)
         {
            this.planDic[String(_loc1_.@cardId)] = new PlanSetting(_loc1_);
         }
      }
      
      public function getPlanSetting(param1:String) : PlanSetting
      {
         var _loc2_:PlanSetting = this.planDic[param1] as PlanSetting;
         if(_loc2_ != null)
         {
            _loc2_.init();
         }
         return _loc2_;
      }
   }
}
