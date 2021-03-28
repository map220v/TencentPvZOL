package com.qq.modules.td.logic.bt_ai.aiNode.aiCode.zombie
{
   import com.qq.CommandName;
   import com.qq.constant.td.TDConditionID;
   import com.qq.constant.td.TDConstant;
   import com.qq.modules.td.logic.TDConditionTriggerManager;
   import com.qq.modules.td.logic.bt_ai.aiNode.BaseZombieNodePvz;
   import com.qq.modules.td.logic.bt_ai.aiNode.executeNode.ExeDoAction;
   import com.qq.modules.td.logic.unit.zombie.PirateZomboss;
   import com.qq.modules.td.model.TDStageInfo;
   import com.qq.utils.CommandDispatcher;
   import com.qq.utils.UtilsManager;
   
   public class AI_Zombie_Pirate_Zomboss extends BaseZombieNodePvz
   {
       
      
      private var _isJustSkill:Boolean;
      
      public function AI_Zombie_Pirate_Zomboss(param1:int = 30)
      {
         super(param1);
         CommandDispatcher.send(CommandName.TD_ShowOrHideBossHpBar,TDStageInfo.getInstance().checkGameType(TDConstant.TDgameType_Param_hasBossHpBar));
         TDConditionTriggerManager.instance.addCondition(TDConditionID.BOSS_APPEAR,true);
      }
      
      override public function calculate() : Boolean
      {
         if(!this.zomboss.isIntro)
         {
            ExeDoAction.calculateStatic(selfObj,TDConstant.ZAction_Intro);
            this.zomboss.isIntro = true;
         }
         else if(this.zomboss.isAtMaxCol)
         {
            if(Math.random() < 0.5)
            {
               ExeDoAction.calculateStatic(selfObj,TDConstant.ZAction_PirateZomboss_Jump);
            }
            else
            {
               ExeDoAction.calculateStatic(selfObj,TDConstant.ZAction_PirateZomboss_WalkBackwards);
            }
         }
         else if(this._isJustSkill)
         {
            this.randomMove();
            this._isJustSkill = false;
         }
         else
         {
            this.castRandomAttackSkill();
            this._isJustSkill = true;
         }
         return true;
      }
      
      private function calculateSkill() : int
      {
         var _loc1_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:Array = null;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc2_:XML = this.zomboss.getRunningProp(TDConstant.Gameobject_Prop_InitParamXml);
         var _loc3_:XML = _loc2_.phasePool.phase[this.zomboss.curPhase - 1];
         var _loc4_:Array = UtilsManager.splitMulStr(_loc3_.@skill,";",",");
         for each(_loc6_ in _loc4_)
         {
            _loc5_ += int(_loc6_[1]);
         }
         _loc7_ = _loc5_ * Math.random();
         _loc9_ = 0;
         while(_loc9_ < _loc4_.length)
         {
            _loc8_ += int(_loc4_[_loc9_][1]);
            if(_loc7_ < _loc8_)
            {
               return _loc4_[_loc9_][0];
            }
            _loc9_++;
         }
         return 0;
      }
      
      private function randomMove() : void
      {
         if(Math.random() < 0.5)
         {
            ExeDoAction.calculateStatic(selfObj,TDConstant.ZAction_PirateZomboss_Jump);
         }
         else
         {
            ExeDoAction.calculateStatic(selfObj,TDConstant.ZAction_PirateZomboss_WalkUpDown);
         }
      }
      
      private function castRandomAttackSkill() : void
      {
         var _loc1_:int = this.calculateSkill();
         switch(_loc1_)
         {
            case 1:
               ExeDoAction.calculateStatic(selfObj,this.crashAction);
               break;
            case 2:
               ExeDoAction.calculateStatic(selfObj,this.portalAction);
               break;
            case 3:
               ExeDoAction.calculateStatic(selfObj,this.rocketLaunchAction);
               break;
            case 4:
               ExeDoAction.calculateStatic(selfObj,this.stompAction);
         }
      }
      
      private function get zomboss() : PirateZomboss
      {
         return zombie as PirateZomboss;
      }
      
      protected function get crashAction() : String
      {
         return TDConstant.ZAction_PirateZomboss_Crash;
      }
      
      protected function get portalAction() : String
      {
         return TDConstant.ZAction_PirateZomboss_Portal;
      }
      
      protected function get rocketLaunchAction() : String
      {
         return TDConstant.ZAction_PirateZomboss_RocketLaunch;
      }
      
      protected function get stompAction() : String
      {
         return TDConstant.ZAction_PirateZomboss_Stomp;
      }
   }
}
