package com.qq.modules.td.model.vo
{
   public class TDPathVO
   {
      
      public static const COL_MAX:int = 20;
       
      
      public var pathCells:Vector.<TDPathPointVO>;
      
      public var pathId:int;
      
      public var type:int;
      
      public var roadIndex:int;
      
      public var order:int;
      
      public var vectorType:int = 6;
      
      public function TDPathVO(param1:XML = null, param2:int = 0)
      {
         this.pathCells = new Vector.<TDPathPointVO>();
         super();
         if(param1)
         {
            this.loadXml(param1);
         }
         if(param2 > 0)
         {
            this.roadIndex = param2 + 1;
         }
      }
      
      public function loadXml(param1:XML) : void
      {
         var _loc2_:int = 0;
         var _loc4_:Array = null;
         var _loc5_:Array = null;
         this.pathId = param1.@pathId;
         this.type = param1.@type;
         this.order = param1.@order;
         var _loc3_:String = param1.@path;
         if(_loc3_.length > 1)
         {
            _loc5_ = _loc3_.split(";");
            _loc2_ = 0;
            while(_loc2_ < _loc5_.length)
            {
               _loc4_ = String(_loc5_[_loc2_]).split(",");
               this.pathCells.push(TDPathPointVO.getNewPathPointVO(_loc4_));
               if(_loc2_ == 0)
               {
                  this.roadIndex = _loc4_[0];
               }
               _loc2_++;
            }
            this.pathCells.push(new TDPathPointVO(_loc4_[0],COL_MAX));
         }
         else
         {
            this.pathCells.push(new TDPathPointVO(this.roadIndex,COL_MAX));
         }
      }
      
      public function clone() : TDPathVO
      {
         var _loc1_:TDPathVO = new TDPathVO();
         _loc1_.pathCells = this.pathCells.slice();
         _loc1_.pathId = this.pathId;
         _loc1_.type = this.type;
         _loc1_.roadIndex = this.roadIndex;
         _loc1_.order = this.order;
         _loc1_.vectorType = this.vectorType;
         return _loc1_;
      }
   }
}
