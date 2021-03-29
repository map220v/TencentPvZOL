package com.qq.modules.td.view.game.ui
{
   import com.qq.CommandName;
   import com.qq.modules.basic.event.CommonEvent;
   import com.qq.modules.basic.view.BasicScreenMediator;
   import com.qq.modules.td.data.map.TDMapWaveInfo;
   import com.qq.modules.td.logic.process.TDEnemyWaveProcess;
   import com.qq.modules.td.model.TDGameInfo;
   import com.qq.modules.td.model.TDStageInfo;
   import flash.display.MovieClip;
   import flash.events.Event;
   
   public class TDProcessBarMediator extends BasicScreenMediator
   {
       
      
      [Inject]
      public var view:TDProcessBar;
      
      private var _waveDelays:Array;
      
      private var _bigWaveFlagList:Vector.<BigWaveInfo>;
      
      private var totalDelay:int;
      
      private var _directFinal:Boolean;
      
      public function TDProcessBarMediator()
      {
         super();
      }
      
      override protected function init() : void
      {
         super.init();
         this._bigWaveFlagList = new Vector.<BigWaveInfo>();
         this.view.barBg.visible = false;
      }
      
      override protected function initListener() : void
      {
         super.initListener();
         addContextListener(CommandName.TD_ProcessBar_Init,this.onProcessBar_Init,CommonEvent);
         addContextListener(CommandName.TD_ProcessBar_Show,this.onProcessBar_Show,CommonEvent);
         addContextListener(CommandName.TD_ProcessBar_Hide,this.TD_ProcessBar_Hide,CommonEvent);
         addContextListener(CommandName.TD_ProcessBar_ToFinal,this.TD_ProcessBar_ToFinal,CommonEvent);
      }
      
      override public function dispose() : void
      {
         removeComponentListener(this.view,Event.ENTER_FRAME,this.enterFrameHandler);
         while(this._bigWaveFlagList.length > 0)
         {
            this._bigWaveFlagList.pop().dispose();
         }
         super.dispose();
      }
      
      private function onProcessBar_Init(param1:Event) : void
      {
         var _loc2_:BigWaveInfo = null;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:BigWaveInfo = null;
         var _loc9_:BigWaveInfo = null;
         var _loc10_:MovieClip = null;
         var _loc11_:TDMapWaveInfo = null;
         this.view.cleanProcessBar();
         for each(_loc2_ in this._bigWaveFlagList)
         {
            _loc2_.dispose();
         }
         this._bigWaveFlagList = new Vector.<BigWaveInfo>();
         this.view.barBg.visible = false;
         this.view.levelInfoTF.x = this.view.panelW - this.view.levelInfoTF.width;
         this.view.levelInfoTF.y = -5;
         this._waveDelays = [];
         var _loc5_:int = 0;
         _loc6_ = 0;
         _loc7_ = TDStageInfo.getInstance().waveList.length;
         _loc3_ = 0;
         while(_loc3_ < _loc7_)
         {
            _loc11_ = TDStageInfo.getInstance().waveList[_loc3_];
            _loc5_ += _loc11_.delay;
            if(_loc11_.enemyInfo == null)
            {
               this._waveDelays[_loc6_] = _loc5_;
               if(_loc11_.isBigWave)
               {
                  (_loc8_ = new BigWaveInfo()).waveIndex = _loc6_;
                  _loc8_.delay = _loc5_;
                  this._bigWaveFlagList.push(_loc8_);
               }
               _loc6_++;
            }
            _loc3_++;
         }
         this.totalDelay = this._waveDelays[this._waveDelays.length - 1];
         for each(_loc9_ in this._bigWaveFlagList)
         {
            this.view.barBg["flagLayer"].addChild(_loc9_.flagMc);
            _loc9_.flagMc.x = -(_loc9_.delay / this.totalDelay) * this.view.barW;
         }
         if((_loc10_ = this.view.barBg["zombieFlag"]) != null)
         {
            _loc10_.x = this.view.zombieFlagStartX;
         }
         this.view.levelInfoTF.text = TDStageInfo.getInstance().stageName;
         addComponentListener(this.view,Event.ENTER_FRAME,this.enterFrameHandler);
      }
      
      protected function enterFrameHandler(param1:Event) : void
      {
         var _loc2_:Number = NaN;
         var _loc3_:Number = NaN;
         var _loc11_:BigWaveInfo = null;
         if(this._directFinal)
         {
            return;
         }
         var _loc4_:int = this._waveDelays.length;
         if(this.view.hasDisposed)
         {
            return;
         }
         var _loc5_:TDEnemyWaveProcess;
         if((_loc5_ = TDGameInfo.getInstance().updateProcessList[TDEnemyWaveProcess.ID] as TDEnemyWaveProcess) == null)
         {
            return;
         }
         var _loc6_:int = TDGameInfo.getInstance().TDGameTime;
         var _loc7_:int = 0;
         var _loc8_:int = _loc5_.delayReduce;
         var _loc9_:int = this._waveDelays.length - 1;
         while(_loc9_ >= 0)
         {
            if(_loc6_ >= this._waveDelays[_loc9_] - _loc8_)
            {
               _loc7_ = _loc9_;
               break;
            }
            _loc9_--;
         }
         _loc3_ = _loc6_ >= this.totalDelay - _loc8_ ? Number(1) : Number(_loc6_ / (this.totalDelay - _loc8_));
         var _loc10_:MovieClip;
         (_loc10_ = this.view.barBg["zombieFlag"]).x = int(this.view.zombieFlagStartX + (1 - _loc3_) * this.view.barW);
         this.view.setProcessValue(_loc3_);
         for each(_loc11_ in this._bigWaveFlagList)
         {
            if(_loc11_.waveIndex <= _loc7_ && _loc11_.flagMc.currentFrameLabel == "normal" && !_loc11_.flagMc.isPlaying)
            {
               _loc11_.flagMc.gotoAndPlay("pass");
            }
         }
      }
      
      private function onProcessBar_Show(param1:Event) : void
      {
         if(this.view.hasDisposed || this.view.barBg == null)
         {
            return;
         }
         this.view.barBg.visible = true;
         this.view.levelInfoTF.visible = true;
         this.view.levelInfoTF.x = this.view.barBg.x - this.view.levelInfoTF.width - 10;
      }
      
      private function TD_ProcessBar_Hide(param1:Event) : void
      {
         if(this.view.hasDisposed || this.view.barBg == null)
         {
            return;
         }
         this.view.barBg.visible = false;
         this.view.levelInfoTF.visible = false;
      }
      
      private function TD_ProcessBar_ToFinal(param1:Event) : void
      {
         this._directFinal = true;
         this.view.setProcessValue(1);
         var _loc2_:MovieClip = this.view.barBg["zombieFlag"];
         _loc2_.x = int(this.view.zombieFlagStartX);
      }
   }
}

import asgui.resources.AssetManager;
import com.qq.utils.UtilsManager;
import flash.display.MovieClip;

class BigWaveInfo
{
    
   
   public var flagMc:MovieClip;//changed private to public...
   
   public var delay:int;//changed private to public...
   
   public var waveIndex:int;//changed private to public...
   
   function BigWaveInfo()
   {
      super();
      this.flagMc = AssetManager.getInstance().GetNewClass("TD_UI_ProcessFlag") as MovieClip;
      this.flagMc.gotoAndStop("normal");
   }
   
   public function dispose() : void//changed private to public...
   {
      UtilsManager.removeFromContainer(this.flagMc);
      this.flagMc = null;
   }
}
