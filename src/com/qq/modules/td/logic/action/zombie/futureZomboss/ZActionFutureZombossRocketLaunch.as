package com.qq.modules.td.logic.action.zombie.futureZomboss
{
   import asgui.events.FrameEvent;
   import com.qq.constant.td.TDConstant;
   import com.qq.constant.td.TDObjTypeID;
   import com.qq.modules.td.command.game.TDGameObjectCmd;
   import com.qq.modules.td.data.map.TDMapTileData;
   import com.qq.modules.td.logic.TDFactory;
   import com.qq.modules.td.logic.action.zombie.BasicZombieAction;
   import com.qq.modules.td.logic.unit.basic.IGameObject;
   import com.qq.modules.td.model.TDGameInfo;
   import flash.events.Event;
   import flash.geom.Point;
   import net.sakri.flash.math.MathUtil;
   
   public class ZActionFutureZombossRocketLaunch extends BasicZombieAction
   {
       
      
      private var _impLaunchCount:int;
      
      private var m_selectTile:TDMapTileData;
      
      private var m_rocketTarget:IGameObject;
      
      public function ZActionFutureZombossRocketLaunch()
      {
         super();
      }
      
      override public function enterState(param1:Array = null) : void
      {
         super.enterState(param1);
         _gameObject.setFrozenAI(true);
         this.m_selectTile = this.caculateSelectTile();
         if(this.m_selectTile)
         {
            TDGameObjectCmd.addGameObjectByPos(TDConstant.UnitCatalog_Object,TDObjTypeID.Obj_Future_Zomboss_RocketTarget,this.m_selectTile.rect.x + this.m_selectTile.rect.width * 0.5,this.m_selectTile.rect.y + this.m_selectTile.rect.height * 0.5);
            this.m_rocketTarget = TDGameInfo.getInstance().getGameObjctByUID(TDFactory.getLastUnitUin());
            this.m_rocketTarget.setAction(TDConstant.RocketTargetAction);
         }
         _gameObject.animation.gotoAndPlay("rocket_launch",1);
         _gameObject.animation.addEventListener(FrameEvent.MOVEMENT_FRAME_EVENT,this.onShoot);
         _gameObject.animation.addEventListener(Event.COMPLETE,this.onFinish);
      }
      
      override public function leaveState() : void
      {
         if(this.m_rocketTarget)
         {
            this.m_rocketTarget.Dispose();
         }
         _gameObject.animation.removeEventListener(Event.COMPLETE,this.onFinish);
         _gameObject.animation.removeEventListener(FrameEvent.MOVEMENT_FRAME_EVENT,this.onShoot);
         super.leaveState();
      }
      
      private function onFinish(param1:Event) : void
      {
         _gameObject.animation.removeEventListener(Event.COMPLETE,this.onFinish);
         _gameObject.setFrozenAI(false);
         _gameObject.setAction();
      }
      
      private function onShoot(param1:FrameEvent) : void
      {
         var _loc2_:IGameObject = null;
         if(param1.frameLabel == "fire")
         {
            if(this.m_selectTile)
            {
               TDGameObjectCmd.addGameObjectByPos(TDConstant.UnitCatalog_Object,TDObjTypeID.Obj_Future_Zomboss_Rocket,_gameObject.x - 35,_gameObject.y - 50);
               _loc2_ = TDGameInfo.getInstance().getGameObjctByUID(TDFactory.getLastUnitUin());
               _loc2_.setAction(TDConstant.FutureBossRocketFly,[new Point(_gameObject.x - 35,_gameObject.y - 50),new Point(this.m_selectTile.rect.x + this.m_selectTile.rect.width * 0.5,this.m_selectTile.rect.y + this.m_selectTile.rect.height * 0.5),1000,this.m_selectTile,this.m_rocketTarget]);
            }
         }
      }
      
      private function caculateSelectTile() : TDMapTileData
      {
         var _loc1_:TDMapTileData = TDGameInfo.getInstance().getRoadTileByGamePos(_gameObject.x,_gameObject.y);
         var _loc2_:int = TDGameInfo.getInstance().maxCol - 4;
         var _loc3_:int = TDGameInfo.getInstance().maxCol;
         var _loc4_:int = MathUtil.getRandomIntInRange(TDGameInfo.getInstance().minRow,TDGameInfo.getInstance().maxRow);
         var _loc5_:int = MathUtil.getRandomIntInRange(_loc2_,_loc3_);
         return TDGameInfo.getInstance().getRoadTileInf(_loc5_,_loc4_);
      }
   }
}
