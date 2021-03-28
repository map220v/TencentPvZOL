package com.qq.modules.td.logic.action.object.effect
{
   import com.qq.CommandName;
   import com.qq.constant.td.TDConstant;
   import com.qq.modules.td.command.effects.TDEffectCmd;
   import com.qq.modules.td.command.game.TDGameObjectCmd;
   import com.qq.modules.td.logic.TDFactory;
   import com.qq.modules.td.logic.action.basic.BasicAction;
   import com.qq.modules.td.logic.unit.basic.IGameObject;
   import com.qq.modules.td.logic.unit.zombie.BasicZombie;
   import com.qq.modules.td.model.TDGameInfo;
   import com.qq.modules.td.model.vo.TDUnitInitVO;
   import com.qq.modules.td.view.game.layer.floor.TDFloorManager;
   import com.qq.utils.CommandDispatcher;
   import com.qq.utils.DMath;
   import flash.geom.Point;
   
   public class TDPopObjectEffectAction extends BasicAction
   {
       
      
      private var _lastTime:Number;
      
      private var _speedX:Number;
      
      private var _speedY:Number;
      
      private var _assY:Number;
      
      private var _summonObject:IGameObject;
      
      private var _targetCol:int;
      
      private var _targetRow:int;
      
      private var _targetPoint:Point;
      
      private var _direction:int;
      
      public function TDPopObjectEffectAction()
      {
         super();
      }
      
      override public function enterState(param1:Array = null) : void
      {
         var _loc7_:TDUnitInitVO = null;
         super.enterState(param1);
         this._lastTime = TDGameInfo.getInstance().getCurGameTime();
         var _loc2_:int = _gameObject.getRunningProp(TDConstant.Gameobject_Prop_SummonZombie_Type);
         this._targetCol = _gameObject.getRunningProp(TDConstant.Gameobject_Prop_SummonZombie_col);
         this._targetRow = _gameObject.getRunningProp(TDConstant.Gameobject_Prop_SummonZombie_row);
         this._targetPoint = TDGameInfo.getInstance().getZomebiePosByTile(this._targetCol,this._targetRow);
         var _loc3_:IGameObject = _gameObject.getRunningProp(TDConstant.Gameobject_Prop_TargetZombie);
         if(_loc3_ == null)
         {
            (_loc7_ = new TDUnitInitVO()).init(TDConstant.UnitCatalog_Zombie,_loc2_);
            _loc7_.setPosByCoord(_gameObject.x,_gameObject.y);
            TDGameObjectCmd.addGameObjectByTDUnitInitVO(_loc7_);
            _loc3_ = TDGameInfo.getInstance().getGameObjctByUID(TDFactory.getLastUnitUin());
         }
         this._summonObject = _loc3_;
         this._summonObject.setShadeVisible(false);
         this._summonObject.setFrozenAI(true);
         this._summonObject.objectModel.addBuff(TDConstant.TDBuffID_God,this._summonObject);
         this._summonObject.setLocation(_gameObject.x,_gameObject.y);
         this._summonObject.setAction(TDConstant.ZAction_Carried);
         if(this._targetPoint.x < _gameObject.x)
         {
            this._direction = -1;
         }
         else
         {
            this._direction = 1;
         }
         var _loc4_:Number = 1.2;
         var _loc5_:int = 180;
         var _loc6_:int;
         if((_loc6_ = DMath.getDistance(_gameObject.x,_gameObject.y,this._targetPoint.x,_gameObject.y)) < 20)
         {
            _loc4_ = 0.2;
            _loc6_ = 20;
            _loc5_ = 80;
         }
         this._assY = -2 * _loc5_ / (_loc4_ * 0.5 * (_loc4_ * 0.5));
         this._speedX = _loc6_ / _loc4_ * this._direction;
         this._speedY = -this._assY * _loc4_ * 0.5;
      }
      
      override public function runningState() : void
      {
         super.runningState();
         var _loc1_:Number = TDGameInfo.getInstance().getCurGameTime();
         var _loc2_:Number = (_loc1_ - this._lastTime) * 0.001;
         this._lastTime = _loc1_;
         this._speedY += this._assY * _loc2_;
         var _loc3_:Number = _gameObject.y - this._speedY * _loc2_;
         _gameObject.setLocation(_gameObject.x + this._speedX * _loc2_,_loc3_);
         this._summonObject.setLocation(_gameObject.x,_gameObject.y);
         if(this._direction == -1 && this._summonObject.x <= this._targetPoint.x)
         {
            _gameObject.dispose();
         }
         if(this._direction == 1 && this._summonObject.x >= this._targetPoint.x)
         {
            _gameObject.dispose();
         }
      }
      
      override public function leaveState() : void
      {
         if(TDFloorManager.instance.hasWaterAt(this._targetRow,this._targetCol))
         {
            this._summonObject.Dispose();
            TDEffectCmd.showWaterSplash(this._targetPoint.x,this._targetPoint.y);
         }
         else
         {
            this._summonObject.objectModel.removeBuff(TDConstant.TDBuffID_God);
            this._summonObject.setLocation(this._targetPoint.x,this._targetPoint.y);
            if(this._summonObject is BasicZombie)
            {
               (this._summonObject as BasicZombie).zombieData.path = null;
            }
            this._summonObject.objectModel.roadIndex = TDGameInfo.getInstance().getRoadIndex(this._targetPoint.y);
            this._summonObject.setFrozenAI(false);
            this._summonObject.setShadeVisible(true);
         }
         CommandDispatcher.send(CommandName.TD_ForceSortDepth);
         super.leaveState();
      }
      
      override public function dispose() : void
      {
         this._summonObject = null;
         super.dispose();
      }
   }
}
