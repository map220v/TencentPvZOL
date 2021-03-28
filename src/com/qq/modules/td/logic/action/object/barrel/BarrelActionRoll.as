package com.qq.modules.td.logic.action.object.barrel
{
   import com.qq.constant.td.TDConstant;
   import com.qq.modules.td.logic.action.basic.BasicAction;
   import com.qq.modules.td.logic.bt_ai.aiUtils.TDSearchTargetUtils;
   import com.qq.modules.td.logic.unit.basic.IGameObject;
   import com.qq.modules.td.logic.unit.plant.BasicPlant;
   
   public class BarrelActionRoll extends BasicAction
   {
       
      
      public function BarrelActionRoll()
      {
         super();
      }
      
      override public function enterState(param1:Array = null) : void
      {
         super.enterState(param1);
         _gameObject.animation.gotoAndPlay("roll",true);
      }
      
      override public function runningState() : void
      {
         super.runningState();
         this.updateDamageState();
         var _loc1_:IGameObject = TDSearchTargetUtils.searchTargetPlant(_gameObject,[TDConstant.PlantHeightType_Normal,TDConstant.PlantHeightType_Low]);
         if(_loc1_)
         {
            if((_loc1_ as BasicPlant).plantData.plantStaticInfo.id == TDConstant.PlantType_SpikeRock)
            {
               _loc1_.changeHp(-_loc1_.objectModel.maxHp.get() * 0.34,TDConstant.AttackType_Normal,TDConstant.AttackMode_ZombieAttack,_gameObject);
            }
            else
            {
               _loc1_.changeHp(-int.MAX_VALUE,TDConstant.AttackType_Normal,TDConstant.AttackMode_ZombieAttack,_gameObject);
            }
         }
      }
      
      private function updateDamageState() : void
      {
         if(_gameObject.objectModel.curHp.get() <= 0)
         {
            _gameObject.setAction(TDConstant.BarrelAction_Die);
         }
      }
      
      override public function dispose() : void
      {
         super.dispose();
      }
   }
}
