package com.qq.modules.mapinfo.view.components
{
   import asgui.managers.PopUpManager;
   import flash.geom.Point;
   
   public class MapInfoMoviCityFixWnd extends MapInfoMoviCityFixWndCE
   {
       
      
      public var defaultCell:Point;
      
      public var areaId:int;
      
      public function MapInfoMoviCityFixWnd(param1:int, param2:Point = null)
      {
         this.areaId = param1;
         this.defaultCell = param2;
         super();
         txtName.SetStyle("textAlign","left");
         txtDesc.SetStyle("textAlign","left");
      }
      
      public function Close() : void
      {
         PopUpManager.RemovePopUp(this);
         Dispose();
      }
   }
}
