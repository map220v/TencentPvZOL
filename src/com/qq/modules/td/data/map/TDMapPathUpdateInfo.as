package com.qq.modules.td.data.map
{
   import com.qq.modules.td.model.vo.TDPathPointVO;
   
   public class TDMapPathUpdateInfo
   {
       
      
      public var delay:int;
      
      public var appearTime:int;
      
      public var mode:String;
      
      public var pathVec:Vector.<TDPathPointVO>;
      
      public var appeared:Boolean;
      
      public function TDMapPathUpdateInfo(param1:XML)
      {
         var _loc5_:String = null;
         var _loc6_:Array = null;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         this.pathVec = new Vector.<TDPathPointVO>();
         super();
         this.delay = int(param1.@delay);
         this.mode = String(param1.@mode);
         var _loc2_:String = String(param1.@path);
         var _loc3_:Array = _loc2_.split(";");
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_.length)
         {
            _loc6_ = (_loc5_ = _loc3_[_loc4_]).split(",");
            _loc7_ = parseInt(_loc6_[0]);
            _loc8_ = parseInt(_loc6_[1]);
            this.pathVec.push(new TDPathPointVO(_loc7_,_loc8_));
            _loc4_++;
         }
      }
   }
}
