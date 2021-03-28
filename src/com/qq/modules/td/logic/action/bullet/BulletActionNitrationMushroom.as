package com.qq.modules.td.logic.action.bullet
{
   import com.qq.modules.td.data.game.unit.basic.TDGameObjectData;
   import com.qq.modules.td.data.map.TDMapTileData;
   import com.qq.modules.td.logic.bt_ai.aiUtils.TDSearchTargetUtils;
   import com.qq.modules.td.logic.numeric.TDDamageCaculete;
   import com.qq.modules.td.logic.unit.basic.IGameObject;
   import com.qq.modules.td.model.TDGameInfo;
   import flash.events.Event;
   import flash.geom.Rectangle;
   
   public class BulletActionNitrationMushroom extends BasicBulletActionRunning
   {
       
      
      private const STATE_APPEAR:int = 1;
      
      private const STATE_WALK:int = 2;
      
      private const STATE_EXPLODE:int = 3;
      
      private var _startTile:TDMapTileData;
      
      private var _bulletState:int;
      
      private var _speed:int;
      
      private var _bulletInvalid:Boolean;
      
      private var _offsetX:Number;
      
      public function BulletActionNitrationMushroom()
      {
         super();
      }
      
      override public function enterState(param1:Array = null) : void
      {
         var _loc2_:int = _bullet.params[0];
         this._offsetX = _bullet.params[1];
         this._startTile = TDGameInfo.getInstance().getRoadTileByIndex(_loc2_);
         this._speed = _bullet.bulletData.getSpeed(TDGameObjectData.SPEED_BULLET);
         super.enterState(param1);
         _bullet.animation.addEventListener(Event.COMPLETE,this.onFinishAppear);
         _bullet.animation.gotoAndPlay("appear");
         this._bulletState = this.STATE_APPEAR;
      }
      
      private function onFinishAppear(param1:Event) : void
      {
         _bullet.animation.removeEventListener(Event.COMPLETE,this.onFinishAppear);
         _bullet.animation.gotoAndPlay("walk",true);
         this._bulletState = this.STATE_WALK;
      }
      
      private function onFinishExplode(param1:Event) : void
      {
         _bullet.animation.removeEventListener(Event.COMPLETE,this.onFinishExplode);
         _bullet.Dispose();
      }
      
      override public function dispose() : void
      {
         _bullet.animation.removeEventListener(Event.COMPLETE,this.onFinishAppear);
         _bullet.animation.removeEventListener(Event.COMPLETE,this.onFinishExplode);
         _shooter = null;
         this._bulletInvalid = false;
         super.dispose();
      }
      
      override protected function initBulletState() : void
      {
         super.initBulletState();
         _bullet.setLocation(this._startTile.rect.x + this._startTile.rect.width * 0.75 + this._offsetX,this._startTile.rect.y + this._startTile.rect.height * 0.65);
      }
      
      override protected function updateBulletPos() : void
      {
         if(this._bulletState == this.STATE_WALK && _bullet)
         {
            _bullet.setLocation(_bullet.x + this._speed * 0.033,_bullet.y);
         }
         super.updateBulletPos();
      }
      
      override protected function updateBulletState() : void
      {
         var _loc1_:IGameObject = null;
         var _loc2_:Array = null;
         var _loc3_:TDMapTileData = null;
         var _loc4_:IGameObject = null;
         var _loc5_:IGameObject = null;
         var _loc6_:TDMapTileData = null;
         if(_bullet && !this._bulletInvalid)
         {
            _loc1_ = this.getFireTarget();
            if(_loc1_ != null)
            {
               this._bulletState = this.STATE_EXPLODE;
               _bullet.animation.addEventListener(Event.COMPLETE,this.onFinishExplode);
               _bullet.animation.gotoAndPlay("explod");
               _loc2_ = [];
               _loc3_ = TDGameInfo.getInstance().getRoadTileByGamePos(_loc1_.x,_loc1_.y);
               if(_loc3_)
               {
                  for each(_loc5_ in TDGameInfo.getInstance().getZombieList([this._startTile.roadIndex],0,true,true))
                  {
                     if((_loc6_ = TDGameInfo.getInstance().getRoadTileByGamePos(_loc5_.x,_loc5_.y)) && _loc6_.index == _loc3_.index)
                     {
                        _loc2_.push(_loc5_);
                     }
                  }
               }
               else
               {
                  _loc2_.push(_loc1_);
                  for each(_loc5_ in TDGameInfo.getInstance().getZombieList([this._startTile.roadIndex],0,true,true))
                  {
                     if(_loc5_.uid != _loc1_.uid && Math.abs(_loc5_.x - _loc1_.x) < this._startTile.rect.width)
                     {
                        _loc2_.push(_loc5_);
                     }
                  }
               }
               for each(_loc4_ in _loc2_)
               {
                  TDDamageCaculete.caculateBulletDamage(_bullet,_loc4_);
               }
               this._bulletInvalid = true;
            }
         }
      }
      
      override protected function getFireTarget() : IGameObject
      {
         var _loc1_:Vector.<IGameObject> = TDSearchTargetUtils.searchTargetForBullet(_bullet,[new Rectangle(_bullet.x - 20,_bullet.y,_bullet.contentW,_bullet.contentH)],[this._startTile.roadIndex]);
         if(_loc1_.length > 0)
         {
            return _loc1_[0];
         }
         return null;
      }
   }
}
