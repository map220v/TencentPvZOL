package com.qq.modules.map.view.mini
{
   import asgui.controls.ToolTip;
   
   public class MapMiniBottomToolTip extends ToolTip
   {
       
      
      public function MapMiniBottomToolTip()
      {
         super();
      }
      
      public function get toolTipOffsetY() : int
      {
         return -60;
      }
   }
}
