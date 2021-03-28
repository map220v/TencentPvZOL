package com.qq.modules.td.logic.process
{
   import com.qq.modules.td.command.game.TDFloorCmd;
   import com.qq.modules.td.data.map.TDMapPathUpdateInfo;
   import com.qq.modules.td.model.TDGameInfo;
   import com.qq.modules.td.model.TDStageInfo;
   
   public class TDPathUpdateProcess extends TDBasicProcess implements IProcess
   {
      
      public static var ID:uint = 9;
       
      
      private var pathUpdateVec:Vector.<TDMapPathUpdateInfo>;
      
      public function TDPathUpdateProcess()
      {
         this.pathUpdateVec = new Vector.<TDMapPathUpdateInfo>();
         super();
         updateDuration = int(1000 / 30);
      }
      
      override public function update() : void
      {
         super.update();
      }
      
      override public function reset() : void
      {
         var _loc1_:XMLList = null;
         var _loc2_:int = 0;
         var _loc3_:TDMapPathUpdateInfo = null;
         if(this.pathUpdateVec.length == 0)
         {
            _loc1_ = TDStageInfo.getInstance().updatePaths;
            if(_loc1_ && _loc1_.length() > 0)
            {
               _loc2_ = 0;
               while(_loc2_ < _loc1_.length())
               {
                  _loc3_ = new TDMapPathUpdateInfo(_loc1_[_loc2_]);
                  this.pathUpdateVec.push(_loc3_);
                  _loc2_++;
               }
            }
         }
         this.initUpdatePaths();
      }
      
      private function initUpdatePaths() : void
      {
         var _loc2_:TDMapPathUpdateInfo = null;
         var _loc1_:Number = TDGameInfo.getInstance().getCurGameTime();
         for each(_loc2_ in this.pathUpdateVec)
         {
            _loc1_ += _loc2_.delay;
            _loc2_.appearTime = _loc1_;
            _loc2_.appeared = false;
         }
      }
      
      override public function dispose() : void
      {
         super.dispose();
      }
      
      override public function pause() : void
      {
         super.pause();
      }
      
      override public function resume() : void
      {
         super.resume();
      }
      
      override public function doProcess() : void
      {
         super.doProcess();
         if(isStop)
         {
            return;
         }
         var _loc1_:uint = time;
         var _loc2_:int = 0;
         while(_loc2_ < this.pathUpdateVec.length)
         {
            if(!this.pathUpdateVec[_loc2_].appeared && this.pathUpdateVec[_loc2_].appearTime <= _loc1_)
            {
               this.pathUpdateVec[_loc2_].appeared = true;
               TDFloorCmd.updatePath(this.pathUpdateVec[_loc2_]);
            }
            _loc2_++;
         }
      }
   }
}
