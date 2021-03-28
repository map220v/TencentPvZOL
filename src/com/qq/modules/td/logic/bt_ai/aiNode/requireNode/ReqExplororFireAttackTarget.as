package com.qq.modules.td.logic.bt_ai.aiNode.requireNode
{
   import com.qq.constant.td.TDConstant;
   import com.qq.modules.td.logic.bt_ai.aiUtils.TDSearchTargetUtils;
   import com.qq.modules.td.logic.unit.basic.IGameObject;
   
   public class ReqExplororFireAttackTarget extends ReqAttackTarget
   {
       
      
      public function ReqExplororFireAttackTarget()
      {
         super();
      }
      
      override public function calculate() : Boolean
      {
         selfObj.attackArea.inflate(50,0);
         if(TDSearchTargetUtils.searchTargetNutsShield(selfObj) != null)
         {
            selfObj.objectModel.cleanState(TDConstant.TDUnitState_HasTorch);
            selfObj.animation.setBoneVisibleRule("torch_fire_*",false);
            selfObj.animation.setBoneVisibleRule("torch_end_lit",false);
         }
         var _loc1_:IGameObject = TDSearchTargetUtils.searchTargetPlant(selfObj);
         selfObj.attackArea.inflate(-50,0);
         if(selfObj.curAttackTarget != null && selfObj.curAttackTarget != _loc1_)
         {
            selfObj.setAttackTarget(_loc1_);
         }
         var _loc2_:Boolean = false;
         if(_loc1_ == null || !_loc1_.isVaild)
         {
            _loc2_ = true;
         }
         else if(!_loc1_.objectModel.isPermitAttack())
         {
            _loc2_ = true;
         }
         else if(selfObj.objectModel.camp == TDConstant.TDCamp_Enemy && selfObj.x < _loc1_.x)
         {
            _loc2_ = true;
         }
         else if(selfObj.objectModel.camp == TDConstant.TDCamp_Self && selfObj.x > _loc1_.x)
         {
            _loc2_ = true;
         }
         if(_loc2_)
         {
            _loc1_ = null;
         }
         selfObj.setAttackTarget(_loc1_);
         if(param1 == true)
         {
            return _loc1_ != null ? true : false;
         }
         return _loc1_ != null ? false : true;
      }
   }
}
