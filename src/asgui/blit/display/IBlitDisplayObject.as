package asgui.blit.display
{
   import asgui.core.IAsguiDisplayObject;
   import asgui.core.IDisposable;
   import flash.geom.ColorTransform;
   import flash.geom.Matrix;
   import flash.geom.Rectangle;
   
   public interface IBlitDisplayObject extends IDisposable, IAsguiDisplayObject
   {
       
      
      function get blitStage() : IBlitStage;
      
      function set blitStage(param1:IBlitStage) : void;
      
      function GetParent() : IBlitDisplayContainer;
      
      function get transformationMatrix() : Matrix;
      
      function set transformationMatrix(param1:Matrix) : void;
      
      function get colorTransform() : ColorTransform;
      
      function set colorTransform(param1:ColorTransform) : void;
      
      function get asset() : *;
      
      function get assetType() : int;
      
      function GetBounds(param1:*) : Rectangle;
   }
}
