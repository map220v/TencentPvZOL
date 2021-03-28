package asgui.blit.display.vectorgraph
{
   import asgui.blit.bone.BlitBoneData;
   import asgui.blit.data.BlitData;
   import asgui.blit.display.IBlitDisplayContainer;
   import asgui.blit.display.IBlitDisplayContainerBatch;
   import asgui.blit.display.IBlitDisplayContainerBatchEncoder;
   import flash.display.BitmapData;
   import flash.display.GraphicsBitmapFill;
   import flash.display.GraphicsPath;
   import flash.display.IGraphicsData;
   import flash.display.Sprite;
   
   public class BlitDisplayContainerVectorgraphBatchEncoder implements IBlitDisplayContainerBatchEncoder
   {
       
      
      private var graphicsDatas:Vector.<IGraphicsData>;
      
      private var graphicsNames:Vector.<String>;
      
      private var _hasDisposed:Boolean;
      
      private var _hasCleared:Boolean;
      
      public function BlitDisplayContainerVectorgraphBatchEncoder(param1:BlitDisplayContainerVectorgraphBatch)
      {
         var _loc3_:int = 0;
         var _loc6_:BlitClipVectorgraph = null;
         this.graphicsDatas = new Vector.<IGraphicsData>();
         super();
         var _loc2_:int = param1.numChildren;
         var _loc4_:Vector.<IGraphicsData> = new Vector.<IGraphicsData>();
         var _loc5_:Vector.<String> = new Vector.<String>();
         _loc3_ = 0;
         while(_loc3_ < _loc2_)
         {
            _loc6_ = param1.getChildAt(_loc3_) as BlitClipVectorgraph;
            _loc5_.push(_loc6_.dataProvider.name);
            _loc4_ = _loc4_.concat(_loc6_.GetGraphicsDatas(true));
            _loc3_++;
         }
         this.graphicsNames = _loc5_;
         this.graphicsDatas = _loc4_;
      }
      
      public function DecodeCopy(param1:IBlitDisplayContainer) : IBlitDisplayContainerBatch
      {
         var _loc2_:Sprite = null;
         if(param1 is Sprite)
         {
            _loc2_ = param1 as Sprite;
            _loc2_.graphics.clear();
            _loc2_.graphics.drawGraphicsData(this.graphicsDatas);
            _loc2_.graphics.endFill();
         }
         return null;
      }
      
      public function CheckBeforeDecode(param1:BlitBoneData) : void
      {
         var _loc2_:BitmapData = null;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:Vector.<BitmapData> = null;
         var _loc7_:BlitData = null;
         var _loc8_:GraphicsBitmapFill = null;
         if(this._hasCleared)
         {
            _loc5_ = (_loc6_ = new Vector.<BitmapData>(this.graphicsNames.length,true)).length;
            _loc3_ = 0;
            while(_loc3_ < _loc5_)
            {
               if(_loc7_ = param1.blits[this.graphicsNames[_loc3_]])
               {
                  _loc6_[_loc3_] = _loc7_.GetFrame(0).bitmapData;
               }
               else
               {
                  _loc6_[_loc3_] = BlitData.BITMAPDATA_BLANK;
               }
               _loc3_++;
            }
            _loc5_ = this.graphicsDatas.length;
            _loc3_ = 0;
            _loc4_ = 0;
            while(_loc3_ < _loc5_)
            {
               if(this.graphicsDatas[_loc3_] is GraphicsBitmapFill)
               {
                  (_loc8_ = this.graphicsDatas[_loc3_] as GraphicsBitmapFill).bitmapData = _loc6_[_loc4_++];
               }
               _loc3_++;
            }
            this._hasCleared = false;
         }
      }
      
      public function Dispose() : void
      {
         this.graphicsDatas = null;
         this._hasDisposed = true;
      }
      
      public function Clear() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         var _loc3_:GraphicsBitmapFill = null;
         if(!this._hasCleared)
         {
            _loc2_ = this.graphicsDatas.length;
            while(_loc1_ < _loc2_)
            {
               if(this.graphicsDatas[_loc1_] is GraphicsBitmapFill)
               {
                  _loc3_ = this.graphicsDatas[_loc1_] as GraphicsBitmapFill;
                  if(_loc3_.bitmapData)
                  {
                     _loc3_.bitmapData = null;
                  }
               }
               _loc1_++;
            }
            this._hasCleared = true;
         }
      }
      
      public function get hasDisposed() : Boolean
      {
         return this._hasDisposed;
      }
      
      public function GetMem() : uint
      {
         var _loc2_:int = 0;
         var _loc4_:GraphicsBitmapFill = null;
         var _loc5_:GraphicsPath = null;
         var _loc1_:uint = 0;
         var _loc3_:int = this.graphicsDatas.length;
         while(_loc2_ < _loc3_)
         {
            if(this.graphicsDatas[_loc2_] is GraphicsBitmapFill)
            {
               _loc4_ = this.graphicsDatas[_loc2_] as GraphicsBitmapFill;
               _loc1_ += 6 * 8;
            }
            else if(this.graphicsDatas[_loc2_] is GraphicsPath)
            {
               _loc5_ = this.graphicsDatas[_loc2_] as GraphicsPath;
               _loc1_ += _loc5_.commands.length * 4 + _loc5_.data.length * 8;
            }
            _loc2_++;
         }
         return _loc1_;
      }
   }
}
