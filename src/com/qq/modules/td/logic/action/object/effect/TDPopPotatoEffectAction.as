package com.qq.modules.td.logic.action.object.effect
{
   import com.qq.constant.td.TDConstant;
   import com.qq.modules.td.command.game.TDGameObjectCmd;
   import com.qq.modules.td.data.map.TDMapTileData;
   import com.qq.modules.td.logic.action.basic.BasicAction;
   import com.qq.modules.td.model.TDGameInfo;
   import com.qq.utils.Bezier;
   import flash.geom.Point;
   import org.as3commons.logging.api.getLogger;
   
   public class TDPopPotatoEffectAction extends BasicAction
   {
      
      private static const POTATO_ID:uint = 1500;
       
      
      private var _targetTile:TDMapTileData;
      
      private var _bezier:Bezier;
      
      private var _crtStep:int;
      
      private var _step:int;
      
      private var _count:int;
      
      protected var _isFinish:Boolean;
      
      public function TDPopPotatoEffectAction()
      {
         super();
      }
      
      override public function enterState(param1:Array = null) : void
      {
         super.enterState(param1);
         this._targetTile = _gameObject.getRunningProp(TDConstant.Gameobject_Prop_PotatoObj);
         var _loc2_:Point = new Point();
         _loc2_.x = this._targetTile.rect.x + this._targetTile.rect.width / 2;
         _loc2_.y = this._targetTile.rect.y + this._targetTile.rect.height / 2;
         var _loc3_:Point = new Point(_gameObject.x,_gameObject.y);
         var _loc4_:int = _gameObject.x + (_loc2_.x - _gameObject.x) * 0.5;
         var _loc5_:TDMapTileData = TDGameInfo.getInstance().getRoadTileInf(0,1);
         var _loc6_:int = Math.min(_loc2_.y,_loc3_.y) - Math.max(300,400 * Math.abs(_loc3_.x - _loc2_.x) / (_loc5_.rect.width * 10));
         var _loc7_:Point = new Point(_loc4_,_loc6_);
         var _loc8_:Point = new Point(_loc2_.x,_loc2_.y);
         var _loc9_:int = Math.max(10,20 * Math.abs(_loc3_.x - _loc2_.x) / (_loc5_.rect.width * 10));
         this._bezier = new Bezier();
         this._bezier.init(_loc3_,_loc7_,_loc8_,_loc9_);
         if(_loc3_.x == _loc8_.x)
         {
            getLogger("potato").debug("两点X坐标相等");
         }
         this._crtStep = 0;
         this._step = 1;
         this._count = 0;
         this._isFinish = false;
      }
      
      override public function runningState() : void
      {
         super.runningState();
         if(this._isFinish)
         {
            return;
         }
         var _loc1_:Array = this._bezier.getAnchorPoint(this._crtStep);
         if(_loc1_.length > 0)
         {
            _gameObject.x = _loc1_[0];
            _gameObject.y = _loc1_[1];
            _gameObject.rotation = _loc1_[2];
            if(_gameObject.rotation > 0 && _gameObject.rotation <= 180)
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
            this.onFinish();
            _gameObject.dispose();
         }
      }
      
      private function onFinish() : void
      {
         TDGameObjectCmd.addPlant(POTATO_ID,this._targetTile,false,null,true);
      }
      
      override public function dispose() : void
      {
         this._targetTile = null;
         this._bezier = null;
         super.dispose();
      }
   }
}
