package com.qq.modules.td.logic.bt_ai.aiNode.aiCode.zombie
{
   import com.qq.constant.td.TDConstant;
   import com.qq.constant.td.TDSoundID;
   import com.qq.modules.td.command.game.sound.TDSoundCmd;
   import com.qq.modules.td.logic.bt_ai.aiNode.BaseZombieNodePvz;
   import com.qq.modules.td.logic.bt_ai.aiNode.executeNode.ExeDoAction;
   import com.qq.modules.td.logic.bt_ai.aiNode.requireNode.ReqAttackTarget;
   import com.qq.modules.td.logic.bt_ai.aiNode.requireNode.ReqZombieDurationExpire;
   import com.qq.modules.td.logic.unit.zombie.FutureProtectorZombie;
   
   public class AI_Zombie_Future_Protector extends BaseZombieNodePvz
   {
       
      
      private var _playedAppearSound:Boolean = false;
      
      public function AI_Zombie_Future_Protector(param1:int = 30)
      {
         super(param1);
      }
      
      override public function calculate() : Boolean
      {
         if(ReqAttackTarget.calculateStatic(true,selfObj))
         {
            ExeDoAction.calculateStatic(selfObj,TDConstant.ZAction_Eat);
         }
         else if(this.protector.isHaveShield)
         {
            ExeDoAction.calculateStatic(selfObj,TDConstant.ZAction_FutureProtector_Shield);
         }
         else if(ReqZombieDurationExpire.calculateStatic(selfObj,true))
         {
            ExeDoAction.calculateStatic(selfObj,TDConstant.ZAction_FutureProtector_OpenShield);
         }
         else
         {
            if(!this._playedAppearSound)
            {
               this._playedAppearSound = true;
               TDSoundCmd.playSound(TDSoundID.Future_Protector_Walk_Loop);
            }
            ExeDoAction.calculateStatic(selfObj,TDConstant.ZAction_Walk);
         }
         return true;
      }
      
      public function get protector() : FutureProtectorZombie
      {
         return zombie as FutureProtectorZombie;
      }
   }
}
