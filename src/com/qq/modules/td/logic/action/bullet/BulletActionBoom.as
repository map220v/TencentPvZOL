package com.qq.modules.td.logic.action.bullet
{
   import com.qq.CommandName;
   import com.qq.constant.td.TDChallengeScoreType;
   import com.qq.constant.td.TDConstant;
   import com.qq.modules.td.command.effects.TDEffectCmd;
   import com.qq.modules.td.logic.TDChallengeScoreManager;
   import com.qq.modules.td.logic.bt_ai.aiUtils.TDSearchTargetUtils;
   import com.qq.modules.td.logic.numeric.TDCheckCollision;
   import com.qq.modules.td.logic.numeric.TDDamageCaculete;
   import com.qq.modules.td.logic.unit.basic.IGameObject;
   import com.qq.modules.td.model.TDStageInfo;
   import com.qq.modules.td.view.game.layer.shadow.TDShadowManager;
   import com.qq.utils.CommandDispatcher;
   import com.qq.utils.DMath;
   import flash.events.Event;
   
   public class BulletActionBoom extends BasicBulletAction
   {
       
      
      public function BulletActionBoom()
      {
         super();
      }
      
      override public function enterState(param1:Array = null) : void
      {
         var _loc2_:Array = null;
         var _loc3_:Vector.<IGameObject> = null;
         var _loc4_:IGameObject = null;
         var _loc5_:IGameObject = null;
         super.enterState(param1);
         TDShadowManager.instance.disposeShadowByTDGameObject(_bullet);
         if(_bullet.bulletData.bulletStaticInfo.isAOE == 1)
         {
            _loc2_ = readObjectParams(TDConstant.ActionParam_BulletBoomArea) as Array;
            if(_loc2_)
            {
               _loc3_ = TDSearchTargetUtils.searchTargetForBullet(_bullet,_loc2_,[_bullet.objectModel.roadIndex]);
            }
            else
            {
               _loc3_ = TDSearchTargetUtils.searchTargetForBullet(_bullet,[TDCheckCollision.getNewObjRect(_bullet,_bullet.attackArea)],_bullet.bulletData.bulletStaticInfo.isMulRow == 1 ? null : [_bullet.objectModel.roadIndex]);
            }
            if(_loc3_ == null || _loc3_.length <= 0)
            {
               TDChallengeScoreManager.instance.addScoreByType(TDChallengeScoreType.Carrot_Rocket_Miss);
            }
            if(_loc3_)
            {
               for each(_loc4_ in _loc3_)
               {
                  this.handleTarget(_loc4_);
               }
               if(TDStageInfo.getInstance().tdGameType == TDConstant.TDGameType_CoconutCannonShooting)
               {
                  CommandDispatcher.send(CommandName.TDMiniGame_CoconutCannon_ChangeScore,_loc3_.length);
               }
            }
         }
         else if(_loc5_ = readObjectParams(TDConstant.ActionParam_Target) as IGameObject)
         {
            this.handleTarget(_loc5_);
         }
         this.playBulletHitEffect();
      }
      
      private function handleTarget(param1:IGameObject) : void
      {
         if(param1 != null)
         {
            TDDamageCaculete.caculateBulletDamage(_bullet,param1);
         }
      }
      
      protected function splatCompleteHandler(param1:Event) : void
      {
         _bullet.animation.removeEventListener(Event.COMPLETE,this.splatCompleteHandler);
         _bullet.dispose();
         _bullet = null;
      }
      
      private function playBulletHitEffect() : void
      {
         var _loc2_:Vector.<int> = null;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc1_:Array = _bullet.bulletData.bulletStaticInfo.hitEffectIDList;
         if(_loc1_.length == 0)
         {
            _loc2_ = _bullet.animation.getFrameLabelRange("splat");
            if(_loc2_ != null)
            {
               _bullet.animation.addEventListener(Event.COMPLETE,this.splatCompleteHandler);
               _bullet.animation.gotoAndPlay("splat");
            }
            else
            {
               this.splatCompleteHandler(null);
            }
         }
         else
         {
            _loc3_ = DMath.randNum(0,_loc1_.length - 1);
            _loc4_ = _loc1_[_loc3_];
            TDEffectCmd.playBombEffect(_loc4_,_gameObject.x,_gameObject.y);
            this.splatCompleteHandler(null);
         }
      }
   }
}
