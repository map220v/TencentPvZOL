package com.qq.modules.td.logic.action.plant.waxgourd
{
   import asgui.events.FrameEvent;
   import com.qq.constant.td.TDConstant;
   import com.qq.modules.td.command.effects.TDEffectCmd;
   import com.qq.modules.td.logic.action.plant.BasicPlantAction;
   import com.qq.modules.td.logic.bt_ai.aiUtils.TDSearchTargetUtils;
   import com.qq.modules.td.logic.numeric.TDCheckCollision;
   import com.qq.modules.td.logic.numeric.TDDamageCaculete;
   import com.qq.modules.td.logic.talent.TalentManager;
   import com.qq.modules.td.logic.unit.plant.BasicPlant;
   import com.qq.modules.td.logic.unit.zombie.BasicZombie;
   import com.qq.modules.td.model.TDGameInfo;
   import com.qq.modules.td.model.vo.TDPathPointVO;
   import com.qq.modules.td.model.vo.TDPathVO;
   import com.qq.modules.td.view.effects.TDEffectPlayInfo;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   
   public class WaxgourdRollAction extends BasicPlantAction
   {
      
      private static const Direction_None:int = 0;
      
      private static const Direction_Top:int = 1;
      
      private static const Direction_Left:int = 2;
      
      private static const Direction_Bottom:int = 3;
       
      
      private var _speed:Number;
      
      private var _targetPoint:Point;
      
      private var _oldPoint:Point;
      
      private var _direction:int;
      
      private var _lastDirection:int;
      
      private var _isAttacking:Boolean;
      
      private var _attackPath:TDPathVO;
      
      private var _attackActionNames:Vector.<String>;
      
      private var _attackList:Array;
      
      private var _runingFun:Function;
      
      public function WaxgourdRollAction()
      {
         this._attackActionNames = new Vector.<String>(4,true);
         super();
         this._attackActionNames[0] = "idle";
         this._attackActionNames[Direction_Left] = "attack_1";
         this._attackActionNames[Direction_Bottom] = "attack_2";
         this._attackActionNames[Direction_Top] = "attack_3";
      }
      
      override public function enterState(param1:Array = null) : void
      {
         super.enterState(param1);
         _gameObject.animation.addEventListener(FrameEvent.MOVEMENT_FRAME_EVENT,this.onFrameEvent);
         this._direction = Direction_None;
         this._lastDirection = Direction_None;
         this._attackPath = param1[0] as TDPathVO;
         this._speed = Number(param1[1]);
         this._oldPoint = this.getNextTargetPoint();
         _gameObject.setLocation(this._oldPoint.x,this._oldPoint.y);
         this._targetPoint = this.getNextTargetPoint();
         this._isAttacking = false;
         this._runingFun = null;
         this.playReady();
      }
      
      override public function runningState() : void
      {
         if(false == _gameObject.animation.isPlaying)
         {
            return;
         }
         if(this._targetPoint != null && this._runingFun != null)
         {
            this._runingFun();
         }
      }
      
      override public function leaveState() : void
      {
         _gameObject.animation.removeEventListener(FrameEvent.MOVEMENT_FRAME_EVENT,this.onFrameEvent);
         super.leaveState();
      }
      
      private function checkDirection() : int
      {
         if(this._targetPoint.y == this._oldPoint.y)
         {
            if(this._targetPoint.x - this._oldPoint.x)
            {
               return Direction_Left;
            }
         }
         else if(this._targetPoint.x == this._oldPoint.x)
         {
            if(this._targetPoint.y - this._oldPoint.y > 0)
            {
               return Direction_Bottom;
            }
            return Direction_Top;
         }
         return Direction_None;
      }
      
      private function updatePath() : void
      {
         var _loc1_:Number = NaN;
         if(this._isAttacking == true)
         {
            return;
         }
         if(this._direction == Direction_Left)
         {
            _loc1_ = this._targetPoint.x - _gameObject.x;
            if(_loc1_ > 0)
            {
               _gameObject.setLocation(_gameObject.x + this._speed,_gameObject.y);
            }
            else
            {
               this.correctPath();
            }
         }
         else if(this._direction == Direction_Top)
         {
            _loc1_ = _gameObject.y - this._targetPoint.y;
            if(_loc1_ > 0)
            {
               _gameObject.setLocation(_gameObject.x,_gameObject.y - this._speed);
            }
            else
            {
               this.correctPath();
            }
         }
         else if(this._direction == Direction_Bottom)
         {
            _loc1_ = this._targetPoint.y - _gameObject.y;
            if(_loc1_ > 0)
            {
               _gameObject.setLocation(_gameObject.x,_gameObject.y + this._speed);
            }
            else
            {
               this.correctPath();
            }
         }
      }
      
      private function correctPath() : void
      {
         this._targetPoint = this.getNextTargetPoint();
         if(this._targetPoint == null)
         {
            return;
         }
         if(this._direction == Direction_Left)
         {
            if(this._targetPoint.y == _gameObject.y)
            {
               _gameObject.setLocation(_gameObject.x + this._speed,_gameObject.y);
            }
            else
            {
               _gameObject.setLocation(this._targetPoint.x,_gameObject.y);
            }
         }
         else if(this._direction == Direction_Top || this._direction == Direction_Bottom)
         {
            if(this._targetPoint.x == _gameObject.x)
            {
               _gameObject.setLocation(_gameObject.x,_gameObject.y + this._speed);
            }
            else
            {
               _gameObject.setLocation(_gameObject.x,this._targetPoint.y);
            }
         }
         this._oldPoint.x = _gameObject.x;
         this._oldPoint.y = _gameObject.y;
      }
      
      private function getNextTargetPoint() : Point
      {
         var _loc1_:TDPathPointVO = this._attackPath.pathCells.pop();
         if(_loc1_ == null)
         {
            return null;
         }
         return TDGameInfo.getInstance().getZomebiePosByTile(_loc1_.col,_loc1_.row);
      }
      
      private function getZombieInAttackArea() : void
      {
         var _loc5_:BasicZombie = null;
         if(this._isAttacking == true)
         {
            return;
         }
         var _loc1_:Boolean = false;
         var _loc2_:int = TDConstant.TDCamp_Enemy;
         var _loc3_:Boolean = false;
         var _loc4_:Array = TDSearchTargetUtils.getZombieList(_plant,null,true,null,[TDConstant.ZombieCatalog_Boss]);
         this._attackList = new Array();
         for each(_loc5_ in _loc4_)
         {
            if(TDCheckCollision.isCollision(_loc5_,_loc5_.damageArea,_gameObject,_gameObject.attackArea))
            {
               this.playAttack();
               this._attackList.push(_loc5_);
            }
         }
      }
      
      private function runingRoll() : void
      {
         this._direction = this.checkDirection();
         this.getZombieInAttackArea();
         this.playRoll();
         this.updatePath();
         this.checkEnd();
      }
      
      private function checkEnd() : void
      {
         var _loc1_:Array = null;
         var _loc2_:Array = null;
         var _loc3_:Number = NaN;
         var _loc4_:Rectangle = null;
         var _loc5_:BasicZombie = null;
         if(this._targetPoint == null)
         {
            _gameObject.animation.visible = false;
            _gameObject.setAction(TDConstant.PlantAction_FadeOut);
            _loc1_ = TalentManager.instance.getPlantExplodeDetail((_gameObject as BasicPlant).plantData.plantStaticInfo);
            if(_loc1_ != null)
            {
               _loc2_ = TDGameInfo.getInstance().getZombieList(null,TDConstant.TDCamp_Enemy,true,true);
               _loc3_ = _loc1_[0];
               _loc4_ = new Rectangle(_gameObject.x - _loc3_ * 0.5,_gameObject.y - _loc3_ * 0.5,_loc3_,_loc3_);
               for each(_loc5_ in _loc2_)
               {
                  if(_loc4_.intersects(_loc5_.damageArea))
                  {
                     TDDamageCaculete.executeDamage(_loc5_,0 - _loc1_[1],TDConstant.AttackType_Normal,TDConstant.AttackMode_Normal,_gameObject);
                  }
               }
               TDEffectCmd.playBlitAnimation(_loc1_[2],_gameObject.x,_gameObject.y,new TDEffectPlayInfo("animation"));
            }
         }
      }
      
      private function onFrameEvent(param1:FrameEvent) : void
      {
         var _loc2_:BasicZombie = null;
         if(param1.frameLabel == "onHit")
         {
            for each(_loc2_ in this._attackList)
            {
               TDDamageCaculete.executeDamage(_loc2_,int.MIN_VALUE,TDConstant.AttackType_Normal,TDConstant.AttackMode_KillByToyCar,_plant);
            }
            this._isAttacking = false;
         }
         else if(param1.frameLabel == "endReady")
         {
            this._runingFun = this.runingRoll;
         }
      }
      
      private function playLeft() : void
      {
         if(this._lastDirection != Direction_Left)
         {
            _gameObject.animation.gotoAndPlay("attack_1",true);
         }
      }
      
      private function playTop() : void
      {
         if(this._lastDirection != Direction_Top)
         {
            _gameObject.animation.gotoAndPlay("attack_3",true);
         }
      }
      
      private function playButtom() : void
      {
         if(this._lastDirection != Direction_Bottom)
         {
            _gameObject.animation.gotoAndPlay("attack_2",true);
         }
      }
      
      private function playLeftAttack() : void
      {
         _gameObject.animation.gotoAndPlay("attack_1_hit",true);
      }
      
      private function playTopAttack() : void
      {
         _gameObject.animation.gotoAndPlay("attack_3_hit",true);
      }
      
      private function playButtomAttack() : void
      {
         _gameObject.animation.gotoAndPlay("attack_2_hit",true);
      }
      
      private function playRoll() : void
      {
         if(this._isAttacking == true)
         {
            return;
         }
         switch(this._direction)
         {
            case Direction_Top:
               this.playTop();
               break;
            case Direction_Left:
               this.playLeft();
               break;
            case Direction_Bottom:
               this.playButtom();
         }
         this._lastDirection = this._direction;
      }
      
      private function playAttack() : void
      {
         this._isAttacking = true;
         this._lastDirection = Direction_None;
         switch(this._direction)
         {
            case Direction_Top:
               this.playTopAttack();
               break;
            case Direction_Left:
               this.playLeftAttack();
               break;
            case Direction_Bottom:
               this.playButtomAttack();
               break;
            default:
               this._isAttacking = false;
         }
      }
      
      private function playReady() : void
      {
         this._direction = this.checkDirection();
         switch(this._direction)
         {
            case Direction_Top:
               _gameObject.animation.gotoAndPlay("attack_3_ready",true);
               break;
            case Direction_Left:
               _gameObject.animation.gotoAndPlay("attack_ready",true);
               break;
            case Direction_Bottom:
               _gameObject.animation.gotoAndPlay("attack_2_ready",true);
         }
      }
   }
}
