package com.qq.modules.td.logic.talent.talentEffect
{
   public class TalentExplodeAtLastZombie extends TalentEffect implements ITalentEffect
   {
       
      
      private var _radius:int;
      
      private var _damage:int;
      
      private var _effectId:int;
      
      public function TalentExplodeAtLastZombie()
      {
         super();
      }
      
      override public function setData(param1:Array) : void
      {
         super.setData(param1);
         this._radius = param1[0];
         this._damage = param1[1];
         this._effectId = param1[2];
      }
      
      public function getExplodeParams() : Array
      {
         return [this._radius,this._damage,this._effectId];
      }
      
      override public function dispose() : void
      {
         super.dispose();
      }
   }
}
