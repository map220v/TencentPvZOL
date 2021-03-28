package com.qq.modules.td.logic.process
{
   public class TDEffectDelayProcess extends TDBasicProcess implements IProcess
   {
      
      public static const ID:int = 5;
       
      
      public var effectsForDelay:Vector.<Object>;
      
      public function TDEffectDelayProcess()
      {
         super();
         this.effectsForDelay = new Vector.<Object>();
         updateDuration = int(1000 / 30);
      }
      
      override public function doProcess() : void
      {
         var _loc1_:int = 0;
         var _loc3_:Object = null;
         var _loc4_:Number = NaN;
         var _loc5_:Function = null;
         super.doProcess();
         if(this.effectsForDelay.length == 0)
         {
            return;
         }
         var _loc2_:Number = time;
         _loc1_ = 0;
         while(_loc1_ < this.effectsForDelay.length)
         {
            _loc3_ = this.effectsForDelay[_loc1_];
            _loc4_ = _loc3_.excuteTime;
            if(_loc2_ > _loc4_)
            {
               (_loc5_ = _loc3_.callFunc).apply();
               this.effectsForDelay.splice(_loc1_,1);
               _loc1_--;
            }
            _loc1_++;
         }
      }
      
      override public function reset() : void
      {
         this.effectsForDelay.length = 0;
         super.reset();
      }
      
      override public function dispose() : void
      {
         this.effectsForDelay.length = 0;
         super.dispose();
      }
   }
}
