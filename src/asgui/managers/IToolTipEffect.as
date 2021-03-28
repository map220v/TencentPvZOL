package asgui.managers
{
   import asgui.core.IToolTip;
   import flash.display.DisplayObject;
   
   public interface IToolTipEffect
   {
       
      
      function ShowImmediately(param1:IToolTip) : void;
      
      function HideImmediately(param1:IToolTip) : void;
      
      function UpdatePosition(param1:IToolTip, param2:Number, param3:Number, param4:DisplayObject = null) : void;
   }
}
