package com.qq.modules.arena.model
{
   import PVZ.Cmd.Dto_ArenaRecorder;
   import com.qq.modules.arena.constant.ArenaConst;
   import flash.display.DisplayObject;
   import org.robotlegs.mvcs.Actor;
   
   public class ArenaModel extends Actor
   {
       
      
      public var recorderInfoList:Array;
      
      public var topPlayerInfoList:Array;
      
      public var serverTopGrade:uint;
      
      public var curRank:uint;
      
      public var curScore:uint;
      
      public var curGrade:uint;
      
      public var curFeatureId:uint;
      
      public var nextGrade:uint;
      
      public var nextFeatureId:uint;
      
      public var ydayRank:uint;
      
      public var ydayGradeResult:uint;
      
      public var rewardList:Array;
      
      public var hasGetReward:Boolean;
      
      public var displayWin:DisplayObject;
      
      public var coolTime:uint;
      
      public var leftFightNum:uint;
      
      public var isAutoOpenDaily:Boolean = true;
      
      public function ArenaModel()
      {
         super();
      }
      
      public function init() : void
      {
         this.recorderInfoList = [];
         this.topPlayerInfoList = [];
         this.rewardList = [];
      }
      
      public function addRecorder(param1:Dto_ArenaRecorder) : void
      {
         this.recorderInfoList.push(param1);
         if(this.recorderInfoList.length > ArenaConst.MAX_RECORDER_NUM)
         {
            this.recorderInfoList.pop();
         }
      }
      
      public function getRecorder(param1:int) : Dto_ArenaRecorder
      {
         return this.recorderInfoList[param1];
      }
   }
}
