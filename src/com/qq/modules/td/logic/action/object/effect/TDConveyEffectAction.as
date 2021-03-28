package com.qq.modules.td.logic.action.object.effect
{
   import com.greensock.TweenMax;
   import com.qq.CommandName;
   import com.qq.constant.td.TDChallengeScoreType;
   import com.qq.constant.td.TDConstant;
   import com.qq.constant.td.TDMusicGameConstant;
   import com.qq.modules.td.data.map.TDMapTileData;
   import com.qq.modules.td.logic.TDChallengeScoreManager;
   import com.qq.modules.td.logic.action.basic.BasicAction;
   import com.qq.modules.td.logic.bt_ai.aiUtils.TDSearchTargetUtils;
   import com.qq.modules.td.logic.unit.basic.IGameObject;
   import com.qq.modules.td.logic.unit.zombie.BasicZombie;
   import com.qq.modules.td.model.TDGameInfo;
   import com.qq.modules.td.model.TDMiniGameMusicData;
   import com.qq.modules.td.model.TDStageInfo;
   import com.qq.utils.CommandDispatcher;
   
   public class TDConveyEffectAction extends BasicAction
   {
       
      
      private var _zombie:IGameObject;
      
      private var _convey:IGameObject;
      
      private var _lastTime:Number;
      
      private var _speed:int;
      
      private var _endX:int;
      
      public function TDConveyEffectAction()
      {
         super();
      }
      
      override public function enterState(param1:Array = null) : void
      {
         super.enterState(param1);
         var _loc2_:int = _gameObject.getRunningProp(TDConstant.GameObject_Prop_ConveryEffect_ZombieUID);
         this._convey = _gameObject.getRunningProp(TDConstant.Gameobject_Prop_ConveryObj);
         this._endX = _gameObject.getRunningProp(TDConstant.GameObject_Prop_ConveryEffect_EndX);
         this._zombie = TDGameInfo.getInstance().getGameObjctByUID(_loc2_);
         this._zombie.setAction(TDConstant.ZAction_Idle);
         this._zombie.setFrozenAI(true);
         this._lastTime = TDGameInfo.getInstance().getCurGameTime();
         this._speed = 80;
      }
      
      override public function leaveState() : void
      {
         if(this._zombie)
         {
            this._zombie.objectModel.removeBuff(TDConstant.TDBuffID_Convey);
            if(!this._zombie.objectModel.hasBuff(TDConstant.TDBuffID_Stun))
            {
               this._zombie.setFrozenAI(false);
            }
         }
         super.leaveState();
      }
      
      private function onFinishDisappear(param1:BasicZombie) : void
      {
         if(param1 == null || !param1.isVaild)
         {
            return;
         }
         param1.setAction(TDConstant.ZAction_Disappear);
      }
      
      override public function runningState() : void
      {
         var _loc2_:Number = NaN;
         var _loc3_:Number = NaN;
         var _loc4_:Number = NaN;
         super.runningState();
         if(!this._zombie.isVaild)
         {
            _gameObject.dispose();
            return;
         }
         var _loc1_:Boolean = false;
         if(!this._convey.isVaild)
         {
            _loc1_ = true;
         }
         else if(this.meetNutsShield())
         {
            _loc1_ = true;
         }
         else
         {
            _loc2_ = TDGameInfo.getInstance().getCurGameTime();
            _loc3_ = (_loc2_ - this._lastTime) * 0.001;
            this._lastTime = _loc2_;
            _loc4_ = this._speed * _loc3_;
            _gameObject.setLocation(_gameObject.x - _loc4_,_gameObject.y);
            this._zombie.setLocation(_gameObject.x,_gameObject.y);
            if(this._zombie.x < this._endX || this._zombie.objectModel.hasBuff(TDConstant.TDBuffID_Stun))
            {
               _loc1_ = true;
            }
         }
         if(_loc1_)
         {
            this.doMusicGame();
            _gameObject.dispose();
         }
      }
      
      private function meetNutsShield() : Boolean
      {
         var _loc1_:TDMapTileData = TDGameInfo.getInstance().getRoadTileByGamePos(this._zombie.x - 30,this._zombie.y);
         if(_loc1_)
         {
            return TDSearchTargetUtils.searchTargetNutsShieldByColumn(_loc1_.roadCol) != null;
         }
         return false;
      }
      
      private function doMusicGame() : void
      {
         var _loc1_:Array = null;
         var _loc2_:IGameObject = null;
         if(TDStageInfo.getInstance().tdGameType == TDConstant.TDGameType_VOS)
         {
            if(this._zombie.objectModel.curHp.get() > 0)
            {
               TDMiniGameMusicData.getInstance().lastResult = TDMusicGameConstant.Miss;
               TDMiniGameMusicData.getInstance().combatNum = 0;
               TDChallengeScoreManager.instance.addScoreByType(TDChallengeScoreType.Bonkchoy_Miss,1);
               CommandDispatcher.send(CommandName.TDMiniGame_Music_ChangeScore);
               _loc1_ = TDGameInfo.getInstance().getPlantListByRoadIndex([this._zombie.objectModel.roadIndex]);
               if(_loc1_.length > 0)
               {
                  _loc2_ = _loc1_[0];
                  if(_loc2_.isFrozenAI())
                  {
                     _loc2_.changeHp(-int(_loc2_.objectModel.maxHp.get() * 0.1 + 10),TDConstant.AttackType_Normal,TDConstant.AttackMode_Normal,this._zombie);
                     TweenMax.to(this._zombie,0.8,{
                        "alpha":0,
                        "onComplete":this.onFinishDisappear,
                        "onCompleteParams":[this._zombie]
                     });
                  }
               }
            }
         }
      }
   }
}
