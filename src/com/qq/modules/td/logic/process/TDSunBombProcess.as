package com.qq.modules.td.logic.process
{
   import com.qq.constant.td.TDObjTypeID;
   import com.qq.modules.td.command.game.TDGameObjectCmd;
   import com.qq.modules.td.data.map.TDMapSunBombInfo;
   import com.qq.modules.td.data.map.TDMapTileData;
   import com.qq.modules.td.model.TDGameInfo;
   import com.qq.modules.td.model.TDStageInfo;
   
   public class TDSunBombProcess extends TDBasicProcess implements IProcess
   {
      
      public static var ID:uint = 8;
       
      
      public var generateSunNum:uint;
      
      private var m_sunBombVec:Vector.<TDMapSunBombInfo>;
      
      public function TDSunBombProcess()
      {
         super();
         updateDuration = int(1000 / 30);
      }
      
      override public function update() : void
      {
         super.update();
      }
      
      override public function reset() : void
      {
         this.generateSunNum = 0;
         this.m_sunBombVec = TDStageInfo.getInstance().sunBombVec.concat();
         this.initSunBombs();
      }
      
      private function initSunBombs() : void
      {
         var _loc2_:TDMapSunBombInfo = null;
         var _loc1_:Number = TDGameInfo.getInstance().getCurGameTime();
         for each(_loc2_ in this.m_sunBombVec)
         {
            _loc1_ += _loc2_.delay;
            _loc2_.appear_time = _loc1_;
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
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:TDMapTileData = null;
         super.doProcess();
         if(isStop)
         {
            return;
         }
         var _loc1_:uint = time;
         while(this.m_sunBombVec.length > 0 && this.m_sunBombVec[0].appear_time <= _loc1_)
         {
            _loc4_ = TDGameInfo.getInstance().getRoadTileInf(this.m_sunBombVec[0].column - 1,this.m_sunBombVec[0].row);
            _loc2_ = int(_loc4_.rect.x + _loc4_.rect.width * 0.5);
            _loc3_ = int(_loc4_.rect.y + _loc4_.rect.height * 0.5);
            TDGameObjectCmd.generateSunBomb(TDObjTypeID.Obj_SunBomb,TDObjTypeID.Obj_SunBombTrack,_loc2_,_loc3_,this.m_sunBombVec[0].isBig,this.m_sunBombVec[0].speed);
            this.m_sunBombVec.shift();
            ++this.generateSunNum;
         }
      }
   }
}
