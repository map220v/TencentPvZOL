package com.qq.modules.main.model.settings.battleCard
{
   import com.qq.modules.main.model.settings.battleCard.ce.BattleCardMarketSettingCE;
   
   public class BattleCardMarketSetting extends BattleCardMarketSettingCE
   {
       
      
      public var buyType:int;
      
      public var buyCost:Number;
      
      public function BattleCardMarketSetting()
      {
         super();
      }
      
      override public function load(param1:Object) : void
      {
         super.load(param1);
         var _loc2_:Array = _costStr.split(":");
         this.buyType = _loc2_[0];
         this.buyCost = _loc2_[1];
      }
   }
}
