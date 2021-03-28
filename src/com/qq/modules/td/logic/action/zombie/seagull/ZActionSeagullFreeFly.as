package com.qq.modules.td.logic.action.zombie.seagull
{
   import com.qq.constant.td.TDConstant;
   import com.qq.modules.td.logic.action.zombie.basic.ZombieActionWalk;
   import com.qq.modules.td.model.TDGameInfo;
   import com.qq.modules.td.model.vo.TDPathPointVO;
   import flash.geom.Point;
   
   public class ZActionSeagullFreeFly extends ZombieActionWalk
   {
       
      
      private var _targetPt:TDPathPointVO;
      
      public function ZActionSeagullFreeFly()
      {
         super();
      }
      
      override public function leaveState() : void
      {
         super.leaveState();
      }
      
      override public function dispose() : void
      {
         super.dispose();
      }
      
      override protected function move(param1:Number) : void
      {
         var _loc2_:Point = null;
         var _loc3_:Number = NaN;
         var _loc4_:int = 0;
         while(param1 > 0)
         {
            if(this._targetPt == null)
            {
               this._targetPt = this.getNextTargetPt();
               if(this._targetPt == null)
               {
                  _zombie.Dispose();
                  return;
               }
               _zombie.setLocation(this._targetPt.x,this._targetPt.y);
               if(this._targetPt.speed != 0)
               {
                  _zombie.setRunningProp(TDConstant.GameObject_Prop_ChangeMoveSpeed,1);
               }
            }
            _loc2_ = new Point(_zombie.x,_zombie.y);
            if(this._targetPt)
            {
               _loc3_ = Point.distance(this._targetPt.getPoint(),_loc2_);
            }
            if(_loc3_ > param1)
            {
               _loc2_ = Point.interpolate(this._targetPt.getPoint(),_loc2_,param1 / _loc3_);
               if(int(_zombie.y) != int(_loc2_.y))
               {
                  _loc4_ = TDGameInfo.getInstance().getRoadIndex(_loc2_.y);
                  _zombie.zombieData.roadIndex = _loc4_;
               }
            }
            continue;
            _zombie.setLocation(_loc2_.x,_loc2_.y);
            _zombie.setLocation(this._targetPt.row,this._targetPt.col);
            param1 -= _loc3_;
            this._targetPt = this.getNextTargetPt();
            if(this._targetPt && this._targetPt.speed != 0)
            {
               _zombie.setRunningProp(TDConstant.GameObject_Prop_ChangeMoveSpeed,1);
            }
            break;
         }
      }
      
      private function getNextTargetPt() : TDPathPointVO
      {
         return _zombie.zombieData.getNextTarget();
      }
      
      override protected function getMoveSpeed() : Number
      {
         if(this._targetPt && this._targetPt.speed != 0)
         {
            return this._targetPt.speed;
         }
         if(_moveSpeed != 0)
         {
            return _moveSpeed;
         }
         return _zombie.model.getSpeed(_speedType);
      }
   }
}
