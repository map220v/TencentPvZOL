package com.qq.modules.td.logic.action.bullet
{
   import com.qq.modules.td.data.map.TDMapTileData;
   import com.qq.modules.td.logic.numeric.TDCheckCollision;
   import com.qq.modules.td.logic.unit.basic.IGameObject;
   import com.qq.modules.td.model.TDGameInfo;
   import com.qq.utils.Bezier;
   import flash.geom.Point;
   
   public class BulletActionRocket extends BasicBulletActionRunning
   {
       
      
      private var _bezier:Bezier;
      
      private var _crtStep:int;
      
      private var _step:int;
      
      private var _count:int;
      
      protected var _isFinish:Boolean;
      
      public function BulletActionRocket()
      {
         super();
      }
      
      override protected function initBulletState() : void
      {
         super.initBulletState();
         this.initBezier();
      }
      
      private function initBezier() : void
      {
         var _loc1_:IGameObject = _bullet.shooter;
         var _loc2_:IGameObject = _bullet.target;
         var _loc3_:Point = new Point(_bullet.x,_bullet.y);
         var _loc4_:int = _loc1_.x + (_loc2_.x - _loc1_.x) * 0.5;
         var _loc5_:TDMapTileData = TDGameInfo.getInstance().getRoadTileInf(0,1);
         var _loc6_:int = _loc2_.y - Math.max(100,400 * Math.abs(_loc3_.x - _loc2_.x) / (_loc5_.rect.width * 10));
         var _loc7_:Point = new Point(_loc4_,_loc6_);
         var _loc8_:Point = new Point(_loc2_.x,_loc2_.y);
         var _loc9_:int = Math.max(10,20 * Math.abs(_loc3_.x - _loc2_.x) / (_loc5_.rect.width * 10));
         this._bezier = new Bezier();
         this._bezier.init(_loc3_,_loc7_,_loc8_,_loc9_);
         this._crtStep = 0;
         this._step = 1;
         this._count = 0;
         this._isFinish = false;
         if(TDCheckCollision.isCollision(_gameObject,_gameObject.damageArea,_bullet.target,_bullet.target.damageArea))
         {
            this._isFinish = true;
         }
      }
      
      override protected function updateBulletPos() : void
      {
         super.updateBulletPos();
         var _loc1_:Array = this._bezier.getAnchorPoint(this._crtStep);
         if(_loc1_.length > 0)
         {
            _bullet.x = _loc1_[0];
            _bullet.y = _loc1_[1];
            _bullet.rotation = _loc1_[2];
            if(_bullet.rotation > 0 && _bullet.rotation <= 180)
            {
               ++this._count;
               if(this._count > 15)
               {
                  this._count = 0;
                  ++this._step;
               }
            }
            this._crtStep += this._step;
         }
         else
         {
            this._isFinish = true;
         }
      }
      
      override protected function updateBulletState() : void
      {
         super.updateBulletState();
         if(this._isFinish)
         {
            doBulletBoom(_bullet.target);
         }
      }
   }
}
