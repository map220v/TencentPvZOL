package com.qq.modules.td.logic.action.object.prismGrassLine
{
   import com.qq.modules.td.logic.action.basic.BasicAction;
   import com.qq.modules.td.logic.unit.plant.BasicPlant;
   import flash.geom.Point;
   
   public class PrismGrassConnectLineActionIdle extends BasicAction
   {
       
      
      private var _srcPlant:BasicPlant;
      
      private var _tarPlant:BasicPlant;
      
      public function PrismGrassConnectLineActionIdle()
      {
         super();
      }
      
      override public function enterState(param1:Array = null) : void
      {
         super.enterState(param1);
         this._srcPlant = param1[0];
         this._tarPlant = param1[1];
         _gameObject.animation.gotoAndPlay("animation",true);
      }
      
      override public function runningState() : void
      {
         var _loc1_:Number = NaN;
         var _loc2_:Number = NaN;
         if(this._srcPlant && this._tarPlant)
         {
            _loc1_ = Point.distance(this.srcPt,this.tarPt);
            _gameObject.animation.bone.asset.width = _loc1_;
            _loc2_ = Math.atan((this.tarPt.y - this.srcPt.y) / (this.tarPt.x - this.srcPt.x)) * 180 / Math.PI;
            if(this.tarPt.x > this.srcPt.x)
            {
               _gameObject.rotation = _loc2_;
            }
            else if(this.tarPt.x == this.srcPt.x)
            {
               if(this.tarPt.y > this.srcPt.y)
               {
                  _gameObject.rotation = 90;
               }
               else
               {
                  _gameObject.rotation = 270;
               }
            }
            else
            {
               _gameObject.rotation = 180 + _loc2_;
            }
            _gameObject.setLocation(this.srcPt.x,this.srcPt.y);
         }
      }
      
      private function get srcPt() : Point
      {
         if(this._srcPlant)
         {
            return new Point(this._srcPlant.x,this._srcPlant.y - this._srcPlant.damageArea.height * 0.5);
         }
         return new Point();
      }
      
      private function get tarPt() : Point
      {
         if(this._tarPlant)
         {
            return new Point(this._tarPlant.x,this._tarPlant.y - this._tarPlant.damageArea.height * 0.5);
         }
         return new Point();
      }
   }
}
