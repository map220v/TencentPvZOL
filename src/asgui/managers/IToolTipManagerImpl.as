package asgui.managers
{
   import asgui.core.IToolTip;
   import flash.display.DisplayObject;
   
   public interface IToolTipManagerImpl
   {
       
      
      function get enabled() : Boolean;
      
      function set enabled(param1:Boolean) : void;
      
      function set toolTipEffect(param1:IToolTipEffect) : void;
      
      function get toolTipEffect() : IToolTipEffect;
      
      function get showDelay() : Number;
      
      function set showDelay(param1:Number) : void;
      
      function RegisterToolTip(param1:DisplayObject, param2:Object, param3:Class = null) : void;
      
      function CreateToolTip(param1:Object, param2:Number = NaN, param3:Number = NaN, param4:IToolTip = null, param5:DisplayObject = null) : IToolTip;
      
      function AddToolTip(param1:IToolTip) : void;
      
      function DestroyToolTip(param1:IToolTip = null) : void;
      
      function UpdatePosition(param1:DisplayObject = null) : void;
      
      function RemoveAllTooltips(param1:Boolean = true) : void;
   }
}
