package com.qq.modules.td.logic.action.zombie.pirateZomboss
{
   import com.qq.constant.td.TDConstant;
   import com.qq.modules.td.command.game.TDGameObjectCmd;
   import com.qq.modules.td.data.game.unit.basic.TDGameObjectData;
   import com.qq.modules.td.logic.action.zombie.basic.ZombieActionWalk;
   import com.qq.modules.td.logic.unit.zombie.PirateZomboss;
   import com.qq.modules.td.model.TDGameInfo;
   import com.qq.utils.UtilsManager;
   import flash.geom.Point;
   
   public class ZActionPirateZombossCrash extends ZombieActionWalk
   {
       
      
      public function ZActionPirateZombossCrash()
      {
         super();
         _walkAnimFlagName = "walk_forward";
         _speedType = TDGameObjectData.SPEED_RUN;
      }
      
      override public function enterState(param1:Array = null) : void
      {
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
            _zombie.setAction(TDConstant.ZAction_PirateZomboss_Stun);
         }
         UtilsManager.bringToTop(_zombie);
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
         return TDGameInfo.getInstance().getZomebiePosByTile(TDGameInfo.getInstance().maxCol - 1,_zombie.objectModel.roadIndex);
      }
      
      override protected function get endPoint() : Point
      {
         return TDGameInfo.getInstance().getZomebiePosByTile(TDGameInfo.getInstance().maxCol - 1,_zombie.objectModel.roadIndex);
      }
      
      private function get zomboss() : PirateZomboss
      {
         return _zombie as PirateZomboss;
      }
   }
}
