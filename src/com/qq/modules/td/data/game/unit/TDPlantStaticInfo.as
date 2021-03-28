package com.qq.modules.td.data.game.unit
{
   import com.qq.modules.td.data.TDDataFactory;
   import com.qq.modules.td.data.game.unit.ce.TDPlantInfoTemplateCE;
   
   public class TDPlantStaticInfo extends TDPlantInfoTemplateCE
   {
       
      
      public var baseInfo:TDPlantBaseStaticInfo;
      
      public function TDPlantStaticInfo()
      {
         super();
      }
      
      override public function load(param1:Object) : void
      {
         super.load(param1);
         this.baseInfo = TDDataFactory.instance.getPlantBaseInfoByID(type);
      }
   }
}
