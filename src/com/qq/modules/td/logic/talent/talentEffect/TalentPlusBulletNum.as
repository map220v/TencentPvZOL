package com.qq.modules.td.logic.talent.talentEffect
{
   import com.qq.modules.td.data.game.unit.TDPlantStaticInfo;
   
   public class TalentPlusBulletNum extends TalentEffect
   {
       
      
      private var plusNum:int;
      
      private var triggerRate:Number;
      
      public function TalentPlusBulletNum()
      {
         super();
      }
      
      override public function setData(param1:Array) : void
      {
         this.plusNum = param1[0];
         this.triggerRate = param1[1];
      }
      
      public function getPlusBulletNum(param1:TDPlantStaticInfo) : int
      {
         var _loc2_:Number = NaN;
         if(hasSamePlantType(param1))
         {
            _loc2_ = Math.random() * 100;
            if(_loc2_ < this.triggerRate)
            {
               return this.plusNum;
            }
         }
         return 0;
      }
   }
}
