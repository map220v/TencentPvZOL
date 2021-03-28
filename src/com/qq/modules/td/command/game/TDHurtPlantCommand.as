package com.qq.modules.td.command.game
{
   import com.qq.constant.td.TDConstant;
   import com.qq.modules.td.command.effects.TDEffectCmd;
   import com.qq.modules.td.command.game.sound.TDSoundCmd;
   import com.qq.modules.td.logic.numeric.TDDamageCaculete;
   import com.qq.modules.td.logic.unit.basic.IGameObject;
   import org.robotlegs.extend.command.StrongRobotlegCommand;
   
   public class TDHurtPlantCommand extends StrongRobotlegCommand
   {
       
      
      public function TDHurtPlantCommand()
      {
         super();
      }
      
      public function firePlant(param1:Object) : void
      {
         var _loc2_:IGameObject = param1 as IGameObject;
         if(_loc2_ == null)
         {
            return;
         }
         TDDamageCaculete.executeDamage(_loc2_,-int.MAX_VALUE,TDConstant.AttackType_Normal,TDConstant.AttackMode_ZombieFire,null);
         TDEffectCmd.playBlitAnimation(TDConstant.UnitType_FireEffect,_loc2_.x,_loc2_.y);
         TDSoundCmd.plantBurn();
      }
   }
}
