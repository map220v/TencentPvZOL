package com.qq.modules.td.logic.action.zombie.basic
{
   import com.qq.constant.td.TDConstant;
   import com.qq.modules.td.command.effects.TDEffectCmd;
   import com.qq.modules.td.data.map.TDMapTileData;
   import com.qq.modules.td.logic.action.zombie.BasicZombieAction;
   import com.qq.modules.td.logic.unit.basic.IGameObject;
   import com.qq.modules.td.logic.unit.zombie.BarrelRollerZombie;
   import com.qq.modules.td.model.TDGameInfo;
   import com.qq.modules.td.view.game.layer.floor.TDFloorManager;
   import com.qq.utils.Bezier;
   import flash.geom.Point;
   
   public class ZombieActionKickedOut extends BasicZombieAction
   {
       
      
      private var _targetPt:Point;
      
      private var _bezier:Bezier;
      
      private var _crtStep:int;
      
      private var _step:int;
      
      private var _count:int;
      
      private var _isFinish:Boolean;
      
      private var _speed:int = 5;
      
      public function ZombieActionKickedOut()
      {
         super();
      }
      
      override public function enterState(param1:Array = null) : void
      {
         super.enterState(param1);
         this._targetPt = param1[0];
         _zombie.setFrozenAI(true);
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
            else
            {
               _zombie.setAction();
               _zombie.setFrozenAI(false);
            }
         }
         else
         {
            _loc2_ = this._bezier.getAnchorPoint(this._crtStep);
            if(_loc2_.length > 0)
            {
               _zombie.setLocation(_loc2_[0],_loc2_[1]);
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
         var _loc1_:Point = new Point(_zombie.x,_zombie.y);
         var _loc2_:int = _loc1_.x + (this._targetPt.x - _loc1_.x) * 0.5;
         var _loc3_:int = _loc1_.y + Math.min(-100,(this._targetPt.y - _loc1_.y) * 0.5);
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
         var _loc1_:IGameObject = null;
         if(_zombie == null || !_zombie.isVaild)
         {
            return;
         }
         _zombie.lootItem();
         if(_zombie.zombieData.zombiestaticInfo.type == TDConstant.ZombieType_BarrelRoller)
         {
            _loc1_ = (_zombie as BarrelRollerZombie).barrel;
            if(_loc1_ && _loc1_.objectModel.curHp.get() > 0)
            {
               _loc1_.setRunningProp(TDConstant.Gameobject_Prop_Die_Popup_Zombie,false);
               _loc1_.Dispose();
            }
         }
         _zombie.setAction(TDConstant.ZAction_Disappear,null,true);
      }
   }
}
