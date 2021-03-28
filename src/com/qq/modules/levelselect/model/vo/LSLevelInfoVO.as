package com.qq.modules.levelselect.model.vo
{
   import PVZ.Cmd.Dto_TD_LevelInfo;
   import PVZ.Cmd.Dto_TD_RankInfo;
   import com.qq.modules.levelselect.model.templates.LSLevelTemplate;
   import com.qq.modules.levelselect.model.templates.LSLevelTemplateFactory;
   
   public class LSLevelInfoVO
   {
       
      
      public var stageId:int;
      
      public var levelId:uint;
      
      public var subLevelId:uint;
      
      public var challengeLevelId:uint;
      
      public var unlocked:Boolean = false;
      
      public var starsGot:uint;
      
      public var passed:Boolean;
      
      public var achievementList:Vector.<int>;
      
      public var plantList:Array;
      
      public var score:uint;
      
      public var promotionRewardList:Array;
      
      public var championInfo:Dto_TD_RankInfo;
      
      public var remainFreeChallengeTimes:int = 1;
      
      public var remainPayChallengeTimes:int = 1;
      
      private var _template:LSLevelTemplate;
      
      public function LSLevelInfoVO(param1:int, param2:int, param3:int = 1, param4:int = 0)
      {
         super();
         this.stageId = param1;
         this.levelId = param2;
         this.subLevelId = param3;
         this.challengeLevelId = param4;
      }
      
      public function loadDTo(param1:Dto_TD_LevelInfo) : void
      {
         this.unlocked = true;
         this.passed = true;
         this.starsGot = param1.achievementList.length;
         this.achievementList = Vector.<int>(param1.achievementList);
         this.challengeLevelId = param1.challengeLevelId;
         this.score = param1.score;
         this.promotionRewardList = param1.promotionReward;
      }
      
      public function getAchievementUnlocked(param1:int) : Boolean
      {
         var _loc2_:int = 0;
         if(this.achievementList == null)
         {
            return false;
         }
         var _loc3_:int = this.achievementList.length;
         _loc2_ = 0;
         while(_loc2_ < _loc3_)
         {
            if(this.achievementList[_loc2_] == param1)
            {
               return true;
            }
            _loc2_++;
         }
         return false;
      }
      
      public function get template() : LSLevelTemplate
      {
         if(this._template == null)
         {
            this._template = LSLevelTemplateFactory.instance.getTemplateByStageIdAndLevelId(this.stageId,this.levelId,this.subLevelId);
         }
         return this._template;
      }
      
      public function get challengeTemplate() : LSLevelTemplate
      {
         return LSLevelTemplateFactory.instance.getTemplateByChallengeId(this.stageId,this.levelId,this.subLevelId,this.challengeLevelId);
      }
      
      public function toString() : String
      {
         return "LSLevelInfoVO [" + "levelId:" + this.levelId + ", " + "subLevelId:" + this.subLevelId + ", " + "unlocked:" + this.unlocked + ", " + "passed:" + this.passed + "]";
      }
   }
}
