package asgui.blit.display
{
   import asgui.blit.bone.BlitBoneData;
   import asgui.core.IDisposable;
   
   public interface IBlitDisplayContainerBatchEncoder extends IDisposable
   {
       
      
      function Clear() : void;
      
      function DecodeCopy(param1:IBlitDisplayContainer) : IBlitDisplayContainerBatch;
      
      function CheckBeforeDecode(param1:BlitBoneData) : void;
      
      function GetMem() : uint;
   }
}
