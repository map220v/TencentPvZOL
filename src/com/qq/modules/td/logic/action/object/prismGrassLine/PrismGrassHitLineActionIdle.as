package com.qq.modules.td.logic.action.object.prismGrassLine
{
   import com.qq.constant.td.TDConstant;
   import com.qq.constant.td.TDObjTypeID;
   import com.qq.modules.td.command.game.TDGameObjectCmd;
   import com.qq.modules.td.logic.TDFactory;
   import com.qq.modules.td.logic.action.basic.BasicAction;
   import com.qq.modules.td.logic.unit.basic.IGameObject;
   import com.qq.modules.td.logic.unit.plant.BasicPlant;
   import com.qq.modules.td.logic.unit.zombie.BasicZombie;
   import com.qq.modules.td.model.TDGameInfo;
   import flash.geom.Point;
   
   public class PrismGrassHitLineActionIdle extends BasicAction
   {
       
      
      private var _effect:IGameObject;
      
      private var _srcPlant:BasicPlant;
      
      private var _tarZombie:BasicZombie;
      
      public function PrismGrassHitLineActionIdle()
      {
         super();
      }
      
      override public function enterState(param1:Array = null) : void
      {
         super.enterState(param1);
         this._srcPlant = param1[0];
         this._tarZombie = param1[1];
         _gameObject.animation.gotoAndPlay("animation",true);
         TDGameObjectCmd.addGameObjectByPos(TDConstant.UnitCatalog_Object,TDObjTypeID.Obj_PrismGrass_Plantfood_Hit,this.tarPt.x,this.tarPt.y);
         this._effect = TDGameInfo.getInstance().getGameObjctByUID(TDFactory.getLastUnitUin());
         this._effect.animation.gotoAndPlay("animation",true);
      }
      
      override public function runningState() : void
      {
         var _loc1_:Number = NaN;
         var _loc2_:Number = NaN;
         if(this._srcPlant && this._tarZombie)
         {
            _loc1_ = Point.distance(this.srcPt,this.tarPt);
            _gameObject.animation.bone.asset.width = _loc1_;
            _loc2_ = Math.atan((this.tarPt.y - this.srcPt.y) / (this.tarPt.x - this.srcPt.x)) * 180 / Math.PI;
            if(this.tarPt.x > this.srcPt.x)
            {
               _gameObject.rotation = _loc2_;
            }
            else
            {
               _gameObject.rotation = 180 + _loc2_;
            }
            _gameObject.setLocation(this.srcPt.x,this.srcPt.y);
            if(this._effect)
            {
               this._effect.setLocation(this.tarPt.x,this.tarPt.y);
            }
         }
      }
      
      private function get srcPt() : Point
      {
         if(this._srcPlant)
         {
            return new Point(this._srcPlant.x + 15,this._srcPlant.y - 40);
         }
         return new Point();
      }
      
      private function get tarPt() : Point
      {
         if(this._tarZombie)
         {
            return new Point(this._tarZombie.x,this._tarZombie.y - 0.5 * this._tarZombie.damageArea.height);
         }
         return new Point();
      }
      
      override public function leaveState() : void
      {
         super.leaveState();
         if(this._effect)
         {
            this._effect.Dispose();
            this._effect = null;
         }
      }
   }
}
