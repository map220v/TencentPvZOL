package com.qq.modules.levelselect.model.vo
{
   import com.tencent.protobuf.Int64;
   
   public class LSChallengeLevelRankVO
   {
       
      
      public var rank:uint;
      
      public var roleId:Int64;
      
      public var roleName:String;
      
      public var score:uint;
      
      public var time:int;
      
      public var QQFaceUrl:String;
      
      public var faceId:uint;
      
      public var stageId:int;
      
      public var levelId:int;
      
      public var subLevelId:int;
      
      public var challengeLevelId:int;
      
      public function LSChallengeLevelRankVO()
      {
         super();
      }
   }
}
