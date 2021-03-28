package com.qq.modules.td.logic.action.bullet
{
   import asgui.blit.bone.BlitBoneAnim;
   import asgui.blit.bone.BlitBoneManager;
   import com.qq.GameGloble;
   import com.qq.constant.td.TDConstant;
   import com.qq.modules.td.command.game.sound.TDSoundCmd;
   import com.qq.modules.td.data.game.unit.TDPlantStaticInfo;
   import com.qq.modules.td.data.game.unit.basic.TDGameObjectData;
   import com.qq.modules.td.logic.bt_ai.aiUtils.TDSearchTargetUtils;
   import com.qq.modules.td.logic.numeric.TDCheckCollision;
   import com.qq.modules.td.logic.numeric.TDDamageCaculete;
   import com.qq.modules.td.logic.talent.TalentManager;
   import com.qq.modules.td.logic.unit.basic.IGameObject;
   import com.qq.modules.td.logic.unit.bullet.BasicBullet;
   import com.qq.modules.td.logic.unit.plant.BasicPlant;
   import com.qq.modules.td.model.TDGameInfo;
   import com.qq.modules.td.view.game.layer.shadow.TDShadowManager;
   import com.qq.utils.UrlManager;
   import flash.events.Event;
   
   public class BAction_Boomerang extends BulletActionLine
   {
       
      
      private var maxHitNum:int = 3;
      
      private var curDirState:int = 1;
      
      private var curDir:int = 1;
      
      private var curHitNum:int = 0;
      
      private var realHitNum:int = 0;
      
      private var delayFrame:int = 30;
      
      private var hasBeenAttackEnemyList:Array;
      
      private var boneAnim:BlitBoneAnim;
      
      private var isCallBacking:Boolean = false;
      
      private var randomSpeed:int;
      
      private var isVariable:Boolean = true;
      
      private var delayCount:int = 0;
      
      public function BAction_Boomerang()
      {
         this.hasBeenAttackEnemyList = [];
         super();
         this.curDirState = 1;
         this.curHitNum = 0;
         this.delayFrame = GameGloble.stage.frameRate;
      }
      
      override protected function initBulletState() : void
      {
         super.initBulletState();
         _targetRoadIndex = _bullet.shooter.objectModel.roadIndex;
         this.maxHitNum = 3 + TalentManager.instance.getPlusAttackNum((_shooter as BasicPlant).plantData.plantStaticInfo as TDPlantStaticInfo);
      }
      
      override public function enterState(param1:Array = null) : void
      {
         super.enterState(param1);
         if(_params == null)
         {
            _params = [];
         }
         if(this._bullet && this._bullet is BasicBullet)
         {
            this.curDir = (this._bullet as BasicBullet).shootDir;
         }
         this.randomSpeed = _bullet.bulletData.getSpeed(TDGameObjectData.SPEED_BULLET);
      }
      
      override protected function updateBulletPos() : void
      {
         if(this.curDirState == -1 && this.isVariable == true)
         {
            this.variableUpdateBulletPos();
         }
         else
         {
            this.constantUpdateBulletPos();
         }
         if(_bullet.bulletData.bulletStaticInfo.needShade)
         {
            TDShadowManager.instance.updateShadowByTDGameObject(_bullet,true,_bullet.bulletData.bulletStaticInfo.isShadowLocateByRoad == 1,0,_bullet.bulletData.bulletStaticInfo.shadowOffSetY);
         }
      }
      
      private function constantUpdateBulletPos() : void
      {
         var _loc1_:Number = this.randomSpeed;
         _loc1_ *= _pastTime;
         _loc1_ *= this.curDirState;
         this.updatePos(_loc1_);
      }
      
      private function variableUpdateBulletPos() : void
      {
         ++this.delayCount;
         if(this.delayCount == this.delayFrame * 0.5)
         {
            this.hasBeenAttackEnemyList = [];
            this.isCallBacking = true;
         }
         if(this.delayCount == this.delayFrame)
         {
            this.isVariable = false;
         }
         var _loc1_:Number = this.randomSpeed * 0.5;
         _loc1_ *= _pastTime;
         _loc1_ = Math.round(Math.cos(Math.PI / 180 * (this.delayCount * (180 / this.delayFrame))) * _loc1_ * 10) / 10;
         this.updatePos(_loc1_);
      }
      
      private function updatePos(param1:Number) : void
      {
         switch(this.curDir)
         {
            case 1:
               _bullet.setLocation(_bullet.x + param1,_bullet.y);
               if(this.isCallBacking)
               {
                  _bullet.rotation = 180;
               }
               else
               {
                  _bullet.rotation = 0;
               }
               break;
            case 2:
               _bullet.setLocation(_bullet.x - param1,_bullet.y);
               if(this.isCallBacking)
               {
                  _bullet.rotation = 0;
               }
               else
               {
                  _bullet.rotation = 180;
               }
               break;
            case 3:
               _bullet.setLocation(_bullet.x,_bullet.y + param1);
               if(this.isCallBacking)
               {
                  _bullet.rotation = 270;
               }
               else
               {
                  _bullet.rotation = 90;
               }
               break;
            case 4:
               _bullet.setLocation(_bullet.x,_bullet.y - param1);
               if(this.isCallBacking)
               {
                  _bullet.rotation = 90;
               }
               else
               {
                  _bullet.rotation = 270;
               }
         }
      }
      
      override protected function updateBulletState() : void
      {
         var _loc1_:Array = null;
         var _loc3_:IGameObject = null;
         var _loc4_:IGameObject = null;
         var _loc5_:Boolean = false;
         var _loc6_:int = 0;
         var _loc7_:Boolean = false;
         if(_bullet.shooter && _bullet.shooter.animation && this.curDirState == -1 && TDCheckCollision.isCollision(_bullet,_bullet.damageArea,_bullet.shooter,_bullet.shooter.damageArea))
         {
            _bullet.setAction(TDConstant.BAction_Disappear);
            return;
         }
         if(this.curDirState == -1 && this.isVariable == true)
         {
            return;
         }
         if(this.curDir == TDConstant.BULLET_DIR_LEFT || this.curDir == TDConstant.BULLET_DIR_RIGHT)
         {
            _loc1_ = TDSearchTargetUtils.getZombieList(_bullet,[_targetRoadIndex]);
         }
         else
         {
            _loc1_ = TDSearchTargetUtils.getZombieList(_bullet);
         }
         var _loc2_:int = _loc1_.length;
         for each(_loc4_ in _loc1_)
         {
            _loc5_ = false;
            _loc6_ = 0;
            while(_loc6_ < this.hasBeenAttackEnemyList.length)
            {
               if(this.hasBeenAttackEnemyList[_loc6_] == _loc4_.uid)
               {
                  _loc5_ = true;
                  _loc6_ = this.hasBeenAttackEnemyList.length;
               }
               _loc6_++;
            }
            if(!_loc5_ && TDCheckCollision.isCollision(_bullet,_bullet.damageArea,_loc4_,_loc4_.damageArea))
            {
               if(_loc7_ = TDSearchTargetUtils.bulletBounce(_bullet,_loc4_))
               {
                  return;
               }
               _loc3_ = _loc4_;
               break;
            }
         }
         if(_loc3_ != null)
         {
            if(this.curHitNum == this.maxHitNum)
            {
               return;
            }
            this._params[TDConstant.ActionParam_Target] = _loc3_;
            this.hasBeenAttackEnemyList.push(_loc3_.uid);
            this.doBulletHit();
            ++this.curHitNum;
            if(this.curDirState == 1)
            {
               if(this.curHitNum == this.maxHitNum || this.curHitNum >= _loc2_)
               {
                  this.curHitNum = 0;
                  this.curDirState = -1;
                  this.realHitNum = 0;
               }
            }
         }
         else if(!TDGameInfo.getInstance().isInScreen(_bullet.x,_bullet.y))
         {
            this.outScreen();
         }
      }
      
      private function outScreen() : void
      {
         if(this.curDirState == -1 && this.isVariable == false)
         {
            _bullet.setAction(TDConstant.BAction_Disappear);
         }
         else
         {
            this.curHitNum = 0;
            this.curDirState = -1;
            this.realHitNum = 0;
         }
      }
      
      private function doBulletHit() : void
      {
         this.playHitEffect();
         var _loc1_:IGameObject = readObjectParams(TDConstant.ActionParam_Target) as IGameObject;
         if(_loc1_ != null && this.realHitNum <= 2)
         {
            TDSoundCmd.zombieHitByBullet(_loc1_.uid,_bullet.bulletData.bulletStaticInfo.type);
            TDDamageCaculete.caculateBulletDamage(_bullet,_loc1_);
            ++this.realHitNum;
         }
      }
      
      private function playHitEffect() : void
      {
         this.boneAnim = BlitBoneManager.impl.createBoneAnim();
         this.boneAnim.data = BlitBoneManager.impl.getBoneDataByUrl(UrlManager.getUrl(UrlManager.Url_TDObjectAnmi,"bloomerang_projectile_hit." + GameGloble.BONE_FILE_EXT));
         var _loc1_:IGameObject = readObjectParams(TDConstant.ActionParam_Target) as IGameObject;
         if(_loc1_)
         {
            _loc1_.frontLayer.addChild(this.boneAnim.asset.asset);
         }
         this.boneAnim.addEventListener(Event.COMPLETE,this.hitEffectCompleteHandler);
         if(this.curDirState == 1)
         {
            this.boneAnim.gotoAndPlay("animation");
         }
         else
         {
            this.boneAnim.gotoAndPlay("animation3");
         }
      }
      
      protected function hitEffectCompleteHandler(param1:Event) : void
      {
         if(this.boneAnim)
         {
            this.boneAnim.removeEventListener(Event.COMPLETE,this.hitEffectCompleteHandler);
         }
         var _loc2_:IGameObject = readObjectParams(TDConstant.ActionParam_Target) as IGameObject;
         if(_loc2_ && this.boneAnim && this.boneAnim.hasDisposed == false)
         {
            _loc2_.frontLayer.removeChild(this.boneAnim.asset.asset);
         }
         if(this.boneAnim && !this.boneAnim.hasDisposed)
         {
            this.boneAnim.Dispose();
            this.boneAnim = null;
         }
      }
      
      override public function dispose() : void
      {
         this.hasBeenAttackEnemyList = [];
         if(this.boneAnim)
         {
            this.hitEffectCompleteHandler(null);
         }
         super.dispose();
      }
   }
}
