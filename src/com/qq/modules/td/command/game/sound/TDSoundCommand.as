package com.qq.modules.td.command.game.sound
{
   import com.qq.constant.td.TDConstant;
   import com.qq.constant.td.TDSoundID;
   import com.qq.modules.sound.command.SoundCmd;
   import com.qq.modules.sound.data.TDSoundData;
   import com.qq.modules.td.logic.unit.basic.IGameObject;
   import com.qq.modules.td.logic.unit.zombie.BasicZombie;
   import com.qq.modules.td.model.TDGameInfo;
   import com.qq.modules.td.model.TDStageInfo;
   import com.qq.sound.AudioManager;
   import flash.utils.clearTimeout;
   import flash.utils.setTimeout;
   import org.robotlegs.extend.command.StrongRobotlegCommand;
   
   public class TDSoundCommand extends StrongRobotlegCommand
   {
       
      
      private var m_curBgSoundID:int;
      
      public function TDSoundCommand()
      {
         super();
      }
      
      public function cleanAllTDSound() : void
      {
         SoundCmd.stopBackgroundSound();
      }
      
      public function cleanBackgoundMusic() : void
      {
         SoundCmd.stopBackgroundSound();
      }
      
      public function playChoosePlantMusic() : void
      {
         SoundCmd.playBackgroundSound(TDSoundData.getInstance().getSoundID(TDSoundData.Sound_ChoosePlant),0);
      }
      
      public function playTDMusic() : void
      {
         this.m_curBgSoundID = TDSoundData.getInstance().getSoundID(TDSoundData.Sound_Background);
         SoundCmd.playBackgroundSound(this.m_curBgSoundID);
      }
      
      public function switchToBigWaveTDMusic() : void
      {
         var _loc2_:int = 0;
         var _loc1_:int = TDSoundData.getInstance().getSoundID(TDSoundData.Sound_BigWave);
         if(this.m_curBgSoundID != _loc1_)
         {
            if(this.m_curBgSoundID != 0)
            {
               SoundCmd.stopSound(this.m_curBgSoundID,true);
               _loc2_ = setTimeout(this.waitSwitchTDMusic,AudioManager.FADE_TIME,_loc2_,_loc1_);
            }
            else
            {
               this.waitSwitchTDMusic(0,_loc1_);
            }
         }
      }
      
      public function switchToFinalWaveTDMusic() : void
      {
         var _loc2_:int = 0;
         var _loc1_:int = TDSoundData.getInstance().getSoundID(TDSoundData.Sound_FinalWave);
         if(this.m_curBgSoundID != _loc1_)
         {
            if(this.m_curBgSoundID != 0)
            {
               SoundCmd.stopSound(this.m_curBgSoundID,true);
               _loc2_ = setTimeout(this.waitSwitchTDMusic,AudioManager.FADE_TIME,_loc2_,_loc1_);
            }
            else
            {
               this.waitSwitchTDMusic(0,_loc1_);
            }
         }
      }
      
      private function waitSwitchTDMusic(param1:int, param2:int) : void
      {
         if(param1 != 0)
         {
            clearTimeout(param1);
         }
         this.m_curBgSoundID = param2;
         SoundCmd.playBackgroundSound(this.m_curBgSoundID);
      }
      
      public function stopChoosePlantMusic() : void
      {
         SoundCmd.stopSound(TDSoundData.getInstance().getSoundID(TDSoundData.Sound_ChoosePlant),true);
      }
      
      public function stopTDMusic() : void
      {
         SoundCmd.stopSound(TDSoundData.getInstance().getSoundID(TDSoundData.Sound_Background),true);
      }
      
      public function pauseAllSound() : void
      {
         SoundCmd.pauseAllSound();
      }
      
      public function resumeAllSound() : void
      {
         SoundCmd.resumeAllSound();
      }
      
      public function zombieEat() : void
      {
         SoundCmd.playRandomSound([26,27,28]);
      }
      
      public function finalWave() : void
      {
         SoundCmd.playSound(55);
      }
      
      public function collectSun() : void
      {
         SoundCmd.playSound(117);
      }
      
      public function zombieDropBody() : void
      {
         SoundCmd.playSound(92);
      }
      
      public function firstZombieCome() : void
      {
      }
      
      public function potatoMineExplode() : void
      {
         SoundCmd.playSound(121);
      }
      
      public function cherryBombExplode() : void
      {
         SoundCmd.playSound(24);
      }
      
      public function pickupPlantCard() : void
      {
         SoundCmd.playSound(130);
      }
      
      public function bigWaveCome() : void
      {
         SoundCmd.playSound(75);
      }
      
      public function readyPlant() : void
      {
         if(TDStageInfo.getInstance().stageID == 5)
         {
            SoundCmd.playSound(442);
         }
         else
         {
            SoundCmd.playSound(125);
         }
      }
      
      public function win() : void
      {
         SoundCmd.playSound(TDSoundData.getInstance().getSoundID(TDSoundData.Sound_Win));
      }
      
      public function lose() : void
      {
         SoundCmd.playSound(TDSoundData.getInstance().getSoundID(TDSoundData.Sound_Lose));
      }
      
      public function playerPauseGame() : void
      {
         SoundCmd.playSound(107);
      }
      
      public function cropPlant(param1:int) : void
      {
         SoundCmd.playRandomSound([109,111]);
         switch(param1)
         {
            case 6500:
               SoundCmd.playSound(TDSoundID.Plant_InfiNut_Spawn);
               break;
            case 8100:
               SoundCmd.playSound(TDSoundID.Plant_Oxygen);
         }
      }
      
      public function chooseCard() : void
      {
         SoundCmd.playSound(130);
      }
      
      private function playHitZombieSound(param1:int, param2:Array) : void
      {
         var _loc4_:Array = null;
         var _loc5_:BasicZombie = null;
         var _loc3_:IGameObject = TDGameInfo.getInstance().getGameObjctByUID(param1);
         if(_loc3_ == null)
         {
            return;
         }
         if(_loc3_.objectModel.unitCatalog == TDConstant.UnitCatalog_Zombie)
         {
            if((_loc5_ = _loc3_ as BasicZombie).zombieData.isExistArmor())
            {
               switch(_loc5_.zombieData.unitType)
               {
                  case 120:
                  case 101:
                     _loc4_ = [114,115];
                     break;
                  case 130:
                  case 102:
                     _loc4_ = [131,132];
                     break;
                  case 160:
                  case 161:
                  case 162:
                     _loc4_ = [223,224];
                     break;
                  case 980:
                  case 1020:
                     _loc4_ = [451];
                     break;
                  default:
                     _loc4_ = param2;
               }
            }
            else
            {
               _loc4_ = param2;
            }
         }
         else
         {
            _loc4_ = param2;
         }
         SoundCmd.playRandomSound(_loc4_);
      }
      
      private function hitZombie(param1:int) : void
      {
         this.playHitZombieSound(param1,[139,140,141]);
      }
      
      private function cabagePultHitZombie(param1:int) : void
      {
         this.playHitZombieSound(param1,[193,194,195,196,197]);
      }
      
      public function pickupShovel() : void
      {
         SoundCmd.playSound(134);
      }
      
      public function cleanPlant() : void
      {
         SoundCmd.playRandomSound([173,174,175]);
      }
      
      public function restorePlantCard() : void
      {
         SoundCmd.playSound(148);
      }
      
      public function clickStartGame() : void
      {
         SoundCmd.playSound(178);
      }
      
      public function plantByEated() : void
      {
         SoundCmd.playSound(179);
      }
      
      public function readyTopCar() : void
      {
         SoundCmd.playRandomSound([180,181,182,183,184]);
      }
      
      private function playCabbagePultAttack() : void
      {
         SoundCmd.playRandomSound([188,189,190]);
      }
      
      private function playCabbagePultSpecialAttack() : void
      {
         SoundCmd.playSound(198);
      }
      
      private function playPeashooterSpecialAttack() : void
      {
         SoundCmd.playSound(199);
      }
      
      public function playRepeatBigBulletShoot() : void
      {
         SoundCmd.playSound(200);
      }
      
      private function sunFlowerSpecialSkill() : void
      {
         SoundCmd.playSound(201);
      }
      
      private function playWallnutSpecialSkill() : void
      {
         SoundCmd.playRandomSound([202,203]);
      }
      
      private function peashooterAttack() : void
      {
         SoundCmd.playRandomSound([229,230]);
      }
      
      private function boomerangeAttack() : void
      {
         SoundCmd.playRandomSound([204,205,206]);
      }
      
      private function zombieHitByBoomerange(param1:int) : void
      {
         this.playHitZombieSound(param1,[207,208]);
      }
      
      public function playPlantNormalAttack(param1:int) : void
      {
         switch(param1)
         {
            case 1200:
            case 1210:
               this.peashooterAttack();
               break;
            case 1600:
               this.boomerangeAttack();
               break;
            case 1400:
               this.playCabbagePultAttack();
               break;
            case 3900:
               this.snapDragonNormalAttack();
         }
      }
      
      public function playPlantSpecialAttack(param1:int) : void
      {
         switch(param1)
         {
            case 1400:
               this.playCabbagePultSpecialAttack();
               break;
            case 1200:
            case 1210:
               this.playPeashooterSpecialAttack();
               break;
            case 1300:
               this.playWallnutSpecialSkill();
               break;
            case 1100:
            case 1110:
               this.sunFlowerSpecialSkill();
               break;
            case 1600:
               this.boomerangeSpeicalSkill();
               break;
            case 3900:
               this.snapDragonSpecialAttack();
         }
      }
      
      private function boomerangeSpeicalSkill() : void
      {
         SoundCmd.playRandomSound([210,210]);
      }
      
      public function icebergBoom() : void
      {
         SoundCmd.playSound(211);
      }
      
      public function bonkchoyAttack(param1:int) : void
      {
         switch(param1)
         {
            case TDConstant.Bonkchoy_AttckType_FinalAttckRight:
            case TDConstant.Bonkchoy_AttckType_FinalAttackLeft:
               SoundCmd.playSound(213);
               break;
            default:
               SoundCmd.playSound(212);
         }
      }
      
      public function zombieHitByBonkchoy() : void
      {
         SoundCmd.playSound(214);
      }
      
      public function zombieHitByBonkchoySpecialSkill() : void
      {
         SoundCmd.playSound(214);
      }
      
      public function graveEatTomb() : void
      {
         SoundCmd.playSound(216);
      }
      
      public function playLawnMowerRun() : void
      {
         SoundCmd.playSound(TDSoundData.getInstance().getSoundID(TDSoundData.Sound_LawnMowerRun));
      }
      
      public function sandstorm() : void
      {
         SoundCmd.playRandomSound([219,220,221]);
      }
      
      public function plantBurn() : void
      {
      }
      
      public function zombieHitByBullet(param1:int, param2:int) : void
      {
         switch(param2)
         {
            case 600:
               this.cabagePultHitZombie(param1);
               break;
            case 500:
               this.zombieHitByBoomerange(param1);
               break;
            default:
               this.hitZombie(param1);
         }
      }
      
      public function camelPanelBreak() : void
      {
         SoundCmd.playRandomSound([225,226]);
      }
      
      public function sarcophagusBreak() : void
      {
         SoundCmd.playRandomSound([227,228]);
      }
      
      public function zombieHowl() : void
      {
         SoundCmd.playSound(TDSoundData.getInstance().getSoundID(TDSoundData.Sound_ZombieAppear));
      }
      
      public function dropLeaf() : void
      {
         SoundCmd.playSound(234);
      }
      
      public function pickupLeaf() : void
      {
         SoundCmd.playSound(235);
      }
      
      public function useSpecialSkill() : void
      {
         SoundCmd.playRandomSound([241,242]);
      }
      
      public function archery() : void
      {
         SoundCmd.playSound(255);
      }
      
      public function playZombieMoveSound(param1:int) : void
      {
         if(param1 == 400)
         {
            SoundCmd.playSound(256);
         }
      }
      
      public function bambooLiNoramlAttack() : void
      {
         SoundCmd.playSound(257);
      }
      
      public function bambooLiSpecialAttack() : void
      {
         SoundCmd.playSound(258);
      }
      
      public function plantBeAttacked() : void
      {
         SoundCmd.playSound(279);
      }
      
      public function playSummonZombieEffect() : void
      {
         SoundCmd.playSound(301);
      }
      
      public function playPotatoSpecialAttack() : void
      {
         SoundCmd.playSound(302);
      }
      
      public function playIcebergSpecialAttack() : void
      {
         SoundCmd.playSound(303);
      }
      
      public function bowlingimpact() : void
      {
         SoundCmd.playSound(351);
      }
      
      public function snapDragonNormalAttack() : void
      {
         SoundCmd.playSound(357);
      }
      
      public function snapDragonSpecialAttack() : void
      {
         SoundCmd.playSound(358);
      }
      
      public function toyCardDropWater() : void
      {
         SoundCmd.playSound(359);
      }
      
      public function zombieDropWater() : void
      {
         SoundCmd.playSound(360);
      }
      
      public function playSunBombExplod() : void
      {
         SoundCmd.playSound(211);
      }
      
      public function playSound(param1:int) : void
      {
         SoundCmd.playSound(param1);
      }
      
      public function zombieDie(param1:uint) : void
      {
         switch(param1)
         {
            case 880:
               SoundCmd.playSound(TDSoundID.Future_Cone_Mvmt_Death);
               break;
            case 890:
               SoundCmd.playSound(TDSoundID.Future_Disco_Mvmt_Death);
               break;
            case 900:
               SoundCmd.playSound(TDSoundID.Future_Football_Mvmt_Death);
               break;
            case 870:
            case 891:
               SoundCmd.playSound(TDSoundID.Future_Jetpack_Death);
               break;
            case 860:
               SoundCmd.playSound(TDSoundID.Future_Protector_Die);
         }
      }
   }
}
