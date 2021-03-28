package com.qq.modules.battle.model
{
   import com.qq.modules.battle.view.control.unitBuff.BattleBuffFactory;
   
   public class BattleBuffInfo
   {
       
      
      public var buffID:int;
      
      public var buffType:int;
      
      public var buffLeftRound:int;
      
      public var icon:String;
      
      public var skillLv:int;
      
      public function BattleBuffInfo(param1:int, param2:int, param3:int, param4:int = -1)
      {
         super();
         this.buffID = param1;
         this.buffType = param2;
         this.buffLeftRound = param3;
         this.icon = BattleBuffFactory.getBuffIcon(this.buffID,this.buffType);
         this.skillLv = param4;
      }
   }
}
