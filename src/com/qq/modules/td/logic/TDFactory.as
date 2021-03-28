package com.qq.modules.td.logic
{
   import asgui.blit.Blit;
   import asgui.blit.data.BlitDataManager;
   import asgui.blit.display.IBlitClip;
   import asgui.blit.display.IBlitDisplayContainer;
   import com.qq.CommandName;
   import com.qq.constant.td.TDConstant;
   import com.qq.constant.td.TDObjTypeID;
   import com.qq.modules.td.data.game.unit.TDBulletData;
   import com.qq.modules.td.data.game.unit.TDNormalObjectData;
   import com.qq.modules.td.data.game.unit.TDPlantData;
   import com.qq.modules.td.data.game.unit.TDZombieData;
   import com.qq.modules.td.data.game.unit.basic.TDGameObjectData;
   import com.qq.modules.td.logic.action.basic.IAction;
   import com.qq.modules.td.logic.action.bullet.BActionForCococnutPlantfood;
   import com.qq.modules.td.logic.action.bullet.BAction_Boomerang;
   import com.qq.modules.td.logic.action.bullet.BulletActionArrow;
   import com.qq.modules.td.logic.action.bullet.BulletActionBoom;
   import com.qq.modules.td.logic.action.bullet.BulletActionBounce;
   import com.qq.modules.td.logic.action.bullet.BulletActionBubbleFly;
   import com.qq.modules.td.logic.action.bullet.BulletActionBubbleSround;
   import com.qq.modules.td.logic.action.bullet.BulletActionDisappear;
   import com.qq.modules.td.logic.action.bullet.BulletActionFireArrow;
   import com.qq.modules.td.logic.action.bullet.BulletActionForBambooGun;
   import com.qq.modules.td.logic.action.bullet.BulletActionForBanana;
   import com.qq.modules.td.logic.action.bullet.BulletActionForCitronPlantfood;
   import com.qq.modules.td.logic.action.bullet.BulletActionForDaffodil;
   import com.qq.modules.td.logic.action.bullet.BulletActionForGlossyPult;
   import com.qq.modules.td.logic.action.bullet.BulletActionForMelonPlantfood;
   import com.qq.modules.td.logic.action.bullet.BulletActionForMelonpult;
   import com.qq.modules.td.logic.action.bullet.BulletActionForThreepeater;
   import com.qq.modules.td.logic.action.bullet.BulletActionFreeLine;
   import com.qq.modules.td.logic.action.bullet.BulletActionGroundRocket;
   import com.qq.modules.td.logic.action.bullet.BulletActionLine;
   import com.qq.modules.td.logic.action.bullet.BulletActionNitrationMushroom;
   import com.qq.modules.td.logic.action.bullet.BulletActionPlantFoodForBanana;
   import com.qq.modules.td.logic.action.bullet.BulletActionRocket;
   import com.qq.modules.td.logic.action.bullet.BulletActionSphinxFireBall;
   import com.qq.modules.td.logic.action.bullet.BulletActionThunderPine;
   import com.qq.modules.td.logic.action.bullet.BulletActionThunderPinePlantfood;
   import com.qq.modules.td.logic.action.bullet.BulletActiongargantuarLaser;
   import com.qq.modules.td.logic.action.object.achieve.ObjectAchieveActionIdle;
   import com.qq.modules.td.logic.action.object.achieve.ObjectAchieveActionResult;
   import com.qq.modules.td.logic.action.object.barrel.BarrelActionDie;
   import com.qq.modules.td.logic.action.object.barrel.BarrelActionIdle;
   import com.qq.modules.td.logic.action.object.barrel.BarrelActionRoll;
   import com.qq.modules.td.logic.action.object.basic.ObjectActionBeThrew;
   import com.qq.modules.td.logic.action.object.basic.ObjectActionBlowAway;
   import com.qq.modules.td.logic.action.object.basic.ObjectActionDisappear;
   import com.qq.modules.td.logic.action.object.basic.ObjectActionKickedAway;
   import com.qq.modules.td.logic.action.object.bone.BoneActionThrowing;
   import com.qq.modules.td.logic.action.object.bossRocket.FutureBossRocketFly;
   import com.qq.modules.td.logic.action.object.bossRocket.FutureBossRocketTargetAction;
   import com.qq.modules.td.logic.action.object.charred.CharredEffectActionIdle;
   import com.qq.modules.td.logic.action.object.coconutGame.TDCoconutControllerAction;
   import com.qq.modules.td.logic.action.object.coin.CoinActionCollect;
   import com.qq.modules.td.logic.action.object.coin.CoinActionFlip;
   import com.qq.modules.td.logic.action.object.coin.CoinActionPopOut;
   import com.qq.modules.td.logic.action.object.dave.DaveBlahblahAction;
   import com.qq.modules.td.logic.action.object.dave.DaveIdleAction;
   import com.qq.modules.td.logic.action.object.dave.DaveStageEndAction;
   import com.qq.modules.td.logic.action.object.dropCard.DropCardActionCollect;
   import com.qq.modules.td.logic.action.object.dropCard.DropCardActionFly;
   import com.qq.modules.td.logic.action.object.dropItem.ZombieHandActionDrop;
   import com.qq.modules.td.logic.action.object.dropItem.ZombieHeadActionDrop;
   import com.qq.modules.td.logic.action.object.dropItem.ZombieItemActionDrop;
   import com.qq.modules.td.logic.action.object.effect.ArrowTargetEffectHideAction;
   import com.qq.modules.td.logic.action.object.effect.ArrowTargetEffectShowAction;
   import com.qq.modules.td.logic.action.object.effect.EffectAdvPlayAction;
   import com.qq.modules.td.logic.action.object.effect.EffectLoopAction;
   import com.qq.modules.td.logic.action.object.effect.EffectPlayAction;
   import com.qq.modules.td.logic.action.object.effect.TDBlowZombieAction;
   import com.qq.modules.td.logic.action.object.effect.TDConveyEffectAction;
   import com.qq.modules.td.logic.action.object.effect.TDMusicGameBoxerEffectAction;
   import com.qq.modules.td.logic.action.object.effect.TDPopObjectEffectAction;
   import com.qq.modules.td.logic.action.object.effect.TDPopPotatoEffectAction;
   import com.qq.modules.td.logic.action.object.effect.TDSkillPortalZombieAction;
   import com.qq.modules.td.logic.action.object.effect.TDSkillSummonZombieAction;
   import com.qq.modules.td.logic.action.object.effect.TDZombieFixedAction;
   import com.qq.modules.td.logic.action.object.effect.TDZombieWalkToAnotherRowAction;
   import com.qq.modules.td.logic.action.object.effect.WaterActionBreaker;
   import com.qq.modules.td.logic.action.object.electricBubble.ElectricBubbleExplode;
   import com.qq.modules.td.logic.action.object.grassScroll.GrassScrollActionRun;
   import com.qq.modules.td.logic.action.object.laser.LaserTrackActionIdle;
   import com.qq.modules.td.logic.action.object.lawnMower.LawnMowerActionAppear;
   import com.qq.modules.td.logic.action.object.lawnMower.LawnMowerActionIdle;
   import com.qq.modules.td.logic.action.object.lawnMower.LawnMowerActionRun;
   import com.qq.modules.td.logic.action.object.lawnMower.LawnMowerActionSink;
   import com.qq.modules.td.logic.action.object.leaf.LeafActionCollect;
   import com.qq.modules.td.logic.action.object.leaf.LeafActionFly;
   import com.qq.modules.td.logic.action.object.loot.LootItemActionIdle;
   import com.qq.modules.td.logic.action.object.loot.LootItemActionPopup;
   import com.qq.modules.td.logic.action.object.magnetArmor.ZombieItemActionMagnet;
   import com.qq.modules.td.logic.action.object.musicGame.TDMusicGameConveyorActionIdle;
   import com.qq.modules.td.logic.action.object.nutsShield.NutsShieldIdleAction;
   import com.qq.modules.td.logic.action.object.nutsShield.NutsShieldOnAction;
   import com.qq.modules.td.logic.action.object.other.ElectromagneticShieldIdle;
   import com.qq.modules.td.logic.action.object.other.GroundFirePlayAction;
   import com.qq.modules.td.logic.action.object.other.JalapenoFireAction;
   import com.qq.modules.td.logic.action.object.other.YetiKeyAction;
   import com.qq.modules.td.logic.action.object.plantFoodEffect.PlantFoodEffectAction;
   import com.qq.modules.td.logic.action.object.poison.PoisonFly;
   import com.qq.modules.td.logic.action.object.poison.PoisonIdle;
   import com.qq.modules.td.logic.action.object.prismGrassLine.PrismGrassConnectLineActionIdle;
   import com.qq.modules.td.logic.action.object.prismGrassLine.PrismGrassHitLineActionIdle;
   import com.qq.modules.td.logic.action.object.quickSand.LongQuickSandAction;
   import com.qq.modules.td.logic.action.object.quickSand.QuickSandAppearAction;
   import com.qq.modules.td.logic.action.object.quickSand.QuickSandDisapperAction;
   import com.qq.modules.td.logic.action.object.quickSand.QuickSandRunningAction;
   import com.qq.modules.td.logic.action.object.seaSplashEffect.SeaSplashEffectActionFollow;
   import com.qq.modules.td.logic.action.object.shootGame.TDShootingGameControllerAction;
   import com.qq.modules.td.logic.action.object.shootGame.TDShootingGameFireAction;
   import com.qq.modules.td.logic.action.object.shootGame.TDShootingGamePowerSavingAction;
   import com.qq.modules.td.logic.action.object.shootGame.TDShootingGameSleepAction;
   import com.qq.modules.td.logic.action.object.shootGame.TDShootingGameWakeUpAction;
   import com.qq.modules.td.logic.action.object.spars.SparsActionDie;
   import com.qq.modules.td.logic.action.object.spars.SparsActionIdle;
   import com.qq.modules.td.logic.action.object.spars.SparsActionShow;
   import com.qq.modules.td.logic.action.object.sun.SunActionBeCatching;
   import com.qq.modules.td.logic.action.object.sun.SunActionDrop;
   import com.qq.modules.td.logic.action.object.sun.SunActionFly;
   import com.qq.modules.td.logic.action.object.sun.SunActionIdle;
   import com.qq.modules.td.logic.action.object.sun.product.SunActionPopOut;
   import com.qq.modules.td.logic.action.object.sunBomb.SunBombActionExplod;
   import com.qq.modules.td.logic.action.object.sunBomb.SunBombActionFall;
   import com.qq.modules.td.logic.action.object.sunBomb.SunBombTrackDisappear;
   import com.qq.modules.td.logic.action.object.sunBomb.SunBombTrackIdle;
   import com.qq.modules.td.logic.action.object.switcher.SwitcherActionIdle;
   import com.qq.modules.td.logic.action.object.switcher.SwitcherActionRun;
   import com.qq.modules.td.logic.action.object.tomb.TombActionIdle;
   import com.qq.modules.td.logic.action.object.torch.TorchActionBoom;
   import com.qq.modules.td.logic.action.object.yakshaStorm.YakshaStormMove;
   import com.qq.modules.td.logic.action.plant.bambooGun.PBambooGunActionIdle;
   import com.qq.modules.td.logic.action.plant.bambooGun.PBambooGunActionShoot;
   import com.qq.modules.td.logic.action.plant.bambooLi.BambooLiActionSpecialSkill;
   import com.qq.modules.td.logic.action.plant.bambooLi.BambooLiAttckAction;
   import com.qq.modules.td.logic.action.plant.banana.PBananaActionAttack;
   import com.qq.modules.td.logic.action.plant.banana.PBananaActionSpecialSkill;
   import com.qq.modules.td.logic.action.plant.basic.PlantActionArm;
   import com.qq.modules.td.logic.action.plant.basic.PlantActionAttackIdle;
   import com.qq.modules.td.logic.action.plant.basic.PlantActionFadeOut;
   import com.qq.modules.td.logic.action.plant.basic.PlantActionIdle;
   import com.qq.modules.td.logic.action.plant.basic.PlantActionPushedAway;
   import com.qq.modules.td.logic.action.plant.basic.PlantActionShoot;
   import com.qq.modules.td.logic.action.plant.basic.PlantActionSleep;
   import com.qq.modules.td.logic.action.plant.basic.PlantActionTransform;
   import com.qq.modules.td.logic.action.plant.basic.PlantActionWakeUp;
   import com.qq.modules.td.logic.action.plant.blover.PBloverActionBlow;
   import com.qq.modules.td.logic.action.plant.bonkchoy.BonkchoyActionAttack;
   import com.qq.modules.td.logic.action.plant.bonkchoy.BonkchoyActionSpecialSkill;
   import com.qq.modules.td.logic.action.plant.boomerang.PBoomerangSpecialSkillAction;
   import com.qq.modules.td.logic.action.plant.bubbleFlower.BubbleFlowerAttackAction;
   import com.qq.modules.td.logic.action.plant.bubbleFlower.PBubbleFlowerSpecialSkill;
   import com.qq.modules.td.logic.action.plant.cabbagepult.PCabbagepulActionAttack;
   import com.qq.modules.td.logic.action.plant.cabbagepult.PCabbagepulSpecialSkillAction;
   import com.qq.modules.td.logic.action.plant.carrotRocket.CarrotShootAction;
   import com.qq.modules.td.logic.action.plant.carrotRocket.PCarrotRocketSpecialSkillAction;
   import com.qq.modules.td.logic.action.plant.cherryBomb.PCherryBombActionExplode;
   import com.qq.modules.td.logic.action.plant.citron.PCitronActionCharge;
   import com.qq.modules.td.logic.action.plant.citron.PCitronActionShoot;
   import com.qq.modules.td.logic.action.plant.citron.PCitronActionSpecialSkill;
   import com.qq.modules.td.logic.action.plant.coconutCannon.PCoconutCannonActionIdle;
   import com.qq.modules.td.logic.action.plant.coconutCannon.PCoconutCannonActionShoot;
   import com.qq.modules.td.logic.action.plant.coconutCannon.PCoconutCannonActionSpecialSkill;
   import com.qq.modules.td.logic.action.plant.dandelion.DandelionAttackAction;
   import com.qq.modules.td.logic.action.plant.dandelion.DandelionSpecialSkillAction;
   import com.qq.modules.td.logic.action.plant.durian.PDurianActionAttack;
   import com.qq.modules.td.logic.action.plant.durian.PDurianActionSpecialSkill;
   import com.qq.modules.td.logic.action.plant.empeach.PEmpeachActionExplode;
   import com.qq.modules.td.logic.action.plant.flytrap.PFlytrapActionEat;
   import com.qq.modules.td.logic.action.plant.flytrap.PFlytrapSpecialSkillAction;
   import com.qq.modules.td.logic.action.plant.frostMushroom.FrostMushroomAttackAction;
   import com.qq.modules.td.logic.action.plant.garlic.GarlicIdleAction1;
   import com.qq.modules.td.logic.action.plant.garlic.GarlicIdleAction2;
   import com.qq.modules.td.logic.action.plant.garlic.GarlicIdleAction3;
   import com.qq.modules.td.logic.action.plant.garlic.PGarlicSpecialSkill;
   import com.qq.modules.td.logic.action.plant.glossyGanoderma.PGlossyGanodermaActionSpecialSkill;
   import com.qq.modules.td.logic.action.plant.gravebuster.PGravebusterActionEat;
   import com.qq.modules.td.logic.action.plant.highWallnut.PHighWallNutSpecialSkill;
   import com.qq.modules.td.logic.action.plant.highWallnut.PHighWallNutsIdle;
   import com.qq.modules.td.logic.action.plant.icebean.PIcebeanActionExplode;
   import com.qq.modules.td.logic.action.plant.iceburg.PIceburgActionFrozen;
   import com.qq.modules.td.logic.action.plant.iceburg.PIceburgActionSpecialSkill;
   import com.qq.modules.td.logic.action.plant.icepea.PIcepeaActionSpecialSkill;
   import com.qq.modules.td.logic.action.plant.jalapeno.PJalapenoActionExplode;
   import com.qq.modules.td.logic.action.plant.kernalpult.PlantKernalpultActionBuffShoot;
   import com.qq.modules.td.logic.action.plant.kernalpult.PlantKernalpultActionShoot;
   import com.qq.modules.td.logic.action.plant.kernalpult.PlantKernalpultActionSpecialSkill;
   import com.qq.modules.td.logic.action.plant.laserbean.PLaserbeanActionShoot;
   import com.qq.modules.td.logic.action.plant.laserbean.PLaserbeanActionSpecialSkill;
   import com.qq.modules.td.logic.action.plant.magnet.PMagnetActionWorking;
   import com.qq.modules.td.logic.action.plant.melonpult.PMelonpultActionShoot;
   import com.qq.modules.td.logic.action.plant.moteng.PlantMotengActionIdle;
   import com.qq.modules.td.logic.action.plant.moteng.PlantMotengActionShoot;
   import com.qq.modules.td.logic.action.plant.moteng.PlantMotengSpecialAction;
   import com.qq.modules.td.logic.action.plant.musicGame.TDMusicGameBoxerActionFight;
   import com.qq.modules.td.logic.action.plant.musicGame.TDMusicGameBoxerActionIdle;
   import com.qq.modules.td.logic.action.plant.narcissus.DaffodilShootAction;
   import com.qq.modules.td.logic.action.plant.narcissus.PDaffodilActionSpecialSkill;
   import com.qq.modules.td.logic.action.plant.nitrationMushroom.PNitrationMushroomAttack;
   import com.qq.modules.td.logic.action.plant.nitrationMushroom.PNitrationMushroomSpecialSkill;
   import com.qq.modules.td.logic.action.plant.nuts.PNutsIdle;
   import com.qq.modules.td.logic.action.plant.nuts.PNutsPlant;
   import com.qq.modules.td.logic.action.plant.nuts.PNutsRecover;
   import com.qq.modules.td.logic.action.plant.nuts.PNutsSpecialSkill;
   import com.qq.modules.td.logic.action.plant.oxygenAlgae.POxygenAlgaeSpecialSkill;
   import com.qq.modules.td.logic.action.plant.peashooter.PPeaShooterActionSpecialSkill;
   import com.qq.modules.td.logic.action.plant.peashooter.PlantPeaShooterActionIdle;
   import com.qq.modules.td.logic.action.plant.peashooter.PlantPeaShooterActionShoot;
   import com.qq.modules.td.logic.action.plant.pineapple.PPineappleActionSpecialSkill;
   import com.qq.modules.td.logic.action.plant.pomegranate.PPomegranateActionSpecialSkill;
   import com.qq.modules.td.logic.action.plant.potatoBowling.PPotatoBowlingActionRoll;
   import com.qq.modules.td.logic.action.plant.potatoBowling.PPotatoBowlingBombActionRoll;
   import com.qq.modules.td.logic.action.plant.potatomine.PPotatomineActionArmed;
   import com.qq.modules.td.logic.action.plant.potatomine.PPotatomineActionIdle;
   import com.qq.modules.td.logic.action.plant.potatomine.PPotatomineActionMashed;
   import com.qq.modules.td.logic.action.plant.potatomine.PPotatomineActionSpecialSkill;
   import com.qq.modules.td.logic.action.plant.potatomine.PPotatomineAction_ArmedIdle;
   import com.qq.modules.td.logic.action.plant.prismGrass.PPrismGrassSpecialSkill;
   import com.qq.modules.td.logic.action.plant.prismGrass.PrismGrassAttackAction;
   import com.qq.modules.td.logic.action.plant.repeater.PPeaRepeatShooterActionSpecialSkill;
   import com.qq.modules.td.logic.action.plant.repeater.PlantPeaRepeatShooterActionShoot;
   import com.qq.modules.td.logic.action.plant.smallWisteria.PSmallWisteriaActionAttack;
   import com.qq.modules.td.logic.action.plant.snapdragon.PSnapdragonActionAttack;
   import com.qq.modules.td.logic.action.plant.snapdragon.PSnapdragonActionSpecialSkill;
   import com.qq.modules.td.logic.action.plant.spikeweed.PSpikeweedActionAttack;
   import com.qq.modules.td.logic.action.plant.spikeweed.PSpikeweedActionSpecialSkill;
   import com.qq.modules.td.logic.action.plant.springbean.PSpringbeanActionAttack;
   import com.qq.modules.td.logic.action.plant.springbean.PSpringbeanActionSpecialSkill;
   import com.qq.modules.td.logic.action.plant.squash.PSquashActionAttack;
   import com.qq.modules.td.logic.action.plant.sunflower.PlantSunFlowerActionProduct;
   import com.qq.modules.td.logic.action.plant.sunflower.PlantSunFlowerSpecialSkillAction;
   import com.qq.modules.td.logic.action.plant.sunflower_twin.PlantSunFlowerTwinSpecialSkillAction;
   import com.qq.modules.td.logic.action.plant.threepeater.PThreepeaterActionShoot;
   import com.qq.modules.td.logic.action.plant.threepeater.PThreepeaterActionSpecialSkill;
   import com.qq.modules.td.logic.action.plant.thunderPine.PThunderPineSpecialSkill;
   import com.qq.modules.td.logic.action.plant.thunderPine.ThunderPineAttackAction;
   import com.qq.modules.td.logic.action.plant.tileTurnip.PTileTurnipActionAttack;
   import com.qq.modules.td.logic.action.plant.wallnut.PWallnutActionIdle;
   import com.qq.modules.td.logic.action.plant.wallnut.PWallnutActionSpecialSkill;
   import com.qq.modules.td.logic.action.plant.waxgourd.WaxgourdRollAction;
   import com.qq.modules.td.logic.action.plant.wintermelon.PWintermelonActionSpecialSkill;
   import com.qq.modules.td.logic.action.zombie.archer.ZombieArcherEndShootAction;
   import com.qq.modules.td.logic.action.zombie.archer.ZombieArcherShootAction;
   import com.qq.modules.td.logic.action.zombie.archer.ZombieArcherStartShootAction;
   import com.qq.modules.td.logic.action.zombie.archer.ZombieArcherWaitShootAction;
   import com.qq.modules.td.logic.action.zombie.balloon.ZombieActionFly;
   import com.qq.modules.td.logic.action.zombie.balloon.ZombieActionFlyOut;
   import com.qq.modules.td.logic.action.zombie.balloon.ZombieActionSwing;
   import com.qq.modules.td.logic.action.zombie.barrelRoller.ZActionBarrelRollerEat;
   import com.qq.modules.td.logic.action.zombie.barrelRoller.ZActionBarrelRollerWalk;
   import com.qq.modules.td.logic.action.zombie.basic.ZombieActionCarried;
   import com.qq.modules.td.logic.action.zombie.basic.ZombieActionCatchSun;
   import com.qq.modules.td.logic.action.zombie.basic.ZombieActionCatchSunEnd;
   import com.qq.modules.td.logic.action.zombie.basic.ZombieActionDeath;
   import com.qq.modules.td.logic.action.zombie.basic.ZombieActionDeathCamel;
   import com.qq.modules.td.logic.action.zombie.basic.ZombieActionDisappear;
   import com.qq.modules.td.logic.action.zombie.basic.ZombieActionEat;
   import com.qq.modules.td.logic.action.zombie.basic.ZombieActionEat2;
   import com.qq.modules.td.logic.action.zombie.basic.ZombieActionIdle;
   import com.qq.modules.td.logic.action.zombie.basic.ZombieActionIntro;
   import com.qq.modules.td.logic.action.zombie.basic.ZombieActionKickedOut;
   import com.qq.modules.td.logic.action.zombie.basic.ZombieActionRun;
   import com.qq.modules.td.logic.action.zombie.basic.ZombieActionStun;
   import com.qq.modules.td.logic.action.zombie.basic.ZombieActionSuperLongDeath;
   import com.qq.modules.td.logic.action.zombie.basic.ZombieActionThrowItem;
   import com.qq.modules.td.logic.action.zombie.basic.ZombieActionWalk;
   import com.qq.modules.td.logic.action.zombie.basic.ZombieActionWalk2;
   import com.qq.modules.td.logic.action.zombie.basic.ZombieActionWalkBackwards;
   import com.qq.modules.td.logic.action.zombie.bengbu.ZActionBengbuCastSkill;
   import com.qq.modules.td.logic.action.zombie.bengbu.ZActionBengbuFreeSkill;
   import com.qq.modules.td.logic.action.zombie.boss.ZActionBossSphinxAngleAttack;
   import com.qq.modules.td.logic.action.zombie.boss.ZActionBossSphinxAngleMove;
   import com.qq.modules.td.logic.action.zombie.boss.ZActionBossSphinxAttack1;
   import com.qq.modules.td.logic.action.zombie.boss.ZActionBossSphinxDeath;
   import com.qq.modules.td.logic.action.zombie.boss.ZActionBossSphinxSleep;
   import com.qq.modules.td.logic.action.zombie.boss.ZActionBossSphinxWaitingAngle;
   import com.qq.modules.td.logic.action.zombie.boss.ZActionBossSphinxWakeUp;
   import com.qq.modules.td.logic.action.zombie.bugBotImp.ZActionBugBotImpTransition;
   import com.qq.modules.td.logic.action.zombie.drunkard.ZombieDrunkardDrinkAction;
   import com.qq.modules.td.logic.action.zombie.emperorQin.ZActionEmperorQinCastSkill;
   import com.qq.modules.td.logic.action.zombie.emperorQin.ZActionEmperorQinDeath;
   import com.qq.modules.td.logic.action.zombie.emperorQin.ZActionEmperorQinDrillOut;
   import com.qq.modules.td.logic.action.zombie.emperorQin.ZActionEmperorQinSecondPhaseAttack;
   import com.qq.modules.td.logic.action.zombie.emperorQin.ZActionEmperorQinSummonZombie;
   import com.qq.modules.td.logic.action.zombie.emperorQin.ZActionEmperorQinThirdPhaseAttack;
   import com.qq.modules.td.logic.action.zombie.emperorQin.ZActionEmperorQinWakeUp;
   import com.qq.modules.td.logic.action.zombie.flipCard.ZActionFlipCardDeath;
   import com.qq.modules.td.logic.action.zombie.flipCard.ZActionZombieFlipCard;
   import com.qq.modules.td.logic.action.zombie.futureProtector.ZActionFutureProtectorCloseShield;
   import com.qq.modules.td.logic.action.zombie.futureProtector.ZActionFutureProtectorOpenShield;
   import com.qq.modules.td.logic.action.zombie.futureProtector.ZActionFutureProtectorShield;
   import com.qq.modules.td.logic.action.zombie.futureZomboss.ZActionFutureZombossRocketLaunch;
   import com.qq.modules.td.logic.action.zombie.futureZomboss.ZActionFutureZombossStun;
   import com.qq.modules.td.logic.action.zombie.gargantuar.ZombieActionLaunchImp;
   import com.qq.modules.td.logic.action.zombie.gargantuar.ZombieActionSmash;
   import com.qq.modules.td.logic.action.zombie.gunman.ZActionGunmanWalkShoot;
   import com.qq.modules.td.logic.action.zombie.harvester.ZActionHarvesterEat;
   import com.qq.modules.td.logic.action.zombie.jetpack.ZActionFutureJetpackEnter;
   import com.qq.modules.td.logic.action.zombie.mechDisco.ZActionMechDiscoDance;
   import com.qq.modules.td.logic.action.zombie.mechFootball.ZActionMechFootballBump;
   import com.qq.modules.td.logic.action.zombie.mechGargantuar.ZActionMechGargantuarHammer;
   import com.qq.modules.td.logic.action.zombie.mechGargantuar.ZActionMechGargantuarLaser;
   import com.qq.modules.td.logic.action.zombie.mechGargantuar.ZActionMechGargantuarSummon;
   import com.qq.modules.td.logic.action.zombie.mechGargantuar.ZActionMechGargantuarWalk;
   import com.qq.modules.td.logic.action.zombie.monkeyCharmer.ZActionMonkeyAttack;
   import com.qq.modules.td.logic.action.zombie.monkeyCharmer.ZActionMonkeyCharmerThrow;
   import com.qq.modules.td.logic.action.zombie.paper.ZombieActionEatNoPaper;
   import com.qq.modules.td.logic.action.zombie.paper.ZombieActionGasp;
   import com.qq.modules.td.logic.action.zombie.paper.ZombieActionWalkNoPaper;
   import com.qq.modules.td.logic.action.zombie.parrot.ZActionParrotCarry;
   import com.qq.modules.td.logic.action.zombie.parrot.ZActionParrotFly;
   import com.qq.modules.td.logic.action.zombie.peddler.ZombiePeddlerSetDogAction;
   import com.qq.modules.td.logic.action.zombie.pirateCannon.ZActionPirateCannonSummon;
   import com.qq.modules.td.logic.action.zombie.pirateCaptain.ZActionCaptainGetParrot;
   import com.qq.modules.td.logic.action.zombie.pirateCaptain.ZActionCaptainReleaseParrot;
   import com.qq.modules.td.logic.action.zombie.pirateZomboss.ZActionPirateZombossCrash;
   import com.qq.modules.td.logic.action.zombie.pirateZomboss.ZActionPirateZombossJump;
   import com.qq.modules.td.logic.action.zombie.pirateZomboss.ZActionPirateZombossPortal;
   import com.qq.modules.td.logic.action.zombie.pirateZomboss.ZActionPirateZombossRocketLaunch;
   import com.qq.modules.td.logic.action.zombie.pirateZomboss.ZActionPirateZombossStomp;
   import com.qq.modules.td.logic.action.zombie.pirateZomboss.ZActionPirateZombossStun;
   import com.qq.modules.td.logic.action.zombie.pirateZomboss.ZActionPirateZombossWalkBackwards;
   import com.qq.modules.td.logic.action.zombie.pirateZomboss.ZActionPirateZombossWalkUpDown;
   import com.qq.modules.td.logic.action.zombie.poison.ZActionPoisonCaster;
   import com.qq.modules.td.logic.action.zombie.polevaulter.ZombieActionJump;
   import com.qq.modules.td.logic.action.zombie.quicksand.ZActionThrowQuickSandAction;
   import com.qq.modules.td.logic.action.zombie.sarcophagus.ZombieSarcophagusActionSpecialBreak;
   import com.qq.modules.td.logic.action.zombie.sarcophagus.ZombieSarcophagusActionSpecialEat;
   import com.qq.modules.td.logic.action.zombie.sarcophagus.ZombieSarcophagusActionSpecialWalk;
   import com.qq.modules.td.logic.action.zombie.seagull.ZActionSeagullDeath;
   import com.qq.modules.td.logic.action.zombie.seagull.ZActionSeagullFreeFly;
   import com.qq.modules.td.logic.action.zombie.supervisor.ZombieActionSupervisonAddSpeed;
   import com.qq.modules.td.logic.action.zombie.supervisor.ZombieActionSupervisorEat;
   import com.qq.modules.td.logic.action.zombie.swashbuckler.ZombieActionSwashbucklerSwing;
   import com.qq.modules.td.logic.action.zombie.terracotta.ZombieTerracottaCottaAction;
   import com.qq.modules.td.logic.action.zombie.terracotta.ZombieTerracottaCtzAction;
   import com.qq.modules.td.logic.action.zombie.terracotta.ZombieTerracottaDeathAction;
   import com.qq.modules.td.logic.action.zombie.terracotta.ZombieTerracottaLineupAction;
   import com.qq.modules.td.logic.action.zombie.terracotta.ZombieTerracottaPopupAction;
   import com.qq.modules.td.logic.action.zombie.tombraiser.ZombieTombraiserActionThrow;
   import com.qq.modules.td.logic.action.zombie.wolfKnight.ZActionWolfKnightSwoop;
   import com.qq.modules.td.logic.action.zombie.yaksha.ZActionYakshaSkill;
   import com.qq.modules.td.logic.unit.basic.IGameObject;
   import com.qq.modules.td.logic.unit.bullet.BasicBullet;
   import com.qq.modules.td.logic.unit.object.TDDropCard;
   import com.qq.modules.td.logic.unit.object.TDLeaf;
   import com.qq.modules.td.logic.unit.object.TDLootItem;
   import com.qq.modules.td.logic.unit.object.TDNormalObject;
   import com.qq.modules.td.logic.unit.object.TDNutsShield;
   import com.qq.modules.td.logic.unit.object.TDSampleMower;
   import com.qq.modules.td.logic.unit.object.TDSeaSplashEffect;
   import com.qq.modules.td.logic.unit.object.TDSpars;
   import com.qq.modules.td.logic.unit.object.TDSparsBlockItem;
   import com.qq.modules.td.logic.unit.object.TDSun;
   import com.qq.modules.td.logic.unit.object.TDSunBomb;
   import com.qq.modules.td.logic.unit.object.TDSunBombTrack;
   import com.qq.modules.td.logic.unit.object.TDSwitcher;
   import com.qq.modules.td.logic.unit.object.TDZombieDropItem;
   import com.qq.modules.td.logic.unit.object.TDZombieMagnetArmor;
   import com.qq.modules.td.logic.unit.object.TDZombieThrowItem;
   import com.qq.modules.td.logic.unit.plant.BasicPlant;
   import com.qq.modules.td.logic.unit.plant.HayrickPlant;
   import com.qq.modules.td.logic.unit.plant.NutsPlant;
   import com.qq.modules.td.logic.unit.plant.OxygenAlagePlant;
   import com.qq.modules.td.logic.unit.zombie.BarrelRollerZombie;
   import com.qq.modules.td.logic.unit.zombie.BasicZombie;
   import com.qq.modules.td.logic.unit.zombie.CamelZombie;
   import com.qq.modules.td.logic.unit.zombie.FlipCardZombie;
   import com.qq.modules.td.logic.unit.zombie.FutureProtectorZombie;
   import com.qq.modules.td.logic.unit.zombie.FutureZomboss;
   import com.qq.modules.td.logic.unit.zombie.GargantuarZombie;
   import com.qq.modules.td.logic.unit.zombie.JellyFishZombie;
   import com.qq.modules.td.logic.unit.zombie.PirateCaptainZombie;
   import com.qq.modules.td.logic.unit.zombie.PirateZomboss;
   import com.qq.modules.td.logic.unit.zombie.SeagullZombie;
   import com.qq.modules.td.logic.unit.zombie.TDRaZombie;
   import com.qq.modules.td.logic.unit.zombie.TerracottaZombie;
   import com.qq.modules.td.logic.unit.zombie.YetiZombie;
   import com.qq.utils.CommandDispatcher;
   import com.qq.utils.UrlManager;
   import flash.display.BitmapData;
   import flash.events.Event;
   import flash.utils.Dictionary;
   import org.as3commons.logging.api.getLogger;
   
   public class TDFactory
   {
      
      private static var _unitClassList:Dictionary = new Dictionary();
      
      private static var _initUnitClassFuncList:Array;
      
      private static var _unitUidIndex:int = 0;
      
      private static var _lastUnitUin:int;
      
      private static var _zombieClassList:Dictionary;
      
      private static var _unitDataClassList:Dictionary;
      
      private static var _actionClassMap:Dictionary;
      
      private static var _resMap:Dictionary;
       
      
      public function TDFactory()
      {
         super();
      }
      
      private static function initUnitClassFunc() : void
      {
         var _loc1_:Function = null;
         if(_initUnitClassFuncList == null)
         {
            _initUnitClassFuncList = new Array();
            _initUnitClassFuncList.push(initZombieClassList);
            _initUnitClassFuncList.push(initPlantClassList);
            _initUnitClassFuncList.push(initBulletClassList);
            _initUnitClassFuncList.push(initObjectClassList);
            while(_initUnitClassFuncList.length > 0)
            {
               _loc1_ = _initUnitClassFuncList.pop();
               if(_loc1_ != null)
               {
                  _loc1_();
               }
            }
         }
      }
      
      private static function addUnitClassToList(param1:int, param2:int, param3:Class) : void
      {
         var _loc4_:Dictionary;
         if((_loc4_ = _unitClassList[param1]) == null)
         {
            _loc4_ = new Dictionary();
            _unitClassList[param1] = _loc4_;
         }
         _loc4_[param2] = param3;
      }
      
      private static function getUnitClass(param1:int, param2:int) : Class
      {
         initUnitClassFunc();
         var _loc3_:Dictionary = _unitClassList[param1];
         if(_loc3_ != null)
         {
            if(_loc3_[param2] != null)
            {
               return _loc3_[param2];
            }
            return _loc3_[0];
         }
         return null;
      }
      
      private static function initPlantClassList() : void
      {
         addUnitClassToList(TDConstant.UnitCatalog_Plant,0,BasicPlant);
         addUnitClassToList(TDConstant.UnitCatalog_Plant,TDConstant.PlantType_Nuts,NutsPlant);
         addUnitClassToList(TDConstant.UnitCatalog_Plant,TDConstant.PlantType_Oxygenalage,OxygenAlagePlant);
         addUnitClassToList(TDConstant.UnitCatalog_Plant,TDConstant.PlantType_Hayrick,HayrickPlant);
      }
      
      private static function createPlant(param1:int, param2:Array, param3:Boolean = false, param4:Boolean = false) : BasicPlant
      {
         var _loc6_:Class = null;
         var _loc5_:TDPlantData;
         if((_loc5_ = createGameObjectData(TDConstant.UnitCatalog_Plant,param1) as TDPlantData) == null)
         {
            getLogger().error("创建的植物类型" + param1 + "不存在");
            return null;
         }
         if((_loc6_ = getUnitClass(TDConstant.UnitCatalog_Plant,param1)) == null)
         {
            _loc6_ = getUnitClass(TDConstant.UnitCatalog_Plant,0);
         }
         var _loc7_:BasicPlant;
         (_loc7_ = new _loc6_()).setData(_loc5_);
         addRunningPropList(_loc7_,param2);
         _loc7_.init(param3,param4);
         return _loc7_;
      }
      
      public static function createGameobject(param1:int, param2:int, param3:Array = null, param4:Boolean = false, param5:Boolean = false) : IGameObject
      {
         var _loc6_:IGameObject = null;
         switch(param1)
         {
            case TDConstant.UnitCatalog_Bullet:
               _loc6_ = createBullet(param2,param3,param5);
               break;
            case TDConstant.UnitCatalog_Zombie:
               _loc6_ = createBT_Zombie(param2,param3,param5);
               break;
            case TDConstant.UnitCatalog_Object:
               _loc6_ = createNormalObject(param2,param3,param5);
               break;
            case TDConstant.UnitCatalog_Plant:
               _loc6_ = createPlant(param2,param3,param4,param5);
         }
         return _loc6_;
      }
      
      public static function getNextUnitUin() : int
      {
         _unitUidIndex += 1;
         _lastUnitUin = _unitUidIndex;
         return _lastUnitUin;
      }
      
      public static function getLastUnitUin() : int
      {
         return _lastUnitUin;
      }
      
      private static function initZombieClassList() : void
      {
         addUnitClassToList(TDConstant.UnitCatalog_Zombie,0,BasicZombie);
         addUnitClassToList(TDConstant.UnitCatalog_Zombie,TDConstant.ZombieType_RA,TDRaZombie);
         addUnitClassToList(TDConstant.UnitCatalog_Zombie,TDConstant.ZombieType_CAMEL_HEAD,CamelZombie);
         addUnitClassToList(TDConstant.UnitCatalog_Zombie,TDConstant.ZombieType_CAMEL_HUMP,CamelZombie);
         addUnitClassToList(TDConstant.UnitCatalog_Zombie,TDConstant.ZombieType_CAMEL_TAIL,CamelZombie);
         addUnitClassToList(TDConstant.UnitCatalog_Zombie,TDConstant.ZombieType_CAMEL_HEAD_FlipCard,FlipCardZombie);
         addUnitClassToList(TDConstant.UnitCatalog_Zombie,TDConstant.ZombieType_CAMEL_HUMP_FlipCard,FlipCardZombie);
         addUnitClassToList(TDConstant.UnitCatalog_Zombie,TDConstant.ZombieType_CAMEL_TAIL_FlipCard,FlipCardZombie);
         addUnitClassToList(TDConstant.UnitCatalog_Zombie,TDConstant.ZombieType_Qin_Terracotta,TerracottaZombie);
         addUnitClassToList(TDConstant.UnitCatalog_Zombie,TDConstant.ZombieType_PirateCaptain,PirateCaptainZombie);
         addUnitClassToList(TDConstant.UnitCatalog_Zombie,TDConstant.ZombieType_PirateGargantuar,GargantuarZombie);
         addUnitClassToList(TDConstant.UnitCatalog_Zombie,TDConstant.ZombieType_PirateSeagull,SeagullZombie);
         addUnitClassToList(TDConstant.UnitCatalog_Zombie,TDConstant.ZombieType_MiniGamePirateSeagull,SeagullZombie);
         addUnitClassToList(TDConstant.UnitCatalog_Zombie,TDConstant.ZombieType_BarrelRoller,BarrelRollerZombie);
         addUnitClassToList(TDConstant.UnitCatalog_Zombie,TDConstant.ZombieType_FutureProtector,FutureProtectorZombie);
         addUnitClassToList(TDConstant.UnitCatalog_Zombie,TDConstant.ZombieType_Yeti,YetiZombie);
         addUnitClassToList(TDConstant.UnitCatalog_Zombie,TDConstant.ZombieType_PirateZomboss,PirateZomboss);
         addUnitClassToList(TDConstant.UnitCatalog_Zombie,TDConstant.ZombieType_FutureZomboss,FutureZomboss);
         addUnitClassToList(TDConstant.UnitCatalog_Zombie,TDConstant.ZombieType_JellyFish,JellyFishZombie);
      }
      
      public static function createBT_Zombie(param1:int, param2:Array = null, param3:Object = null, param4:Boolean = false) : BasicZombie
      {
         var _loc5_:TDZombieData;
         if((_loc5_ = createGameObjectData(TDConstant.UnitCatalog_Zombie,param1) as TDZombieData) == null)
         {
            getLogger().error("创建的僵尸类型" + param1 + "不存在");
            return null;
         }
         _loc5_.loadCreateConfigObj(param3);
         _loc5_.init();
         var _loc6_:Class;
         if((_loc6_ = getUnitClass(TDConstant.UnitCatalog_Zombie,_loc5_.zombiestaticInfo.type)) == null)
         {
            _loc6_ = getUnitClass(TDConstant.UnitCatalog_Zombie,0);
         }
         var _loc7_:BasicZombie;
         (_loc7_ = new _loc6_()).setData(_loc5_);
         addRunningPropList(_loc7_,param2);
         _loc7_.init(false,param4);
         return _loc7_;
      }
      
      private static function initObjectClassList() : void
      {
         addUnitClassToList(TDConstant.UnitCatalog_Object,0,TDNormalObject);
         addUnitClassToList(TDConstant.UnitCatalog_Object,TDConstant.UnitType_Sun,TDSun);
         addUnitClassToList(TDConstant.UnitCatalog_Object,TDConstant.UnitType_BigSun,TDSun);
         addUnitClassToList(TDConstant.UnitCatalog_Object,TDConstant.UnitType_TDSwitcher,TDSwitcher);
         addUnitClassToList(TDConstant.UnitCatalog_Object,TDConstant.UnitType_TD_SPARS,TDSpars);
         addUnitClassToList(TDConstant.UnitCatalog_Object,TDConstant.UnitType_TD_SPARS_UP,TDSpars);
         addUnitClassToList(TDConstant.UnitCatalog_Object,TDConstant.UnitType_PlantSun,TDSun);
         addUnitClassToList(TDConstant.UnitCatalog_Object,TDConstant.UnitType_FinalBag,TDLootItem);
         addUnitClassToList(TDConstant.UnitCatalog_Object,TDConstant.UnitType_DropHead,TDZombieDropItem);
         addUnitClassToList(TDConstant.UnitCatalog_Object,TDConstant.UnitType_DropHand,TDZombieDropItem);
         addUnitClassToList(TDConstant.UnitCatalog_Object,TDConstant.UnitType_DropItem,TDZombieDropItem);
         addUnitClassToList(TDConstant.UnitCatalog_Object,TDConstant.UnitType_MagnetArmor,TDZombieMagnetArmor);
         addUnitClassToList(TDConstant.UnitCatalog_Object,TDConstant.UnitType_ThrowBone,TDZombieThrowItem);
         addUnitClassToList(TDConstant.UnitCatalog_Object,TDConstant.UnitType_Leaf,TDLeaf);
         addUnitClassToList(TDConstant.UnitCatalog_Object,TDConstant.UnitType_DropCard,TDDropCard);
         addUnitClassToList(TDConstant.UnitCatalog_Object,TDConstant.UnitType_TD_SPARS_BLOCK_ITEM,TDSparsBlockItem);
         addUnitClassToList(TDConstant.UnitCatalog_Object,TDObjTypeID.Obj_SunBomb,TDSunBomb);
         addUnitClassToList(TDConstant.UnitCatalog_Object,TDObjTypeID.Obj_SunBombTrack,TDSunBombTrack);
         addUnitClassToList(TDConstant.UnitCatalog_Object,TDObjTypeID.Obj_Poison,TDZombieThrowItem);
         addUnitClassToList(TDConstant.UnitCatalog_Object,TDObjTypeID.Obj_Nuts_Shield,TDNutsShield);
         addUnitClassToList(TDConstant.UnitCatalog_Object,TDObjTypeID.Obj_Sea_Splash_Effect,TDSeaSplashEffect);
         addUnitClassToList(TDConstant.UnitCatalog_Object,TDObjTypeID.Obj_Sample_Mower,TDSampleMower);
      }
      
      public static function createNormalObject(param1:int, param2:Array = null, param3:Boolean = false) : TDNormalObject
      {
         var _loc6_:TDNormalObjectData = null;
         var _loc5_:TDNormalObject;
         var _loc4_:Class;
         if((_loc5_ = new (_loc4_ = getUnitClass(TDConstant.UnitCatalog_Object,param1))()) != null)
         {
            _loc6_ = new TDNormalObjectData(TDConstant.UnitCatalog_Object,param1);
            _loc5_.setData(_loc6_);
            addRunningPropList(_loc5_,param2);
            _loc5_.init(false,param3);
            return _loc5_;
         }
         getLogger("TD").debug("创建的通用物件类型" + param1 + "不存在");
         return null;
      }
      
      private static function initBulletClassList() : void
      {
         addUnitClassToList(TDConstant.UnitCatalog_Bullet,0,BasicBullet);
      }
      
      public static function createBullet(param1:int, param2:Array = null, param3:Boolean = false) : BasicBullet
      {
         var _loc6_:TDBulletData = null;
         var _loc4_:Class;
         if((_loc4_ = getUnitClass(TDConstant.UnitCatalog_Bullet,param1)) == null)
         {
            _loc4_ = getUnitClass(TDConstant.UnitCatalog_Bullet,0);
         }
         var _loc5_:BasicBullet;
         if((_loc5_ = new _loc4_()) != null)
         {
            _loc6_ = new TDBulletData(TDConstant.UnitCatalog_Bullet,param1);
            _loc5_.setData(_loc6_);
            addRunningPropList(_loc5_,param2);
            _loc5_.init(false,param3);
            return _loc5_;
         }
         getLogger("TD").debug("创建的子弹类型" + param1 + "不存在");
         return null;
      }
      
      private static function initUnitDataClass() : void
      {
         _unitDataClassList = new Dictionary();
         _unitDataClassList[TDConstant.UnitCatalog_Zombie] = TDZombieData;
         _unitDataClassList[TDConstant.UnitCatalog_Plant] = TDPlantData;
      }
      
      public static function createGameObjectData(param1:int, param2:int) : TDGameObjectData
      {
         var _loc4_:TDGameObjectData = null;
         if(_unitDataClassList == null)
         {
            initUnitDataClass();
         }
         var _loc3_:Class = _unitDataClassList[param1];
         if(_loc3_ != null)
         {
            _loc4_ = new _loc3_(param1,param2);
         }
         else
         {
            getLogger("TD").debug("创建的单位数据类型" + param1 + "不存在");
         }
         return _loc4_;
      }
      
      public static function addRunningPropList(param1:IGameObject, param2:Array) : void
      {
         var _loc3_:* = null;
         if(param2 != null)
         {
            for(_loc3_ in param2)
            {
               param1.setRunningProp(int(_loc3_),param2[_loc3_]);
            }
         }
      }
      
      private static function initActionClassList() : void
      {
         _actionClassMap = new Dictionary();
         addActionToClassList(TDConstant.ZAction_Idle,ZombieActionIdle);
         addActionToClassList(TDConstant.ZAction_Run,ZombieActionRun);
         addActionToClassList(TDConstant.ZAction_Jump,ZombieActionJump);
         addActionToClassList(TDConstant.ZAction_Walk,ZombieActionWalk);
         addActionToClassList(TDConstant.ZAction_Walk2,ZombieActionWalk2);
         addActionToClassList(TDConstant.ZAction_WalkBackwards,ZombieActionWalkBackwards);
         addActionToClassList(TDConstant.ZAction_Death,ZombieActionDeath);
         addActionToClassList(TDConstant.ZAction_Death_Camel,ZombieActionDeathCamel);
         addActionToClassList(TDConstant.ZAction_KickedOut,ZombieActionKickedOut);
         addActionToClassList(TDConstant.ZAction_Carried,ZombieActionCarried);
         addActionToClassList(TDConstant.ZAction_ThrowItem,ZombieActionThrowItem);
         addActionToClassList(TDConstant.ZAction_Intro,ZombieActionIntro);
         addActionToClassList(TDConstant.ZAction_Stun,ZombieActionStun);
         addActionToClassList(TDConstant.ZAction_SuperLongDeath,ZombieActionSuperLongDeath);
         addActionToClassList(TDConstant.ZAction_Eat,ZombieActionEat);
         addActionToClassList(TDConstant.ZAction_Eat2,ZombieActionEat2);
         addActionToClassList(TDConstant.ZAction_Disappear,ZombieActionDisappear);
         addActionToClassList(TDConstant.ZAction_Gasp,ZombieActionGasp);
         addActionToClassList(TDConstant.ZAction_WalkNoPaper,ZombieActionWalkNoPaper);
         addActionToClassList(TDConstant.ZAction_EatNoPaper,ZombieActionEatNoPaper);
         addActionToClassList(TDConstant.ZAction_Fly,ZombieActionFly);
         addActionToClassList(TDConstant.ZAction_Swing,ZombieActionSwing);
         addActionToClassList(TDConstant.ZAction_FlyOut,ZombieActionFlyOut);
         addActionToClassList(TDConstant.ZAction_Gargantuar_LaunchImp,ZombieActionLaunchImp);
         addActionToClassList(TDConstant.ZAction_Gargantuar_Smash,ZombieActionSmash);
         addActionToClassList(TDConstant.ZAction_CatchSun,ZombieActionCatchSun);
         addActionToClassList(TDConstant.ZAction_CatchSunEnd,ZombieActionCatchSunEnd);
         addActionToClassList(TDConstant.ZAction_Sarcophagus_Break,ZombieSarcophagusActionSpecialBreak);
         addActionToClassList(TDConstant.ZAction_Sarcophagus_SpecialEat,ZombieSarcophagusActionSpecialEat);
         addActionToClassList(TDConstant.ZAction_Sarcophagus_SpecialWalk,ZombieSarcophagusActionSpecialWalk);
         addActionToClassList(TDConstant.ZAction_Tombraiser_Throw,ZombieTombraiserActionThrow);
         addActionToClassList(TDConstant.ZActionZombieFlipCard,ZActionZombieFlipCard);
         addActionToClassList(TDConstant.ZAction_FlipCard_Death,ZActionFlipCardDeath);
         addActionToClassList(TDConstant.ZAction_Archer_StartShoot,ZombieArcherStartShootAction);
         addActionToClassList(TDConstant.ZAction_Archer_WaitShoot,ZombieArcherWaitShootAction);
         addActionToClassList(TDConstant.ZAction_Archer_EndShoot,ZombieArcherEndShootAction);
         addActionToClassList(TDConstant.ZAction_Archer_Shoot,ZombieArcherShootAction);
         addActionToClassList(TDConstant.ZAction_BossSphinx_Sleep,ZActionBossSphinxSleep);
         addActionToClassList(TDConstant.ZAction_BossSphinx_Attack1,ZActionBossSphinxAttack1);
         addActionToClassList(TDConstant.ZAction_BossSphinx_WakeUp,ZActionBossSphinxWakeUp);
         addActionToClassList(TDConstant.ZAction_BossSphinx_WaitingAngle,ZActionBossSphinxWaitingAngle);
         addActionToClassList(TDConstant.ZAction_BossSphinx_AngleAttack,ZActionBossSphinxAngleAttack);
         addActionToClassList(TDConstant.ZAction_BossSphinx_AngleMove,ZActionBossSphinxAngleMove);
         addActionToClassList(TDConstant.ZAction_SphinxDeath,ZActionBossSphinxDeath);
         addActionToClassList(TDConstant.ZAction_PeddlerSetPig,ZombiePeddlerSetDogAction);
         addActionToClassList(TDConstant.ZAction_Terracotta_Ctz,ZombieTerracottaCtzAction);
         addActionToClassList(TDConstant.ZAction_Terracotta_Cotta,ZombieTerracottaCottaAction);
         addActionToClassList(TDConstant.ZAction_Terracotta_Popup,ZombieTerracottaPopupAction);
         addActionToClassList(TDConstant.ZAction_Terracotta_Lineup,ZombieTerracottaLineupAction);
         addActionToClassList(TDConstant.ZAction_Terracotta_Death,ZombieTerracottaDeathAction);
         addActionToClassList(TDConstant.ZAction_Drunkard_Drink,ZombieDrunkardDrinkAction);
         addActionToClassList(TDConstant.ZAction_ThrowQuickSand,ZActionThrowQuickSandAction);
         addActionToClassList(TDConstant.ZAction_Supervisor_Eat,ZombieActionSupervisorEat);
         addActionToClassList(TDConstant.ZAction_Supervisor_AddSpeed,ZombieActionSupervisonAddSpeed);
         addActionToClassList(TDConstant.ZAction_Swashbuckler_Swing,ZombieActionSwashbucklerSwing);
         addActionToClassList(TDConstant.ZAction_PirateCaptain_ReleaseParrot,ZActionCaptainReleaseParrot);
         addActionToClassList(TDConstant.ZAction_PirateCaptain_GetParrot,ZActionCaptainGetParrot);
         addActionToClassList(TDConstant.ZAction_PirateParrot_Fly,ZActionParrotFly);
         addActionToClassList(TDConstant.ZAction_PirateParrot_Carry,ZActionParrotCarry);
         addActionToClassList(TDConstant.ZAction_Seagull_Death,ZActionSeagullDeath);
         addActionToClassList(TDConstant.ZAction_Seagull_FreeFly,ZActionSeagullFreeFly);
         addActionToClassList(TDConstant.ZAction_BarrelRoller_Walk,ZActionBarrelRollerWalk);
         addActionToClassList(TDConstant.ZAction_BarrelRoller_Eat,ZActionBarrelRollerEat);
         addActionToClassList(TDConstant.ZAction_MonkeyCharmer_Throw,ZActionMonkeyCharmerThrow);
         addActionToClassList(TDConstant.ZAction_Monkey_Attack,ZActionMonkeyAttack);
         addActionToClassList(TDConstant.ZAction_Gunman_WalkShoot,ZActionGunmanWalkShoot);
         addActionToClassList(TDConstant.ZAction_BugBotImp_Transition,ZActionBugBotImpTransition);
         addActionToClassList(TDConstant.ZAction_FutureJetpack_Enter,ZActionFutureJetpackEnter);
         addActionToClassList(TDConstant.ZAction_FutureProtector_OpenShield,ZActionFutureProtectorOpenShield);
         addActionToClassList(TDConstant.ZAction_FutureProtector_Shield,ZActionFutureProtectorShield);
         addActionToClassList(TDConstant.ZAction_FutureProtector_CloseShield,ZActionFutureProtectorCloseShield);
         addActionToClassList(TDConstant.ZAction_MechDisco_Dance,ZActionMechDiscoDance);
         addActionToClassList(TDConstant.ZAction_MechFootball_Bump,ZActionMechFootballBump);
         addActionToClassList(TDConstant.ZAction_EmperorQin_DrillOut,ZActionEmperorQinDrillOut);
         addActionToClassList(TDConstant.ZAction_EmperorQin_SecondPhaseAttack,ZActionEmperorQinSecondPhaseAttack);
         addActionToClassList(TDConstant.ZAction_EmperorQin_ThirdPhaseAttack,ZActionEmperorQinThirdPhaseAttack);
         addActionToClassList(TDConstant.ZAction_EmperorQin_WakeUp,ZActionEmperorQinWakeUp);
         addActionToClassList(TDConstant.ZAction_EmperorQinDeath,ZActionEmperorQinDeath);
         addActionToClassList(TDConstant.ZAction_EmperorQin_CastSkill,ZActionEmperorQinCastSkill);
         addActionToClassList(TDConstant.ZAction_EmperorQin_SummonZombie,ZActionEmperorQinSummonZombie);
         addActionToClassList(TDConstant.ZAction_PirateZomboss_Stun,ZActionPirateZombossStun);
         addActionToClassList(TDConstant.ZAction_PirateZomboss_RocketLaunch,ZActionPirateZombossRocketLaunch);
         addActionToClassList(TDConstant.ZAction_PirateZomboss_Crash,ZActionPirateZombossCrash);
         addActionToClassList(TDConstant.ZAction_PirateZomboss_WalkBackwards,ZActionPirateZombossWalkBackwards);
         addActionToClassList(TDConstant.ZAction_PirateZomboss_Jump,ZActionPirateZombossJump);
         addActionToClassList(TDConstant.ZAction_PirateZomboss_Portal,ZActionPirateZombossPortal);
         addActionToClassList(TDConstant.ZAction_PirateZomboss_Stomp,ZActionPirateZombossStomp);
         addActionToClassList(TDConstant.ZAction_PirateZomboss_WalkUpDown,ZActionPirateZombossWalkUpDown);
         addActionToClassList(TDConstant.ZAction_Poison_Caster,ZActionPoisonCaster);
         addActionToClassList(TDConstant.ZAction_Wolf_Knight_Swoop,ZActionWolfKnightSwoop);
         addActionToClassList(TDConstant.ZAction_Mech_Gargantuar_Walk,ZActionMechGargantuarWalk);
         addActionToClassList(TDConstant.ZAction_Mech_Gargantuar_Summon,ZActionMechGargantuarSummon);
         addActionToClassList(TDConstant.ZAction_Mech_Gargantuar_Laser,ZActionMechGargantuarLaser);
         addActionToClassList(TDConstant.ZAction_Mech_Gargantuar_Hammer,ZActionMechGargantuarHammer);
         addActionToClassList(TDConstant.ZAction_Harveseter_Eat,ZActionHarvesterEat);
         addActionToClassList(TDConstant.ZAction_FutureZomboss_RocketLaunch,ZActionFutureZombossRocketLaunch);
         addActionToClassList(TDConstant.ZAction_FutureZomboss_Stun,ZActionFutureZombossStun);
         addActionToClassList(TDConstant.ZAction_Pirate_Cannon_Summon,ZActionPirateCannonSummon);
         addActionToClassList(TDConstant.ZAction_WalkToAnotherRow,TDZombieWalkToAnotherRowAction);
         addActionToClassList(TDConstant.ZAction_Fixed,TDZombieFixedAction);
         addActionToClassList(TDConstant.ZAction_Bengbu_CastSkill,ZActionBengbuCastSkill);
         addActionToClassList(TDConstant.ZAction_Bengbu_FreeSkill,ZActionBengbuFreeSkill);
         addActionToClassList(TDConstant.ZAction_Yaksha_Skill,ZActionYakshaSkill);
         addActionToClassList(TDConstant.PlantAction_Idle,PlantActionIdle);
         addActionToClassList(TDConstant.PlantAction_Shoot,PlantActionShoot);
         addActionToClassList(TDConstant.PPeaShooterAction_Idle,PlantPeaShooterActionIdle);
         addActionToClassList(TDConstant.PlantPeaShooterAction_Shoot,PlantPeaShooterActionShoot);
         addActionToClassList(TDConstant.PlantPeaRepeatShooterAction_Shoot,PlantPeaRepeatShooterActionShoot);
         addActionToClassList(TDConstant.PlantAction_FadeOut,PlantActionFadeOut);
         addActionToClassList(TDConstant.PlantAction_WakeUp,PlantActionWakeUp);
         addActionToClassList(TDConstant.PlantAction_Sleep,PlantActionSleep);
         addActionToClassList(TDConstant.PlantAction_Arm,PlantActionArm);
         addActionToClassList(TDConstant.PlantAction_AttackIdle,PlantActionAttackIdle);
         addActionToClassList(TDConstant.PlantAction_PushedAway,PlantActionPushedAway);
         addActionToClassList(TDConstant.PlantSunFlowerAction_Product,PlantSunFlowerActionProduct);
         addActionToClassList(TDConstant.PWallnutAction_Idle,PWallnutActionIdle);
         addActionToClassList(TDConstant.PMelonpultAction_Shoot,PMelonpultActionShoot);
         addActionToClassList(TDConstant.PPotatomineAction_Idle,PPotatomineActionIdle);
         addActionToClassList(TDConstant.PPotatomineAction_Armed,PPotatomineActionArmed);
         addActionToClassList(TDConstant.PPotatomineAction_ArmedIdle,PPotatomineAction_ArmedIdle);
         addActionToClassList(TDConstant.PPotatomineAction_Mashed,PPotatomineActionMashed);
         addActionToClassList(TDConstant.PBambooGun_Idle,PBambooGunActionIdle);
         addActionToClassList(TDConstant.PBambooGun_Shoot,PBambooGunActionShoot);
         addActionToClassList(TDConstant.PMagnetAction_Working,PMagnetActionWorking);
         addActionToClassList(TDConstant.PSquashAction_Attack,PSquashActionAttack);
         addActionToClassList(TDConstant.PCabbagepulActionAttack,PCabbagepulActionAttack);
         addActionToClassList(TDConstant.PBonkchoyActionAttack,BonkchoyActionAttack);
         addActionToClassList(TDConstant.PIceburgActionFrozen,PIceburgActionFrozen);
         addActionToClassList(TDConstant.PlantMotengActionIdle,PlantMotengActionIdle);
         addActionToClassList(TDConstant.PlantMotengActionShoot,PlantMotengActionShoot);
         addActionToClassList(TDConstant.PlantMotengSpecialAction,PlantMotengSpecialAction);
         addActionToClassList(TDConstant.PFlytrapAction_Eat,PFlytrapActionEat);
         addActionToClassList(TDConstant.PFlytrapSpecialSkillAction,PFlytrapSpecialSkillAction);
         addActionToClassList(TDConstant.PPotatoBowlingAction_Roll,PPotatoBowlingActionRoll);
         addActionToClassList(TDConstant.PPotatoBowlingBombAction_Roll,PPotatoBowlingBombActionRoll);
         addActionToClassList(TDConstant.PlantKernalpultActionShoot,PlantKernalpultActionShoot);
         addActionToClassList(TDConstant.PlantKernalpultActionBuffShoot,PlantKernalpultActionBuffShoot);
         addActionToClassList(TDConstant.PCoconutCannonAction_Idle,PCoconutCannonActionIdle);
         addActionToClassList(TDConstant.PCoconutCannonAction_Shoot,PCoconutCannonActionShoot);
         addActionToClassList(TDConstant.PCarrotRocketAction_Shoot,CarrotShootAction);
         addActionToClassList(TDConstant.PDaffodilAction_Shoot,DaffodilShootAction);
         addActionToClassList(TDConstant.PDurianAction_Attack,PDurianActionAttack);
         addActionToClassList(TDConstant.PCherryBombAction_Explode,PCherryBombActionExplode);
         addActionToClassList(TDConstant.PJalapenoAction_Explode,PJalapenoActionExplode);
         addActionToClassList(TDConstant.PIcebeanAction_Explode,PIcebeanActionExplode);
         addActionToClassList(TDConstant.PLaserbeanAction_Shoot,PLaserbeanActionShoot);
         addActionToClassList(TDConstant.PBloverAction_Blow,PBloverActionBlow);
         addActionToClassList(TDConstant.PCitronAction_Charge,PCitronActionCharge);
         addActionToClassList(TDConstant.PCitronAction_Shoot,PCitronActionShoot);
         addActionToClassList(TDConstant.PEmpeachAction_Explode,PEmpeachActionExplode);
         addActionToClassList(TDConstant.PTileTurnipAction_Attack,PTileTurnipActionAttack);
         addActionToClassList(TDConstant.PBananaAction_Attack,PBananaActionAttack);
         addActionToClassList(TDConstant.PNitrationMushroom_Attack,PNitrationMushroomAttack);
         addActionToClassList(TDConstant.PNuts_Idle,PNutsIdle);
         addActionToClassList(TDConstant.PNuts_Plant,PNutsPlant);
         addActionToClassList(TDConstant.PNuts_Recover,PNutsRecover);
         addActionToClassList(TDConstant.PHighWallNuts_Idle,PHighWallNutsIdle);
         addActionToClassList(TDConstant.PPrismGrass_Attack,PrismGrassAttackAction);
         addActionToClassList(TDConstant.PThunderPine_Attack,ThunderPineAttackAction);
         addActionToClassList(TDConstant.PBubbleFlower_Attack,BubbleFlowerAttackAction);
         addActionToClassList(TDConstant.PGarlic_Idle1,GarlicIdleAction1);
         addActionToClassList(TDConstant.PGarlic_Idle2,GarlicIdleAction2);
         addActionToClassList(TDConstant.PGarlic_Idle3,GarlicIdleAction3);
         addActionToClassList(TDConstant.PlantActionTransform,PlantActionTransform);
         addActionToClassList(TDConstant.FrostMushroomAttackAction,FrostMushroomAttackAction);
         addActionToClassList(TDConstant.PGravebusterAction_Eat,PGravebusterActionEat);
         addActionToClassList(TDConstant.PSmallWisteriaAction_Attack,PSmallWisteriaActionAttack);
         addActionToClassList(TDConstant.TDMusicGameBoxerActionIdle,TDMusicGameBoxerActionIdle);
         addActionToClassList(TDConstant.TDMusicGameBoxerActionFight,TDMusicGameBoxerActionFight);
         addActionToClassList(TDConstant.BambooLiAttckAction,BambooLiAttckAction);
         addActionToClassList(TDConstant.DandelionAttackAction,DandelionAttackAction);
         addActionToClassList(TDConstant.WaxgourdRollAction,WaxgourdRollAction);
         addActionToClassList(TDConstant.PSnapdragonAction_Attack,PSnapdragonActionAttack);
         addActionToClassList(TDConstant.PSpikeweedAction_Attack,PSpikeweedActionAttack);
         addActionToClassList(TDConstant.PSpringbeanAction_Attack,PSpringbeanActionAttack);
         addActionToClassList(TDConstant.PThreepeaterAction_Shoot,PThreepeaterActionShoot);
         addActionToClassList(TDConstant.PSunFlower_SpecialSkill,PlantSunFlowerSpecialSkillAction);
         addActionToClassList(TDConstant.PWallnut_SpecialSkill,PWallnutActionSpecialSkill);
         addActionToClassList(TDConstant.PSunFlower_Twin_SpecialSkill,PlantSunFlowerTwinSpecialSkillAction);
         addActionToClassList(TDConstant.PBoomerangSpecialSkillAction,PBoomerangSpecialSkillAction);
         addActionToClassList(TDConstant.PCabbagepulSpecialSkillAction,PCabbagepulSpecialSkillAction);
         addActionToClassList(TDConstant.BonkchoyActionSpecialSkill,BonkchoyActionSpecialSkill);
         addActionToClassList(TDConstant.PPeaShooterActionSpecialSkill,PPeaShooterActionSpecialSkill);
         addActionToClassList(TDConstant.PPeaRepeatShooterActionSpecialSkill,PPeaRepeatShooterActionSpecialSkill);
         addActionToClassList(TDConstant.BambooLiActionSpecialSkill,BambooLiActionSpecialSkill);
         addActionToClassList(TDConstant.DandelionSpecialSkillAction,DandelionSpecialSkillAction);
         addActionToClassList(TDConstant.PPotatomineActionSpecialSkill,PPotatomineActionSpecialSkill);
         addActionToClassList(TDConstant.PIceburgActionSpecialSkill,PIceburgActionSpecialSkill);
         addActionToClassList(TDConstant.PCarrotRocketSpecialSkillAction,PCarrotRocketSpecialSkillAction);
         addActionToClassList(TDConstant.PSnapdragonActionSpecialSkill,PSnapdragonActionSpecialSkill);
         addActionToClassList(TDConstant.PlantKernalpultActionSpecialSkill,PlantKernalpultActionSpecialSkill);
         addActionToClassList(TDConstant.PSpikeweedActionSpecialSkill,PSpikeweedActionSpecialSkill);
         addActionToClassList(TDConstant.PSpringbeanActionSpecialSkill,PSpringbeanActionSpecialSkill);
         addActionToClassList(TDConstant.PThreepeaterActionSpecialSkill,PThreepeaterActionSpecialSkill);
         addActionToClassList(TDConstant.PCoconutCannonActionSpecialSkill,PCoconutCannonActionSpecialSkill);
         addActionToClassList(TDConstant.PPomegranateActionSpecialSkill,PPomegranateActionSpecialSkill);
         addActionToClassList(TDConstant.PDaffodilActionSpecialSkill,PDaffodilActionSpecialSkill);
         addActionToClassList(TDConstant.PDurianActionSpecialSkill,PDurianActionSpecialSkill);
         addActionToClassList(TDConstant.PPineappleActionSpecialSkill,PPineappleActionSpecialSkill);
         addActionToClassList(TDConstant.PWintermelonActionSpecialSkill,PWintermelonActionSpecialSkill);
         addActionToClassList(TDConstant.PLaserbeanActionSpecialSkill,PLaserbeanActionSpecialSkill);
         addActionToClassList(TDConstant.PCitronActionSpecialSkill,PCitronActionSpecialSkill);
         addActionToClassList(TDConstant.PGlossyGanodermaActionSpecialSkill,PGlossyGanodermaActionSpecialSkill);
         addActionToClassList(TDConstant.PBananaActionSpecialSkill,PBananaActionSpecialSkill);
         addActionToClassList(TDConstant.PNitrationMushroomSpecialSkill,PNitrationMushroomSpecialSkill);
         addActionToClassList(TDConstant.PNutsSpecialSkill,PNutsSpecialSkill);
         addActionToClassList(TDConstant.PHighWallNutSpecialSkill,PHighWallNutSpecialSkill);
         addActionToClassList(TDConstant.PPrismGrassSpecialSkill,PPrismGrassSpecialSkill);
         addActionToClassList(TDConstant.POxygenAlgaeSpecialSkill,POxygenAlgaeSpecialSkill);
         addActionToClassList(TDConstant.PGarlicSpecialSkill,PGarlicSpecialSkill);
         addActionToClassList(TDConstant.PThunderPineSpecialSkill,PThunderPineSpecialSkill);
         addActionToClassList(TDConstant.PBubbleFlowerSpecialSkill,PBubbleFlowerSpecialSkill);
         addActionToClassList(TDConstant.PIcepeaActionSpecialSkill,PIcepeaActionSpecialSkill);
         addActionToClassList(TDConstant.BAction_LINE,BulletActionLine);
         addActionToClassList(TDConstant.BAction_ForBambooGun,BulletActionForBambooGun);
         addActionToClassList(TDConstant.BAction_ForMelonpult,BulletActionForMelonpult);
         addActionToClassList(TDConstant.BAction_Boomerang,BAction_Boomerang);
         addActionToClassList(TDConstant.BAction_BOOM,BulletActionBoom);
         addActionToClassList(TDConstant.BAction_Disappear,BulletActionDisappear);
         addActionToClassList(TDConstant.BActoin_SphinxFireBall,BulletActionSphinxFireBall);
         addActionToClassList(TDConstant.BAction_Arrow,BulletActionArrow);
         addActionToClassList(TDConstant.BAction_FireArrow,BulletActionFireArrow);
         addActionToClassList(TDConstant.BAction_Rocket,BulletActionRocket);
         addActionToClassList(TDConstant.BAction_GroundRocket,BulletActionGroundRocket);
         addActionToClassList(TDConstant.BAction_ForThreepeater,BulletActionForThreepeater);
         addActionToClassList(TDConstant.BAction_FreeLine,BulletActionFreeLine);
         addActionToClassList(TDConstant.BAction_ForCococnutPlantfood,BActionForCococnutPlantfood);
         addActionToClassList(TDConstant.BAction_ForDaffodil,BulletActionForDaffodil);
         addActionToClassList(TDConstant.BAction_ForMelonPlantfood,BulletActionForMelonPlantfood);
         addActionToClassList(TDConstant.BAction_ForCitronPlantfood,BulletActionForCitronPlantfood);
         addActionToClassList(TDConstant.BAction_ForGlossypult,BulletActionForGlossyPult);
         addActionToClassList(TDConstant.BAction_Banana,BulletActionForBanana);
         addActionToClassList(TDConstant.BAction_BananaPlantfood,BulletActionPlantFoodForBanana);
         addActionToClassList(TDConstant.BAction_GargantuarLaser,BulletActiongargantuarLaser);
         addActionToClassList(TDConstant.BAction_Nitration_Mushroom,BulletActionNitrationMushroom);
         addActionToClassList(TDConstant.BAction_ForThunderPine,BulletActionThunderPine);
         addActionToClassList(TDConstant.BAction_ForThunderPinePlantfood,BulletActionThunderPinePlantfood);
         addActionToClassList(TDConstant.BAction_ForBubbleFly,BulletActionBubbleFly);
         addActionToClassList(TDConstant.BAction_ForBubbleSround,BulletActionBubbleSround);
         addActionToClassList(TDConstant.BAction_Bounce,BulletActionBounce);
         addActionToClassList(TDConstant.SunAction_Idle,SunActionIdle);
         addActionToClassList(TDConstant.SunAction_Drop,SunActionDrop);
         addActionToClassList(TDConstant.SunAction_Fly,SunActionFly);
         addActionToClassList(TDConstant.SunAction_SunActionBeCatching,SunActionBeCatching);
         addActionToClassList(TDConstant.ObjectAction_Disappear,ObjectActionDisappear);
         addActionToClassList(TDConstant.ObjectAction_BeThrew,ObjectActionBeThrew);
         addActionToClassList(TDConstant.ObjectAction_BlowAway,ObjectActionBlowAway);
         addActionToClassList(TDConstant.ObjectAction_KickedAway,ObjectActionKickedAway);
         addActionToClassList(TDConstant.SunAction_PopOut,SunActionPopOut);
         addActionToClassList(TDConstant.EffectPlayAction,EffectPlayAction);
         addActionToClassList(TDConstant.EffectAdvPlayAction,EffectAdvPlayAction);
         addActionToClassList(TDConstant.EffectLoopAction,EffectLoopAction);
         addActionToClassList(TDConstant.CharredEffectAction_Idle,CharredEffectActionIdle);
         addActionToClassList(TDConstant.LootItemAction_Idle,LootItemActionIdle);
         addActionToClassList(TDConstant.LootItemAction_Popup,LootItemActionPopup);
         addActionToClassList(TDConstant.LawnMowerAction_Appear,LawnMowerActionAppear);
         addActionToClassList(TDConstant.LawnMowerAction_Idle,LawnMowerActionIdle);
         addActionToClassList(TDConstant.LawnMowerAction_Run,LawnMowerActionRun);
         addActionToClassList(TDConstant.LawnMowerAction_Sink,LawnMowerActionSink);
         addActionToClassList(TDConstant.ZombieHeadAction_Drop,ZombieHeadActionDrop);
         addActionToClassList(TDConstant.ZombieHandAction_Drop,ZombieHandActionDrop);
         addActionToClassList(TDConstant.ZombieItemAction_Drop,ZombieItemActionDrop);
         addActionToClassList(TDConstant.CoinAction_PopOut,CoinActionPopOut);
         addActionToClassList(TDConstant.CoinAction_Flip,CoinActionFlip);
         addActionToClassList(TDConstant.CoinAction_Collect,CoinActionCollect);
         addActionToClassList(TDConstant.ZombieItemAction_Magnet,ZombieItemActionMagnet);
         addActionToClassList(TDConstant.DaveBlahblahAction,DaveBlahblahAction);
         addActionToClassList(TDConstant.DaveIdleAction,DaveIdleAction);
         addActionToClassList(TDConstant.DaveStageEndAction,DaveStageEndAction);
         addActionToClassList(TDConstant.SwitcherActionIdle,SwitcherActionIdle);
         addActionToClassList(TDConstant.SwitcherActionRun,SwitcherActionRun);
         addActionToClassList(TDConstant.BoneAction_Throwing,BoneActionThrowing);
         addActionToClassList(TDConstant.TorchAction_Boom,TorchActionBoom);
         addActionToClassList(TDConstant.LeafAction_Fly,LeafActionFly);
         addActionToClassList(TDConstant.LeafAction_Collect,LeafActionCollect);
         addActionToClassList(TDConstant.DropCardAction_Fly,DropCardActionFly);
         addActionToClassList(TDConstant.DropCardAction_Collect,DropCardActionCollect);
         addActionToClassList(TDConstant.PlantFoodEffectAction,PlantFoodEffectAction);
         addActionToClassList(TDConstant.Achieve_idle,ObjectAchieveActionIdle);
         addActionToClassList(TDConstant.Achieve_result,ObjectAchieveActionResult);
         addActionToClassList(TDConstant.TDSkillSummonZombieAction,TDSkillSummonZombieAction);
         addActionToClassList(TDConstant.TDSkillPortalZombieEffectAction,TDSkillPortalZombieAction);
         addActionToClassList(TDConstant.TDBlowZombieAction,TDBlowZombieAction);
         addActionToClassList(TDConstant.TDPopObjectEffectAction,TDPopObjectEffectAction);
         addActionToClassList(TDConstant.TDMusicGameConveyorActionIdle,TDMusicGameConveyorActionIdle);
         addActionToClassList(TDConstant.TDConveyEffectAction,TDConveyEffectAction);
         addActionToClassList(TDConstant.TDMusicGameBoxerEffectAction,TDMusicGameBoxerEffectAction);
         addActionToClassList(TDConstant.GrassScrollActionRun,GrassScrollActionRun);
         addActionToClassList(TDConstant.TombActionIdle,TombActionIdle);
         addActionToClassList(TDConstant.ArrowTargetEffectShowAction,ArrowTargetEffectShowAction);
         addActionToClassList(TDConstant.ArrowTargetEffectHideAction,ArrowTargetEffectHideAction);
         addActionToClassList(TDConstant.QuickSandAppearAction,QuickSandAppearAction);
         addActionToClassList(TDConstant.QuickSandRunningAction,QuickSandRunningAction);
         addActionToClassList(TDConstant.QuickSandDisapperAction,QuickSandDisapperAction);
         addActionToClassList(TDConstant.TDPopPotatoEffectAction,TDPopPotatoEffectAction);
         addActionToClassList(TDConstant.SparsActionShow,SparsActionShow);
         addActionToClassList(TDConstant.SparsActionIdle,SparsActionIdle);
         addActionToClassList(TDConstant.SparsActionDie,SparsActionDie);
         addActionToClassList(TDConstant.WaterAction_breaker,WaterActionBreaker);
         addActionToClassList(TDConstant.BarrelAction_Idle,BarrelActionIdle);
         addActionToClassList(TDConstant.BarrelAction_Roll,BarrelActionRoll);
         addActionToClassList(TDConstant.BarrelAction_Die,BarrelActionDie);
         addActionToClassList(TDConstant.GroundFirePlayAction,GroundFirePlayAction);
         addActionToClassList(TDConstant.TDShootingGameControllerAction,TDShootingGameControllerAction);
         addActionToClassList(TDConstant.TDShootingGamePowerSavingAction,TDShootingGamePowerSavingAction);
         addActionToClassList(TDConstant.TDShootingGameFireAction,TDShootingGameFireAction);
         addActionToClassList(TDConstant.TDShootingGameSleepAction,TDShootingGameSleepAction);
         addActionToClassList(TDConstant.TDShootingGameWakeUpAction,TDShootingGameWakeUpAction);
         addActionToClassList(TDConstant.TDCoconutControllerAction,TDCoconutControllerAction);
         addActionToClassList(TDConstant.JalapenoFireAction,JalapenoFireAction);
         addActionToClassList(TDConstant.LongQuickSandAction,LongQuickSandAction);
         addActionToClassList(TDConstant.ElectromagneticShieldAction_Idle,ElectromagneticShieldIdle);
         addActionToClassList(TDConstant.TDSunBombAction_Fall,SunBombActionFall);
         addActionToClassList(TDConstant.TDSunBombAction_Explod,SunBombActionExplod);
         addActionToClassList(TDConstant.TDSunBombTrackAction_Idle,SunBombTrackIdle);
         addActionToClassList(TDConstant.TDSunBombTrackAction_Disappear,SunBombTrackDisappear);
         addActionToClassList(TDConstant.PoisonAction_Fly,PoisonFly);
         addActionToClassList(TDConstant.PoisonAction_Idle,PoisonIdle);
         addActionToClassList(TDConstant.YetiKeyAction,YetiKeyAction);
         addActionToClassList(TDConstant.LaserTrackAction_Idle,LaserTrackActionIdle);
         addActionToClassList(TDConstant.NutsShieldOnAction,NutsShieldOnAction);
         addActionToClassList(TDConstant.NutsShieldIdleAction,NutsShieldIdleAction);
         addActionToClassList(TDConstant.PrismGrassConnectLineIdle,PrismGrassConnectLineActionIdle);
         addActionToClassList(TDConstant.PrismGrassHitLineIdle,PrismGrassHitLineActionIdle);
         addActionToClassList(TDConstant.FutureBossRocketFly,FutureBossRocketFly);
         addActionToClassList(TDConstant.RocketTargetAction,FutureBossRocketTargetAction);
         addActionToClassList(TDConstant.TDSeaSplashEffect_Follow,SeaSplashEffectActionFollow);
         addActionToClassList(TDConstant.YakshaStormMove,YakshaStormMove);
         addActionToClassList(TDConstant.ElectricBubbleExplode,ElectricBubbleExplode);
      }
      
      private static function addActionToClassList(param1:String, param2:Class) : void
      {
         if(_actionClassMap == null)
         {
            _actionClassMap = new Dictionary();
         }
         _actionClassMap[param1] = param2;
      }
      
      private static function getActionClass(param1:String) : Class
      {
         if(_actionClassMap == null)
         {
            initActionClassList();
         }
         var _loc2_:Class = _actionClassMap[param1];
         if(_loc2_ == null)
         {
            getLogger("TD").debug("找不到动作类" + param1);
         }
         return _loc2_;
      }
      
      public static function createAction(param1:String, param2:IGameObject) : IAction
      {
         var _loc4_:IAction = null;
         var _loc3_:Class = getActionClass(param1);
         if(_loc3_ != null)
         {
            (_loc4_ = new _loc3_()).setGameObject(param2,param1);
         }
         return _loc4_;
      }
      
      public static function addRes(param1:int, param2:Object, param3:String) : void
      {
         if(_resMap == null)
         {
            _resMap = new Dictionary();
         }
         _resMap[param1] = param2;
      }
      
      public static function getRes(param1:int) : Object
      {
         if(_resMap == null)
         {
            return null;
         }
         return _resMap[param1];
      }
      
      public static function cleanAllRes() : void
      {
         var _loc1_:Object = null;
         for each(_loc1_ in _resMap)
         {
            if(_loc1_ != null && _loc1_ is BitmapData)
            {
               (_loc1_ as BitmapData).dispose();
            }
         }
         _resMap = new Dictionary();
      }
      
      public static function playBlitDisplay(param1:String, param2:int, param3:int, param4:int = 1, param5:Boolean = false) : IBlitDisplayContainer
      {
         var b:IBlitClip = null;
         var blitDataCompleteHandler:Function = null;
         var source:String = param1;
         var x:int = param2;
         var y:int = param3;
         var playTimes:int = param4;
         var randomStart:Boolean = param5;
         var c:IBlitDisplayContainer = Blit.factory.CreateBlitContainer();
         b = Blit.factory.CreateBlitClip();
         b.autoUpdatePosition = true;
         b.dataProvider = BlitDataManager.GetBlitDataByUrl(UrlManager.getInstance().getUrl(UrlManager.Url_TD_EFFECTS,source));
         c.x = x;
         c.y = y;
         b.Play(playTimes);
         c.AddChild(b);
         CommandDispatcher.send(CommandName.TDEffectCommand_AddEffect_TOP,c);
         if(randomStart)
         {
            if(b.dataProvider.hasContent)
            {
               b.currentFrame = b.dataProvider.totalFrames * Math.random();
            }
            else
            {
               blitDataCompleteHandler = function(param1:Event):void
               {
                  b.dataProvider.removeEventListener(Event.COMPLETE,blitDataCompleteHandler);
                  if(b.dataProvider)
                  {
                     b.currentFrame = b.dataProvider.totalFrames * Math.random();
                  }
               };
               b.dataProvider.addEventListener(Event.COMPLETE,blitDataCompleteHandler);
            }
         }
         return c;
      }
   }
}
