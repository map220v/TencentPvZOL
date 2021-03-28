package com.qq.modules.battle.view.control
{
   import asgui.controls.Image;
   import asgui.resources.AssetManager;
   import com.greensock.TweenLite;
   import com.qq.modules.battle.constant.BattleConst;
   import com.qq.utils.UtilsManager;
   import flash.display.MovieClip;
   import flash.events.TimerEvent;
   import flash.text.TextFormat;
   import flash.utils.Timer;
   
   public class UnitBloodCtr extends BaseUnitControler
   {
       
      
      private var nextEffctTimer:Timer;
      
      private var fadeTime:int = 1000;
      
      private var _resetBlood:Boolean = false;
      
      private var _cacheList:Array;
      
      private var _numCache:Array;
      
      public function UnitBloodCtr()
      {
         super();
      }
      
      override public function get ctrType() : String
      {
         return BaseUnitControler.TYPE_BLOOD;
      }
      
      override public function dispose() : void
      {
         this.cleanUnitBitmapNumber();
         if(this.nextEffctTimer)
         {
            this.nextEffctTimer.stop();
            this.nextEffctTimer.removeEventListener(TimerEvent.TIMER_COMPLETE,this.fadeHandler);
            this.nextEffctTimer = null;
         }
         this._numCache = null;
         super.dispose();
      }
      
      private function getUnitBitmapNumber() : Image
      {
         var _loc1_:Image = null;
         var _loc4_:Image = null;
         var _loc5_:MovieClip = null;
         var _loc6_:MovieClip = null;
         var _loc7_:UnitBitmapNumber = null;
         if(this._cacheList == null)
         {
            this._cacheList = new Array();
         }
         var _loc2_:int = this._cacheList.length;
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            if((_loc4_ = this._cacheList[_loc3_]) != null && _loc4_.parent == null)
            {
               _loc1_ = _loc4_;
            }
            _loc3_++;
         }
         if(_loc1_ == null)
         {
            _loc1_ = new Image();
            _loc1_.scrollRectEnabled = false;
            _loc1_.source = AssetManager.GetClass("battle_ui_changeHP_new");
            _loc6_ = (_loc5_ = _loc1_.mcHolder as MovieClip).getChildByName("mc") as MovieClip;
            _loc7_ = new UnitBitmapNumber();
            _loc6_.addChild(_loc7_);
            _loc1_.mouseChildren = false;
            _loc1_.mouseEnabled = false;
            this._cacheList.push(_loc1_);
         }
         return _loc1_;
      }
      
      private function recycleUnitBitmapNumber(param1:Image) : void
      {
         if(param1 == null)
         {
            return;
         }
         UtilsManager.removeFromContainer(param1);
      }
      
      private function cleanUnitBitmapNumber() : void
      {
         var _loc1_:Image = null;
         var _loc2_:MovieClip = null;
         var _loc3_:MovieClip = null;
         var _loc4_:UnitBitmapNumber = null;
         if(this._cacheList == null)
         {
            this._cacheList = new Array();
         }
         while(this._cacheList.length > 0)
         {
            _loc1_ = this._cacheList.pop();
            if(_loc1_ != null)
            {
               _loc2_ = _loc1_.mcHolder as MovieClip;
               if(_loc2_ != null)
               {
                  _loc3_ = _loc2_.getChildByName("mc") as MovieClip;
                  if(_loc3_ != null && _loc3_.numChildren > 0)
                  {
                     if((_loc4_ = _loc3_.getChildAt(0) as UnitBitmapNumber) != null)
                     {
                        UtilsManager.removeFromContainer(_loc4_);
                        _loc4_.Dispose();
                     }
                  }
                  _loc1_.Dispose();
                  UtilsManager.removeFromContainer(_loc1_);
               }
            }
         }
      }
      
      override protected function initlize() : void
      {
         super.initlize();
         this.nextEffctTimer = new Timer(this.fadeTime,1);
         this.nextEffctTimer.addEventListener(TimerEvent.TIMER_COMPLETE,this.fadeHandler);
      }
      
      public function changeBlood(param1:Number, param2:Boolean, param3:Boolean = true) : void
      {
         if(!param3 && this.isPlaying())
         {
            if(this._numCache == null)
            {
               this._numCache = new Array();
            }
            this.nextEffctTimer.delay = 100;
            this._numCache.push([param1,param2]);
         }
         else
         {
            this.playAnmi(param1,param2,param3);
         }
      }
      
      private function isPlaying() : Boolean
      {
         if(this.nextEffctTimer == null)
         {
            return false;
         }
         return this.nextEffctTimer.running;
      }
      
      private function playAnmi(param1:Number, param2:Boolean, param3:Boolean = true) : void
      {
         var _loc4_:String = null;
         var _loc7_:UnitBitmapNumber = null;
         var _loc8_:MovieClip = null;
         var _loc9_:TextFormat = null;
         var _loc10_:Number = NaN;
         if(!this.isPlaying())
         {
            _loc4_ = "show";
         }
         else
         {
            _loc4_ = "flash";
         }
         var _loc6_:MovieClip;
         var _loc5_:Image;
         if((_loc6_ = (_loc5_ = this.getUnitBitmapNumber()).mcHolder as MovieClip) != null)
         {
            _loc6_.gotoAndPlay(_loc4_);
            _loc7_ = (_loc8_ = _loc6_.getChildByName("mc") as MovieClip).getChildAt(0) as UnitBitmapNumber;
         }
         if(_loc7_ != null)
         {
            if(param2)
            {
               _loc7_.style = UnitBitmapNumber.STYLE_YELLOW;
            }
            else
            {
               _loc7_.style = UnitBitmapNumber.STYLE_RED;
            }
            if(param1 > 0)
            {
               _loc7_.style = UnitBitmapNumber.STYLE_GREEN;
            }
            else if(param2)
            {
               _loc7_.style = UnitBitmapNumber.STYLE_YELLOW;
            }
            else
            {
               _loc7_.style = UnitBitmapNumber.STYLE_RED;
            }
            if(this._resetBlood)
            {
               _loc7_.reset();
               this._resetBlood = false;
            }
            _loc10_ = param1;
            if(param3)
            {
               _loc10_ += Number(_loc7_.value);
            }
            if(_loc10_ == 0)
            {
               _loc7_.miss = true;
            }
            else
            {
               _loc7_.value = _loc10_;
            }
            _loc5_.x = (BattleConst.GRID_WIDTH - _loc5_.width) * 0.5;
         }
         _unitLayer.addChild(_loc5_);
         TweenLite.to(_loc5_,0,{
            "delay":0.5,
            "onComplete":this.showNumFinish,
            "onCompleteParams":[_loc5_]
         });
         this.nextEffctTimer.reset();
         this.nextEffctTimer.start();
      }
      
      private function showNumFinish(param1:Image) : void
      {
         if(param1 != null)
         {
            this.recycleUnitBitmapNumber(param1);
         }
      }
      
      public function resetBlood() : void
      {
      }
      
      protected function fadeHandler(param1:TimerEvent) : void
      {
         var _loc2_:Array = null;
         if(this._numCache != null && this._numCache.length > 0)
         {
            _loc2_ = this._numCache.pop();
            this.playAnmi(_loc2_[0],_loc2_[1],false);
         }
         else
         {
            this.nextEffctTimer.delay = this.fadeTime;
         }
         this._resetBlood = true;
      }
   }
}
