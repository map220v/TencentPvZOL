package com.qq.modules.fuben.model.vo
{
   import PVZ.Cmd.Cmd_Fuben_GetStageInfo_SC;
   import PVZ.Cmd.Dto_Fuben_ChapterInfo;
   import com.qq.modules.fuben.FubenGlobals;
   import com.qq.modules.fuben.model.FubenData;
   import com.qq.modules.fuben.model.templates.FubenChapterTemplate;
   import com.qq.modules.fuben.model.templates.FubenTemplate;
   import com.qq.modules.fuben.model.templates.FubenTemplateFactory;
   
   public class FubenChapterVO
   {
       
      
      public var stages:Vector.<FubenStageVO>;
      
      private var _hasTakeReward:Vector.<Boolean>;
      
      private var dto:Dto_Fuben_ChapterInfo;
      
      public var chapterId:int;
      
      private var _unlocked:Boolean;
      
      private var _template:FubenChapterTemplate;
      
      private var _maxStar:int = -1;
      
      public function FubenChapterVO(param1:int, param2:FubenChapterTemplate = null)
      {
         var _loc4_:int = 0;
         this._hasTakeReward = new Vector.<Boolean>(4,true);
         super();
         this.chapterId = param1;
         var _loc3_:Vector.<FubenTemplate> = FubenTemplateFactory.instance.getFubenTemplatesByChapterId(param1);
         var _loc5_:int = _loc3_.length;
         this.stages = new Vector.<FubenStageVO>(_loc5_,true);
         _loc4_ = 0;
         while(_loc4_ < _loc5_)
         {
            this.stages[_loc4_] = new FubenStageVO(_loc3_[_loc4_].id,_loc3_[_loc4_]);
            _loc4_++;
         }
         this._template = this.template;
      }
      
      public function getUnlocked(param1:int = 1) : Boolean
      {
         if(param1 == FubenGlobals.FUBEN_MODE_ELITE)
         {
            return FubenData.isPassChapter(this.chapterId,FubenGlobals.FUBEN_MODE_NORMAL);
         }
         return this._unlocked;
      }
      
      public function loadDto(param1:Dto_Fuben_ChapterInfo) : void
      {
         this.dto = param1;
         this._unlocked = true;
      }
      
      public function loadCmd_Fuben_GetStageInfo_SC(param1:Cmd_Fuben_GetStageInfo_SC, param2:int) : void
      {
         this._hasTakeReward[param2] = param1.hasTakeReward;
      }
      
      public function get template() : FubenChapterTemplate
      {
         if(this._template == null)
         {
            this._template = FubenTemplateFactory.instance.getFubenChapterTemplateById(this.chapterId);
         }
         return this._template;
      }
      
      public function getStageById(param1:int, param2:int) : FubenStageVO
      {
         var _loc3_:int = 0;
         var _loc4_:int = this.stages.length;
         _loc3_ = 0;
         while(_loc3_ < _loc4_)
         {
            if(this.stages[_loc3_].template.stageId == param1 && this.stages[_loc3_].template.mode == param2)
            {
               return this.stages[_loc3_];
            }
            _loc3_++;
         }
         return null;
      }
      
      public function getStagesByMode(param1:int) : Vector.<FubenStageVO>
      {
         var _loc3_:int = 0;
         var _loc2_:Vector.<FubenStageVO> = new Vector.<FubenStageVO>();
         _loc3_ = 0;
         while(_loc3_ < this.stages.length)
         {
            if(this.stages[_loc3_].template.mode == param1)
            {
               _loc2_.push(this.stages[_loc3_]);
            }
            _loc3_++;
         }
         return _loc2_;
      }
      
      public function ifAllPassed(param1:int) : Boolean
      {
         var _loc3_:int = 0;
         var _loc2_:Vector.<FubenStageVO> = new Vector.<FubenStageVO>();
         _loc3_ = 0;
         while(_loc3_ < this.stages.length)
         {
            if(this.stages[_loc3_].template.mode == param1 && this.stages[_loc3_].star == 0)
            {
               return false;
            }
            _loc3_++;
         }
         return true;
      }
      
      public function getLastUnlockedChapter(param1:int) : FubenStageVO
      {
         var _loc3_:int = 0;
         var _loc4_:FubenStageVO = null;
         var _loc2_:int = this.stages.length;
         _loc3_ = 0;
         while(_loc3_ < _loc2_)
         {
            if(this.stages[_loc3_].template.mode == param1 && this.stages[_loc3_].unlocked)
            {
               _loc4_ = this.stages[_loc3_];
            }
            _loc3_++;
         }
         return _loc4_;
      }
      
      public function getTakenReward(param1:int) : Boolean
      {
         return this._hasTakeReward[param1];
      }
      
      public function setTakenReward(param1:int, param2:Boolean) : Boolean
      {
         return this._hasTakeReward[param1] = param2;
      }
      
      public function canOpenChest(param1:int) : Boolean
      {
         if(this.getTakenReward(param1))
         {
            return false;
         }
         return this.getStar(param1) >= this.getMaxStar(param1);
      }
      
      public function getStar(param1:int = 0) : int
      {
         var _loc3_:int = 0;
         if(this.dto && param1 == 0)
         {
            return this.dto.star;
         }
         var _loc2_:int = 0;
         var _loc4_:int = this.stages.length;
         _loc3_ = 0;
         while(_loc3_ < _loc4_)
         {
            if(param1 == 0 || this.stages[_loc3_].template.mode == param1)
            {
               _loc2_ += this.stages[_loc3_].star;
            }
            _loc3_++;
         }
         return _loc2_;
      }
      
      public function getMaxStar(param1:int = 0) : int
      {
         if(param1 > 0)
         {
            return this.template.getBonusTemplate(param1).starsMax;
         }
         return this.template.getBonusTemplate(1).starsMax + this.template.getBonusTemplate(2).starsMax;
      }
      
      public function getLastEasyStageId() : int
      {
         if(this.dto == null)
         {
            return -1;
         }
         return this.dto.lastEasyStageId;
      }
      
      public function getLastHardStageId() : int
      {
         if(this.dto == null)
         {
            return -1;
         }
         return this.dto.lastHardStageId;
      }
   }
}
