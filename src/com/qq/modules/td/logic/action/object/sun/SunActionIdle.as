package com.qq.modules.td.logic.action.object.sun
{
   import com.qq.constant.td.TDConstant;
   import com.qq.modules.td.model.TDGameInfo;
   
   public class SunActionIdle extends BasicSunAction
   {
       
      
      private var _lastUpdateTime:Number;
      
      private var _existTime:int;
      
      public function SunActionIdle()
      {
         super();
      }
      
      override public function enterState(param1:Array = null) : void
      {
         super.enterState(param1);
         if(_sun.beCatchingStep == 0)
         {
            _sun.animation.gotoAndPlay(TDConstant.ObjectAnmi_Idle,true);
         }
         this._existTime = _sun.sunData.objectStaticInfo.getParam(TDConstant.NormalObj_Param_ExistTime);
         this._lastUpdateTime = TDGameInfo.getInstance().getCurGameTime();
      }
      
      override public function runningState() : void
      {
         var _loc1_:Number = TDGameInfo.getInstance().getCurGameTime();
         if(_loc1_ - this._lastUpdateTime > this._existTime)
         {
            _sun.setAction(TDConstant.ObjectAction_Disappear);
         }
      }
   }
}
