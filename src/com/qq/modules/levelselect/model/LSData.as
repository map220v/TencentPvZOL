package com.qq.modules.levelselect.model
{
   import PVZ.Cmd.Cmd_TD_GetStageInfo_SC;
   import PVZ.Cmd.Dto_TD_ChallengeTimes;
   import PVZ.Cmd.Dto_TD_ChampionInfo;
   import PVZ.Cmd.Dto_TD_LevelInfo;
   import com.qq.modules.levelselect.model.templates.LSGateTemplate;
   import com.qq.modules.levelselect.model.templates.LSGateTemplateFactory;
   import com.qq.modules.levelselect.model.templates.LSLevelTemplate;
   import com.qq.modules.levelselect.model.templates.LSLevelTemplateFactory;
   import com.qq.modules.levelselect.model.vo.LSGateInfoVO;
   import com.qq.modules.levelselect.model.vo.LSLevelInfoVO;
   
   public class LSData
   {
       
      
      var $stageId:uint = 1;
      
      var levels:Vector.<LSLevelInfoVO>;
      
      var gates:Vector.<LSGateInfoVO>;
      
      var $star:int;
      
      var $hasSwapTD:Boolean;
      
      public function LSData()
      {
         super();
      }
      
      public function get stageId() : int
      {
         return this.$stageId;
      }
      
      public function get star() : int
      {
         return this.$star;
      }
      
      public function get hasSwapTD() : Boolean
      {
         return this.$hasSwapTD;
      }
      
      public function set hasSwapTD(param1:Boolean) : void
      {
         this.$hasSwapTD = param1;
      }
      
      public function loadCmd_TD_GetStageInfo_SC(param1:Cmd_TD_GetStageInfo_SC) : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:LSLevelInfoVO = null;
         var _loc5_:Dto_TD_LevelInfo = null;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:LSGateInfoVO = null;
         var _loc10_:int = 0;
         var _loc11_:int = 0;
         var _loc12_:Dto_TD_ChallengeTimes = null;
         var _loc13_:Dto_TD_ChampionInfo = null;
         this.$stageId = param1.stageId;
         this.$star = param1.star;
         if(this.levels == null)
         {
            this.buildLevelsFromTemplate();
         }
         var _loc9_:Array = [];
         _loc7_ = param1.levelInfoList.length;
         _loc3_ = 0;
         while(_loc3_ < _loc7_)
         {
            _loc5_ = param1.levelInfoList[_loc3_];
            if(_loc9_[_loc5_.levelId] == null)
            {
               _loc9_[_loc5_.levelId] = 2;
            }
            if(_loc9_[_loc5_.levelId + 1] == null)
            {
               _loc9_[_loc5_.levelId + 1] = 1;
            }
            if(_loc5_.subLevelId + 1 > _loc9_[_loc5_.levelId])
            {
               _loc9_[_loc5_.levelId] = _loc5_.subLevelId + 1;
            }
            _loc3_++;
         }
         _loc7_ = param1.gateList.length;
         _loc6_ = this.gates.length;
         _loc2_ = 0;
         while(_loc2_ < _loc6_)
         {
            if((_loc8_ = this.gates[_loc2_]) && (_loc8_.stageId == 1 || _loc8_.stageId == 2) && this.$hasSwapTD)
            {
               _loc8_.visible = false;
               _loc8_.unlocked = true;
            }
            else
            {
               _loc8_.visible = _loc9_[_loc8_.levelId] != null && _loc8_.subLevelId <= _loc9_[_loc8_.levelId];
               _loc3_ = 0;
               while(_loc3_ < _loc7_)
               {
                  _loc10_ = param1.gateList[_loc3_];
                  if(_loc8_.template.gateId == _loc10_)
                  {
                     _loc8_.unlocked = true;
                     break;
                  }
                  _loc3_++;
               }
            }
            _loc2_++;
         }
         _loc7_ = param1.levelInfoList.length;
         _loc6_ = this.levels.length;
         _loc2_ = 0;
         while(_loc2_ < _loc6_)
         {
            _loc4_ = this.levels[_loc2_];
            _loc3_ = 0;
            while(_loc3_ < _loc7_)
            {
               _loc5_ = param1.levelInfoList[_loc3_];
               if(_loc4_.levelId == _loc5_.levelId && _loc4_.subLevelId == _loc5_.subLevelId)
               {
                  if(_loc4_.challengeLevelId == _loc5_.challengeLevelId)
                  {
                     _loc4_.loadDTo(_loc5_);
                     break;
                  }
               }
               _loc3_++;
            }
            if(!_loc4_.unlocked && _loc3_ == _loc7_)
            {
               if((_loc8_ = this.getGateByLevelId(_loc4_.levelId,_loc4_.subLevelId)) && (_loc8_.stageId == 1 || _loc8_.stageId == 2) && this.$hasSwapTD)
               {
                  _loc4_.unlocked = true;
               }
               else if(_loc8_ && !_loc8_.unlocked)
               {
                  _loc4_.unlocked = false;
               }
               else
               {
                  _loc4_.unlocked = _loc4_.subLevelId <= _loc9_[_loc4_.levelId];
               }
            }
            _loc2_++;
         }
         _loc2_ = 0;
         while(_loc2_ < _loc6_)
         {
            _loc4_ = this.levels[_loc2_];
            _loc3_ = 0;
            while(_loc3_ < _loc7_)
            {
               _loc11_ = 0;
               while(_loc11_ < param1.challengeTimes.length)
               {
                  if((_loc12_ = param1.challengeTimes[_loc11_]).levelId == _loc4_.levelId && _loc12_.subLevelId == _loc4_.subLevelId && _loc12_.challengeLevelId == _loc4_.challengeLevelId)
                  {
                     if(_loc12_.challengeTimes == 0)
                     {
                        _loc4_.remainFreeChallengeTimes = 1;
                        _loc4_.remainPayChallengeTimes = 1;
                     }
                     else if(_loc12_.challengeTimes == 1)
                     {
                        _loc4_.remainFreeChallengeTimes = 0;
                        _loc4_.remainPayChallengeTimes = 1;
                     }
                     else
                     {
                        _loc4_.remainFreeChallengeTimes = 0;
                        _loc4_.remainPayChallengeTimes = 0;
                     }
                  }
                  _loc11_++;
               }
               _loc11_ = 0;
               while(_loc11_ < param1.championInfo.length)
               {
                  if((_loc13_ = param1.championInfo[_loc11_]).levelId == _loc4_.levelId && _loc13_.subLevelId == _loc4_.subLevelId && _loc13_.challengeLevelId == _loc4_.challengeLevelId)
                  {
                     _loc4_.championInfo = _loc13_.info;
                  }
                  _loc11_++;
               }
               _loc3_++;
            }
            _loc2_++;
         }
      }
      
      public function getGateById(param1:int) : LSGateInfoVO
      {
         var _loc3_:int = 0;
         var _loc4_:LSGateInfoVO = null;
         var _loc2_:int = this.gates.length;
         _loc3_ = 0;
         while(_loc3_ < _loc2_)
         {
            if((_loc4_ = this.gates[_loc3_]).template.gateId == param1)
            {
               return _loc4_;
            }
            _loc3_++;
         }
         return null;
      }
      
      public function getGateByLevelId(param1:int, param2:int) : LSGateInfoVO
      {
         var _loc4_:int = 0;
         var _loc5_:LSGateInfoVO = null;
         var _loc3_:int = this.gates.length;
         _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            if((_loc5_ = this.gates[_loc4_]).levelId == param1 && _loc5_.subLevelId == param2)
            {
               return _loc5_;
            }
            _loc4_++;
         }
         return null;
      }
      
      public function getLevelByLevelId(param1:int, param2:int) : LSLevelInfoVO
      {
         var _loc4_:int = 0;
         var _loc5_:LSLevelInfoVO = null;
         var _loc3_:int = this.levels.length;
         _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            if((_loc5_ = this.levels[_loc4_]).levelId == param1 && _loc5_.subLevelId == param2)
            {
               return _loc5_;
            }
            _loc4_++;
         }
         return null;
      }
      
      public function getLastMainLevel() : LSLevelInfoVO
      {
         var _loc2_:int = 0;
         var _loc3_:LSLevelInfoVO = null;
         var _loc1_:int = this.levels.length;
         _loc2_ = 0;
         while(_loc2_ < _loc1_)
         {
            if(this.levels[_loc2_].unlocked && this.levels[_loc2_].subLevelId == 1)
            {
               if(_loc3_ == null)
               {
                  _loc3_ = this.levels[_loc2_];
               }
               else if(_loc3_.levelId < this.levels[_loc2_].levelId)
               {
                  _loc3_ = this.levels[_loc2_];
               }
            }
            _loc2_++;
         }
         return _loc3_;
      }
      
      public function buildLevelsFromTemplate() : void
      {
         var _loc3_:int = 0;
         var _loc4_:LSLevelTemplate = null;
         var _loc5_:LSLevelInfoVO = null;
         var _loc7_:LSGateTemplate = null;
         var _loc8_:LSGateInfoVO = null;
         this.levels = new Vector.<LSLevelInfoVO>();
         this.gates = new Vector.<LSGateInfoVO>();
         var _loc1_:Vector.<LSLevelTemplate> = LSLevelTemplateFactory.instance.getTemplatesByStageId(this.stageId);
         var _loc2_:int = _loc1_.length;
         _loc3_ = 0;
         while(_loc3_ < _loc2_)
         {
            _loc4_ = _loc1_[_loc3_];
            _loc5_ = new LSLevelInfoVO(this.stageId,_loc4_.levelId,_loc4_.subLevelId,_loc4_.challengeLevelId);
            this.levels.push(_loc5_);
            if(_loc5_ && (_loc5_.stageId == 1 || _loc5_.stageId == 2) && this.$hasSwapTD)
            {
               _loc5_.unlocked = true;
            }
            else if(_loc4_.levelId == 1 && _loc4_.subLevelId == 1)
            {
               _loc5_.unlocked = true;
            }
            _loc3_++;
         }
         var _loc6_:Vector.<LSGateTemplate>;
         _loc2_ = (_loc6_ = LSGateTemplateFactory.instance.getTemplatesByStageId(this.stageId)).length;
         _loc3_ = 0;
         while(_loc3_ < _loc2_)
         {
            _loc7_ = _loc6_[_loc3_];
            _loc8_ = new LSGateInfoVO(this.stageId,_loc7_.levelId,_loc7_.subLevelId);
            this.gates.push(_loc8_);
            if(_loc7_ && (_loc7_.stageId == 1 || _loc7_.stageId == 2) && this.$hasSwapTD)
            {
               _loc8_.unlocked = true;
            }
            else if(_loc7_.levelId == 1 && _loc7_.subLevelId == 1)
            {
               _loc8_.unlocked = true;
            }
            _loc3_++;
         }
      }
   }
}
