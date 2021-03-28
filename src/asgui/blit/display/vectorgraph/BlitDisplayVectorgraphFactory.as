package asgui.blit.display.vectorgraph
{
   import asgui.blit.IBlitBatchableDisplayFactory;
   import asgui.blit.IBlitDisplayFactory;
   import asgui.blit.display.BlitDisplayContainer;
   import asgui.blit.display.BlitDisplayFactory;
   import asgui.blit.display.IBlitClip;
   import asgui.blit.display.IBlitDisplayContainer;
   
   public class BlitDisplayVectorgraphFactory extends BlitDisplayFactory implements IBlitDisplayFactory, IBlitBatchableDisplayFactory
   {
       
      
      public function BlitDisplayVectorgraphFactory()
      {
         super();
      }
      
      override public function CreateBlitClip(param1:Object = null) : IBlitClip
      {
         return new BlitClipVectorgraph();
      }
      
      override public function CreateBlitContainer(param1:Object = null) : IBlitDisplayContainer
      {
         var _loc4_:BlitDisplayContainerVectorgraphBatch = null;
         var _loc2_:Boolean = param1 && param1.hasOwnProperty("batch") ? Boolean(param1["batch"]) : false;
         if(_loc2_)
         {
            return new BlitDisplayContainerVectorgraphBatch();
         }
         return new BlitDisplayContainer(false);
      }
   }
}
