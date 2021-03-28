package com.qq.modules.td.logic.talent.talentEffect
{
   import com.qq.modules.td.data.game.unit.TDPlantStaticInfo;
   
   public class TalentReflectHurt extends TalentEffect
   {
       
      
      private var reflectHurt:Number;
      
      public function TalentReflectHurt()
      {
         super();
      }
      
      override public function setData(param1:Array) : void
      {
         super.setData(param1);
         this.reflectHurt = param1[0];
      }
      
      public function getReflectHurt(param1:TDPlantStaticInfo) : Number
      {
         if(hasSamePlantType(param1))
         {
            return -this.reflectHurt;
         }
         return 0;
      }
   }
}
