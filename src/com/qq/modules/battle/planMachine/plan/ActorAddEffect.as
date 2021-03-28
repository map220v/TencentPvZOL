package com.qq.modules.battle.planMachine.plan
{
   import com.qq.GameGloble;
   import com.qq.modules.battle.model.BattleFightModel;
   import com.qq.modules.battle.model.BattleUnitInfo;
   import com.qq.modules.battle.model.BattleUnitModel;
   import com.qq.modules.battle.view.unit.UnitBase;
   import com.qq.modules.battle.view.unit.UnitEffectCav;
   import com.qq.modules.main.model.SettingsModel;
   import com.qq.modules.main.model.settings.battle.BattleCardSettings;
   import com.qq.modules.main.model.settings.battle.ce.BattleLineupCardTemp;
   import com.qq.utils.UrlManager;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   import tencent.tools.planMachine.ICallBack;
   
   public class ActorAddEffect extends BattleBasePlan
   {
       
      
      protected var topOrGround:Boolean;
      
      protected var effectName:String;
      
      protected var time:Number;
      
      protected var offsetX:Number;
      
      protected var offsetY:Number;
      
      protected var actionName:String;
      
      protected var target:UnitBase;
      
      protected var anim:UnitEffectCav;
      
      private var timer:Timer;
      
      public function ActorAddEffect()
      {
         super();
      }
      
      override protected function dispose() : void
      {
         if(this.timer)
         {
            if(BattleUnitModel.getInstance().battleTimer)
            {
               BattleUnitModel.getInstance().battleTimer.removeTimer(this.timer);
            }
            this.timer.stop();
            this.timer.removeEventListener(TimerEvent.TIMER_COMPLETE,this.playCompleteHandler);
            this.timer = null;
         }
         if(this.anim)
         {
            this.anim.removeEventListener(Event.COMPLETE,this.playCompleteHandler);
            if(this.topOrGround)
            {
               this.target.removeTopEffect(this.anim);
            }
            else
            {
               this.target.removeBottomEffect(this.anim);
            }
            this.anim.Dispose();
            this.anim = null;
         }
         super.dispose();
      }
      
      override public function setDynamicParams(param1:Array) : void
      {
         this.topOrGround = param1[0] == "1" ? true : false;
         this.effectName = param1[1];
         this.time = param1[2];
         this.actionName = param1[3];
         this.offsetX = param1[4];
         this.offsetY = param1[5];
      }
      
      override public function doPlan(param1:ICallBack) : void
      {
         var _loc4_:BattleUnitInfo = null;
         var _loc5_:BattleLineupCardTemp = null;
         super.doPlan(param1);
         this.target = this.getTarget();
         if(this.target == null)
         {
            return;
         }
         var _loc2_:String = UrlManager.getUrl(UrlManager.Url_Battle_Effect,this.effectName + "." + GameGloble.BONE_FILE_EXT);
         if(this.topOrGround)
         {
            this.anim = this.target.addTopEffect(_loc2_);
         }
         else
         {
            this.anim = this.target.addGroundEffect(_loc2_);
         }
         if(isRightSide)
         {
            this.offsetX = -this.offsetX;
         }
         this.anim.mouseChildren = false;
         this.anim.mouseEnabled = false;
         this.anim.x += this.offsetX;
         this.anim.y += this.offsetY;
         if(this.time == 0)
         {
            this.anim.anim.gotoAndPlay(this.actionName,1);
            this.anim.anim.addEventListener(Event.COMPLETE,this.playCompleteHandler);
         }
         else
         {
            this.anim.anim.gotoAndPlay(this.actionName,0);
            this.timer = new Timer(this.time,1);
            BattleUnitModel.getInstance().battleTimer.addTimer(this.timer);
            this.timer.addEventListener(TimerEvent.TIMER_COMPLETE,this.playCompleteHandler);
            this.timer.start();
         }
         var _loc3_:int = BattleUnitModel.getInstance().getUnitIndex(this.target);
         if(actor && (actor.actorIndex % 2 == 0 && _loc3_ % 2 != 0 || actor.actorIndex % 2 == 0))
         {
            if((_loc4_ = BattleFightModel.getInstance().getFightCardByPosIndex(actor.actorIndex)).cardId != 0)
            {
               _loc5_ = SettingsModel.instance.battleCardSettings.getBattleCardTempById(_loc4_.cardId);
            }
            if(_loc5_ == null || _loc5_.type == BattleCardSettings.BATTLE_CARD_TYPE_PLANT)
            {
               this.anim.scaleX = -this.anim.scaleX;
            }
         }
      }
      
      protected function getTarget() : UnitBase
      {
         return BattleUnitModel.getInstance().getUnitByPosIndex(actor.actorIndex) as UnitBase;
      }
      
      protected function playCompleteHandler(param1:Event) : void
      {
         if(this.timer)
         {
            this.timer.removeEventListener(TimerEvent.TIMER_COMPLETE,this.playCompleteHandler);
         }
         if(this.topOrGround)
         {
            this.target.removeTopEffect(this.anim);
         }
         else
         {
            this.target.removeBottomEffect(this.anim);
         }
         if(this.anim)
         {
            this.anim.removeEventListener(Event.COMPLETE,this.playCompleteHandler);
            this.anim.Dispose();
         }
         this.anim = null;
         this.target = null;
         setComplete();
      }
   }
}
