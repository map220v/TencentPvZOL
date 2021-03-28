package com.qq.modules.td.logic.action.zombie.basic
{
   import asgui.blit.bone.BlitBoneAnim;
   import com.qq.constant.td.TDConstant;
   import com.qq.modules.td.logic.action.zombie.BasicZombieAction;
   import com.qq.modules.td.logic.unit.object.TDSun;
   import com.qq.modules.td.model.TDGameInfo;
   import flash.events.Event;
   import flash.events.IEventDispatcher;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   
   public class ZombieActionCatchSun extends BasicZombieAction
   {
       
      
      private var suns:Array;
      
      private var catchTimer:Timer;
      
      public function ZombieActionCatchSun()
      {
         super();
      }
      
      override public function enterState(param1:Array = null) : void
      {
         super.enterState(param1);
         _zombie.animation.gotoAndPlay("power_up",false);
         _zombie.animation.addEventListener(Event.COMPLETE,this.onPowerUpComplete,false,0,true);
         this.startCatching();
      }
      
      protected function onPowerUpComplete(param1:Event) : void
      {
         (param1.currentTarget as IEventDispatcher).removeEventListener(Event.COMPLETE,this.onPowerUpComplete);
         _zombie.animation.gotoAndPlay("power",true);
      }
      
      override public function leaveState() : void
      {
         this.stopCatching();
      }
      
      public function startCatching() : void
      {
         var _loc1_:int = 0;
         var _loc2_:TDSun = null;
         if(this.catchTimer == null)
         {
            this.catchTimer = new Timer(800);
            this.catchTimer.addEventListener(TimerEvent.TIMER,this.catchTimerHandler);
            this.catchTimer.start();
         }
         this.suns = TDGameInfo.getInstance().getGameObjectMapByCatalgAndType(TDConstant.UnitCatalog_Object,TDConstant.UnitType_Sun);
         this.suns = this.suns.concat(TDGameInfo.getInstance().getGameObjectMapByCatalgAndType(TDConstant.UnitCatalog_Object,TDConstant.UnitType_PlantSun));
         this.suns = this.suns.concat(TDGameInfo.getInstance().getGameObjectMapByCatalgAndType(TDConstant.UnitCatalog_Object,TDConstant.UnitType_BigSun));
         _loc1_ = 0;
         while(_loc1_ < this.suns.length)
         {
            _loc2_ = this.suns[_loc1_];
            if(_loc2_.beCatchingStep > 0)
            {
               this.suns.splice(_loc1_,1);
               _loc1_--;
            }
            _loc1_++;
         }
         this.doCatching();
      }
      
      protected function onTransitionRedComplete(param1:Event) : void
      {
         (param1.currentTarget as IEventDispatcher).removeEventListener(Event.COMPLETE,this.onTransitionRedComplete);
         (param1.currentTarget as BlitBoneAnim).gotoAndPlay("red",0);
      }
      
      public function stopCatching() : void
      {
         var _loc1_:TDSun = null;
         var _loc2_:int = 0;
         if(this.catchTimer)
         {
            this.catchTimer.removeEventListener(TimerEvent.TIMER,this.catchTimerHandler);
            this.catchTimer.stop();
            this.catchTimer = null;
         }
         var _loc3_:int = this.suns.length;
         _loc2_ = 0;
         while(_loc2_ < _loc3_)
         {
            _loc1_ = this.suns[_loc2_];
            _loc1_.beCatchingStep = 0;
            _loc1_.setAction(TDConstant.SunAction_Idle);
            _loc2_++;
         }
      }
      
      protected function catchTimerHandler(param1:TimerEvent) : void
      {
         this.doCatching();
      }
      
      public function doCatching() : void
      {
         var _loc1_:TDSun = null;
         var _loc2_:int = 0;
         var _loc5_:String = null;
         if(_zombie.objectModel.curHp.get() <= 0)
         {
            this.stopCatching();
         }
         var _loc3_:int = this.suns.length;
         var _loc4_:Boolean = true;
         _loc2_ = 0;
         while(_loc2_ < _loc3_)
         {
            _loc1_ = this.suns[_loc2_];
            if(!(_loc1_.hasDisposed || _loc1_.zombieCatcher != null && _loc1_.zombieCatcher.uid != _zombie.uid))
            {
               _loc4_ = false;
               if(!((_loc5_ = _loc1_.getActionID()) != TDConstant.SunAction_Idle && _loc5_ != TDConstant.SunAction_SunActionBeCatching && _loc5_ != TDConstant.SunAction_Drop))
               {
                  ++_loc1_.beCatchingStep;
                  _loc1_.setAction(TDConstant.SunAction_SunActionBeCatching,[_zombie]);
               }
            }
            _loc2_++;
         }
         if(_loc3_ > 0 && _loc4_)
         {
            _zombie.setAction(TDConstant.ZAction_CatchSunEnd);
         }
      }
   }
}
