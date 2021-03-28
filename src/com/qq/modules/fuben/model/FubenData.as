package com.qq.modules.fuben.model
{
   import PVZ.Cmd.Cmd_Fuben_GetChapterInfo_SC;
   import PVZ.Cmd.Cmd_Fuben_GetStageInfo_SC;
   import PVZ.Cmd.Cmd_Fuben_SyncStageInfo_SC;
   import PVZ.Cmd.Dto_FightReward;
   import PVZ.Cmd.Dto_FubenSweep;
   import PVZ.Cmd.Dto_Fuben_ChapterInfo;
   import PVZ.Cmd.Dto_Fuben_StageInfo;
   import PVZ.Cmd.Dto_ItemInfo;
   import PVZ.Cmd.Dto_KillReward;
   import com.qq.constant.ItemID;
   import com.qq.modules.bag.model.BagItemTemplate;
   import com.qq.modules.fuben.FubenGlobals;
   import com.qq.modules.fuben.model.templates.FubenChapterTemplate;
   import com.qq.modules.fuben.model.templates.FubenTemplateFactory;
   import com.qq.modules.fuben.model.vo.FubenChapterVO;
   import com.qq.modules.fuben.model.vo.FubenStageVO;
   import com.qq.modules.main.model.SettingsModel;
   
   public class FubenData
   {
      
      public static var chapters:Vector.<FubenChapterVO>;
       
      
      public var fubenSweepList:Array;
      
      public function FubenData()
      {
         var _loc1_:int = 0;
         super();
         var _loc2_:Vector.<FubenChapterTemplate> = FubenTemplateFactory.instance.getAllFubenChapterTemplates();
         chapters = new Vector.<FubenChapterVO>(_loc2_.length + 1,true);
         _loc1_ = 0;
         while(_loc1_ < _loc2_.length)
         {
            chapters[_loc2_[_loc1_].id] = new FubenChapterVO(_loc2_[_loc1_].id,_loc2_[_loc1_]);
            _loc1_++;
         }
      }
      
      public static function isPassChapter(param1:int, param2:int) : Boolean
      {
         var _loc7_:FubenStageVO = null;
         if(chapters == null)
         {
            return false;
         }
         var _loc3_:FubenChapterVO = chapters[param1];
         var _loc4_:int = 0;
         var _loc5_:int = _loc3_.stages.length;
         var _loc6_:int = 0;
         while(_loc6_ < _loc5_)
         {
            if((_loc7_ = _loc3_.stages[_loc6_]).template.mode == param2)
            {
               _loc4_++;
            }
            _loc6_++;
         }
         if(_loc3_.getLastEasyStageId() >= _loc4_)
         {
            return true;
         }
         return false;
      }
      
      public function getFubenChapterVO(param1:int) : FubenChapterVO
      {
         if(chapters.length <= param1)
         {
            return null;
         }
         return chapters[param1];
      }
      
      public function getUnlockedFubenChapterVOs() : Vector.<FubenChapterVO>
      {
         var _loc1_:int = 0;
         var _loc4_:FubenChapterVO = null;
         var _loc2_:int = chapters.length;
         var _loc3_:Vector.<FubenChapterVO> = new Vector.<FubenChapterVO>();
         _loc1_ = 0;
         while(_loc1_ < _loc2_)
         {
            if((_loc4_ = chapters[_loc1_]) && _loc4_.getUnlocked())
            {
               _loc3_.push(_loc4_);
            }
            _loc1_++;
         }
         return _loc3_;
      }
      
      public function getAllFubenChapterVOs() : Vector.<FubenChapterVO>
      {
         var _loc1_:int = 0;
         var _loc4_:FubenChapterVO = null;
         var _loc2_:int = chapters.length;
         var _loc3_:Vector.<FubenChapterVO> = new Vector.<FubenChapterVO>();
         _loc1_ = 0;
         while(_loc1_ < _loc2_)
         {
            if(_loc4_ = chapters[_loc1_])
            {
               _loc3_.push(_loc4_);
            }
            _loc1_++;
         }
         return _loc3_;
      }
      
      public function getLastUnlockedElietFubenID() : int
      {
         var _loc1_:int = 0;
         var _loc3_:FubenChapterVO = null;
         var _loc5_:int = 0;
         var _loc2_:int = chapters.length;
         var _loc4_:int = 1;
         _loc1_ = 1;
         while(_loc1_ < _loc2_)
         {
            _loc3_ = chapters[_loc1_];
            if(_loc3_)
            {
               _loc5_ = _loc3_.getLastHardStageId();
               if(_loc3_.chapterId == 1)
               {
                  if(_loc3_.getLastEasyStageId() < 10)
                  {
                     return 1;
                  }
                  _loc4_ = _loc3_.chapterId;
               }
               else if(FubenData.isPassChapter(_loc3_.chapterId,FubenGlobals.FUBEN_MODE_NORMAL) && _loc3_.chapterId > _loc4_)
               {
                  _loc4_ = _loc3_.chapterId;
               }
            }
            _loc1_++;
         }
         return _loc4_;
      }
      
      public function getLastUnlockedFubenStageVo() : FubenChapterVO
      {
         var _loc1_:int = 0;
         var _loc3_:FubenChapterVO = null;
         var _loc2_:int = chapters.length;
         _loc1_ = 1;
         while(_loc1_ < _loc2_)
         {
            if(chapters[_loc1_])
            {
               if(!chapters[_loc1_].getUnlocked())
               {
                  break;
               }
               _loc3_ = chapters[_loc1_];
            }
            _loc1_++;
         }
         return _loc3_;
      }
      
      public function getFubenStageVo(param1:int, param2:int, param3:int) : FubenStageVO
      {
         return this.getFubenChapterVO(param1).getStageById(param2,param3);
      }
      
      public function loadCmd_Fuben_GetChapterInfo_SC(param1:Cmd_Fuben_GetChapterInfo_SC) : void
      {
         var _loc2_:int = 0;
         var _loc3_:Dto_Fuben_ChapterInfo = null;
         var _loc4_:FubenChapterVO = null;
         _loc2_ = 0;
         while(_loc2_ < param1.chapterinfo.length)
         {
            _loc3_ = param1.chapterinfo[_loc2_];
            (_loc4_ = chapters[_loc3_.chapterid]).loadDto(_loc3_);
            _loc2_++;
         }
      }
      
      public function loadCmd_Fuben_SyncStageInfo_SC(param1:Cmd_Fuben_SyncStageInfo_SC) : FubenStageVO
      {
         var _loc2_:FubenStageVO = null;
         _loc2_ = this.getFubenStageVo(param1.stageinfo.chapterid,param1.stageinfo.stageid,param1.stageinfo.modeid);
         _loc2_.loadDto(param1.stageinfo);
         var _loc3_:FubenStageVO = this.getFubenStageVo(param1.stageinfo.chapterid,param1.stageinfo.stageid + 1,param1.stageinfo.modeid);
         if(_loc3_ && param1.stageinfo.star > 0)
         {
            _loc3_.setUnlocked();
         }
         return _loc2_;
      }
      
      public function loadCmd_Fuben_GetStageInfo_SC(param1:Cmd_Fuben_GetStageInfo_SC) : String
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:Dto_Fuben_StageInfo = null;
         var _loc6_:int = 0;
         var _loc8_:FubenStageVO = null;
         var _loc7_:int = param1.stageinfo.length;
         _loc6_ = 0;
         while(_loc6_ < _loc7_)
         {
            _loc5_ = param1.stageinfo[_loc6_];
            (_loc8_ = this.getFubenStageVo(_loc5_.chapterid,_loc5_.stageid,_loc5_.modeid)).loadDto(_loc5_);
            _loc2_ = _loc5_.chapterid;
            _loc4_ = _loc5_.modeid;
            if(_loc3_ < _loc5_.stageid && _loc5_.star > 0)
            {
               _loc3_ = _loc5_.stageid;
            }
            _loc6_++;
         }
         _loc3_++;
         if(_loc8_ = this.getFubenStageVo(_loc2_,_loc3_,_loc4_))
         {
            _loc8_.setUnlocked();
         }
         var _loc9_:FubenChapterVO;
         (_loc9_ = this.getFubenChapterVO(_loc2_)).loadCmd_Fuben_GetStageInfo_SC(param1,_loc4_);
         return _loc2_ + "_" + _loc4_;
      }
      
      public function getSweepRewardItemList(param1:Dto_FubenSweep) : Array
      {
         var _loc2_:Array = this.getKillRewardItemList(param1.reward);
         return _loc2_.concat(this.getRewardItemList(param1.reward));
      }
      
      private function getKillRewardItemList(param1:Array) : Array
      {
         var _loc5_:Dto_FightReward = null;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:Dto_KillReward = null;
         var _loc9_:int = 0;
         var _loc10_:int = 0;
         var _loc2_:int = param1.length;
         var _loc3_:Array = [];
         var _loc4_:int = 0;
         while(_loc4_ < _loc2_)
         {
            _loc6_ = (_loc5_ = param1[_loc4_]).killRewardList.length;
            _loc7_ = 0;
            while(_loc7_ < _loc6_)
            {
               _loc9_ = (_loc8_ = _loc5_.killRewardList[_loc7_] as Dto_KillReward).itemList.length;
               _loc10_ = 0;
               while(_loc10_ < _loc9_)
               {
                  _loc3_.push(_loc8_.itemList[_loc10_]);
                  _loc10_++;
               }
               _loc7_++;
            }
            _loc4_++;
         }
         return _loc3_;
      }
      
      private function getRewardItemList(param1:Array, param2:Boolean = true) : Array
      {
         var _loc6_:Dto_FightReward = null;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:Dto_ItemInfo = null;
         var _loc10_:BagItemTemplate = null;
         var _loc3_:int = param1.length;
         var _loc4_:Array = [];
         var _loc5_:int = 0;
         while(_loc5_ < _loc3_)
         {
            _loc7_ = (_loc6_ = param1[_loc5_]).rewardItem.length;
            _loc8_ = 0;
            while(_loc8_ < _loc7_)
            {
               _loc9_ = _loc6_.rewardItem[_loc8_] as Dto_ItemInfo;
               _loc10_ = SettingsModel.instance.itemSetting.getBagItemTemplateById(_loc9_.id);
               if(param2)
               {
                  if(_loc9_.id != ItemID.Exp && _loc9_.id != ItemID.CardExp)
                  {
                     _loc4_.push(_loc9_);
                  }
               }
               else
               {
                  _loc4_.push(_loc9_);
               }
               _loc8_++;
            }
            _loc5_++;
         }
         return _loc4_;
      }
      
      public function getSweepRewardCardExpAndRoleExp(param1:Dto_FubenSweep) : Array
      {
         var _loc7_:Dto_FightReward = null;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc10_:Dto_ItemInfo = null;
         var _loc11_:BagItemTemplate = null;
         var _loc2_:Array = param1.reward;
         var _loc3_:int = _loc2_.length;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         while(_loc6_ < _loc3_)
         {
            _loc8_ = (_loc7_ = _loc2_[_loc6_]).rewardItem.length;
            _loc9_ = 0;
            while(_loc9_ < _loc8_)
            {
               _loc10_ = _loc7_.rewardItem[_loc9_] as Dto_ItemInfo;
               _loc11_ = SettingsModel.instance.itemSetting.getBagItemTemplateById(_loc10_.id);
               if(_loc10_.id == ItemID.CardExp)
               {
                  _loc5_ += _loc10_.num;
               }
               if(_loc10_.id == ItemID.Exp)
               {
                  _loc4_ += _loc10_.num;
               }
               _loc9_++;
            }
            _loc6_++;
         }
         return [_loc5_,_loc4_];
      }
   }
}
