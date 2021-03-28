package com.qq.modules.topKing.model
{
   import com.qq.modules.topKing.model.templates.ce.TopKingStageInfoCE;
   
   public class TopKingStageInfo extends TopKingStageInfoCE
   {
       
      
      public var rewardItemID:int;
      
      public var rewardItemNum:int;
      
      public function TopKingStageInfo()
      {
         super();
      }
      
      override public function load(param1:Object) : void
      {
         super.load(param1);
         var _loc2_:Array = rewardStr.split(":");
         if(_loc2_.length == 2)
         {
            this.rewardItemID = _loc2_[0];
            this.rewardItemNum = _loc2_[1];
         }
      }
   }
}
