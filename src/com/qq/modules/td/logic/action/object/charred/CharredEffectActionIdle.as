package com.qq.modules.td.logic.action.object.charred
{
   import com.qq.constant.td.TDConstant;
   import com.qq.modules.td.logic.action.basic.BasicAction;
   import com.qq.modules.td.logic.unit.basic.IGameObject;
   import com.qq.modules.td.model.TDGameInfo;
   import flash.events.Event;
   
   public class CharredEffectActionIdle extends BasicAction
   {
       
      
      private var _charredEffectUID:int;
      
      public function CharredEffectActionIdle()
      {
         super();
      }
      
      override public function enterState(param1:Array = null) : void
      {
         super.enterState(param1);
         _gameObject.animation.gotoAndPlay(TDConstant.ObjectAnmi_Idle);
         _gameObject.animation.addEventListener(Event.COMPLETE,this.onFinishAction);
         this._charredEffectUID = _gameObject.objectModel.getParamValue(TDConstant.GameObjectData_Param_CharredUIN);
      }
      
      override public function leaveState() : void
      {
         _gameObject.animation.removeEventListener(Event.COMPLETE,this.onFinishAction);
         super.leaveState();
      }
      
      private function onFinishAction(param1:Event) : void
      {
         var _loc2_:IGameObject = TDGameInfo.getInstance().getGameObjctByUID(this._charredEffectUID);
         if(_loc2_ != null && _loc2_.objectModel.unitCatalog == TDConstant.UnitCatalog_Zombie)
         {
            _loc2_.setAction(TDConstant.ZAction_Disappear);
         }
         _gameObject.dispose();
      }
   }
}
