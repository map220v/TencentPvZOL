package asgui.blit.display
{
   import asgui.blit.IBlitDisplayFactory;
   
   public class BlitDisplayFactory implements IBlitDisplayFactory
   {
       
      
      public function BlitDisplayFactory()
      {
         super();
      }
      
      public function CreateStage(param1:int, param2:int) : IBlitStage
      {
         return new BlitStage(param1,param2);
      }
      
      public function CreateBlitClip(param1:Object = null) : IBlitClip
      {
         var _loc2_:Boolean = param1 && param1.hasOwnProperty("smoothing") ? Boolean(param1["smoothing"]) : false;
         return new BlitClip(_loc2_);
      }
      
      public function CreateBlitShape(param1:Object = null) : IBlitShape
      {
         return new BlitShape();
      }
      
      public function CreateBlitContainer(param1:Object = null) : IBlitDisplayContainer
      {
         var _loc2_:Boolean = param1 && param1.hasOwnProperty("smoothing") ? Boolean(param1["smoothing"]) : false;
         var _loc3_:Boolean = param1 && param1.hasOwnProperty("batch") ? Boolean(param1["batch"]) : false;
         return new BlitDisplayContainer(_loc2_);
      }
   }
}
