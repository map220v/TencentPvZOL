package com.qq.modules.mapinfo.view.map
{
   import com.qq.modules.map.model.vo.MapCityCellVO;
   import org.allencuilib.util.TimeUtils;
   
   public class MapInfoDeclareWarCard extends MapInfoRoleFunctionCard
   {
       
      
      public function MapInfoDeclareWarCard(param1:MapCityCellVO, param2:Function)
      {
         super(param1,param2);
      }
      
      override protected function update() : void
      {
         super.update();
         if(vo.isDeclaringWar())
         {
            this.txt.text = "<font color=\'#ffff00\'>宣战倒计时：</font><font color=\'#00ff00\'>" + TimeUtils.GetDigitalTimeString(vo.getgetTimeWarDeclaringEndLeft(),true) + "</font>";
         }
         else
         {
            updateCall.apply();
         }
      }
   }
}
