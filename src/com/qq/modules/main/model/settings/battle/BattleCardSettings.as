package com.qq.modules.main.model.settings.battle
{
   import com.qq.modules.main.model.settings.battle.ce.BattleLineupCardTemp;
   import org.as3commons.logging.api.getLogger;
   
   public class BattleCardSettings
   {
      
      public static const BATTLE_CARD_TYPE_ZOMBIE:uint = 1;
      
      public static const BATTLE_CARD_TYPE_PLANT:uint = 2;
       
      
      private var settingList:Array;
      
      public function BattleCardSettings()
      {
         var _loc3_:BattleLineupCardTemp = null;
         super();
         this.settingList = new Array();
         var _loc1_:int = BattleLineupTemplateFactory.instance.cacheBattleLineupCardTemplate.length;
         var _loc2_:int = 0;
         while(_loc2_ < _loc1_)
         {
            _loc3_ = BattleLineupTemplateFactory.instance.cacheBattleLineupCardTemplate[_loc2_];
            this.settingList[_loc3_.id] = _loc3_;
            _loc2_++;
         }
      }
      
      public function getBattleCardNextUpgradeCardInfo(param1:Number) : BattleLineupCardTemp
      {
         var _loc3_:BattleLineupCardTemp = null;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:BattleLineupCardTemp = null;
         var _loc2_:BattleLineupCardTemp = this.getBattleCardTempById(param1);
         if(_loc2_ != null && _loc2_.star < 5)
         {
            _loc4_ = BattleLineupTemplateFactory.instance.cacheBattleLineupCardTemplate.length;
            _loc5_ = 0;
            while(_loc5_ < _loc4_)
            {
               if((_loc6_ = BattleLineupTemplateFactory.instance.cacheBattleLineupCardTemplate[_loc5_]).tdId == _loc2_.tdId && _loc6_.star == _loc2_.star + 1)
               {
                  _loc3_ = _loc6_;
               }
               _loc5_++;
            }
         }
         return _loc3_;
      }
      
      public function getBattleCardTempById(param1:Number) : BattleLineupCardTemp
      {
         var _loc2_:BattleLineupCardTemp = this.settingList[param1];
         if(_loc2_ == null)
         {
            getLogger().warn("无法找到id: " + param1 + " 对应的战斗卡牌模版!");
         }
         return _loc2_;
      }
      
      public function getBattleCardTempByTDID(param1:int) : BattleLineupCardTemp
      {
         var _loc4_:BattleLineupCardTemp = null;
         var _loc2_:int = BattleLineupTemplateFactory.instance.cacheBattleLineupCardTemplate.length;
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            _loc4_ = BattleLineupTemplateFactory.instance.cacheBattleLineupCardTemplate[_loc3_];
            if(int(_loc4_.tdId) == param1)
            {
               return _loc4_;
            }
            _loc3_++;
         }
         return null;
      }
      
      public function getBattleCardTempByIconId(param1:int) : BattleLineupCardTemp
      {
         var _loc4_:BattleLineupCardTemp = null;
         var _loc2_:int = BattleLineupTemplateFactory.instance.cacheBattleLineupCardTemplate.length;
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            _loc4_ = BattleLineupTemplateFactory.instance.cacheBattleLineupCardTemplate[_loc3_];
            if(int(_loc4_.icon) == param1)
            {
               return _loc4_;
            }
            _loc3_++;
         }
         return null;
      }
   }
}
