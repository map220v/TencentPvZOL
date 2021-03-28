package asgui.blit.display.vectorgraph
{
   import asgui.blit.display.BlitDisplayContainer;
   import asgui.blit.display.IBlitDisplayContainerBatch;
   import asgui.blit.display.IBlitDisplayContainerBatchEncoder;
   
   public class BlitDisplayContainerVectorgraphBatch extends BlitDisplayContainer implements IBlitDisplayContainerBatch
   {
       
      
      private var encoder:BlitDisplayContainerVectorgraphBatchEncoder;
      
      public function BlitDisplayContainerVectorgraphBatch()
      {
         super();
      }
      
      public function GetEncoder() : IBlitDisplayContainerBatchEncoder
      {
         if(!this.encoder)
         {
            this.encoder = new BlitDisplayContainerVectorgraphBatchEncoder(this);
         }
         return this.encoder;
      }
   }
}
