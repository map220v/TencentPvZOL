package com.qq.modules.dummy.model
{
   import PVZ.Cmd.Dto_PuppetFuben_StageInfo;
   import com.qq.GameGloble;
   import com.qq.modules.main.constant.PrivilegeConst;
   import org.as3commons.logging.api.getLogger;
   
   public class DummyFubenStageInfo
   {
       
      
      private var _chapterID:int;
      
      private var _stageID:int;
      
      private var _levelID:int;
      
      private var _mode:int;
      
      private var _template:DummyFubenStageTemplate;
      
      private var _dto_info:Dto_PuppetFuben_StageInfo;
      
      private var _levelList:Array;
      
      private var _lostLevelID:int;
      
      public function DummyFubenStageInfo()
      {
         super();
         this._lostLevelID = 0;
      }
      
      public function reset(param1:int, param2:int, param3:int) : void
      {
         this._chapterID = param1;
         this._stageID = param3;
         this._mode = param2;
         this._template = DummyDataFactory.getInstance().getFubenStageTemplateByChapterAndMode(param1,param3,param2);
         this._levelList = DummyDataFactory.getInstance().getFubenLevelInfoListByChaperAndStage(this._chapterID,param2,this._stageID);
         this._lostLevelID = 0;
      }
      
      public function setDtoInfo(param1:Dto_PuppetFuben_StageInfo) : void
      {
         if(param1 == null)
         {
            this._dto_info = null;
         }
         else if(param1.stageId == this._stageID)
         {
            this._dto_info = param1;
         }
         else
         {
            getLogger("dummy").error("傀儡副本stageID更新不符" + this._stageID);
         }
         this._lostLevelID = 0;
      }
      
      public function get star() : int
      {
         if(this._dto_info != null)
         {
            return this._dto_info.star;
         }
         return 0;
      }
      
      public function get stageID() : int
      {
         return this._stageID;
      }
      
      public function get canSweepByVip() : Boolean
      {
         if(this._dto_info != null)
         {
            if(this._dto_info.canSweep)
            {
               return true;
            }
            if(this._dto_info.star > 0)
            {
               return true;
            }
            return false;
         }
         return false;
      }
      
      public function get canSweep() : Boolean
      {
         if(this._dto_info != null)
         {
            if(this._dto_info.canSweep)
            {
               return true;
            }
            if(this.canSweepByVip > 0 && GameGloble.privilegeProxy.hasPrivilege(PrivilegeConst.PRIVILEGE_FUBEN_SWEEP))
            {
               return true;
            }
            return this._dto_info.canSweep;
         }
         return false;
      }
      
      public function get icon() : String
      {
         if(this._template != null)
         {
            return this._template.icon.toString();
         }
         return "";
      }
      
      public function get name() : String
      {
         if(this._template != null)
         {
            return this._template.name;
         }
         return "";
      }
      
      public function get openMinLv() : int
      {
         if(this._template != null)
         {
            return this._template.openMinLv;
         }
         return 0;
      }
      
      public function get id() : int
      {
         if(this._template != null)
         {
            return this._template.id;
         }
         return DummyDataFactory.getInstance().getFubenStageID(this._chapterID,this._stageID,this._mode);
      }
      
      public function get levelList() : Array
      {
         if(this._levelList == null)
         {
            return new Array();
         }
         return this._levelList;
      }
      
      public function get totalLevel() : int
      {
         if(this._levelList == null)
         {
            return 0;
         }
         return this._levelList.length;
      }
      
      public function get levelID() : int
      {
         return this._levelID;
      }
      
      public function set levelID(param1:int) : void
      {
         this._levelID = param1;
      }
      
      public function get lootItemIDList() : Array
      {
         if(this._template != null)
         {
            return this._template.getLootItemIDList();
         }
         return [];
      }
      
      public function get totalLimitTimes() : int
      {
         if(this._template != null)
         {
            return this._template.fightLimit;
         }
         return 0;
      }
      
      public function get leftTimes() : int
      {
         if(this._dto_info != null)
         {
            return this._dto_info.times;
         }
         return 10;
      }
      
      public function get recommandFP() : int
      {
         var _loc2_:DummyFubenLevelTemplate = null;
         var _loc1_:Array = this.levelList;
         if(_loc1_.length > 0)
         {
            _loc2_ = this.levelList[_loc1_.length - 1];
            return _loc2_.recommandFP;
         }
         return 0;
      }
      
      public function get lostLevelID() : int
      {
         return this._lostLevelID;
      }
      
      public function set lostLevelID(param1:int) : void
      {
         this._lostLevelID = param1;
      }
      
      public function clean() : void
      {
         this._levelID = 1;
         this._lostLevelID = 0;
      }
   }
}
