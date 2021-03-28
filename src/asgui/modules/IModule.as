package asgui.modules
{
   import asgui.core.IDisposable;
   import flash.display.Sprite;
   
   public interface IModule extends IDisposable
   {
       
      
      function get data() : Object;
      
      function set data(param1:Object) : void;
      
      function Setup(param1:Sprite) : void;
      
      function Unload() : void;
   }
}
