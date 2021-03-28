package asgui.core
{
   import asgui.styles.StyleDeclaration;
   import flash.display.Stage;
   
   public interface IUIComponent extends IAsguiDisplayObject, IToolTipable, IValidatableComponent, ILayoutComponent
   {
       
      
      function InitializeComponent() : void;
      
      function get styleDeclaration() : StyleDeclaration;
      
      function get enabled() : Boolean;
      
      function set enabled(param1:Boolean) : void;
      
      function get toolTip() : Object;
      
      function set toolTip(param1:Object) : void;
      
      function get styleName() : String;
      
      function set styleName(param1:String) : void;
      
      function get stage() : Stage;
   }
}
