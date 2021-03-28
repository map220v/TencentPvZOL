package asgui.core
{
   import flash.events.IEventDispatcher;
   import flash.geom.Point;
   
   public interface IAsguiDisplayObject extends IEventDispatcher
   {
       
      
      function get name() : String;
      
      function set name(param1:String) : void;
      
      function get width() : Number;
      
      function set width(param1:Number) : void;
      
      function get height() : Number;
      
      function set height(param1:Number) : void;
      
      function get x() : Number;
      
      function set x(param1:Number) : void;
      
      function get y() : Number;
      
      function set y(param1:Number) : void;
      
      function get visible() : Boolean;
      
      function set visible(param1:Boolean) : void;
      
      function get alpha() : Number;
      
      function set alpha(param1:Number) : void;
      
      function get scaleX() : Number;
      
      function set scaleX(param1:Number) : void;
      
      function get scaleY() : Number;
      
      function set scaleY(param1:Number) : void;
      
      function get rotation() : Number;
      
      function set rotation(param1:Number) : void;
      
      function localToGlobal(param1:Point) : Point;
      
      function globalToLocal(param1:Point) : Point;
      
      function get filters() : Array;
      
      function set filters(param1:Array) : void;
   }
}
