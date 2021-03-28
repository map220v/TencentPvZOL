package com.qq.modules.union.model
{
   import com.tencent.protobuf.Int64;
   
   public class PlayerUnionInfo
   {
       
      
      public var id:Int64;
      
      public var name:String;
      
      public var lastLeaveUnionTime:Number;
      
      public var inviteNum:int;
      
      public var applyUnionList:Array;
      
      public var position:int;
      
      public var leftFertilizerTimes:int;
      
      public var level:int;
      
      public var cohesion:uint;
      
      public var dailyDonate:int;
      
      public function PlayerUnionInfo()
      {
         super();
         this.clean();
      }
      
      public function isVaild() : Boolean
      {
         return this.id.low != 0;
      }
      
      public function get isApplyUnion() : Boolean
      {
         return this.applyUnionList != null && this.applyUnionList.length > 0;
      }
      
      public function clean() : void
      {
         this.id = new Int64(0);
         this.applyUnionList = null;
         this.name = null;
         this.lastLeaveUnionTime = 0;
         this.inviteNum = 0;
      }
   }
}
