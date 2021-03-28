package com.qq.modules.td.logic.talent.talentEffect
{
   import com.qq.CommandName;
   import com.qq.modules.basic.event.CommonEvent;
   import com.qq.modules.td.data.game.unit.TDPlantStaticInfo;
   import com.qq.utils.CommandDispatcher;
   
   public class TalentCardCoolDownIcon extends TalentCardCoolDown
   {
       
      
      private var putOutFire:Boolean = false;
      
      public function TalentCardCoolDownIcon()
      {
         super();
      }
      
      override public function setData(param1:Array) : void
      {
         super.setData(param1);
         CommandDispatcher._dispatcher.addEventListener(CommandName.TD_PutoutFire,this.putoutFireHander);
      }
      
      private function putoutFireHander(param1:CommonEvent) : void
      {
         this.putOutFire = true;
      }
      
      override protected function growPlantHandler(param1:CommonEvent) : void
      {
         super.growPlantHandler(param1);
         this.putOutFire = false;
      }
      
      override public function getPlantCardCoolTime(param1:TDPlantStaticInfo) : Number
      {
         if(hasSamePlantType(param1))
         {
            if(param1.baseInfo.id == 1700)
            {
               if(this.putOutFire)
               {
                  return super.getPlantCardCoolTime(param1);
               }
               return param1.baseInfo.cardRefreshDuration;
            }
            return super.getPlantCardCoolTime(param1);
         }
         return param1.baseInfo.cardRefreshDuration;
      }
      
      override public function dispose() : void
      {
         CommandDispatcher._dispatcher.removeEventListener(CommandName.TD_PutoutFire,this.putoutFireHander);
         super.dispose();
      }
   }
}
