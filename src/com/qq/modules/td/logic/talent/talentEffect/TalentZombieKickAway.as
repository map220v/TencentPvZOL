package com.qq.modules.td.logic.talent.talentEffect
{
   public class TalentZombieKickAway extends TalentEffect implements ITalentEffect
   {
       
      
      private var _rate:Number;
      
      public function TalentZombieKickAway()
      {
         super();
      }
      
      override public function setData(param1:Array) : void
      {
         super.setData(param1);
         this._rate = param1[0];
      }
      
      public function getKickAwayEnable() : Boolean
      {
         if(Math.random() * 100 <= this._rate)
         {
            return true;
         }
         return false;
      }
      
      override public function dispose() : void
      {
         super.dispose();
      }
   }
}
