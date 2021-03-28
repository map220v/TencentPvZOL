package asgui.core
{
   import flash.display.DisplayObject;
   
   public interface IValidatableComponent extends IDisposable, IAsguiDisplayObject
   {
       
      
      function get root() : DisplayObject;
      
      function ValidateSkin() : void;
      
      function ValidateDisplayList() : void;
      
      function ValidateSize() : void;
      
      function ValidateProperties() : void;
      
      function InvalidateSkin() : void;
      
      function InvalidateDisplayList(param1:Object = null) : void;
      
      function InvalidateSize() : void;
      
      function InvalidateProperties() : void;
      
      function get parents() : int;
   }
}
