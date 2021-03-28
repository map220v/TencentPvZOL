package com.qq.modules.td.logic.talent
{
   import com.qq.modules.td.data.game.unit.TDPlantStaticInfo;
   import com.qq.utils.data.PData;
   
   public class TalentPData extends PData
   {
       
      
      private var plantStaticInfo:TDPlantStaticInfo;
      
      public function TalentPData(param1:TDPlantStaticInfo)
      {
         super();
         this.plantStaticInfo = param1;
         var _loc2_:Number = TalentManager.instance.getPlantMaxHP(param1);
         this.set(_loc2_);
      }
      
      override public function get() : Number
      {
         return super.get();
      }
   }
}
