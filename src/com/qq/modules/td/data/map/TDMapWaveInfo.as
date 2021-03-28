package com.qq.modules.td.data.map
{
   public class TDMapWaveInfo
   {
       
      
      private var _waveType:int;
      
      public var delay:int;
      
      public var actBeforeDelay:String;
      
      public var actAfterDelay:String;
      
      public var isBigWave:Boolean;
      
      public var isAdvanceTime:Boolean;
      
      public var paramStr:String;
      
      public var enemyInfo:TDMapWaveEnemyData;
      
      public var comeMode:int;
      
      public function TDMapWaveInfo(param1:int)
      {
         super();
         this._waveType = param1;
         this.delay = 0;
      }
      
      public function get waveType() : int
      {
         return this._waveType;
      }
      
      public function setWaveInfo(param1:XML) : void
      {
         this.delay = int(param1.@delay);
         this.actBeforeDelay = String(param1.@actBeforeDelay);
         this.actAfterDelay = String(param1.@actAfterDelay);
         this.paramStr = String(param1.@param);
         if(int(param1.@isBigWave) == 1)
         {
            this.isBigWave = true;
         }
         if(int(param1.@isAdvanceTime) == 1)
         {
            this.isAdvanceTime = true;
         }
         this.comeMode = int(param1.@comeMode);
      }
      
      public function setEnemyInfo(param1:XML) : void
      {
         this.enemyInfo = new TDMapWaveEnemyData(param1);
         this.delay = this.enemyInfo.delay;
      }
   }
}
