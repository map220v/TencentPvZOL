package com.qq.tooltip
{
   import PVZ.Cmd.Dto_CardFullInfo;
   
   public class PlantZombieCardToolTip extends PlantCardToolTip
   {
       
      
      public function PlantZombieCardToolTip(param1:Class = null)
      {
         super(PlantZombieCardToolTipMediator);
      }
      
      override public function update(param1:Dto_CardFullInfo, param2:int = 0) : void
      {
         super.update(param1);
      }
   }
}
