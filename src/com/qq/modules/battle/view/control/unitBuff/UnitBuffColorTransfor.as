package com.qq.modules.battle.view.control.unitBuff
{
   import flash.geom.ColorTransform;
   
   public class UnitBuffColorTransfor extends UnitBuffWithEffect
   {
       
      
      public var colorTransf:ColorTransform;
      
      public function UnitBuffColorTransfor(param1:ColorTransform)
      {
         this.colorTransf = param1;
         super();
      }
      
      override public function dispose() : void
      {
         if(unit != null)
         {
            unit.animation.asset.colorTransform = new ColorTransform();
         }
         super.dispose();
      }
      
      override protected function render() : void
      {
         super.render();
         if(unit != null)
         {
            unit.animation.asset.colorTransform = this.colorTransf;
         }
      }
   }
}
