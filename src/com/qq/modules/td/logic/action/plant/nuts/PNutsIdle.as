package com.qq.modules.td.logic.action.plant.nuts
{
   import com.qq.constant.td.TDConstant;
   import com.qq.modules.td.logic.action.plant.BasicPlantAction;
   import flash.events.Event;
   
   public class PNutsIdle extends BasicPlantAction
   {
       
      
      private var _lastCurHp:Number;
      
      private var _playedDieAnim:Boolean;
      
      private var _dieAnimPlaying:Boolean;
      
      public function PNutsIdle()
      {
         super();
      }
      
      override public function enterState(param1:Array = null) : void
      {
         super.enterState(param1);
         this._lastCurHp = -1;
         this.updateState();
      }
      
      override public function runningState() : void
      {
         if(this._lastCurHp == -1)
         {
            this._lastCurHp = _plant.plantData.curHp.get();
         }
         var _loc1_:Number = _plant.plantData.curHp.get();
         if(this._lastCurHp != _loc1_)
         {
            this.updateState();
         }
      }
      
      protected function onAnimComplete(param1:Event) : void
      {
         _plant.animation.removeEventListener(Event.COMPLETE,this.onAnimComplete);
         this._playedDieAnim = true;
         this._dieAnimPlaying = false;
         this.updateState();
      }
      
      public function updateState() : void
      {
         var _loc2_:String = null;
         var _loc1_:Number = _plant.plantData.curHp.get() / _plant.plantData.maxHp.get();
         if(_loc1_ > 0.75)
         {
            if(Math.random() > 0.5)
            {
               _loc2_ = TDConstant.PlantAnmi_Idle;
            }
            else
            {
               _loc2_ = TDConstant.PlantAnmi_Idle2;
            }
         }
         else if(_loc1_ > 0.5)
         {
            _loc2_ = TDConstant.PlantAnmi_Damage1;
         }
         else if(_loc1_ > 0)
         {
            _loc2_ = TDConstant.PlantAnmi_Damage2;
         }
         else
         {
            _loc2_ = TDConstant.PlantAnmi_Die_Idle;
         }
         if(_loc2_ == TDConstant.PlantAnmi_Die_Idle && !this._playedDieAnim)
         {
            if(this._dieAnimPlaying)
            {
               return;
            }
            this._dieAnimPlaying = true;
            _plant.animation.gotoAndPlay("die");
            _plant.animation.addEventListener(Event.COMPLETE,this.onAnimComplete);
         }
         else
         {
            _plant.animation.gotoAndPlay(_loc2_,true);
         }
      }
   }
}
