package com.qq.modules.td.logic.action.zombie.pirateZomboss
{
   import com.qq.constant.td.TDConstant;
   import com.qq.modules.td.command.game.TDGameObjectCmd;
   import com.qq.modules.td.data.game.unit.basic.TDGameObjectData;
   import com.qq.modules.td.logic.action.zombie.basic.ZombieActionWalkVertical;
   import com.qq.modules.td.logic.unit.zombie.PirateZomboss;
   import com.qq.modules.td.model.TDGameInfo;
   import flash.geom.Point;
   import net.sakri.flash.math.MathUtil;
   
   public class ZActionPirateZombossWalkUpDown extends ZombieActionWalkVertical
   {
       
      
      private var _isUp:Boolean;
      
      private var _targetRow:int;
      
      public function ZActionPirateZombossWalkUpDown()
      {
         super();
      }
      
      override public function enterState(param1:Array = null) : void
      {
         _speedType = TDGameObjectData.SPEED_WALK;
         if(_zombie.objectModel.roadIndex <= TDGameInfo.getInstance().minRow)
         {
            this._isUp = false;
         }
         else if(_zombie.objectModel.roadIndex >= TDGameInfo.getInstance().maxRow - 1)
         {
            this._isUp = true;
         }
         else
         {
            this._isUp = Math.random() < 0.5;
         }
         if(this._isUp)
         {
            _walkAnimFlagName = TDConstant.ZombieAnmi_WalkUp;
            this._targetRow = MathUtil.getRandomIntInRange(TDGameInfo.getInstance().minRow,Math.max(TDGameInfo.getInstance().minRow,_zombie.zombieData.roadIndex - 1));
         }
         else
         {
            _walkAnimFlagName = TDConstant.ZombieAnmi_WalkDown;
            this._targetRow = MathUtil.getRandomIntInRange(Math.min(_zombie.zombieData.roadIndex + 1,TDGameInfo.getInstance().maxRow - 1),TDGameInfo.getInstance().maxRow - 1);
         }
         super.enterState(param1);
         _zombie.setFrozenAI(true);
         target = this.getNextWalkTarget();
      }
      
      override public function runningState() : void
      {
         super.runningState();
         this.doHit();
         if(this.getNextWalkTarget().equals(new Point(_zombie.x,_zombie.y)))
         {
            _zombie.setFrozenAI(false);
            _zombie.setAction();
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
      
      override protected function getNextWalkTarget() : Point
      {
         var _loc1_:Point = TDGameInfo.getInstance().getZomebiePosByTile(TDGameInfo.getInstance().minCol,this._targetRow);
         _loc1_.x = _zombie.x;
         return _loc1_;
      }
      
      override protected function get endPoint() : Point
      {
         var _loc1_:Point = TDGameInfo.getInstance().getZomebiePosByTile(TDGameInfo.getInstance().minCol,this._targetRow);
         _loc1_.x = _zombie.x;
         return _loc1_;
      }
      
      private function get zomboss() : PirateZomboss
      {
         return _zombie as PirateZomboss;
      }
   }
}
