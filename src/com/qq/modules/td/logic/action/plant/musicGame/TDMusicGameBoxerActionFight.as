package com.qq.modules.td.logic.action.plant.musicGame
{
   import asgui.events.FrameEvent;
   import com.qq.CommandName;
   import com.qq.GameGloble;
   import com.qq.constant.td.TDChallengeScoreType;
   import com.qq.constant.td.TDConstant;
   import com.qq.constant.td.TDMusicGameConstant;
   import com.qq.modules.td.logic.TDChallengeScoreManager;
   import com.qq.modules.td.logic.action.basic.BasicAction;
   import com.qq.modules.td.logic.numeric.TDCheckCollision;
   import com.qq.modules.td.logic.trigger.TDTrigConst;
   import com.qq.modules.td.logic.trigger.events.TriggerEvent;
   import com.qq.modules.td.logic.unit.basic.IGameObject;
   import com.qq.modules.td.logic.unit.zombie.BasicZombie;
   import com.qq.modules.td.model.TDGameInfo;
   import com.qq.modules.td.model.TDMiniGameMusicData;
   import com.qq.modules.td.model.TDStageInfo;
   import com.qq.utils.CommandDispatcher;
   import flash.events.Event;
   import flash.geom.Rectangle;
   
   public class TDMusicGameBoxerActionFight extends BasicAction
   {
       
      
      public function TDMusicGameBoxerActionFight()
      {
         super();
      }
      
      override public function enterState(param1:Array = null) : void
      {
         var _loc2_:int = 0;
         var _loc4_:String = null;
         var _loc5_:BasicZombie = null;
         super.enterState(param1);
         _gameObject.animation.addEventListener(Event.COMPLETE,this.onComplete);
         var _loc3_:Array = TDGameInfo.getInstance().getZombieList([_gameObject.objectModel.roadIndex],0,false,true,false);
         if(_loc3_.length > 0)
         {
            _loc5_ = _loc3_[0];
            _loc2_ = this.getResult(_loc5_);
         }
         if(_loc2_ == TDMusicGameConstant.Perfect)
         {
            _loc4_ = TDConstant.PlantAnmi_Attack4;
         }
         else
         {
            _loc4_ = TDConstant.PlantAnmi_Attack;
         }
         _gameObject.animation.gotoAndPlay(_loc4_);
         _gameObject.animation.addEventListener(FrameEvent.MOVEMENT_FRAME_EVENT,this.onAttack);
      }
      
      override public function leaveState() : void
      {
         _gameObject.animation.removeEventListener(FrameEvent.MOVEMENT_FRAME_EVENT,this.onAttack);
         _gameObject.animation.removeEventListener(Event.COMPLETE,this.onComplete);
         super.leaveState();
      }
      
      override public function runningState() : void
      {
         super.runningState();
      }
      
      private function onAttack(param1:FrameEvent) : void
      {
         var _loc2_:Array = null;
         var _loc3_:BasicZombie = null;
         var _loc4_:int = 0;
         if(param1.frameLabel == "attack")
         {
            _loc2_ = TDGameInfo.getInstance().getZombieList([_gameObject.objectModel.roadIndex],0,false,true,false);
            if(_loc2_.length > 0)
            {
               _loc3_ = _loc2_[0];
               if(_loc3_.objectModel.checkState(TDConstant.TDUnitState_OnConvey) && TDCheckCollision.isCollision(_gameObject,_gameObject.attackArea,_loc3_,_loc3_.damageArea))
               {
                  if(_loc3_.zombieData.isExistArmor())
                  {
                     if(_loc3_.zombieData.getAllArmorCurHp() > 1000)
                     {
                        _loc4_ = -(_loc3_.zombieData.getAllArmorMaxHp() * 0.5 + 10);
                     }
                     else
                     {
                        _loc4_ = -(_loc3_.zombieData.getAllArmorMaxHp() + 10);
                     }
                  }
                  else
                  {
                     _loc4_ = -(_loc3_.zombieData.curHp.get() + 10);
                  }
                  _loc3_.changeHp(_loc4_,TDConstant.AttackType_Normal,TDConstant.AttackMode_Skill,_loc3_);
                  if(_loc3_.objectModel.curHp.get() <= 0)
                  {
                     this.countScore(_loc3_);
                  }
               }
            }
            _gameObject.setRunningProp(TDConstant.GameObject_Prop_MusicGame_Boxer_isCoolDown,0);
         }
      }
      
      private function onComplete(param1:Event) : void
      {
         _gameObject.setAction(TDConstant.TDMusicGameBoxerActionIdle);
      }
      
      private function getResult(param1:IGameObject) : int
      {
         var _loc2_:int = 0;
         if(!TDMusicGameConstant.Perfect_Area_Rect)
         {
            TDMusicGameConstant.Perfect_Area_Rect = new Rectangle(440,0,35,GameGloble.stage.stageHeight);
         }
         if(TDMusicGameConstant.Perfect_Area_Rect.contains(param1.x,param1.y))
         {
            _loc2_ = TDMusicGameConstant.Perfect;
         }
         else
         {
            _loc2_ = TDMusicGameConstant.Good;
         }
         return _loc2_;
      }
      
      private function countScore(param1:IGameObject) : void
      {
         var _loc4_:int = 0;
         var _loc2_:int = 0;
         var _loc3_:int = this.getResult(param1);
         if(TDStageInfo.getInstance().isChallengeLevel())
         {
            if(_loc3_ == TDMusicGameConstant.Perfect)
            {
               TDChallengeScoreManager.instance.addScoreByType(TDChallengeScoreType.Bonkchoy_Perfect_Kill);
            }
            TDMiniGameMusicData.getInstance().lastResult = _loc3_;
            TDMiniGameMusicData.getInstance().combatNum = TDMiniGameMusicData.getInstance().combatNum + 1;
            CommandDispatcher.send(CommandName.TDMiniGame_Music_ChangeScore);
         }
         else
         {
            switch(param1.objectModel.unitType)
            {
               case TDMusicGameConstant.ZombieType_Normal:
                  _loc2_ += _loc3_ == TDMusicGameConstant.Good ? 100 : 200;
                  break;
               case TDMusicGameConstant.ZombieType_Cross:
                  _loc2_ += _loc3_ == TDMusicGameConstant.Good ? 250 : 500;
                  break;
               case TDMusicGameConstant.ZombieType_Drum:
                  _loc2_ += _loc3_ == TDMusicGameConstant.Good ? 500 : 1000;
            }
            TDMiniGameMusicData.getInstance().lastResult = _loc3_;
            TDMiniGameMusicData.getInstance().combatNum = TDMiniGameMusicData.getInstance().combatNum + 1;
            _loc4_ = Math.min(TDMiniGameMusicData.getInstance().combatNum,30) * 10;
            _loc2_ += _loc4_;
            TDMiniGameMusicData.getInstance().totalScore = TDMiniGameMusicData.getInstance().totalScore + _loc2_;
            if(_loc2_ > 0)
            {
               CommandDispatcher._dispatcher.dispatchEvent(new TriggerEvent(TDTrigConst.TYPE_MGAME_SCORE,[TDMiniGameMusicData.getInstance().totalScore]));
            }
            CommandDispatcher.send(CommandName.TDMiniGame_Music_ChangeScore);
         }
      }
   }
}
