package asgui.managers.tooltips
{
   import asgui.core.Application;
   import asgui.core.IToolTip;
   import asgui.managers.IToolTipEffect;
   import flash.display.DisplayObject;
   import flash.geom.Point;
   
   public class BottomToolTipEffect implements IToolTipEffect
   {
       
      
      private var target:DisplayObject;
      
      public function BottomToolTipEffect()
      {
         super();
      }
      
      public function ShowImmediately(param1:IToolTip) : void
      {
         param1.visible = true;
         (param1 as DisplayObject).alpha = 1;
      }
      
      public function HideImmediately(param1:IToolTip) : void
      {
         param1.visible = false;
         (param1 as DisplayObject).alpha = 0;
      }
      
      public function UpdatePosition(param1:IToolTip, param2:Number, param3:Number, param4:DisplayObject = null) : void
      {
         var _loc7_:Point = null;
         if(param4 != null)
         {
            this.target = param4;
         }
         var _loc5_:int = Application.application.height;
         var _loc6_:int = Application.application.width;
         if(this.target)
         {
            _loc7_ = this.target.localToGlobal(new Point());
            param1.x = _loc7_.x - param1.width / 2 + this.target.width / 2;
            param1.y = _loc7_.y + this.target.height;
         }
         else
         {
            param1.x = -param1.width / 2;
            param1.y = 0;
         }
         if(param1.x < 0)
         {
            param1.x = 0;
         }
         else if(param1.x > _loc6_ - param1.width)
         {
            param1.x = _loc6_ - param1.width;
         }
         if(param1.y > _loc5_ - param1.height)
         {
            param1.y -= this.target.height + param1.height;
         }
         param1.x = int(param1.x / 2) * 2;
         param1.y = int(param1.y / 2) * 2;
      }
   }
}
