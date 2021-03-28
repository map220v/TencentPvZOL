package asgui.blit.display
{
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.geom.ColorTransform;
   import flash.geom.Matrix;
   import flash.geom.Rectangle;
   
   public class BlitDisplayContainer extends Sprite implements IBlitDisplayContainer
   {
       
      
      public function BlitDisplayContainer(param1:Boolean = false)
      {
         super();
         this.cacheAsBitmap = param1;
      }
      
      public function get asset() : *
      {
         return this;
      }
      
      public function get assetType() : int
      {
         return BlitAssetType.BITMAP;
      }
      
      public function AddChildAt(param1:IBlitDisplayObject, param2:int) : IBlitDisplayObject
      {
         if(param2 > this.numChildren)
         {
            return this.AddChild(param1);
         }
         return addChildAt(param1 as DisplayObject,param2) as IBlitDisplayObject;
      }
      
      public function AddChild(param1:IBlitDisplayObject) : IBlitDisplayObject
      {
         return addChild(param1 as DisplayObject) as IBlitDisplayObject;
      }
      
      public function RemoveChildAt(param1:int) : IBlitDisplayObject
      {
         return removeChildAt(param1) as IBlitDisplayObject;
      }
      
      public function RemoveChild(param1:IBlitDisplayObject) : IBlitDisplayObject
      {
         param1.blitStage = null;
         return removeChild(param1 as DisplayObject) as IBlitDisplayObject;
      }
      
      public function RemoveAllChildren() : void
      {
         graphics.clear();
         while(this.numChildren > 0)
         {
            removeChildAt(0);
         }
      }
      
      public function Contains(param1:IBlitDisplayObject) : Boolean
      {
         return contains(param1 as DisplayObject);
      }
      
      public function GetChildAt(param1:int) : IBlitDisplayObject
      {
         return super.getChildAt(param1) as IBlitDisplayObject;
      }
      
      public function GetChildIndex(param1:IBlitDisplayObject) : int
      {
         return super.getChildIndex(param1 as DisplayObject);
      }
      
      public function GetChildByName(param1:String) : IBlitDisplayObject
      {
         return super.getChildByName(param1) as IBlitDisplayObject;
      }
      
      public function SwapChildren(param1:IBlitClip, param2:IBlitClip) : void
      {
         super.swapChildren(param1 as DisplayObject,param2 as DisplayObject);
      }
      
      public function SwapChildrenAt(param1:int, param2:int) : void
      {
         super.swapChildrenAt(param1,param2);
      }
      
      override public function set rotation(param1:Number) : void
      {
         super.rotation = param1 * 180 / Math.PI;
      }
      
      override public function get rotation() : Number
      {
         return super.rotation * Math.PI / 180;
      }
      
      public function get blitStage() : IBlitStage
      {
         return null;
      }
      
      public function set blitStage(param1:IBlitStage) : void
      {
      }
      
      public function Dispose() : void
      {
      }
      
      public function get hasDisposed() : Boolean
      {
         return false;
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
      
      public function get transformationMatrix() : Matrix
      {
         return this.transform.matrix;
      }
      
      public function set transformationMatrix(param1:Matrix) : void
      {
         this.transform.matrix = param1;
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
