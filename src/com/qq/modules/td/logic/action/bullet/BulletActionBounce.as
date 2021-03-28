package com.qq.modules.td.logic.action.bullet
{
   import com.qq.constant.td.TDConstant;
   import com.qq.modules.td.data.map.TDMapTileData;
   import com.qq.modules.td.model.TDGameInfo;
   
   public class BulletActionBounce extends BasicBulletAction
   {
       
      
      protected var _lastUpdateTime:Number = 0.0;
      
      private var _angel:Number;
      
      private var _speed:Number;
      
      private var _direction:int;
      
      public function BulletActionBounce()
      {
         super();
      }
      
      override public function enterState(param1:Array = null) : void
      {
         super.enterState(null);
         this._angel = 45 * Math.PI / 180;
         this._speed = _bullet.bulletData.bulletStaticInfo.moveSpeed;
         var _loc2_:TDMapTileData = TDGameInfo.getInstance().getRoadTileByGamePos(_bullet.x,_bullet.y);
         this._direction = Math.random() > 0.5 ? -1 : 1;
         if(_loc2_)
         {
            if(_loc2_.roadRow < TDGameInfo.getInstance().minRow + 0.5 * (TDGameInfo.getInstance().maxRow - TDGameInfo.getInstance().minRow))
            {
               this._direction = -1;
            }
            else if(_loc2_.roadRow > TDGameInfo.getInstance().minRow + 0.5 * (TDGameInfo.getInstance().maxRow - TDGameInfo.getInstance().minRow))
            {
               this._direction = 1;
            }
         }
         this._lastUpdateTime = TDGameInfo.getInstance().getCurGameTime();
      }
      
      override public function runningState() : void
      {
         var _loc1_:Number = TDGameInfo.getInstance().getCurGameTime();
         var _loc2_:Number = (_loc1_ - this._lastUpdateTime) * 0.001;
         this._lastUpdateTime = _loc1_;
         var _loc3_:Number = this._speed * _loc2_;
         var _loc4_:Number = _loc3_ * 0.707;
         var _loc5_:Number = _loc3_ * 0.707;
         _bullet.setLocation(_bullet.x + _loc4_,_bullet.y + this._direction * _loc5_);
         if(!TDGameInfo.getInstance().isInScreen(_bullet.x,_bullet.y))
         {
            _bullet.setAction(TDConstant.BAction_Disappear);
         }
         super.runningState();
      }
   }
}
