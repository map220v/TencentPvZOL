package com.qq.modules.battle.view.control
{
   import asgui.controls.Image;
   import asgui.resources.AssetManager;
   import com.qq.modules.battle.constant.BattleConst;
   import flash.display.MovieClip;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   
   public class UnitShiedCtr extends BaseUnitControler
   {
       
      
      private var bloodTotal:MovieClip;
      
      private var bloodImg:Image;
      
      private var bloodBitNum:UnitBitmapNumber;
      
      private var fadeTimer:Timer;
      
      private var fadeTime:int = 1000;
      
      private var _resetBlood:Boolean = false;
      
      public function UnitShiedCtr()
      {
         super();
      }
      
      override public function get ctrType() : String
      {
         return BaseUnitControler.TYPE_SHIED;
      }
      
      override public function dispose() : void
      {
         if(this.bloodBitNum)
         {
            this.bloodBitNum.Dispose();
            this.bloodBitNum = null;
         }
         if(this.bloodImg)
         {
            if(_unitLayer.contains(this.bloodImg))
            {
               _unitLayer.removeChild(this.bloodImg);
            }
            this.bloodTotal = null;
         }
         if(this.fadeTimer)
         {
            this.fadeTimer.stop();
            this.fadeTimer.removeEventListener(TimerEvent.TIMER_COMPLETE,this.fadeHandler);
            this.fadeTimer = null;
         }
         super.dispose();
      }
      
      override protected function initlize() : void
      {
         super.initlize();
         this.bloodImg = new Image();
         this.bloodImg.scrollRectEnabled = false;
         this.bloodImg.source = AssetManager.GetClass("battle_ui_changeHP_new");
         this.bloodTotal = this.bloodImg.mcHolder as MovieClip;
         var _loc1_:MovieClip = this.bloodTotal.getChildByName("mc") as MovieClip;
         this.bloodBitNum = new UnitBitmapNumber();
         this.bloodBitNum.style = UnitBitmapNumber.STYLE_BLUE;
         _loc1_.addChild(this.bloodBitNum);
         _unitLayer.addChild(this.bloodImg);
         this.bloodTotal.visible = false;
         this.bloodTotal.mouseChildren = false;
         this.fadeTimer = new Timer(this.fadeTime,1);
         this.fadeTimer.addEventListener(TimerEvent.TIMER_COMPLETE,this.fadeHandler);
      }
      
      public function changeBlood(param1:Number) : void
      {
         if(param1 == 0)
         {
            return;
         }
         if(this.bloodTotal.visible == false)
         {
            this.bloodImg.y = Math.random() * 40;
            this.bloodTotal.gotoAndPlay("show");
         }
         else
         {
            this.bloodTotal.gotoAndPlay("flash");
         }
         this.bloodTotal.visible = true;
         this.fadeTimer.reset();
         this.fadeTimer.start();
         if(this._resetBlood)
         {
            this.bloodBitNum.reset();
            this._resetBlood = false;
         }
         var _loc2_:Number = Number(this.bloodBitNum.value);
         _loc2_ += param1;
         this.bloodBitNum.value = _loc2_;
         this.bloodImg.x = (BattleConst.GRID_WIDTH - this.bloodImg.width) * 0.5;
      }
      
      public function resetBlood() : void
      {
         this._resetBlood = true;
      }
      
      protected function fadeHandler(param1:TimerEvent) : void
      {
         this.bloodTotal.visible = false;
      }
   }
}
