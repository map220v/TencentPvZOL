package com.qq.modules.td.logic.action.object.effect
{
   import com.qq.constant.td.TDConstant;
   import com.qq.modules.td.logic.action.basic.BasicAction;
   import com.qq.modules.td.view.effects.TDEffectPlayInfo;
   import com.qq.utils.DMath;
   import flash.events.Event;
   
   public class EffectPlayAction extends BasicAction
   {
       
      
      private var _effectInitInfo:TDEffectPlayInfo;
      
      public function EffectPlayAction()
      {
         super();
      }
      
      override public function enterState(param1:Array = null) : void
      {
         var _loc2_:String = null;
         var _loc3_:Array = null;
         var _loc4_:int = 0;
         super.enterState(param1);
         if(_gameObject.hasRunningProp(TDConstant.Gameobject_Prop_InitUnitParam))
         {
            this._effectInitInfo = _gameObject.getRunningProp(TDConstant.Gameobject_Prop_InitUnitParam);
         }
         if(this._effectInitInfo)
         {
            _loc2_ = this._effectInitInfo.frameLabe;
         }
         if(_loc2_ == null || _loc2_ == "")
         {
            _loc3_ = _gameObject.animation.getAllLabelName();
            _loc4_ = DMath.randNum(0,_loc3_.length - 1);
            _loc2_ = _loc3_[_loc4_];
         }
         _gameObject.animation.gotoAndPlay(_loc2_);
         _gameObject.animation.addEventListener(Event.COMPLETE,this.onFinishAction);
      }
      
      override public function leaveState() : void
      {
         _gameObject.animation.removeEventListener(Event.COMPLETE,this.onFinishAction);
      }
      
      private function onFinishAction(param1:Event) : void
      {
         _gameObject.dispose();
      }
   }
}
