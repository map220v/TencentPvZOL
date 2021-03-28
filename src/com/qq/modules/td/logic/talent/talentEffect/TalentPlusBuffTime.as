package com.qq.modules.td.logic.talent.talentEffect
{
   import com.qq.modules.td.data.game.buff.TDBuffStaticInfo;
   import com.qq.modules.td.data.game.unit.TDPlantStaticInfo;
   
   public class TalentPlusBuffTime extends TalentEffect
   {
       
      
      private var plugTime:Number;
      
      private var buffId:int;
      
      public function TalentPlusBuffTime()
      {
         super();
      }
      
      override public function setData(param1:Array) : void
      {
         this.buffId = param1[0];
         this.plugTime = param1[1];
      }
      
      public function getPlugBuffTime(param1:TDPlantStaticInfo, param2:TDBuffStaticInfo) : Number
      {
         if(hasSamePlantType(param1) && this.buffId == param2.id)
         {
            return param2.duration.get() + this.plugTime;
         }
         return param2.duration.get();
      }
   }
}
