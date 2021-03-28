package com.qq.modules.td.logic.talent.talentEffect
{
   import com.qq.CommandName;
   import com.qq.modules.basic.event.CommonEvent;
   import com.qq.modules.td.logic.action.plant.sunflower.PlanProductItem;
   import com.qq.modules.td.logic.unit.basic.IGameObject;
   import com.qq.utils.CommandDispatcher;
   
   public class TalentGrowPlantSunDrop extends TalentEffect
   {
       
      
      private var plantNumLimit:int;
      
      private var dropType:int;
      
      private var dropNum:int;
      
      private var plantNum:int = 0;
      
      public function TalentGrowPlantSunDrop()
      {
         super();
      }
      
      override public function setData(param1:Array) : void
      {
         super.setData(param1);
         this.plantNumLimit = param1[0];
         this.dropNum = param1[1];
         this.dropType = param1[2];
         CommandDispatcher._dispatcher.addEventListener(CommandName.TD_StartCardCooldown,this.growPlantHandler);
      }
      
      public function growPlantHandler(param1:CommonEvent) : void
      {
         if(param1.param.plantType == this.plantType)
         {
            ++this.plantNum;
         }
      }
      
      public function growPlantSunDrop(param1:IGameObject) : void
      {
         if(this.plantNum == this.plantNumLimit)
         {
            this.plantNum = 0;
            this.dropSun(param1);
         }
      }
      
      private function dropSun(param1:IGameObject) : void
      {
         var _loc2_:PlanProductItem = new PlanProductItem(param1,this.dropType,this.dropNum,20,0);
         _loc2_.doPlan(null);
      }
      
      override public function dispose() : void
      {
         CommandDispatcher._dispatcher.removeEventListener(CommandName.TD_StartCardCooldown,this.growPlantHandler);
      }
   }
}
