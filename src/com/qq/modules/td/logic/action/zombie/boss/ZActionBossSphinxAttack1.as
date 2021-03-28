package com.qq.modules.td.logic.action.zombie.boss
{
   import asgui.events.FrameEvent;
   import com.qq.constant.td.TDConstant;
   import com.qq.modules.td.command.game.TDGameObjectCmd;
   import com.qq.modules.td.command.game.sound.TDSoundCmd;
   import com.qq.modules.td.logic.action.basic.BasicAction;
   import com.qq.modules.td.model.TDGameInfo;
   import flash.events.Event;
   import org.as3commons.logging.api.getLogger;
   
   public class ZActionBossSphinxAttack1 extends BasicAction
   {
       
      
      private var _lastTime:Number;
      
      private var _summonDuration:int;
      
      private var _summonAreaColMin:int;
      
      private var _summonAreaColMax:int;
      
      private var _summonZombieTypeList:Array;
      
      private var _isSummoning:Boolean;
      
      private var _summonIndex:int;
      
      public function ZActionBossSphinxAttack1()
      {
         super();
      }
      
      override public function enterState(param1:Array = null) : void
      {
         var _loc3_:XMLList = null;
         var _loc4_:XML = null;
         var _loc5_:String = null;
         var _loc6_:Array = null;
         getLogger("boss").info("boss attack1");
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
         }
         this._isSummoning = false;
         this._lastTime = TDGameInfo.getInstance().getCurGameTime();
         _gameObject.animation.gotoAndPlay("idle",true);
      }
      
      override public function leaveState() : void
      {
         _gameObject.setRunningProp(TDConstant.Gameobject_Prop_SummonZombie_Index,this._summonIndex);
         _gameObject.animation.removeEventListener(FrameEvent.MOVEMENT_FRAME_EVENT,this.onSummon);
         _gameObject.animation.removeEventListener(Event.COMPLETE,this.onFinishSummon);
         super.leaveState();
      }
      
      override public function runningState() : void
      {
         var _loc1_:Number = NaN;
         super.runningState();
         if(!this._isSummoning)
         {
            if(_gameObject.getRunningProp(TDConstant.GameObject_Prop_BossSphinx_State) == 2)
            {
               _gameObject.setAction(TDConstant.ZAction_BossSphinx_WakeUp);
               return;
            }
            _loc1_ = TDGameInfo.getInstance().getCurGameTime();
            if(_loc1_ - this._lastTime > this._summonDuration)
            {
               _gameObject.animation.addEventListener(FrameEvent.MOVEMENT_FRAME_EVENT,this.onSummon);
               _gameObject.animation.addEventListener(Event.COMPLETE,this.onFinishSummon);
               _gameObject.animation.gotoAndPlay("attack1");
               this._lastTime = _loc1_;
               this._isSummoning = true;
            }
         }
      }
      
      private function onSummon(param1:FrameEvent) : void
      {
         var _loc2_:Array = null;
         if(param1.frameLabel == "summon")
         {
            _gameObject.animation.removeEventListener(Event.COMPLETE,this.onSummon);
            _loc2_ = this.getNextSummonZombieList();
            TDSoundCmd.playSummonZombieEffect();
            TDGameObjectCmd.summonZombieInArea(_loc2_,this._summonAreaColMin,this._summonAreaColMax);
         }
      }
      
      private function onFinishSummon(param1:Event) : void
      {
         _gameObject.animation.removeEventListener(FrameEvent.MOVEMENT_FRAME_EVENT,this.onSummon);
         _gameObject.animation.removeEventListener(Event.COMPLETE,this.onFinishSummon);
         _gameObject.animation.gotoAndPlay("idle");
         this._isSummoning = false;
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
