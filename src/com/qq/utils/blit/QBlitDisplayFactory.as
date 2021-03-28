package com.qq.utils.blit
{
   import asgui.blit.display.BlitDisplayContainer;
   import asgui.blit.display.IBlitDisplayContainer;
   import asgui.blit.display.IBlitStage;
   import asgui.blit.display.vectorgraph.BlitDisplayVectorgraphFactory;
   
   public class QBlitDisplayFactory extends BlitDisplayVectorgraphFactory
   {
       
      
      public function QBlitDisplayFactory()
      {
         super();
      }
      
      override public function CreateStage(param1:int, param2:int) : IBlitStage
      {
         return new QBlitStage(param1,param2);
      }
      
      override public function CreateBlitContainer(param1:Object = null) : IBlitDisplayContainer
      {
         return super.CreateBlitContainer(param1) as BlitDisplayContainer;
      }
   }
}
