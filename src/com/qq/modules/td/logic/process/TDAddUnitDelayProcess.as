package com.qq.modules.td.logic.process
{
   import com.qq.modules.td.command.game.TDGameObjectCmd;
   import com.qq.modules.td.model.TDGameInfo;
   import com.qq.modules.td.model.vo.TDUnitInitVO;
   
   public class TDAddUnitDelayProcess extends TDBasicProcess implements IProcess
   {
      
      public static var ID:uint = 10;
       
      
      private var unitVec:Vector.<TDUnitInitVO>;
      
      private var dealedVec:Vector.<TDUnitInitVO>;
      
      private var startTime:int;
      
      public function TDAddUnitDelayProcess()
      {
         this.unitVec = new Vector.<TDUnitInitVO>();
         this.dealedVec = new Vector.<TDUnitInitVO>();
         super();
         updateDuration = int(1000 / 30);
      }
      
      override public function update() : void
      {
         super.update();
      }
      
      override public function reset() : void
      {
         this.dealedVec = new Vector.<TDUnitInitVO>();
         this.startTime = TDGameInfo.getInstance().getCurGameTime();
      }
      
      override public function dispose() : void
      {
         this.unitVec = new Vector.<TDUnitInitVO>();
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
         while(_loc2_ < this.unitVec.length)
         {
            if(this.startTime + this.unitVec[_loc2_].delay <= _loc1_ && this.dealedVec.indexOf(this.unitVec[_loc2_]) < 0)
            {
               this.dealedVec.push(this.unitVec[_loc2_]);
               TDGameObjectCmd.addGameObjectByTDUnitInitVO(this.unitVec[_loc2_]);
            }
            _loc2_++;
         }
      }
      
      public function addDelayUnit(param1:TDUnitInitVO) : void
      {
         this.unitVec.push(param1);
      }
   }
}
