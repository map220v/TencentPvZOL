package com.qq.modules.td.logic.action.object.other
{
   import com.qq.constant.td.TDConstant;
   import com.qq.modules.td.data.map.TDMapTileData;
   import com.qq.modules.td.logic.action.basic.BasicAction;
   import com.qq.modules.td.logic.unit.basic.IGameObject;
   import com.qq.modules.td.model.TDGameInfo;
   
   public class GroundFirePlayAction extends BasicAction
   {
       
      
      private var _existingTime:int;
      
      private var _attackDamage:int;
      
      private var _attackInterval:int;
      
      private var _enterTime:int;
      
      private var _lastTime:int;
      
      private var _tile:TDMapTileData;
      
      public function GroundFirePlayAction()
      {
         super();
      }
      
      override public function enterState(param1:Array = null) : void
      {
         super.enterState(param1);
         this._attackDamage = _gameObject.objectModel.staticInfo.getParam(TDConstant.NormalObj_Param_AttackDamage);
         this._attackInterval = _gameObject.objectModel.staticInfo.getParam(TDConstant.NormalObj_Param_AttackInteral);
         this._existingTime = _gameObject.objectModel.staticInfo.getParam(TDConstant.NormalObj_Param_ExistTime);
         _gameObject.animation.gotoAndPlay(TDConstant.ObjectAnmi_Idle,true);
         this._tile = TDGameInfo.getInstance().getRoadTileByGamePos(_gameObject.x,_gameObject.y);
         this._enterTime = TDGameInfo.getInstance().getCurGameTime();
      }
      
      override public function leaveState() : void
      {
         super.leaveState();
      }
      
      override public function runningState() : void
      {
         var _loc2_:Array = null;
         var _loc3_:IGameObject = null;
         super.runningState();
         if(_gameObject.objectModel.hasBuffByType(TDConstant.TDBuffType_Wet))
         {
            _gameObject.Dispose();
         }
         var _loc1_:int = TDGameInfo.getInstance().getCurGameTime();
         if(_loc1_ > this._enterTime + this._existingTime)
         {
            _gameObject.Dispose();
         }
         else if(_loc1_ >= this._lastTime + this._attackInterval)
         {
            this._lastTime = _loc1_;
            _loc2_ = this.getPlantTarget();
            if(_loc2_.length > 0)
            {
               for each(_loc3_ in _loc2_)
               {
                  _loc3_.changeHp(-this._attackDamage,TDConstant.AttackType_Normal,TDConstant.AttackMode_Normal,_gameObject);
               }
            }
         }
      }
      
      private function getPlantTarget() : Array
      {
         return TDGameInfo.getInstance().getPlantByTileIndex(this._tile.index);
      }
   }
}
