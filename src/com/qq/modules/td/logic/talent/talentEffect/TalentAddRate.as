package com.qq.modules.td.logic.talent.talentEffect
{
   public class TalentAddRate extends TalentEffect implements ITalentEffect
   {
       
      
      private var _addRate:Number = 0;
      
      public function TalentAddRate()
      {
         super();
      }
      
      override public function setData(param1:Array) : void
      {
         super.setData(param1);
         this._addRate = param1[0];
      }
      
      public function getAddRate() : Number
      {
         return this._addRate;
      }
      
      override public function dispose() : void
      {
         super.dispose();
      }
   }
}
