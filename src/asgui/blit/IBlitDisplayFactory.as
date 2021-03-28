package asgui.blit
{
   import asgui.blit.display.IBlitClip;
   import asgui.blit.display.IBlitDisplayContainer;
   import asgui.blit.display.IBlitShape;
   import asgui.blit.display.IBlitStage;
   
   public interface IBlitDisplayFactory
   {
       
      
      function CreateStage(param1:int, param2:int) : IBlitStage;
      
      function CreateBlitClip(param1:Object = null) : IBlitClip;
      
      function CreateBlitShape(param1:Object = null) : IBlitShape;
      
      function CreateBlitContainer(param1:Object = null) : IBlitDisplayContainer;
   }
}
