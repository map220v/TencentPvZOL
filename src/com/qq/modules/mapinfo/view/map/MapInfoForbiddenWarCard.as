package com.qq.modules.mapinfo.view.map
{
   import PVZ.Cmd.E_WarFreeType;
   import com.qq.modules.map.model.vo.MapCityCellVO;
   import com.qq.utils.UrlManager;
   import org.allencuilib.util.TimeUtils;
   
   public class MapInfoForbiddenWarCard extends MapInfoRoleFunctionCard
   {
       
      
      public function MapInfoForbiddenWarCard(param1:MapCityCellVO, param2:Function)
      {
         super(param1,param2);
      }
      
      override protected function update() : void
      {
         super.update();
         if(vo.warFree == E_WarFreeType.E_WarFreeType_Normal)
         {
            this.icon.source = UrlManager.getUrl(0,"swf/mapinfo/forbidden_war.png");
            this.txt.text = "<font color=\'#ffff00\'>免战倒计时：</font><font color=\'#00ff00\'>" + TimeUtils.GetDigitalTimeString(vo.getgetTimeWarForbidEndLeft()) + "</font>";
         }
         else if(vo.warFree == E_WarFreeType.E_WarFreeType_NewCity)
         {
            this.icon.source = UrlManager.getUrl(0,"swf/mapinfo/forbidden_war.png");
            this.txt.text = "<font color=\'#ffff00\'>新手期免战保护</font>";
         }
         else
         {
            updateCall.apply();
         }
      }
   }
}
