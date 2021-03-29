package com.qq.modules.levelselect.model.vo
{
   import com.tencent.protobuf.Int64;
   
   public class LSChallengeScoreRankVO
   {
       
      
      public var rank:uint;
      
      public var roleId:Int64;
      
      public var roleName:String;
      
      public var level:uint;
      
      public var score:uint;
      
      public var time:uint;
      
      public var QQFaceUrl:String;
      
      public var faceId:uint;
      
      public function LSChallengeScoreRankVO()
      {
         super();
      }
   }
}
