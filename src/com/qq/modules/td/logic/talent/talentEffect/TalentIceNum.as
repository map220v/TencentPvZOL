package com.qq.modules.td.logic.talent.talentEffect
{
   import com.qq.modules.td.data.game.unit.TDPlantStaticInfo;
   
   public class TalentIceNum extends TalentEffect
   {
       
      
      private var iceRate:Number;
      
      public function TalentIceNum()
      {
         super();
      }
      
      override public function setData(param1:Array) : void
      {
         super.setData(param1);
         this.iceRate = param1[0];
      }
      
      public function getIceNum(param1:TDPlantStaticInfo) : Number
      {
         var _loc2_:int = 0;
         if(hasSamePlantType(param1))
         {
            _loc2_ = Math.round(Math.random() * 100);
            if(_loc2_ < this.iceRate)
            {
               return 100;
            }
         }
         return 1;
      }
   }
}
