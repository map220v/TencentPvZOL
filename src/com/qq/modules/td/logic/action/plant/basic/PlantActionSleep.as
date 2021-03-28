package com.qq.modules.td.logic.action.plant.basic
{
   import com.qq.constant.td.TDConstant;
   import com.qq.modules.td.logic.action.plant.BasicPlantAction;
   import com.qq.utils.DMath;
   import flash.events.Event;
   
   public class PlantActionSleep extends BasicPlantAction
   {
       
      
      private var _idleLabelNames:Array;
      
      public function PlantActionSleep()
      {
         super();
      }
      
      override public function enterState(param1:Array = null) : void
      {
         super.enterState(param1);
         _gameObject.animation.addEventListener(Event.COMPLETE,this.onComplete);
         this.playRandomIdleAction();
      }
      
      override public function leaveState() : void
      {
         super.leaveState();
         _gameObject.animation.removeEventListener(Event.COMPLETE,this.onComplete);
      }
      
      private function onComplete(param1:Event) : void
      {
         this.playRandomIdleAction();
      }
      
      private function playRandomIdleAction() : void
      {
         var _loc1_:String = this.getActionLabelName();
         var _loc2_:int = DMath.randNum(2,4);
         _gameObject.animation.gotoAndPlay(_loc1_,_loc2_);
      }
      
      private function getActionLabelName() : String
      {
         var _loc1_:int = 0;
         var _loc2_:Array = null;
         var _loc3_:Array = null;
         var _loc4_:int = 0;
         var _loc5_:String = null;
         var _loc6_:int = 0;
         if(_gameObject != null)
         {
            if(this._idleLabelNames == null)
            {
               this._idleLabelNames = new Array();
               _loc2_ = _gameObject.animation.getAllLabelName();
               _loc3_ = new Array();
               _loc4_ = 0;
               while(_loc4_ < _loc2_.length)
               {
                  if((_loc6_ = (_loc5_ = _loc2_[_loc4_]).indexOf(TDConstant.PlantAnmi_Sleep)) != -1 && _loc6_ == 0)
                  {
                     this._idleLabelNames.push(_loc5_);
                  }
                  _loc4_++;
               }
            }
            _loc1_ = DMath.randNum(0,this._idleLabelNames.length - 1);
            return this._idleLabelNames[_loc1_];
         }
         return TDConstant.PlantAnmi_Idle;
      }
   }
}
