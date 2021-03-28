package com.qq.modules.td.logic.action.object.bossRocket
{
   import com.qq.constant.td.TDConstant;
   import com.qq.constant.td.TDObjTypeID;
   import com.qq.modules.td.command.effects.TDEffectCmd;
   import com.qq.modules.td.data.map.TDMapTileData;
   import com.qq.modules.td.logic.action.basic.BasicAction;
   import com.qq.modules.td.logic.unit.basic.IGameObject;
   import com.qq.modules.td.model.TDGameInfo;
   import com.qq.modules.td.view.effects.TDEffectPlayInfo;
   import flash.geom.Point;
   
   public class FutureBossRocketFly extends BasicAction
   {
       
      
      private var m_srcPt:Point;
      
      private var m_tarPt:Point;
      
      private var m_speed:int;
      
      private var m_selectTile:TDMapTileData;
      
      private var m_rocketTarget:IGameObject;
      
      private var m_rotation:Number;
      
      private var m_xSpeed:Number;
      
      private var m_ySpeed:Number;
      
      public function FutureBossRocketFly()
      {
         super();
      }
      
      override public function enterState(param1:Array = null) : void
      {
         this.m_srcPt = param1[0];
         this.m_tarPt = param1[1];
         this.m_speed = param1[2];
         this.m_selectTile = param1[3];
         this.m_rocketTarget = param1[4];
         this.m_rotation = Math.atan((this.m_tarPt.y - this.m_srcPt.y) / (this.m_tarPt.x - this.m_srcPt.x)) * 180 / Math.PI;
         var _loc2_:Number = Math.sqrt(Math.pow(this.m_tarPt.y - this.m_srcPt.y,2) + Math.pow(this.m_tarPt.x - this.m_srcPt.x,2));
         this.m_xSpeed = this.m_speed * (this.m_tarPt.x - this.m_srcPt.x) / _loc2_;
         this.m_ySpeed = this.m_speed * (this.m_tarPt.y - this.m_srcPt.y) / _loc2_;
         super.enterState(param1);
         _gameObject.animation.gotoAndPlay("idle",true);
      }
      
      override public function runningState() : void
      {
         if(this.m_tarPt.x > this.m_srcPt.x)
         {
            _gameObject.rotation = 180 + this.m_rotation;
         }
         else
         {
            _gameObject.rotation = 360 + this.m_rotation;
         }
         var _loc1_:Number = _gameObject.x + this.m_xSpeed / 30;
         var _loc2_:Number = _gameObject.y + this.m_ySpeed / 30;
         _gameObject.setLocation(_loc1_,_loc2_);
         if(this.m_selectTile.rect.containsPoint(new Point(_loc1_,_loc2_)))
         {
            this.hitEffect();
            if(this.m_rocketTarget)
            {
               this.m_rocketTarget.Dispose();
            }
            _gameObject.Dispose();
         }
      }
      
      override public function leaveState() : void
      {
         super.leaveState();
      }
      
      private function hitEffect() : void
      {
         var _loc1_:IGameObject = null;
         var _loc2_:Array = null;
         var _loc3_:IGameObject = null;
         for each(_loc1_ in TDGameInfo.getInstance().getGameObjectMapByCatalg(TDConstant.UnitCatalog_Plant))
         {
            if(_loc1_.objectModel.tileIndex == this.m_selectTile.index)
            {
               _loc1_.Dispose();
            }
         }
         _loc2_ = TDGameInfo.getInstance().getGameObjectMapByCatalg(TDConstant.UnitCatalog_Object);
         for each(_loc3_ in _loc2_)
         {
            if(_loc3_.objectModel.column == this.m_selectTile.roadCol && _loc3_.objectModel.roadIndex == this.m_selectTile.roadRow && TDObjTypeID.POWER_TILE_TYPE_ARR.indexOf(_loc3_.objectModel.unitType) >= 0)
            {
               _loc3_.Dispose();
            }
         }
         TDEffectCmd.playBlitAnimation(TDObjTypeID.Obj_Future_Zomboss_Rocket_Explod,this.m_selectTile.rect.x + this.m_selectTile.rect.width * 0.5,this.m_selectTile.rect.y + this.m_selectTile.rect.height * 0.5,new TDEffectPlayInfo("animation"));
      }
   }
}
