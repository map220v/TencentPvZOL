package com.qq.modules.mapinfo.view.map
{
   import asgui.controls.Image;
   import asgui.controls.Text;
   import com.qq.display.QCanvas;
   import com.qq.modules.map.model.vo.MapCityCellVO;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   
   public class MapInfoRoleFunctionCard extends QCanvas
   {
       
      
      protected var vo:MapCityCellVO;
      
      protected var updateCall:Function;
      
      protected var timer:Timer;
      
      protected var txt:Text;
      
      protected var icon:Image;
      
      public function MapInfoRoleFunctionCard(param1:MapCityCellVO, param2:Function)
      {
         this.updateCall = param2;
         this.vo = param1;
         super();
      }
      
      override public function InitializeComponent() : void
      {
         super.InitializeComponent();
         this.height = 26;
         this.width = 180;
         this.icon = new Image();
         this.addChild(this.icon);
         this.txt = new Text();
         this.txt.y = 3;
         this.txt.x = 33;
         this.txt.width = 180;
         this.txt.height = 26;
         this.addChild(this.txt);
         this.timer = new Timer(1000);
         this.timer.addEventListener(TimerEvent.TIMER,this.timerHandler);
         this.timer.start();
         this.update();
      }
      
      protected function timerHandler(param1:TimerEvent) : void
      {
         this.update();
      }
      
      protected function update() : void
      {
      }
      
      override public function Dispose() : void
      {
         if(this.timer)
         {
            this.timer.stop();
            this.timer = null;
         }
         super.Dispose();
      }
   }
}
