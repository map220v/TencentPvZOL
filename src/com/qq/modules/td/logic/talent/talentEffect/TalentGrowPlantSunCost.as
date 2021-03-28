package com.qq.modules.td.logic.talent.talentEffect
{
   import com.qq.CommandName;
   import com.qq.modules.basic.event.CommonEvent;
   import com.qq.modules.td.data.game.unit.TDPlantStaticInfo;
   import com.qq.utils.CommandDispatcher;
   
   public class TalentGrowPlantSunCost extends TalentEffect implements ITalentEffect
   {
       
      
      private var plantNumLimit:int;
      
      private var sunCostArg:int;
      
      private var plantNum:int = 0;
      
      public function TalentGrowPlantSunCost()
      {
         super();
      }
      
      override public function setData(param1:Array) : void
      {
         super.setData(param1);
         this.sunCostArg = param1[0];
         this.plantNumLimit = param1[1];
         if(this.plantNumLimit == 0)
         {
            this.plantNumLimit = int.MAX_VALUE;
         }
         CommandDispatcher._dispatcher.addEventListener(CommandName.TD_StartCardCooldown,this.growPlantHandler);
      }
      
      public function getGrowPlantSunCost(param1:TDPlantStaticInfo) : Number
      {
         if(hasSamePlantType(param1))
         {
            if(this.plantNum < this.plantNumLimit)
            {
               return param1.baseInfo.price - this.sunCostArg;
            }
         }
         return param1.baseInfo.price;
      }
      
      public function isGrowPlantSunCostChange(param1:TDPlantStaticInfo) : Boolean
      {
         if(hasSamePlantType(param1))
         {
            if(this.plantNum < this.plantNumLimit)
            {
               return true;
            }
         }
         return false;
      }
      
      public function growPlantHandler(param1:CommonEvent) : void
      {
         if(param1.param.plantType == this.plantType)
         {
            ++this.plantNum;
            CommandDispatcher.send(CommandName.TD_TALENT_UPDATE);
         }
      }
      
      override public function dispose() : void
      {
         CommandDispatcher._dispatcher.removeEventListener(CommandName.TD_StartCardCooldown,this.growPlantHandler);
      }
   }
}
