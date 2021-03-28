package com.qq.modules.td.logic.bt_ai.aiNode.requireNode
{
   import com.qq.constant.td.TDConstant;
   import com.qq.modules.td.logic.bt_ai.aiNode.BaseNodePvz;
   import com.qq.modules.td.logic.bt_ai.aiUtils.TDSearchTargetUtils;
   import com.qq.modules.td.logic.unit.basic.IGameObject;
   import com.qq.modules.td.logic.unit.zombie.BasicZombie;
   import tencent.tools.behaviourTrees.BehaviourTreeNodeType;
   
   public class ReqAttackTarget extends BaseNodePvz
   {
       
      
      protected var param1:Boolean = false;
      
      public function ReqAttackTarget()
      {
         super(BehaviourTreeNodeType.REQUIRE);
      }
      
      public static function calculateStatic(param1:Boolean, param2:IGameObject, param3:Array = null) : Boolean
      {
         if(!param3)
         {
            if(param2 is BasicZombie)
            {
               param3 = (param2 as BasicZombie).zombieData.zombiestaticInfo.attackHeightArr;
            }
            else
            {
               param3 = [TDConstant.PlantHeightType_Normal,TDConstant.PlantHeightType_Low];
            }
         }
         var _loc4_:IGameObject;
         if((_loc4_ = TDSearchTargetUtils.searchTargetPlant(param2,param3)) == null)
         {
            _loc4_ = TDSearchTargetUtils.searchTargetNutsShield(param2);
         }
         if(param2.curAttackTarget != null && param2.curAttackTarget != _loc4_)
         {
            param2.setAttackTarget(_loc4_);
         }
         var _loc5_:Boolean = false;
         if(_loc4_ == null || !_loc4_.isVaild)
         {
            _loc5_ = true;
         }
         else if(!_loc4_.objectModel.isPermitAttack())
         {
            _loc5_ = true;
         }
         else if(param2.objectModel.camp == TDConstant.TDCamp_Enemy && param2.x < _loc4_.x)
         {
            _loc5_ = true;
         }
         else if(param2.objectModel.camp == TDConstant.TDCamp_Self && param2.x > _loc4_.x)
         {
            _loc5_ = true;
         }
         if(_loc5_)
         {
            _loc4_ = null;
         }
         param2.setAttackTarget(_loc4_);
         if(param1)
         {
            return _loc4_ != null ? true : false;
         }
         return _loc4_ != null ? false : true;
      }
      
      override public function setDynamicParams(param1:Array) : void
      {
         if(param1[0] == "false")
         {
            this.param1 = false;
         }
         if(param1[0] == "true")
         {
            this.param1 = true;
         }
      }
      
      override public function calculate() : Boolean
      {
         return calculateStatic(this.param1,selfObj);
      }
   }
}
