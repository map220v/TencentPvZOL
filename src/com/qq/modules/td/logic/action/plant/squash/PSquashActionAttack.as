package com.qq.modules.td.logic.action.plant.squash
{
   import com.greensock.TweenLite;
   import com.greensock.easing.Circ;
   import com.qq.CommandName;
   import com.qq.constant.td.TDConstant;
   import com.qq.modules.td.logic.action.plant.BasicPlantAction;
   import com.qq.modules.td.logic.bt_ai.aiUtils.TDSearchTargetUtils;
   import com.qq.modules.td.logic.numeric.TDCheckCollision;
   import com.qq.modules.td.logic.numeric.TDDamageCaculete;
   import com.qq.modules.td.logic.unit.basic.IGameObject;
   import com.qq.utils.CommandDispatcher;
   import com.qq.utils.UtilsManager;
   import flash.events.Event;
   import org.as3commons.logging.api.getLogger;
   
   public class PSquashActionAttack extends BasicPlantAction
   {
       
      
      private var cachePos:Array;
      
      private var cacheGroundY:Number;
      
      private var isFront:Boolean;
      
      public function PSquashActionAttack()
      {
         this.cachePos = [];
         super();
      }
      
      override public function enterState(param1:Array = null) : void
      {
         super.enterState(param1);
         if(!_plant.curAttackTarget)
         {
            getLogger().error("倭瓜没有攻击目标，不该进入攻击行为");
            return;
         }
         _plant.setFrozenAI(true);
         _plant.plantData.addBuff(TDConstant.TDBuffID_God,_plant);
         this.isFront = _plant.curAttackTarget.x > _plant.x;
         this.cachePos[0] = _plant.curAttackTarget.x;
         this.cachePos[1] = _plant.curAttackTarget.y + 30;
         this.cacheGroundY = _plant.curAttackTarget.y + 10;
         if(this.isFront)
         {
            _plant.animation.gotoAndPlay("size_up");
         }
         else
         {
            _plant.animation.gotoAndPlay("turn");
         }
         _plant.animation.addEventListener(Event.COMPLETE,this.onLookHandler);
      }
      
      protected function onLookHandler(param1:Event) : void
      {
         _plant.animation.removeEventListener(Event.COMPLETE,this.onLookHandler);
         UtilsManager.bringToTop(_plant.frontLayer);
         if(this.isFront)
         {
            _plant.animation.gotoAndPlay("jump_up_right");
         }
         else
         {
            _plant.animation.gotoAndPlay("jump_up_left");
         }
         _plant.animation.addEventListener(Event.COMPLETE,this.preJumpHandler);
      }
      
      protected function preJumpHandler(param1:Event) : void
      {
         _plant.animation.removeEventListener(Event.COMPLETE,this.preJumpHandler);
         if(_plant.curAttackTarget)
         {
            this.cachePos[0] = _plant.curAttackTarget.x;
            this.cachePos[1] = _plant.curAttackTarget.y - _plant.curAttackTarget.damageArea.height - 30;
         }
         TweenLite.to(_plant,0.3,{
            "x":this.cachePos[0],
            "y":this.cachePos[1],
            "ease":Circ.easeOut,
            "onComplete":this.onJumpUpHandler
         });
      }
      
      private function onJumpUpHandler() : void
      {
         var onJumpUp:Function = null;
         onJumpUp = function():void
         {
            _plant.setShadeVisible(false);
            TweenLite.to(_plant,0.14,{
               "y":cacheGroundY,
               "onComplete":onJumpDownHandler
            });
            if(isFront)
            {
               _plant.animation.gotoAndPlay("jump_down_right");
            }
            else
            {
               _plant.animation.gotoAndPlay("jump_down_left");
            }
            _plant.animation.addEventListener(Event.COMPLETE,onJumpDownMovieHandler);
         };
         TweenLite.delayedCall(0.2,onJumpUp);
      }
      
      private function onJumpDownHandler() : void
      {
         var _loc4_:IGameObject = null;
         var _loc5_:Boolean = false;
         var _loc1_:Array = TDSearchTargetUtils.getZombieList(_plant,[_plant.objectModel.roadIndex]);
         var _loc2_:Array = [];
         var _loc3_:int = 0;
         for each(_loc4_ in _loc1_)
         {
            if(_loc5_ = TDCheckCollision.isInCentry(_loc4_,_loc4_.damageArea,_plant,_plant.attackArea))
            {
               _loc2_.push(_loc4_);
               _loc3_++;
            }
         }
         TDDamageCaculete.caculatePlantDamage(_plant,_loc2_);
         CommandDispatcher.send(CommandName.TD_PlayShakeEffect,2);
      }
      
      protected function onJumpDownMovieHandler(param1:Event) : void
      {
         _plant.animation.removeEventListener(Event.COMPLETE,this.onJumpDownMovieHandler);
         _plant.dispose();
      }
      
      override public function runningState() : void
      {
         super.runningState();
      }
   }
}
