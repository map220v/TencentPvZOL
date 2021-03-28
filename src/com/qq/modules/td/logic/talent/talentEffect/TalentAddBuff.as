package com.qq.modules.td.logic.talent.talentEffect
{
   public class TalentAddBuff extends TalentEffect implements ITalentEffect
   {
       
      
      private var _buffId:int;
      
      private var _rate:Number;
      
      public function TalentAddBuff()
      {
         super();
      }
      
      override public function setData(param1:Array) : void
      {
         super.setData(param1);
         this._buffId = param1[0];
         this._rate = param1[1];
      }
      
      public function getAddBuffId() : int
      {
         if(Math.random() * 100 > this._rate)
         {
            return 0;
         }
         return this._buffId;
      }
      
      override public function dispose() : void
      {
         super.dispose();
      }
   }
}
