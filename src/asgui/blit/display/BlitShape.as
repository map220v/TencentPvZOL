package asgui.blit.display
{
   import flash.display.Shape;
   import flash.geom.ColorTransform;
   import flash.geom.Matrix;
   import flash.geom.Rectangle;
   
   public class BlitShape extends Shape implements IBlitShape
   {
       
      
      private var _disposed:Boolean;
      
      private var _blitStage:IBlitStage;
      
      public function BlitShape()
      {
         super();
      }
      
      public function Dispose() : void
      {
         this._disposed = true;
      }
      
      public function get hasDisposed() : Boolean
      {
         return this._disposed;
      }
      
      public function get asset() : *
      {
         return this;
      }
      
      public function get assetType() : int
      {
         return BlitAssetType.VECTORGRAPH;
      }
      
      public function BeginFill(param1:uint, param2:Number = 1.0) : void
      {
         graphics.beginFill(param1,param2);
      }
      
      public function Clear() : void
      {
         graphics.clear();
      }
      
      public function MoveTo(param1:Number, param2:Number) : void
      {
         graphics.moveTo(param1,param2);
      }
      
      public function LineTo(param1:Number, param2:Number) : void
      {
         graphics.lineTo(param1,param2);
      }
      
      public function DrawRect(param1:Number, param2:Number, param3:Number, param4:Number) : void
      {
         graphics.drawRect(param1,param2,param3,param4);
      }
      
      public function DrawCircle(param1:Number, param2:Number, param3:Number) : void
      {
         graphics.drawCircle(param1,param2,param3);
      }
      
      public function get blitStage() : IBlitStage
      {
         return this._blitStage;
      }
      
      public function set blitStage(param1:IBlitStage) : void
      {
         this._blitStage = param1;
      }
      
      public function get transformationMatrix() : Matrix
      {
         return this.transform.matrix;
      }
      
      public function set transformationMatrix(param1:Matrix) : void
      {
         this.transform.matrix = param1;
      }
      
      public function GetParent() : IBlitDisplayContainer
      {
         return this.parent as IBlitDisplayContainer;
      }
      
      public function GetBounds(param1:*) : Rectangle
      {
         if(param1 is IBlitDisplayObject)
         {
            return getBounds((param1 as IBlitDisplayObject).asset);
         }
         return getBounds(param1);
      }
      
      public function get colorTransform() : ColorTransform
      {
         return this.transform.colorTransform;
      }
      
      public function set colorTransform(param1:ColorTransform) : void
      {
         this.transform.colorTransform = param1;
      }
   }
}
