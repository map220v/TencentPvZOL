package com.qq.modules.td.view.game
{
   import asgui.core.Application;
   import com.qq.CommandName;
   import com.qq.GameGloble;
   import com.qq.constant.td.TDConstant;
   import com.qq.modules.basic.event.CommonEvent;
   import com.qq.modules.basic.view.BasicScreenMediator;
   import com.qq.modules.td.command.game.TDGameCmd;
   import com.qq.modules.td.data.map.TDMapRoadData;
   import com.qq.modules.td.data.map.TDMapTileData;
   import com.qq.modules.td.model.TDGameInfo;
   import com.qq.utils.CommandDispatcher;
   import com.qq.utils.GraphicsUtils;
   import com.qq.utils.UtilsManager;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.KeyboardEvent;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import org.as3commons.logging.api.getLogger;
   
   public class TDBGViewMediator extends BasicScreenMediator
   {
      
      private static const LockScreenLayerName:String = "lockScreen";
       
      
      [Inject]
      public var view:TDBGView;
      
      public function TDBGViewMediator()
      {
         super();
      }
      
      override protected function init() : void
      {
         super.init();
         GameGloble.resizeHelper.addListener(this.checkSize);
      }
      
      override protected function initListener() : void
      {
         super.initListener();
         addContextListener(CommandName.TD_LockScreen,this.onLockScreen,CommonEvent);
         addContextListener(CommandName.TD_UnlockScreen,this.onUnlockScreen,CommonEvent);
         addContextListener(CommandName.TD_UPDATE_SERVER_TIME,this.onReportResult);
      }
      
      private function onReportResult(param1:Event) : void
      {
         TDGameCmd.reportTDResult();
      }
      
      override public function reset(param1:Object = null) : void
      {
         super.reset(param1);
         CommandDispatcher.send(CommandName.TD_InitTDGame);
      }
      
      override public function dispose() : void
      {
         Application.application.stage.removeEventListener(KeyboardEvent.KEY_DOWN,this.keyHandler);
         GameGloble.resizeHelper.removeListener(this.checkSize);
         GameGloble.stage.removeEventListener(Event.RESIZE,this.onResizeLockScreen);
         super.dispose();
      }
      
      public function checkSize(param1:Number, param2:int, param3:int) : void
      {
         var _loc8_:int = 0;
         var _loc9_:Point = null;
         var _loc10_:Point = null;
         var _loc11_:Array = null;
         var _loc12_:TDMapRoadData = null;
         var _loc13_:TDMapTileData = null;
         var _loc4_:int = int(GameGloble.TDScreenW * param1);
         var _loc5_:int = int(GameGloble.TDScreenH * param1);
         var _loc6_:Number = param2 / param3 / (GameGloble.TDScreenW / GameGloble.TDScreenH);
         var _loc7_:int;
         _loc8_ = ((_loc7_ = param2 - GameGloble.TDScreenW * param1) - TDConstant.passWarfieldPosX * param1) / param1;
         GameGloble.xForScene = _loc8_;
         GameGloble.xAddForUI = _loc7_;
         this.view.scene.setLocation(_loc8_,0);
         this.view.scene.unitLayer.scaleX = this.view.scene.unitLayer.scaleY = param1;
         this.view.scene.unitLayer.setNormalX(_loc8_ * (param1 - 1));
         this.view.scene.gameUILayer.updateLocation(true);
         this.view.scene.gameUILayer.setLocation(-_loc8_ + TDConstant.passWarfieldPosX - 460,0);
         this.view.scene.skyLayer.setNormalX(_loc8_ * (param1 - 1));
         this.view.topScence.scaleX = this.view.topScence.scaleY = param1;
         this.view.topScence.x = _loc8_ + _loc8_ * (param1 - 1);
         this.view.scene.scrollRect = new Rectangle(0,0,param2 - _loc8_,param3);
         if(GameGloble.debugUIGraphics)
         {
            _loc9_ = new Point(_loc7_ * param1,0);
            _loc10_ = new Point(_loc8_ * param1,0);
            this.view.debugLayer.graphics.clear();
            this.view.debugLayer.graphics.lineStyle(1,16711680);
            this.view.debugLayer.graphics.drawRect(_loc9_.x,0,2,200);
            this.view.debugLayer.graphics.drawRect(_loc10_.x,0,2,200);
            if(_loc11_ = TDGameInfo.getInstance().roadList)
            {
               for each(_loc12_ in _loc11_)
               {
                  for each(_loc13_ in _loc12_.tileList)
                  {
                     this.view.debugLayer.graphics.drawRect(_loc10_.x + param1 * _loc13_.rect.x,_loc10_.y + param1 * _loc13_.rect.y,param1 * _loc13_.rect.width,param1 * _loc13_.rect.height);
                  }
               }
            }
         }
      }
      
      protected function keyHandler(param1:KeyboardEvent) : void
      {
         if(!param1.ctrlKey || !param1.altKey)
         {
            return;
         }
         switch(param1.keyCode)
         {
            case 71:
               if(this.view.uiPanel)
               {
                  this.view.removeChild(this.view.uiPanel);
                  this.view.uiPanel.Dispose();
               }
         }
      }
      
      private function onLockScreen(param1:Event) : void
      {
         GameGloble.stage.addEventListener(Event.RESIZE,this.onResizeLockScreen);
         var _loc2_:Sprite = this.view.getChildByName(LockScreenLayerName) as Sprite;
         if(_loc2_ == null)
         {
            _loc2_ = new Sprite();
            _loc2_.name = LockScreenLayerName;
            this.view.addChild(_loc2_);
         }
         this.onResizeLockScreen(null);
      }
      
      private function onUnlockScreen(param1:Event) : void
      {
         GameGloble.stage.removeEventListener(Event.RESIZE,this.onResizeLockScreen);
         var _loc2_:Sprite = this.view.getChildByName(LockScreenLayerName) as Sprite;
         if(_loc2_ != null)
         {
            UtilsManager.removeFromContainer(_loc2_);
         }
      }
      
      private function onResizeLockScreen(param1:Event) : void
      {
         var _loc2_:Sprite = this.view.getChildByName(LockScreenLayerName) as Sprite;
         if(_loc2_ == null)
         {
            getLogger("TD").debug("屏幕锁定层没有找到");
            return;
         }
         GraphicsUtils.cleanContainer(_loc2_);
         GraphicsUtils.drawRect(_loc2_,0,0,GameGloble.stage.stageWidth,GameGloble.stage.stageHeight,0,0);
      }
   }
}
