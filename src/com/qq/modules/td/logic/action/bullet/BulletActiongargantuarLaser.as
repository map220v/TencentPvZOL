package com.qq.modules.td.logic.action.bullet
{
   import asgui.events.FrameEvent;
   import com.qq.constant.td.TDConstant;
   import com.qq.constant.td.TDObjTypeID;
   import com.qq.modules.td.command.game.TDGameObjectCmd;
   import com.qq.modules.td.data.map.TDMapTileData;
   import com.qq.modules.td.logic.TDFactory;
   import com.qq.modules.td.logic.unit.basic.IGameObject;
   import com.qq.modules.td.model.TDGameInfo;
   import flash.events.Event;
   import flash.geom.Point;
   
   public class BulletActiongargantuarLaser extends BasicBulletActionRunning
   {
       
      
      private var m_startPt:Point;
      
      private var m_targetPt:Point;
      
      private var m_targetTile:TDMapTileData;
      
      private var m_damageTarget:IGameObject;
      
      private var m_distance:Number;
      
      private var m_angle:Number;
      
      private var m_isAbove:Boolean;
      
      public function BulletActiongargantuarLaser()
      {
         super();
      }
      
      override public function enterState(param1:Array = null) : void
      {
         this.m_startPt = _bullet.params[0] as Point;
         this.m_targetTile = _bullet.params[1] as TDMapTileData;
         this.m_damageTarget = _bullet.params[2] as IGameObject;
         this.m_targetPt = new Point(this.m_targetTile.rect.x + this.m_targetTile.rect.width * 0.5,this.m_targetTile.rect.y + this.m_targetTile.rect.height * 0.75);
         this.m_distance = Point.distance(this.m_targetPt,this.m_startPt);
         this.m_angle = Math.atan((this.m_targetPt.y - this.m_startPt.y) / (this.m_targetPt.x - this.m_startPt.x)) * 180 / Math.PI;
         if(this.m_targetTile.roadIndex > _bullet.shooter.objectModel.roadIndex)
         {
            this.m_isAbove = false;
         }
         else
         {
            this.m_isAbove = true;
         }
         super.enterState(param1);
         _bullet.animation.addEventListener(Event.COMPLETE,this.onStart);
         _bullet.animation.gotoAndPlay("laser_start");
      }
      
      override public function runningState() : void
      {
         _bullet.rotation = this.m_angle;
         _bullet.setLocation(this.m_startPt.x,this.m_startPt.y);
      }
      
      protected function onStart(param1:Event) : void
      {
         _bullet.animation.removeEventListener(Event.COMPLETE,this.onStart);
         _bullet.animation.addEventListener(Event.COMPLETE,this.onIdle);
         _bullet.animation.addEventListener(FrameEvent.MOVEMENT_FRAME_EVENT,this.onShoot);
         _bullet.animation.gotoAndPlay("laser_idle");
      }
      
      protected function onShoot(param1:FrameEvent) : void
      {
         var _loc2_:IGameObject = null;
         if(param1.frameLabel == "shoot")
         {
            TDGameObjectCmd.addGameObjectByPos(TDConstant.UnitCatalog_Object,TDObjTypeID.Obj_Gargantuar_Laser_Track,this.m_startPt.x,this.m_startPt.y);
            _loc2_ = TDGameInfo.getInstance().getGameObjctByUID(TDFactory.getLastUnitUin());
            _loc2_.setAction(TDConstant.LaserTrackAction_Idle,[this.m_startPt,this.m_targetPt,this.m_distance,this.m_angle,this.m_damageTarget,this.m_isAbove]);
            _bullet.animation.removeEventListener(FrameEvent.MOVEMENT_FRAME_EVENT,this.onShoot);
         }
      }
      
      protected function onIdle(param1:Event) : void
      {
         _bullet.animation.removeEventListener(Event.COMPLETE,this.onIdle);
         _bullet.animation.addEventListener(Event.COMPLETE,this.onEnd);
         _bullet.animation.gotoAndPlay("laser_end");
      }
      
      protected function onEnd(param1:Event) : void
      {
         _bullet.animation.removeEventListener(Event.COMPLETE,this.onEnd);
         _bullet.Dispose();
      }
      
      override public function leaveState() : void
      {
         super.leaveState();
         _bullet.animation.removeEventListener(Event.COMPLETE,this.onStart);
         _bullet.animation.removeEventListener(Event.COMPLETE,this.onIdle);
         _bullet.animation.removeEventListener(Event.COMPLETE,this.onEnd);
         _bullet.animation.removeEventListener(FrameEvent.MOVEMENT_FRAME_EVENT,this.onShoot);
      }
   }
}
