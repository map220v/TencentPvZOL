package com.qq.modules.td.logic.talent.talentEffect
{
   public class TalentDamagePlus extends TalentEffect implements ITalentEffect
   {
       
      
      private var _plantId:int;
      
      private var _targetType:int;
      
      private var _damagePlus:Number;
      
      public function TalentDamagePlus()
      {
         super();
      }
      
      override public function setData(param1:Array) : void
      {
         super.setData(param1);
         this._plantId = param1[0];
         this._targetType = param1[1];
         this._damagePlus = param1[2];
      }
      
      public function getDamagePlus(param1:int) : Number
      {
         if(this._targetType == param1)
         {
            return this._damagePlus;
         }
         return 1;
      }
      
      override public function dispose() : void
      {
         super.dispose();
      }
   }
}
