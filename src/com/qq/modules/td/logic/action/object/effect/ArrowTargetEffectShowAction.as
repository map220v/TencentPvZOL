package com.qq.modules.td.logic.action.object.effect
{
   import com.qq.constant.td.TDConstant;
   import com.qq.modules.td.command.effects.TDEffectCmd;
   import com.qq.modules.td.logic.action.basic.BasicAction;
   import com.qq.modules.td.logic.unit.basic.IGameObject;
   import com.qq.modules.td.model.TDGameInfo;
   
   public class ArrowTargetEffectShowAction extends BasicAction
   {
       
      
      private var _target:IGameObject;
      
      private var _shooter:IGameObject;
      
      private var _shootUID:int;
      
      public function ArrowTargetEffectShowAction()
      {
         super();
      }
      
      override public function enterState(param1:Array = null) : void
      {
         super.enterState(param1);
         var _loc2_:int = _gameObject.getRunningProp(TDConstant.GameObject_Prop_ArrowTargetEffect_TargetUID);
         this._target = TDGameInfo.getInstance().getGameObjctByUID(_loc2_);
         this._shootUID = _gameObject.getRunningProp(TDConstant.GameObject_Prop_ArrowTargetEffect_ShooterUID);
         this._shooter = TDGameInfo.getInstance().getGameObjctByUID(this._shootUID);
         _gameObject.animation.gotoAndPlay("show",1);
      }
      
      override public function runningState() : void
      {
         super.runningState();
         var _loc1_:int = -1;
         if(this._target != null && !this._target.isVaild)
         {
            _loc1_ = this._shootUID;
         }
         if(this._shooter != null && !this._shooter.isVaild)
         {
            _loc1_ = this._shootUID;
         }
         if(_loc1_ != -1)
         {
            TDEffectCmd.hideArrowTargetEffect(_loc1_);
         }
      }
      
      override public function dispose() : void
      {
         this._target = null;
         this._shooter = null;
         super.dispose();
      }
   }
}
