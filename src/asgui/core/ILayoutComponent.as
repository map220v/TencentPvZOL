package asgui.core
{
   public interface ILayoutComponent extends IDisposable
   {
       
      
      function get id() : String;
      
      function set id(param1:String) : void;
      
      function get left() : Number;
      
      function set left(param1:Number) : void;
      
      function get right() : Number;
      
      function set right(param1:Number) : void;
      
      function get top() : Number;
      
      function set top(param1:Number) : void;
      
      function get bottom() : Number;
      
      function set bottom(param1:Number) : void;
      
      function get hcenter() : Number;
      
      function set hcenter(param1:Number) : void;
      
      function get vcenter() : Number;
      
      function set vcenter(param1:Number) : void;
      
      function InvalidateLayout() : void;
      
      function ValidateLayout(param1:int = 0, param2:int = 0) : Boolean;
   }
}
