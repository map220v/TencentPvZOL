package com.qq.modules.mapinfo.view.history
{
   import com.qq.display.QCanvas;
   import flash.display.MovieClip;
   
   public class TimemachineView extends QCanvas
   {
       
      
      public var builderMc:MovieClip;
      
      public function TimemachineView(param1:Class = null)
      {
         super(!!param1 ? param1 : TimemachineViewMediator);
      }
   }
}
