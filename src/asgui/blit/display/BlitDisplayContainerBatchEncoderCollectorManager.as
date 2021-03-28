package asgui.blit.display
{
   public class BlitDisplayContainerBatchEncoderCollectorManager
   {
      
      private static var _instance:BlitDisplayContainerBatchEncoderCollectorManager;
       
      
      private var collectors:Array;
      
      public var createCounter:int;
      
      public function BlitDisplayContainerBatchEncoderCollectorManager()
      {
         this.collectors = [];
         super();
      }
      
      public static function get instance() : BlitDisplayContainerBatchEncoderCollectorManager
      {
         if(!_instance)
         {
            _instance = new BlitDisplayContainerBatchEncoderCollectorManager();
         }
         return _instance;
      }
      
      public function GetOrCreateCollector(param1:String, param2:String) : BlitDisplayContainerBatchEncoderCollector
      {
         if(!this.collectors[param1])
         {
            this.collectors[param1] = [];
         }
         if(!this.collectors[param1][param2])
         {
            this.collectors[param1][param2] = new BlitDisplayContainerBatchEncoderCollector();
            ++this.createCounter;
         }
         return this.collectors[param1][param2];
      }
      
      public function ClearByUrl(param1:String) : void
      {
         var _loc2_:Array = null;
         var _loc3_:BlitDisplayContainerBatchEncoderCollector = null;
         if(this.collectors[param1])
         {
            _loc2_ = this.collectors[param1];
            for each(_loc3_ in _loc2_)
            {
               _loc3_.Clear();
            }
            delete this.collectors[param1];
         }
      }
      
      public function Clear() : void
      {
         var _loc1_:Array = null;
         var _loc2_:BlitDisplayContainerBatchEncoderCollector = null;
         for each(_loc1_ in this.collectors)
         {
            for each(_loc2_ in _loc1_)
            {
               _loc2_.Clear();
            }
         }
      }
      
      public function ClearAndDispose() : void
      {
         var _loc1_:Array = null;
         var _loc2_:BlitDisplayContainerBatchEncoderCollector = null;
         for each(_loc1_ in this.collectors)
         {
            for each(_loc2_ in _loc1_)
            {
               _loc2_.DisposeContent();
            }
         }
         this.collectors = [];
      }
      
      public function GetMem() : uint
      {
         var _loc2_:Array = null;
         var _loc3_:BlitDisplayContainerBatchEncoderCollector = null;
         var _loc1_:uint = 0;
         for each(_loc2_ in this.collectors)
         {
            for each(_loc3_ in _loc2_)
            {
               _loc1_ += _loc3_.GetMem();
            }
         }
         return _loc1_;
      }
   }
}
