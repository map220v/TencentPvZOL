package com.qq.modules.td.logic.talent.talentEffect
{
   import com.qq.constant.td.TDConstant;
   import com.qq.modules.td.data.game.unit.TDPlantBaseStaticInfo;
   import com.qq.modules.td.logic.action.plant.sunflower.PlanProductItem;
   import com.qq.modules.td.logic.unit.basic.IGameObject;
   import com.qq.modules.td.model.TDStageInfo;
   
   public class TalentAttackZombieDrop extends TalentEffect
   {
       
      
      private var dropRate:Number;
      
      private var dropNum:Number;
      
      private var dropType:int;
      
      public function TalentAttackZombieDrop()
      {
         super();
      }
      
      override public function setData(param1:Array) : void
      {
         super.setData(param1);
         this.dropRate = param1[0];
         this.dropNum = param1[1];
         this.dropType = param1[2];
      }
      
      public function getDropSun(param1:TDPlantBaseStaticInfo, param2:IGameObject) : Number
      {
         var _loc3_:Number = NaN;
         if(TDStageInfo.getInstance().tdGameType == TDConstant.TDGameType_Boss)
         {
            return 0;
         }
         if(hasSamePlantType2(param1))
         {
            _loc3_ = Math.round(Math.random() * 100);
            if(_loc3_ < this.dropRate)
            {
               this.dropSun(param2);
               return this.dropNum;
            }
         }
         return 0;
      }
      
      private function dropSun(param1:IGameObject) : void
      {
         var _loc2_:PlanProductItem = new PlanProductItem(param1,this.dropType,this.dropNum,20,0);
         _loc2_.doPlan(null);
      }
      
      override public function dispose() : void
      {
         super.dispose();
      }
   }
}
