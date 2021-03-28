package com.qq.modules.td.logic.action.zombie.terracotta
{
   import com.qq.constant.td.TDConstant;
   import com.qq.modules.td.logic.action.zombie.BasicZombieAction;
   import com.qq.modules.td.logic.unit.zombie.TerracottaZombie;
   import com.qq.modules.td.model.TDGameInfo;
   import com.qq.modules.td.model.TDMiniGameTerracottaMemoryData;
   import flash.geom.Point;
   
   public class ZombieTerracottaLineupAction extends BasicZombieAction
   {
      
      private static const FRAME_GAP:int = 2;
       
      
      private var _lineUpPath:Vector.<Point>;
      
      private var _curStep:int;
      
      private var _curFrame:int;
      
      public function ZombieTerracottaLineupAction()
      {
         super();
      }
      
      override public function enterState(param1:Array = null) : void
      {
         super.enterState(param1);
         _gameObject.setFrozenAI(true);
         _gameObject.animation.gotoAndStop("bingmayong_idle");
         this._lineUpPath = TDMiniGameTerracottaMemoryData.getInstance().getRotatePath(_zombie as TerracottaZombie);
      }
      
      override public function runningState() : void
      {
         var _loc1_:Point = null;
         super.runningState();
         ++this._curFrame;
         if(this._curFrame >= FRAME_GAP)
         {
            this._curFrame = 0;
         }
         if(this._curFrame == 0)
         {
            if(this._curStep < this._lineUpPath.length)
            {
               _loc1_ = this._lineUpPath[this._curStep];
               _gameObject.setLocation(_loc1_.x,_loc1_.y);
               ++this._curStep;
            }
            else
            {
               TDMiniGameTerracottaMemoryData.getInstance().endLineUp();
               _zombie.zombieData.roadIndex = TDGameInfo.getInstance().getRoadIndex(_zombie.y);
               _zombie.zombieData.updateSortIndex();
               _zombie.setAction(TDConstant.ZAction_Terracotta_Cotta);
            }
         }
      }
      
      override public function leaveState() : void
      {
         this._lineUpPath = null;
         _gameObject.setFrozenAI(false);
         super.leaveState();
      }
   }
}
