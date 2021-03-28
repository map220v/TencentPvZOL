package asgui.blit.bone
{
   import asgui.logger.Statistic;
   import asgui.logger.Statistics;
   import flash.utils.getTimer;
   
   public final class BlitBoneAnimRenderAnalyzer
   {
      
      public static const RENDER_TYPE_NONE:int = 0;
      
      public static const RENDER_TYPE_BONES_UPDATE:int = 1;
      
      public static const RENDER_TYPE_BATCH_WITHOUT_CACHE:int = 2;
      
      public static const RENDER_TYPE_BATCH_WITH_CACHE:int = 3;
      
      private static var _instance:BlitBoneAnimRenderAnalyzer;
       
      
      private var _isRecording:Boolean = false;
      
      private var recordedTime:int;
      
      private var startRecordingTime:int;
      
      private var recordedCost:int;
      
      private var _frameRenderTypeCounts:Vector.<int>;
      
      public function BlitBoneAnimRenderAnalyzer()
      {
         this._frameRenderTypeCounts = new Vector.<int>(4,true);
         super();
      }
      
      public static function get instance() : BlitBoneAnimRenderAnalyzer
      {
         if(_instance == null)
         {
            _instance = new BlitBoneAnimRenderAnalyzer();
         }
         return _instance;
      }
      
      public function startRecord() : void
      {
         this.stopRecord();
         this._isRecording = true;
         this.startRecordingTime = getTimer();
      }
      
      public function stopRecord() : void
      {
         this._isRecording = false;
         this.recordedTime += getTimer() - this.startRecordingTime;
      }
      
      function addFrameRenderTypeCount(param1:int) : void
      {
         if(!this._isRecording)
         {
            return;
         }
         ++this._frameRenderTypeCounts[param1];
      }
      
      function addFrameCost(param1:int) : void
      {
         if(!this._isRecording)
         {
            return;
         }
         this.recordedCost += param1;
      }
      
      public function GetStatistics() : Statistics
      {
         var _loc1_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:String = null;
         var _loc2_:int = 0;
         var _loc6_:Statistics = new Statistics();
         var _loc7_:int = this.recordedTime;
         if(this._isRecording)
         {
            _loc7_ += getTimer() - this.startRecordingTime;
         }
         _loc6_.value = 1000 * this.recordedCost / _loc7_;
         var _loc8_:int = 1;
         _loc1_ = 0;
         while(_loc1_ < this._frameRenderTypeCounts.length)
         {
            switch(_loc1_)
            {
               case RENDER_TYPE_NONE:
                  _loc5_ = "NONE";
                  break;
               case RENDER_TYPE_BONES_UPDATE:
                  _loc5_ = "BONES_UPDATE";
                  break;
               case RENDER_TYPE_BATCH_WITHOUT_CACHE:
                  _loc5_ = "BATCH_WITHOUT_CACHE";
                  break;
               case RENDER_TYPE_BATCH_WITH_CACHE:
                  _loc5_ = "BATCH_WITH_CACHE";
                  break;
            }
            _loc6_.Add(new Statistic(null,_loc5_,null,1000 * this._frameRenderTypeCounts[_loc1_] / _loc7_ / _loc8_));
            _loc1_++;
         }
         return _loc6_;
      }
   }
}
