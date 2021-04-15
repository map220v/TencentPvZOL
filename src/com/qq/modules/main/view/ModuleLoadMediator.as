package com.qq.modules.main.view
{
   import asgui.controls.Image;
   import asgui.core.Application;
   import asgui.managers.LoaderManager;
   import asgui.managers.LoaderManagerStatus;
   import asgui.managers.SystemManager;
   import com.qq.CommandName;
   import com.qq.GameGloble;
   import com.qq.IMyApplication;
   import com.qq.modules.basic.event.CommonEvent;
   import com.qq.modules.basic.view.BasicScreenMediator;
   import com.qq.utils.UtilsManager;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.events.Event;
   import flash.geom.Matrix;
   import flash.utils.clearTimeout;
   import flash.utils.setTimeout;
   import org.as3commons.logging.api.getLogger;
   import org.robotlegs.extend.module.RobotlegModuleLoaderManager;
   
   public class ModuleLoadMediator extends BasicScreenMediator
   {
      
      private static const TIME_OUT:int = 15000;
       
      
      [Inject]
      public var view:ModuleLoadView;
      
      private var _counter:int;
      
      private var _isRunning:Boolean;
      
      private var m_timeOutID:int;
      
      private var _shotBitmap:Bitmap;
      
      private var counter:int;
      
      private var finishCounter:int;
      
      public function ModuleLoadMediator()
      {
         super();
         this._counter = 0;
         this._isRunning = false;
      }
      
      override protected function initListener() : void
      {
         super.initListener();
         RobotlegModuleLoaderManager.impl.addEventListener(Event.CHANGE,this.onStatLoadModule);
         addComponentListener(GameGloble.stage,Event.RESIZE,this.onResizeScreen);
         addContextListener(CommandName.Common_ShotScreen,this.onShotScreen);
         addContextListener(CommandName.Common_ShowLoding,this.onStatLoadModule);
      }
      
      override protected function initialized() : void
      {
         super.initialized();
         this.onResizeScreen(null);
      }
      
      private function onResizeScreen(param1:Event) : void
      {
         var _loc2_:Application = Application.application;
         if(this.view != null)
         {
            this.view.mc.x = (_loc2_.width - this.view.mc.width) * 0.5;
            this.view.mc.y = (_loc2_.height - this.view.mc.height) * 0.5;
         }
      }
      
      private function onStatLoadModule(param1:Event) : void
      {
         if(this._isRunning)
         {
            return;
         }
         if(!GameGloble.isFinishBaseModuleLoader)
         {
            return;
         }
         this._isRunning = true;
         getLogger("Load").info("Module Loading Started");
         UtilsManager.bringToTop(this.view);
         this.setProgress(0);
         this.view.addEventListener(Event.ENTER_FRAME,this.onProgressLoad);
         ++this._counter;
         this.view.play();
         this.view.visible = true;
         this.view.mc.visible = true;
         this.counter = 0;
         this.addTimeoutWatcher();
      }
      
      private function addTimeoutWatcher() : void
      {
         this.m_timeOutID = setTimeout(this.onTimeout,TIME_OUT);
      }
      
      private function onTimeout() : void
      {
         this.clearTimeoutWatcher();
         this.view.stop();
      }
      
      private function onShotScreen(param1:CommonEvent) : void
      {
         var bitmapData:BitmapData = null;
         var e:CommonEvent = param1;
         if(!GameGloble.isFinishBaseModuleLoader)
         {
            return;
         }
         if(this._shotBitmap == null)
         {
            this._shotBitmap = new Bitmap();
         }
         else if(this._shotBitmap.bitmapData != null)
         {
            this._shotBitmap.bitmapData.dispose();
         }
         var app:Application = Application.application;
         var scene:SystemManager = SystemManager.instance;
         if(!bitmapData)
         {
            bitmapData = new BitmapData(app.width,app.height,false);
         }
         var visibleBefore:Boolean = this.view.visible;
         this.view.visible = false;
         try
         {
            bitmapData.draw(scene,new Matrix());
         }
         catch(err:Error)
         {
         }
         this._shotBitmap.bitmapData = bitmapData;
         this.view.visible = true;
         this.view.addChildAt(this._shotBitmap,0);
         this.onResizeScreen(null);
         this.view.visible = visibleBefore;
      }
      
      private function onProgressLoad(param1:Event) : void
      {
         var _loc2_:LoaderManagerStatus = LoaderManager.impl.GetStatus();
         this.setProgress(_loc2_.queueIndex,_loc2_.queueLength);
         var _loc3_:Image = (Application.application as IMyApplication).bg;
         if(this.counter == 15)
         {
            _loc3_.visible = true;
            _loc3_.alpha = 0;
         }
         else if(this.counter > 15)
         {
            _loc3_.alpha += 0.05;
         }
         ++this.counter;
      }
      
      private function onFinishLoad(param1:Event) : void
      {
         this.view.removeEventListener(Event.ENTER_FRAME,this.onProgressLoad);
         setTimeout(this.view.stop,10);
         if(this._shotBitmap != null)
         {
            UtilsManager.removeFromContainer(this._shotBitmap);
            if(this._shotBitmap.bitmapData != null)
            {
               this._shotBitmap.bitmapData.dispose();
            }
         }
         this._isRunning = false;
      }
      
      private function clearTimeoutWatcher() : void
      {
         if(this.m_timeOutID > 0)
         {
            clearTimeout(this.m_timeOutID);
            this.m_timeOutID = 0;
         }
      }
      
      private function setProgress(param1:int, param2:int = 100) : void
      {
         this.view.percentTF.text = int(100 * param1 / param2) + "%";
         if(param1 == param2)
         {
            if(++this.finishCounter > 5)
            {
               this.onFinishLoad(null);
               this.finishCounter = 0;
            }
         }
         else
         {
            this.finishCounter = 0;
         }
      }
   }
}
