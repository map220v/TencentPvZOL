package com.qq.modules.td.logic.action.object.basic
{
   import com.qq.constant.td.TDConstant;
   import com.qq.modules.td.command.effects.TDEffectCmd;
   import com.qq.modules.td.data.map.TDMapTileData;
   import com.qq.modules.td.logic.action.basic.BasicAction;
   import com.qq.modules.td.model.TDGameInfo;
   import com.qq.modules.td.view.game.layer.floor.TDFloorManager;
   import com.qq.utils.Bezier;
   import flash.geom.Point;
   
   public class ObjectActionBeThrew extends BasicAction
   {
       
      
      private var _targetPt:Point;
      
      private var _bezier:Bezier;
      
      private var _crtStep:int;
      
      private var _step:int;
      
      private var _count:int;
      
      private var _isFinish:Boolean;
      
      private var _speed:int = 10;
      
      public function ObjectActionBeThrew()
      {
         super();
      }
      
      override public function enterState(param1:Array = null) : void
      {
         super.enterState(param1);
         this._targetPt = param1[0];
         this.initBezier();
      }
      
      override public function runningState() : void
      {
         var _loc1_:TDMapTileData = null;
         var _loc2_:Array = null;
         super.runningState();
         if(this._isFinish)
         {
            _loc1_ = TDGameInfo.getInstance().getRoadTileByGamePos(this._targetPt.x,this._targetPt.y);
            if(_loc1_ && TDFloorManager.instance.hasWaterAt(_loc1_.roadRow,_loc1_.roadCol))
            {
               TDEffectCmd.showWaterSplash(this._targetPt.x,this._targetPt.y,false);
               this.onFinishDisappear();
            }
            else if(_gameObject.objectModel.staticInfo.hasParam(TDConstant.NormalObj_Param_SpecialActionName))
            {
               _gameObject.setAction(_gameObject.objectModel.staticInfo.getParamStr(TDConstant.NormalObj_Param_SpecialActionName));
            }
            else
            {
               this.onFinishDisappear();
            }
         }
         else
         {
            _loc2_ = this._bezier.getAnchorPoint(this._crtStep);
            if(_loc2_.length > 0)
            {
               _gameObject.setLocation(_loc2_[0],_loc2_[1]);
               this._crtStep += this._step;
            }
            else
            {
               this._isFinish = true;
            }
         }
      }
      
      override public function leaveState() : void
      {
         super.leaveState();
      }
      
      private function initBezier() : void
      {
         var _loc1_:Point = new Point(_gameObject.x,_gameObject.y);
         var _loc2_:int = _loc1_.x + (this._targetPt.x - _loc1_.x) * 0.5;
         var _loc3_:int = this._targetPt.y - Math.max(100,0.5 * Math.abs(_loc1_.x - this._targetPt.x));
         var _loc4_:Point = new Point(_loc2_,_loc3_);
         this._bezier = new Bezier();
         this._bezier.init(_loc1_,_loc4_,this._targetPt,this._speed);
         this._crtStep = 0;
         this._step = 1;
         this._count = 0;
         this._isFinish = false;
      }
      
      private function onFinishDisappear() : void
      {
         _gameObject.dispose();
      }
   }
}
