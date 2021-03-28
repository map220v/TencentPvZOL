package com.qq.modules.td.logic.talent.talentEffect
{
   import com.qq.modules.td.data.game.unit.TDPlantStaticInfo;
   import flash.geom.Rectangle;
   
   public class TalentAttackAreaDouble extends TalentEffect
   {
       
      
      public function TalentAttackAreaDouble()
      {
         super();
      }
      
      override public function setData(param1:Array) : void
      {
      }
      
      public function getAttackArea(param1:TDPlantStaticInfo, param2:Rectangle) : Array
      {
         if(hasSamePlantType(param1))
         {
            return [param2,new Rectangle(-param2.x - param2.width,param2.y,param2.width,param2.height)];
         }
         return [param2];
      }
   }
}
