package com.qq.modules.td.logic.action.plant.wallnut
{
   import com.qq.constant.td.TDConstant;
   import com.qq.modules.td.logic.action.plant.BasicPlantAction;
   
   public class PWallnutActionIdle extends BasicPlantAction
   {
       
      
      private var _curDamageState:int;
      
      private var _maxDamageState:int;
      
      private var _lastCurHp:Number;
      
      public function PWallnutActionIdle()
      {
         super();
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
         else if(_loc1_ > 0.25)
         {
            _loc2_ = TDConstant.PlantAnmi_Damage2;
         }
         else
         {
            _loc2_ = TDConstant.PlantAnmi_Damage3;
         }
         _plant.animation.gotoAndPlay(_loc2_,true);
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
      
      override public function dispose() : void
      {
         super.dispose();
      }
   }
}
