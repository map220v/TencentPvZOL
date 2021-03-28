package com.qq.modules.main.model.settings.battle.ce
{
   import com.qq.templates.font.FontNormal;
   
   public class BattleLineupCardFeatureTemp extends BattleLineupCardFeatureTemplateCE
   {
       
      
      public function BattleLineupCardFeatureTemp()
      {
         super();
      }
      
      public function get descWithValue() : String
      {
         var _loc1_:String = null;
         if(sign == 1)
         {
            _loc1_ = FontNormal.INCREASE;
         }
         else if(sign == 2)
         {
            _loc1_ = FontNormal.DECREASE;
         }
         if(valueType == 1)
         {
            return _loc1_ + int(value / 100) + desc;
         }
         return _loc1_ + value + desc;
      }
      
      public function getSimpleDescWithValue() : String
      {
         var _loc1_:String = null;
         if(sign == 1)
         {
            _loc1_ = "+";
         }
         else if(sign == 2)
         {
            _loc1_ = "-";
         }
         if(valueType == 1)
         {
            return simpleDesc + _loc1_ + int(value / 100) + "%";
         }
         return simpleDesc + _loc1_ + value;
      }
   }
}
