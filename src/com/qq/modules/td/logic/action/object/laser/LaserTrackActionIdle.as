package com.qq.modules.td.logic.action.object.laser
{
   import com.qq.constant.td.TDConstant;
   import com.qq.constant.td.TDObjTypeID;
   import com.qq.modules.td.command.effects.TDEffectCmd;
   import com.qq.modules.td.logic.TDFactory;
   import com.qq.modules.td.logic.action.basic.BasicAction;
   import com.qq.modules.td.logic.unit.basic.IGameObject;
   import com.qq.modules.td.model.TDGameInfo;
   import com.qq.modules.td.view.effects.TDEffectPlayInfo;
   import com.qq.utils.UtilsManager;
   import flash.events.Event;
   import flash.geom.Point;
   
   public class LaserTrackActionIdle extends BasicAction
   {
       
      
      private const SWING_RANGE_X:Array = [-20,20];
      
      private const SWING_RANGE_Y:Array = [-35,10];
      
      private var m_startPt:Point;
      
      private var m_targetPt:Point;
      
      private var m_distance:Number;
      
      private var m_angle:Number;
      
      private var m_damageTarget:IGameObject;
      
      private var m_fixSwing:Number = 0;
      
      private var m_swingDir:int = -1;
      
      private var m_isAbove:Boolean;
      
      private var effect:IGameObject;
      
      public function LaserTrackActionIdle()
      {
         super();
      }
      
      override public function enterState(param1:Array = null) : void
      {
         this.m_startPt = param1[0];
         this.m_targetPt = param1[1];
         this.m_distance = param1[2];
         this.m_angle = param1[3];
         this.m_damageTarget = param1[4];
         this.m_isAbove = param1[5];
         super.enterState(param1);
         _gameObject.animation.addEventListener(Event.COMPLETE,this.onFinish);
         _gameObject.animation.gotoAndPlay("laser_beam");
         if(this.m_damageTarget != null)
         {
            this.m_damageTarget.changeHp(-int.MAX_VALUE,TDConstant.AttackType_Normal,TDConstant.AttackMode_ZombieLaser,this.m_damageTarget);
            this.m_damageTarget.Dispose();
         }
         TDEffectCmd.playBlitAnimation(TDObjTypeID.Obj_Gargantuar_Laser_Explod,this.m_targetPt.x,this.m_targetPt.y,new TDEffectPlayInfo("laser_hit"));
         this.effect = TDGameInfo.getInstance().getGameObjctByUID(TDFactory.getLastUnitUin());
      }
      
      override public function runningState() : void
      {
         var _loc1_:Number = NaN;
         var _loc2_:Number = NaN;
         if(this.m_swingDir == -1)
         {
            --this.m_fixSwing;
            if(this.m_fixSwing <= (!!this.m_isAbove ? this.SWING_RANGE_Y[0] : this.SWING_RANGE_X[0]))
            {
               this.m_swingDir = 1;
            }
         }
         else
         {
            ++this.m_fixSwing;
            if(this.m_fixSwing >= (!!this.m_isAbove ? this.SWING_RANGE_Y[1] : this.SWING_RANGE_X[1]))
            {
               this.m_swingDir = -1;
            }
         }
         if(this.m_isAbove)
         {
            _loc1_ = Math.atan((this.m_targetPt.y + this.m_fixSwing - this.m_startPt.y) / (this.m_targetPt.x - this.m_startPt.x)) * 180 / Math.PI;
            _loc2_ = Point.distance(new Point(this.m_targetPt.x,this.m_targetPt.y + this.m_fixSwing),new Point(this.m_startPt.x,this.m_startPt.y));
            if(this.effect)
            {
               this.effect.setLocation(this.m_targetPt.x,this.m_targetPt.y + this.m_fixSwing);
            }
         }
         else
         {
            _loc1_ = Math.atan((this.m_targetPt.y - this.m_startPt.y) / (this.m_targetPt.x + this.m_fixSwing - this.m_startPt.x)) * 180 / Math.PI;
            _loc2_ = Point.distance(new Point(this.m_targetPt.x + this.m_fixSwing,this.m_targetPt.y),new Point(this.m_startPt.x,this.m_startPt.y));
            if(this.effect)
            {
               this.effect.setLocation(this.m_targetPt.x + this.m_fixSwing,this.m_targetPt.y);
            }
         }
         _gameObject.animation.bone.asset.width = _loc2_;
         _gameObject.rotation = 180 + _loc1_;
         _gameObject.setLocation(this.m_startPt.x,this.m_startPt.y);
         UtilsManager.bringToTop(_gameObject.frontLayer);
      }
      
      private function onFinish(param1:Event) : void
      {
         _gameObject.animation.removeEventListener(Event.COMPLETE,this.onFinish);
         _gameObject.Dispose();
      }
   }
}
