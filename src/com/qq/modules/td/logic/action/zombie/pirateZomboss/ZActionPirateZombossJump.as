package com.qq.modules.td.logic.action.zombie.pirateZomboss
{
   import com.qq.CommandName;
   import com.qq.modules.td.command.game.TDGameObjectCmd;
   import com.qq.modules.td.logic.action.zombie.BasicZombieAction;
   import com.qq.modules.td.logic.unit.zombie.PirateZomboss;
   import com.qq.modules.td.model.TDGameInfo;
   import com.qq.utils.CommandDispatcher;
   import flash.events.Event;
   import flash.geom.Point;
   import net.sakri.flash.math.MathUtil;
   
   public class ZActionPirateZombossJump extends BasicZombieAction
   {
       
      
      private var _isMoving:Boolean;
      
      private var _moveSpeed:int = 10;
      
      private var _targetRow:int;
      
      private var _targetCol:int;
      
      private var _targetPt:Point;
      
      private var _curPt:Point;
      
      public function ZActionPirateZombossJump()
      {
         super();
      }
      
      override public function enterState(param1:Array = null) : void
      {
         super.enterState(param1);
         this._curPt = new Point();
         _gameObject.setFrozenAI(true);
         _gameObject.animation.addEventListener(Event.COMPLETE,this.onFinishPortalStart);
         _gameObject.animation.gotoAndPlay("jump_start");
      }
      
      private function onFinishPortalStart(param1:Event) : void
      {
         _gameObject.animation.removeEventListener(Event.COMPLETE,this.onFinishPortalStart);
         this._isMoving = true;
         this._targetRow = MathUtil.getRandomIntInRange(1,4);
         this._targetCol = MathUtil.getRandomIntInRange(0,1);
         this._targetPt = TDGameInfo.getInstance().getZomebiePosByTile(this._targetCol,this._targetRow);
         _gameObject.animation.gotoAndPlay("jump_mid");
      }
      
      private function onJumpLand(param1:Event) : void
      {
         _gameObject.animation.gotoAndPlay("jump_land");
         CommandDispatcher.send(CommandName.TD_ForceSortDepth);
      }
      
      override public function runningState() : void
      {
         var _loc1_:int = 0;
         var _loc2_:Number = NaN;
         var _loc3_:Point = null;
         super.runningState();
         if(this._isMoving)
         {
            if(this._curPt.equals(this._targetPt))
            {
               this._isMoving = false;
               _gameObject.animation.gotoAndPlay("jump_land");
               _gameObject.animation.addEventListener(Event.COMPLETE,this.onJumpComplete);
               this.doHit();
            }
            else
            {
               this._curPt.x = _zombie.x;
               this._curPt.y = _zombie.y;
               _loc1_ = Point.distance(this._targetPt,this._curPt);
               _loc2_ = this._moveSpeed > _loc1_ ? Number(1) : Number(this._moveSpeed / _loc1_);
               _loc3_ = Point.interpolate(this._targetPt,this._curPt,_loc2_);
               _zombie.setLocation(_loc3_.x,_loc3_.y);
               _zombie.objectModel.roadIndex = TDGameInfo.getInstance().getRoadIndex(_zombie.y);
            }
         }
      }
      
      private function doHit() : void
      {
         var _loc2_:Array = null;
         var _loc1_:Array = this.zomboss.coverTileArr;
         for each(_loc2_ in _loc1_)
         {
            TDGameObjectCmd.destoryObjByTile(_loc2_[0],_loc2_[1]);
         }
      }
      
      private function onJumpComplete(param1:Event) : void
      {
         _gameObject.animation.removeEventListener(Event.COMPLETE,this.onJumpComplete);
         _gameObject.setAction();
         _gameObject.setFrozenAI(false);
      }
      
      override public function leaveState() : void
      {
         super.leaveState();
         _gameObject.setAction();
         _gameObject.setFrozenAI(false);
         _gameObject.animation.removeEventListener(Event.COMPLETE,this.onFinishPortalStart);
         _gameObject.animation.removeEventListener(Event.COMPLETE,this.onJumpComplete);
      }
      
      private function get zomboss() : PirateZomboss
      {
         return _zombie as PirateZomboss;
      }
   }
}
