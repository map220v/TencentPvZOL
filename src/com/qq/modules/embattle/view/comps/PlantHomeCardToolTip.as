package com.qq.modules.embattle.view.comps
{
   import PVZ.Cmd.Dto_CardFullInfo;
   import PVZ.Cmd.Dto_FightCardInfo;
   import com.qq.tooltip.PlantCardToolTip;
   
   public class PlantHomeCardToolTip extends PlantCardToolTip
   {
       
      
      public function PlantHomeCardToolTip(param1:Class = null)
      {
         super(param1);
      }
      
      override public function update(param1:Dto_CardFullInfo, param2:int = 0) : void
      {
         super.update(param1,param2);
         hpBar.setPercent(param1.base.currentHp.toNumber() / param1.hp.toNumber());
      }
      
      override public function updateWithFightCard(param1:Dto_FightCardInfo, param2:int = 0) : void
      {
         super.updateWithFightCard(param1,param2);
      }
   }
}
