package com.qq.modules.td.logic.unit.object
{
   import com.qq.constant.td.TDConstant;
   import com.qq.modules.td.data.game.unit.TDNormalObjectData;
   import com.qq.modules.td.data.game.unit.basic.TDGameObjectData;
   import flash.geom.Point;
   
   public class TDSunBombTrack extends TDNormalObject
   {
       
      
      public var trackData:TDNormalObjectData;
      
      public var targetPoint:Point;
      
      public function TDSunBombTrack()
      {
         super();
         this.targetPoint = new Point();
      }
      
      override public function setData(param1:TDGameObjectData) : void
      {
         super.setData(param1);
         this.trackData = param1 as TDNormalObjectData;
         setAction(TDConstant.TDSunBombTrackAction_Idle);
      }
      
      override public function update() : void
      {
         super.update();
      }
      
      override public function Dispose() : void
      {
         super.Dispose();
      }
      
      public function disappear() : void
      {
         setAction(TDConstant.TDSunBombTrackAction_Disappear);
      }
   }
}
