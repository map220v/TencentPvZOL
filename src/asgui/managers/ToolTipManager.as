package asgui.managers
{
   import asgui.core.IToolTip;
   import flash.display.DisplayObject;
   import flash.events.EventDispatcher;
   import flash.events.IEventDispatcher;
   
   public class ToolTipManager extends EventDispatcher
   {
      
      public static var _impl:IToolTipManagerImpl;
       
      
      public function ToolTipManager(param1:IEventDispatcher = null)
      {
         super(param1);
      }
      
      public static function get impl() : IToolTipManagerImpl
      {
         return _impl;
      }
      
      public static function RegisterToolTip(param1:DisplayObject, param2:Object, param3:Class = null) : void
      {
         impl.RegisterToolTip(param1,param2,param3);
      }
      
      public static function CreateToolTip(param1:Object, param2:Number = NaN, param3:Number = NaN, param4:IToolTip = null, param5:DisplayObject = null) : IToolTip
      {
         return impl.CreateToolTip(param1,param2,param3,param4,param5);
      }
      
      public static function AddToolTip(param1:IToolTip) : void
      {
         impl.AddToolTip(param1);
      }
      
      public static function DestroyToolTip(param1:IToolTip = null) : void
      {
         impl.DestroyToolTip(param1);
      }
      
      public static function UpdatePosition() : void
      {
         impl.UpdatePosition();
      }
      
      public static function showToolTipAll() : void
      {
         impl.enabled = true;
      }
      
      public static function RemoveAllTooltips(param1:Boolean = true) : void
      {
         impl.RemoveAllTooltips(param1);
      }
      
      public static function get showDelay() : Number
      {
         return impl.showDelay;
      }
      
      public static function set showDelay(param1:Number) : void
      {
         impl.showDelay = param1;
      }
   }
}
