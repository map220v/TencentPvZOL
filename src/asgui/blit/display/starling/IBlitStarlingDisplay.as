package asgui.blit.display.starling
{
   import asgui.core.IDisposable;
   
   public interface IBlitStarlingDisplay extends IDisposable
   {
       
      
      function addEventListener(param1:String, param2:Function) : void;
      
      function removeEventListener(param1:String, param2:Function) : void;
      
      function hasEventListener(param1:String) : Boolean;
      
      function get holder() : IBlitDisplayStarling;
   }
}
