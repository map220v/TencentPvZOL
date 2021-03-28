package com.qq.modules.td.logic.action.zombie.boss
{
   import asgui.events.FrameEvent;
   import com.qq.constant.td.TDConstant;
   import com.qq.modules.td.command.game.TDFireBulletCmd;
   import com.qq.modules.td.command.game.TDGameObjectCmd;
   import com.qq.modules.td.command.game.sound.TDSoundCmd;
   import com.qq.modules.td.logic.action.basic.BasicAction;
   import com.qq.modules.td.model.TDGameInfo;
   import flash.events.Event;
   import org.as3commons.logging.api.getLogger;
   
   public class ZActionBossSphinxAngleAttack extends BasicAction
   {
       
      
      private var _lastTime:Number;
      
      private var _summonDuration:int;
      
      private var _summonAreaColMin:int;
      
      private var _summonAreaColMax:int;
      
      private var _summonZombieTypeList:Array;
      
      private var _isAttacking:Boolean;
      
      private var _bulletType:int;
      
      private var _summonIndex:int;
      
      public function ZActionBossSphinxAngleAttack()
      {
         super();
      }
      
      override public function enterState(param1:Array = null) : void
      {
         var _loc3_:XMLList = null;
         var _loc4_:XML = null;
         var _loc5_:String = null;
         var _loc6_:Array = null;
         getLogger("boss").info("boss angle attack");
         super.enterState(param1);
         var _loc2_:XML = _gameObject.getRunningProp(TDConstant.Gameobject_Prop_InitParamXml);
         if(_loc2_ != null)
         {
            this._summonDuration = int(_loc2_.summonDuration.@value);
            this._summonAreaColMin = int(_loc2_.summonArea.@startCol);
            this._summonAreaColMax = int(_loc2_.summonArea.@endCol);
            this._summonZombieTypeList = new Array();
            _loc3_ = _loc2_.summonZombie.list;
            for each(_loc4_ in _loc3_)
            {
               _loc6_ = (_loc5_ = _loc4_.@value).split(";");
               this._summonZombieTypeList.push(_loc6_);
            }
            this._bulletType = int(_loc2_.bulletType.@value);
         }
         this._isAttacking = false;
         this._lastTime = TDGameInfo.getInstance().getCurGameTime();
         _gameObject.animation.addEventListener(Event.COMPLETE,this.onComplete);
         _gameObject.animation.addEventListener(FrameEvent.MOVEMENT_FRAME_EVENT,this.onAction);
         _gameObject.animation.gotoAndPlay("angleAttack");
         this._summonIndex = _gameObject.getRunningProp(TDConstant.Gameobject_Prop_SummonZombie_Index);
      }
      
      private function onAction(param1:FrameEvent) : void
      {
         if(param1.frameLabel == "shoot")
         {
            this.onShoot();
         }
         if(param1.frameLabel == "summon")
         {
            this.onSummon();
         }
      }
      
      private function onComplete(param1:Event) : void
      {
         _gameObject.animation.removeEventListener(Event.COMPLETE,this.onComplete);
         _gameObject.setAction(TDConstant.ZAction_BossSphinx_WaitingAngle);
      }
      
      private function onSummon() : void
      {
         var _loc1_:Array = this.getNextSummonZombieList();
         TDSoundCmd.playSummonZombieEffect();
         TDGameObjectCmd.summonZombieInArea(_loc1_,this._summonAreaColMin,this._summonAreaColMax);
      }
      
      private function onShoot() : void
      {
         TDFireBulletCmd.shoot(_gameObject,null,this._bulletType,"_Zombie_boss_fireball",0,0,-1,false,null,null,TDConstant.TDCamp_Enemy);
      }
      
      override public function leaveState() : void
      {
         _gameObject.animation.removeEventListener(FrameEvent.MOVEMENT_FRAME_EVENT,this.onAction);
         _gameObject.animation.removeEventListener(Event.COMPLETE,this.onComplete);
         super.leaveState();
      }
      
      override public function runningState() : void
      {
         super.runningState();
      }
      
      private function getNextSummonZombieList() : Array
      {
         var _loc1_:Array = null;
         if(this._summonIndex >= this._summonZombieTypeList.length)
         {
            this._summonIndex = 0;
         }
         _loc1_ = this._summonZombieTypeList[this._summonIndex];
         ++this._summonIndex;
         return _loc1_;
      }
   }
}
