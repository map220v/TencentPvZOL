package com.qq.modules.td.logic.bt_ai.aiNode.aiCode.zombie
{
   import com.qq.constant.td.TDConstant;
   import com.qq.constant.td.TDSoundID;
   import com.qq.modules.td.command.game.sound.TDSoundCmd;
   import com.qq.modules.td.logic.bt_ai.aiNode.BaseZombieNodePvz;
   import com.qq.modules.td.logic.bt_ai.aiNode.executeNode.ExeDoAction;
   import com.qq.modules.td.logic.bt_ai.aiNode.requireNode.ReqAttackTarget;
   import com.qq.modules.td.logic.unit.zombie.BasicZombie;
   
   public class AI_Zombie_Future_Jetpack extends BaseZombieNodePvz
   {
       
      
      private var _playedAppearSound:Boolean = false;
      
      public function AI_Zombie_Future_Jetpack(param1:int = 30)
      {
         super(param1);
      }
      
      override public function calculate() : Boolean
      {
         if(ReqAttackTarget.calculateStatic(true,selfObj))
         {
            ExeDoAction.calculateStatic(selfObj,TDConstant.ZAction_Eat);
         }
         else
         {
            ExeDoAction.calculateStatic(selfObj,TDConstant.ZAction_Walk);
         }
         if(!this._playedAppearSound)
         {
            this._playedAppearSound = true;
            switch((selfObj as BasicZombie).zombieData.zombiestaticInfo.id)
            {
               case 870:
                  TDSoundCmd.playSound(TDSoundID.Future_Jetpack_Enter);
            }
         }
         return true;
      }
   }
}
