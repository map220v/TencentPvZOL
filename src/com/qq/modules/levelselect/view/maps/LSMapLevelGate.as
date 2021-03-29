package com.qq.modules.levelselect.view.maps
{
   import asgui.core.IDisposable;
   import asgui.managers.ToolTipManager;
   import com.qq.managers.FilterManager;
   import com.qq.modules.levelselect.command.LSProxyCmd;
   import com.qq.modules.levelselect.model.vo.LSGateInfoVO;
   import com.qq.modules.sound.command.TDLevelSelectCmd;
   import com.qq.templates.font.FontHKHB;
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   
   public class LSMapLevelGate implements IDisposable
   {
       
      
      private var mc:MovieClip;
      
      private var icon:MovieClip;
      
      private var levelId:int;
      
      private var subLevelId:int;
      
      public var vo:LSGateInfoVO;
      
      private var nextRoad:LSMapLevelRoad;
      
      private var initX:Number;
      
      private var initY:Number;
      
      private var initScaleX:Number;
      
      private var _hasDisposed:Boolean;
      
      public function LSMapLevelGate(param1:MovieClip, param2:int, param3:int, param4:int)
      {
         var mc:MovieClip = param1;
         var stageId:int = param2;
         var levelId:int = param3;
         var subLevelId:int = param4;
         super();
         this.subLevelId = subLevelId;
         this.levelId = levelId;
         this.mc = mc;
         this.icon = mc["icon"];
         this.initX = this.icon.x;
         this.initY = this.icon.y;
         this.initScaleX = mc.scaleX;
         mc.buttonMode = true;
         mc.stop();
         mc.gotoAndStop("close");
         this.icon.stop();
         try
         {
            this.icon.gotoAndStop("close");
         }
         catch(err:Error)
         {
         }
         mc.addEventListener(MouseEvent.CLICK,this.clickHandler,false,0,true);
         mc.addEventListener(MouseEvent.ROLL_OVER,this.overHandler,false,0,true);
         mc.addEventListener(MouseEvent.ROLL_OUT,this.outHandler,false,0,true);
         mc.visible = false;
      }
      
      public function get hasDisposed() : Boolean
      {
         return this._hasDisposed;
      }
      
      public function Dispose() : void
      {
         if(this.mc)
         {
            ToolTipManager.RegisterToolTip(this.mc,null);
            this.mc.removeEventListener(Event.COMPLETE,this.mcCompleteHandler);
            this.mc.removeEventListener(MouseEvent.CLICK,this.clickHandler);
            this.mc.removeEventListener(MouseEvent.ROLL_OVER,this.overHandler);
            this.mc.removeEventListener(MouseEvent.ROLL_OUT,this.outHandler);
            this.mc = null;
         }
         this.nextRoad = null;
         this.vo = null;
         this.icon = null;
         this._hasDisposed = true;
      }
      
      public function callVisible() : void
      {
         if(this.mc == null)
         {
            return;
         }
         this.mc.visible = true;
      }
      
      public function callOpen() : void
      {
         TDLevelSelectCmd.openLockDoor();
         this.mc.gotoAndPlay("open");
         try
         {
            this.icon.gotoAndPlay("open");
         }
         catch(err:Error)
         {
         }
         this.mc.addEventListener(Event.COMPLETE,this.mcCompleteHandler,false,0,true);
      }
      
      protected function mcCompleteHandler(param1:Event) : void
      {
         if(this.nextRoad)
         {
            this.nextRoad.call();
         }
      }
      
      public function setWaitingUnlock(param1:LSMapLevelRoad) : void
      {
         this.nextRoad = param1;
         this.mc.gotoAndStop(1);
      }
      
      public function loadVO(param1:LSGateInfoVO) : void
      {
         var tipStr:String = null;
         var keyMc:MovieClip = null;
         var vo:LSGateInfoVO = param1;
         this.vo = vo;
         if(vo.unlocked)
         {
            this.mc.gotoAndStop("open_ok");
            try
            {
               this.icon.gotoAndStop("open_ok");
            }
            catch(err:Error)
            {
            }
            if(vo.subLevelId == 1)
            {
               tipStr = FontHKHB.LEVEL_SELECT_UNLOCKED;
            }
            else
            {
               tipStr = FontHKHB.LEVEL_SELECT_UNLOCKED2;
            }
            ToolTipManager.RegisterToolTip(this.mc,tipStr,LSMapLevelGateToolTip);
         }
         else
         {
            this.mc.gotoAndStop("close");
            try
            {
               this.icon.gotoAndStop("close");
            }
            catch(err:Error)
            {
            }
            keyMc = MovieClip(this.mc.key).getChildAt(0) as MovieClip;
            if(keyMc)
            {
               if(vo.template.needStars > 0)
               {
                  keyMc.gotoAndStop(2);
               }
               else
               {
                  keyMc.gotoAndStop(1);
               }
            }
            ToolTipManager.RegisterToolTip(this.mc,vo.stageId + "_" + vo.levelId + "_" + vo.subLevelId,LSMapLevelGateToolTip);
         }
         this.mc.visible = vo.visible;
      }
      
      protected function clickHandler(param1:MouseEvent) : void
      {
         LSProxyCmd.checkForUnlockGate(this.vo);
      }
      
      public function get location() : Point
      {
         return new Point(this.mc.x,this.mc.y);
      }
      
      protected function outHandler(param1:MouseEvent) : void
      {
         this.icon.filters = [];
         this.icon.scaleX = this.initScaleX;
         this.icon.scaleY = 1;
         this.icon.x = this.initX;
         this.icon.y = this.initY;
      }
      
      protected function overHandler(param1:MouseEvent) : void
      {
         this.icon.filters = [FilterManager.getGlowLine()];
         this.icon.scaleX = this.initScaleX * 1.2;
         this.icon.scaleY = 1.2;
         if(this.icon.transform.matrix.a < 0)
         {
            this.icon.x = this.initX + 15;
         }
         else
         {
            this.icon.x = this.initX - 15;
         }
         this.icon.y = this.initY - 8;
      }
   }
}
