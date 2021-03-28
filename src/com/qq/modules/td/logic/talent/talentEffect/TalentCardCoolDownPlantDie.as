package com.qq.modules.td.logic.talent.talentEffect
{
   import com.qq.CommandName;
   import com.qq.modules.basic.event.CommonEvent;
   import com.qq.modules.td.data.game.unit.TDPlantStaticInfo;
   import com.qq.utils.CommandDispatcher;
   
   public class TalentCardCoolDownPlantDie extends TalentEffect
   {
       
      
      private var coolDownArg:Number;
      
      private var isTriggerCoolDown:Boolean = false;
      
      public function TalentCardCoolDownPlantDie()
      {
         super();
      }
      
      override public function setData(param1:Array) : void
      {
         this.coolDownArg = param1[0];
         CommandDispatcher._dispatcher.addEventListener(CommandName.TD_StartCardCooldown,this.growPlantHandler);
         CommandDispatcher._dispatcher.addEventListener(CommandName.TD_PLANT_REMOVE,this.removePlantHandler);
      }
      
      protected function growPlantHandler(param1:CommonEvent) : void
      {
         if(param1.param.plantType == this.plantType)
         {
            this.isTriggerCoolDown = false;
         }
      }
      
      protected function removePlantHandler(param1:CommonEvent) : void
      {
         if(param1.param.plantType == this.plantType)
         {
            this.isTriggerCoolDown = true;
         }
      }
      
      public function getPlugPlantCardCoolTime(param1:TDPlantStaticInfo) : Number
      {
         if(hasSamePlantType(param1) && this.isTriggerCoolDown == true)
         {
            return -this.coolDownArg;
         }
         return 0;
      }
      
      override public function dispose() : void
      {
         CommandDispatcher._dispatcher.removeEventListener(CommandName.TD_StartCardCooldown,this.growPlantHandler);
         CommandDispatcher._dispatcher.removeEventListener(CommandName.TD_PLANT_REMOVE,this.removePlantHandler);
      }
   }
}
