package com.qq.modules.td.logic.action.zombie.emperorQin
{
   import com.qq.constant.td.TDConstant;
   import com.qq.modules.td.command.game.TDGameObjectCmd;
   import com.qq.modules.td.logic.action.zombie.BasicZombieAction;
   import com.qq.modules.td.model.TDGameInfo;
   import flash.events.Event;
   
   public class ZActionEmperorQinSummonZombie extends BasicZombieAction
   {
       
      
      private var _summonDuration:int;
      
      private var _summonAreaColMin:int;
      
      private var _summonAreaColMax:int;
      
      private var _summonZombieTypeList:Array;
      
      private var _summonIndex:int;
      
      public function ZActionEmperorQinSummonZombie()
      {
         super();
      }
      
      override public function enterState(param1:Array = null) : void
      {
         var _loc4_:XMLList = null;
         var _loc5_:XML = null;
         var _loc6_:String = null;
         var _loc7_:Array = null;
         super.enterState(param1);
         _gameObject.setFrozenAI(true);
         var _loc2_:XML = _gameObject.getRunningProp(TDConstant.Gameobject_Prop_InitParamXml);
         if(_loc2_ != null)
         {
            this._summonDuration = int(_loc2_.summonDuration.@value);
            this._summonAreaColMin = int(_loc2_.summonArea.@startCol);
            this._summonAreaColMax = int(_loc2_.summonArea.@endCol);
            this._summonZombieTypeList = new Array();
            _loc4_ = _loc2_.summonZombie.list;
            for each(_loc5_ in _loc4_)
            {
               _loc7_ = (_loc6_ = _loc5_.@value).split(";");
               this._summonZombieTypeList.push(_loc7_);
            }
         }
         _gameObject.animation.gotoAndPlay("skill_2");
         _gameObject.animation.addEventListener(Event.COMPLETE,this.onFinishSummon);
         this._summonIndex = _gameObject.getRunningProp(TDConstant.Gameobject_Prop_SummonZombie_Index);
         var _loc3_:Array = this.getNextSummonZombieList();
         TDGameObjectCmd.summonZombieInArea(_loc3_,this._summonAreaColMin,this._summonAreaColMax,false);
         _gameObject.setTimeRecord(TDConstant.TimeRecord_ZombieDuration,TDGameInfo.getInstance().getCurGameTime());
      }
      
      override public function leaveState() : void
      {
         _gameObject.setRunningProp(TDConstant.Gameobject_Prop_SummonZombie_Index,this._summonIndex);
         _gameObject.animation.removeEventListener(Event.COMPLETE,this.onFinishSummon);
         super.leaveState();
      }
      
      override public function runningState() : void
      {
         super.runningState();
      }
      
      private function onFinishSummon(param1:Event) : void
      {
         _gameObject.animation.removeEventListener(Event.COMPLETE,this.onFinishSummon);
         _gameObject.setFrozenAI(false);
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
