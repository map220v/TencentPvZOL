package com.qq.modules.battle.view.control.unitBuff
{
   import com.qq.modules.battle.model.BattleBuffInfo;
   import com.qq.modules.battle.view.unit.UnitBase;
   
   public class UnitBuff
   {
      
      public static const ALIGN_BOTTOM:uint = 1;
      
      public static const ALIGN_TOP:uint = 2;
       
      
      public var buffID:int;
      
      public var buffType:int;
      
      public var targetIndex:uint;
      
      public var buffCount:int;
      
      public var icon:String;
      
      private var _effectRes:String;
      
      private var _align:int;
      
      protected var unit:UnitBase;
      
      public function UnitBuff()
      {
         super();
         this.buffCount = 1;
      }
      
      public function dispose() : void
      {
         if(this.unit)
         {
            this.unit = null;
         }
      }
      
      public function reduceBuffCount() : void
      {
         --this.buffCount;
      }
      
      public function addBuffCount() : void
      {
         ++this.buffCount;
      }
      
      public function setData(param1:UnitBase) : void
      {
         this.unit = param1;
         this.render();
      }
      
      public function setInfo(param1:BattleBuffInfo, param2:int) : void
      {
         this.buffID = param1.buffID;
         this.buffType = param1.buffType;
         this.targetIndex = param2;
         this.icon = BattleBuffFactory.getBuffIcon(this.buffID,this.buffType);
      }
      
      public function getEffectResName() : String
      {
         if(this._effectRes == null)
         {
            this._effectRes = BattleBuffFactory.getBuffEffectResName(this.buffID,this.buffType);
         }
         return this._effectRes;
      }
      
      public function getAlign() : int
      {
         if(this._align == 0)
         {
            this._align = BattleBuffFactory.getBuffalign(this.buffID,this.buffType);
         }
         return this._align;
      }
      
      protected function render() : void
      {
      }
   }
}
