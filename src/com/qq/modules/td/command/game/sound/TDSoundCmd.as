package com.qq.modules.td.command.game.sound
{
   import org.robotlegs.extend.ExtendContext;
   import org.robotlegs.extend.command.StrongRobotlegCommandEvent;
   
   public class TDSoundCmd
   {
       
      
      public function TDSoundCmd()
      {
         super();
      }
      
      public static function cleanAllTDSound() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("TDSoundCommand","cleanAllTDSound",[]));
      }
      
      public static function cleanBackgoundMusic() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("TDSoundCommand","cleanBackgoundMusic",[]));
      }
      
      public static function playChoosePlantMusic() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("TDSoundCommand","playChoosePlantMusic",[]));
      }
      
      public static function playTDMusic() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("TDSoundCommand","playTDMusic",[]));
      }
      
      public static function switchToBigWaveTDMusic() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("TDSoundCommand","switchToBigWaveTDMusic",[]));
      }
      
      public static function switchToFinalWaveTDMusic() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("TDSoundCommand","switchToFinalWaveTDMusic",[]));
      }
      
      public static function stopChoosePlantMusic() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("TDSoundCommand","stopChoosePlantMusic",[]));
      }
      
      public static function stopTDMusic() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("TDSoundCommand","stopTDMusic",[]));
      }
      
      public static function pauseAllSound() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("TDSoundCommand","pauseAllSound",[]));
      }
      
      public static function resumeAllSound() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("TDSoundCommand","resumeAllSound",[]));
      }
      
      public static function zombieEat() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("TDSoundCommand","zombieEat",[]));
      }
      
      public static function finalWave() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("TDSoundCommand","finalWave",[]));
      }
      
      public static function collectSun() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("TDSoundCommand","collectSun",[]));
      }
      
      public static function zombieDropBody() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("TDSoundCommand","zombieDropBody",[]));
      }
      
      public static function firstZombieCome() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("TDSoundCommand","firstZombieCome",[]));
      }
      
      public static function potatoMineExplode() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("TDSoundCommand","potatoMineExplode",[]));
      }
      
      public static function cherryBombExplode() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("TDSoundCommand","cherryBombExplode",[]));
      }
      
      public static function pickupPlantCard() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("TDSoundCommand","pickupPlantCard",[]));
      }
      
      public static function bigWaveCome() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("TDSoundCommand","bigWaveCome",[]));
      }
      
      public static function readyPlant() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("TDSoundCommand","readyPlant",[]));
      }
      
      public static function win() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("TDSoundCommand","win",[]));
      }
      
      public static function lose() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("TDSoundCommand","lose",[]));
      }
      
      public static function playerPauseGame() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("TDSoundCommand","playerPauseGame",[]));
      }
      
      public static function cropPlant(param1:int) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("TDSoundCommand","cropPlant",[param1]));
      }
      
      public static function chooseCard() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("TDSoundCommand","chooseCard",[]));
      }
      
      public static function pickupShovel() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("TDSoundCommand","pickupShovel",[]));
      }
      
      public static function cleanPlant() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("TDSoundCommand","cleanPlant",[]));
      }
      
      public static function restorePlantCard() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("TDSoundCommand","restorePlantCard",[]));
      }
      
      public static function clickStartGame() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("TDSoundCommand","clickStartGame",[]));
      }
      
      public static function plantByEated() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("TDSoundCommand","plantByEated",[]));
      }
      
      public static function readyTopCar() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("TDSoundCommand","readyTopCar",[]));
      }
      
      public static function playRepeatBigBulletShoot() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("TDSoundCommand","playRepeatBigBulletShoot",[]));
      }
      
      public static function playPlantNormalAttack(param1:int) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("TDSoundCommand","playPlantNormalAttack",[param1]));
      }
      
      public static function playPlantSpecialAttack(param1:int) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("TDSoundCommand","playPlantSpecialAttack",[param1]));
      }
      
      public static function icebergBoom() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("TDSoundCommand","icebergBoom",[]));
      }
      
      public static function bonkchoyAttack(param1:int) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("TDSoundCommand","bonkchoyAttack",[param1]));
      }
      
      public static function zombieHitByBonkchoy() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("TDSoundCommand","zombieHitByBonkchoy",[]));
      }
      
      public static function zombieHitByBonkchoySpecialSkill() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("TDSoundCommand","zombieHitByBonkchoySpecialSkill",[]));
      }
      
      public static function graveEatTomb() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("TDSoundCommand","graveEatTomb",[]));
      }
      
      public static function playLawnMowerRun() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("TDSoundCommand","playLawnMowerRun",[]));
      }
      
      public static function sandstorm() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("TDSoundCommand","sandstorm",[]));
      }
      
      public static function plantBurn() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("TDSoundCommand","plantBurn",[]));
      }
      
      public static function zombieHitByBullet(param1:int, param2:int) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("TDSoundCommand","zombieHitByBullet",[param1,param2]));
      }
      
      public static function camelPanelBreak() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("TDSoundCommand","camelPanelBreak",[]));
      }
      
      public static function sarcophagusBreak() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("TDSoundCommand","sarcophagusBreak",[]));
      }
      
      public static function zombieHowl() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("TDSoundCommand","zombieHowl",[]));
      }
      
      public static function dropLeaf() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("TDSoundCommand","dropLeaf",[]));
      }
      
      public static function pickupLeaf() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("TDSoundCommand","pickupLeaf",[]));
      }
      
      public static function useSpecialSkill() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("TDSoundCommand","useSpecialSkill",[]));
      }
      
      public static function archery() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("TDSoundCommand","archery",[]));
      }
      
      public static function playZombieMoveSound(param1:int) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("TDSoundCommand","playZombieMoveSound",[param1]));
      }
      
      public static function bambooLiNoramlAttack() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("TDSoundCommand","bambooLiNoramlAttack",[]));
      }
      
      public static function bambooLiSpecialAttack() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("TDSoundCommand","bambooLiSpecialAttack",[]));
      }
      
      public static function plantBeAttacked() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("TDSoundCommand","plantBeAttacked",[]));
      }
      
      public static function playSummonZombieEffect() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("TDSoundCommand","playSummonZombieEffect",[]));
      }
      
      public static function playPotatoSpecialAttack() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("TDSoundCommand","playPotatoSpecialAttack",[]));
      }
      
      public static function playIcebergSpecialAttack() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("TDSoundCommand","playIcebergSpecialAttack",[]));
      }
      
      public static function bowlingimpact() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("TDSoundCommand","bowlingimpact",[]));
      }
      
      public static function snapDragonNormalAttack() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("TDSoundCommand","snapDragonNormalAttack",[]));
      }
      
      public static function snapDragonSpecialAttack() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("TDSoundCommand","snapDragonSpecialAttack",[]));
      }
      
      public static function toyCardDropWater() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("TDSoundCommand","toyCardDropWater",[]));
      }
      
      public static function zombieDropWater() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("TDSoundCommand","zombieDropWater",[]));
      }
      
      public static function playSunBombExplod() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("TDSoundCommand","playSunBombExplod",[]));
      }
      
      public static function playSound(param1:int) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("TDSoundCommand","playSound",[param1]));
      }
      
      public static function zombieDie(param1:uint) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("TDSoundCommand","zombieDie",[param1]));
      }
   }
}
