package com.qq.modules.levelselect.view.maps
{
   import asgui.core.IDisposable;
   import asgui.utils.DisplayUtil;
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.geom.Point;
   
   public class LSMapLevelRoad implements IDisposable
   {
       
      
      private var mc:MovieClip;
      
      private var nextRoad:LSMapLevelRoad;
      
      private var level:LSMapLevelIcon;
      
      public var extra:String;
      
      private var gate:LSMapLevelGate;
      
      private var _hasDisposed:Boolean;
      
      public function LSMapLevelRoad(param1:MovieClip, param2:String = null)
      {
         super();
         this.extra = param2;
         this.mc = param1;
         param1.gotoAndStop(1);
         param1.addEventListener(Event.COMPLETE,this.mcCompleteHandler);
      }
      
      public function get hasDisposed() : Boolean
      {
         return this._hasDisposed;
      }
      
      public function Dispose() : void
      {
         this.nextRoad = null;
         this.level = null;
         this.gate = null;
         if(this.mc)
         {
            this.mc.removeEventListener(Event.CHANGE,this.mcChangeHandler);
            this.mc.removeEventListener(Event.COMPLETE,this.mcCompleteHandler);
            this.mc = null;
         }
         this._hasDisposed = true;
      }
      
      protected function mcCompleteHandler(param1:Event) : void
      {
         this.mc.removeEventListener(Event.COMPLETE,this.mcCompleteHandler);
         DisplayUtil.StopMovieClip(this.mc);
      }
      
      public function get location() : Point
      {
         return new Point(this.mc.x,this.mc.y);
      }
      
      public function init(param1:*, param2:LSMapLevelRoad = null) : void
      {
         if(param1 is LSMapLevelIcon)
         {
            this.level = param1 as LSMapLevelIcon;
            this.mc.visible = this.level.vo && this.level.vo.unlocked;
            if(this.level.vo && this.level.vo.unlocked)
            {
               this.mc.gotoAndStop("done");
            }
            DisplayUtil.StopMovieClip(this.mc);
         }
         else if(param1 is LSMapLevelGate)
         {
            this.gate = param1 as LSMapLevelGate;
            this.mc.visible = this.gate.vo && this.gate.vo.unlocked;
            if(this.gate.vo && this.gate.vo.unlocked)
            {
               this.mc.gotoAndStop("done");
            }
            DisplayUtil.StopMovieClip(this.mc);
         }
         this.nextRoad = param2;
      }
      
      public function call() : void
      {
         this.mc.addEventListener(Event.CHANGE,this.mcChangeHandler);
         this.mc.visible = true;
         this.mc.gotoAndPlay(1);
      }
      
      public function setReadyForCall() : void
      {
         this.mc.gotoAndStop(1);
      }
      
      protected function mcChangeHandler(param1:Event) : void
      {
         this.mc.removeEventListener(Event.CHANGE,this.mcChangeHandler);
         if(this.nextRoad)
         {
            this.nextRoad.call();
         }
         else
         {
            if(this.level && this.level.vo.unlocked)
            {
               this.level.callVisible();
            }
            if(this.gate)
            {
               this.gate.callVisible();
            }
         }
      }
   }
}
