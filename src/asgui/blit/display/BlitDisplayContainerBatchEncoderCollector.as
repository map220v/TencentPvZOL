package asgui.blit.display
{
   import asgui.core.IDisposable;
   
   public class BlitDisplayContainerBatchEncoderCollector implements IDisposable
   {
       
      
      private var encoders:Array;
      
      private var _hasDisposed:Boolean;
      
      public function BlitDisplayContainerBatchEncoderCollector()
      {
         this.encoders = [];
         super();
      }
      
      public function Dispose() : void
      {
         this.DisposeContent();
         this.encoders = null;
         this._hasDisposed = true;
      }
      
      public function DisposeContent() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = this.encoders.length;
         _loc1_ = 0;
         while(_loc1_ < _loc2_)
         {
            if(this.encoders[_loc1_])
            {
               (this.encoders[_loc1_] as IBlitDisplayContainerBatchEncoder).Dispose();
            }
            _loc1_++;
         }
         this.encoders = [];
      }
      
      public function Clear() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = this.encoders.length;
         _loc1_ = 0;
         while(_loc1_ < _loc2_)
         {
            if(this.encoders[_loc1_])
            {
               (this.encoders[_loc1_] as IBlitDisplayContainerBatchEncoder).Clear();
            }
            _loc1_++;
         }
      }
      
      public function get hasDisposed() : Boolean
      {
         return this._hasDisposed;
      }
      
      public function GetEncoder(param1:int) : IBlitDisplayContainerBatchEncoder
      {
         return this.encoders[param1];
      }
      
      public function HasEncoder(param1:int) : Boolean
      {
         return this.encoders[param1];
      }
      
      public function SetEncoder(param1:IBlitDisplayContainerBatchEncoder, param2:int) : void
      {
         this.encoders[param2] = param1;
      }
      
      public function GetMem() : uint
      {
         var _loc2_:int = 0;
         var _loc1_:uint = 0;
         var _loc3_:int = this.encoders.length;
         _loc2_ = 0;
         while(_loc2_ < _loc3_)
         {
            if(this.encoders[_loc2_])
            {
               _loc1_ += (this.encoders[_loc2_] as IBlitDisplayContainerBatchEncoder).GetMem();
            }
            _loc2_++;
         }
         return _loc1_;
      }
   }
}
