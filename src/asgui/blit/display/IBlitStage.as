package asgui.blit.display
{
   import flash.geom.Rectangle;
   
   public interface IBlitStage extends IBlitDisplayContainer
   {
       
      
      function get stageWidth() : int;
      
      function set stageWidth(param1:int) : void;
      
      function get stageHeight() : int;
      
      function set stageHeight(param1:int) : void;
      
      function get stageRect() : Rectangle;
      
      function get bgcolor() : uint;
      
      function set bgcolor(param1:uint) : void;
   }
}
