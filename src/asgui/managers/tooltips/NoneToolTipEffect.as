package asgui.managers.tooltips
{
   import asgui.core.IToolTip;
   import asgui.managers.IToolTipEffect;
   import flash.display.DisplayObject;
   
   public class NoneToolTipEffect implements IToolTipEffect
   {
       
      
      public function NoneToolTipEffect()
      {
         super();
      }
      
      public function ShowImmediately(param1:IToolTip) : void
      {
         this.$ShowImmediately(param1);
      }
      
      private function $ShowImmediately(param1:IToolTip) : void
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
         param1.x = param2;
         param1.y = param3;
      }
   }
}
