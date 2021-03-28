package com.qq.modules.td.logic.talent.talentEffect
{
   import com.qq.CommandName;
   import com.qq.modules.basic.event.CommonEvent;
   import com.qq.modules.td.data.game.unit.TDPlantStaticInfo;
   import com.qq.utils.CommandDispatcher;
   
   public class TalentCardCoolDown extends TalentEffect implements ITalentEffect
   {
       
      
      private var coolDownArg:Number;
      
      private var plantNumLimit:Number;
      
      private var curPlantNum:int = 0;
      
      public function TalentCardCoolDown()
      {
         super();
      }
      
      override public function setData(param1:Array) : void
      {
         super.params = param1;
         this.coolDownArg = param1[0];
         this.plantNumLimit = param1[1];
         if(this.plantNumLimit == 0)
         {
            this.plantNumLimit = int.MAX_VALUE;
         }
         CommandDispatcher._dispatcher.addEventListener(CommandName.TD_StartCardCooldown,this.growPlantHandler);
      }
      
      public function getPlantCardCoolTime(param1:TDPlantStaticInfo) : Number
      {
         if(hasSamePlantType(param1))
         {
            if(this.curPlantNum < this.plantNumLimit)
            {
               return param1.baseInfo.cardRefreshDuration - this.coolDownArg;
            }
         }
         return param1.baseInfo.cardRefreshDuration;
      }
      
      protected function growPlantHandler(param1:CommonEvent) : void
      {
         if(param1.param.plantType == this.plantType)
         {
            ++this.curPlantNum;
            CommandDispatcher.send(CommandName.TD_TALENT_UPDATE);
         }
      }
      
      override public function dispose() : void
      {
         CommandDispatcher._dispatcher.removeEventListener(CommandName.TD_StartCardCooldown,this.growPlantHandler);
      }
   }
}
