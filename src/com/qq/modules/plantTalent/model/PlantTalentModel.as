package com.qq.modules.plantTalent.model
{
   import PVZ.Cmd.Dto_PlantInfo;
   import PVZ.Cmd.Dto_TalentInfo;
   import com.qq.display.QCanvas;
   import com.qq.modules.basic.event.CommonEvent;
   import com.qq.modules.main.model.ActorModel;
   import com.qq.modules.main.model.SettingsModel;
   import com.qq.modules.main.model.settings.plantTalent.PlantTalentSetting;
   import com.qq.modules.plantTalent.constant.PlantTalentConst;
   import flash.utils.Dictionary;
   import org.robotlegs.mvcs.Actor;
   
   public class PlantTalentModel extends Actor
   {
       
      
      [Inject]
      public var actorModel:ActorModel;
      
      public var curStageId:int;
      
      private var _curTalentList:Array;
      
      private var _curUnlockPlantList:Array;
      
      private var _curTalentDic:Dictionary;
      
      private var m_talentDic:Dictionary;
      
      public var plantTalentWindow:QCanvas;
      
      public var isShowAllPlant:Boolean = false;
      
      public var cacheNewStudyTalentId:int = 0;
      
      public function PlantTalentModel()
      {
         this.m_talentDic = new Dictionary();
         super();
      }
      
      public function get curTalentList() : Array
      {
         return this._curTalentList;
      }
      
      public function get curUnlockPlantList() : Array
      {
         return this._curUnlockPlantList;
      }
      
      public function setUnlockPlantList(param1:Array, param2:Array) : void
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:PlantTalentSetting = null;
         this._curUnlockPlantList = param1;
         this._curTalentList = [];
         this._curTalentDic = new Dictionary();
         _loc4_ = 0;
         while(_loc4_ < param2.length)
         {
            this._curTalentList.push(param2[_loc4_].talentId);
            this.m_talentDic[param2[_loc4_].talentId] = param2[_loc4_];
            _loc4_++;
         }
         _loc3_ = this._curUnlockPlantList.length;
         _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            this._curTalentDic[(this._curUnlockPlantList[_loc4_] as Dto_PlantInfo).plantId] = [];
            _loc4_++;
         }
         _loc3_ = this._curTalentList.length;
         _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            _loc5_ = SettingsModel.instance.plantTalentSets.getPlantTalentSetById(this._curTalentList[_loc4_]);
            if(!this._curTalentDic[_loc5_.plantId])
            {
               this._curTalentDic[_loc5_.plantId] = [];
            }
            (this._curTalentDic[_loc5_.plantId] as Array).push(_loc5_.id);
            _loc4_++;
         }
         dispatch(new CommonEvent(PlantTalentConst.PT_DATA_UPDATE));
      }
      
      public function setTalentStudy(param1:int) : void
      {
         var _loc2_:PlantTalentSetting = SettingsModel.instance.plantTalentSets.getPlantTalentSetById(param1);
         var _loc3_:int = _loc2_.plantId;
         var _loc4_:Array;
         (_loc4_ = this._curTalentDic[_loc3_]).push(param1);
         this._curTalentList.push(param1);
         (this.m_talentDic[param1] as Dto_TalentInfo).hasStudy = true;
         (this.m_talentDic[param1] as Dto_TalentInfo).satisfyPower = true;
         (this.m_talentDic[param1] as Dto_TalentInfo).satisfyCondition = true;
         this.cacheNewStudyTalentId = param1;
         dispatch(new CommonEvent(PlantTalentConst.PT_DATA_UPDATE));
         dispatch(new CommonEvent(PlantTalentConst.PT_NEW_STUDYED));
      }
      
      public function hasTalentStudyed(param1:int, param2:int) : Boolean
      {
         var _loc6_:Dto_TalentInfo = null;
         var _loc3_:Array = this._curTalentDic[param1];
         if(!_loc3_)
         {
            return false;
         }
         var _loc4_:int = _loc3_.length;
         var _loc5_:int = 0;
         while(_loc5_ < _loc4_)
         {
            _loc6_ = this.getTalentInfoById(param2);
            if(_loc3_[_loc5_] == param2 && _loc6_ && _loc6_.hasStudy)
            {
               return true;
            }
            _loc5_++;
         }
         return false;
      }
      
      public function hasPlantActivated(param1:int) : Boolean
      {
         var _loc2_:Array = this._curTalentDic[param1];
         if(!_loc2_)
         {
            return false;
         }
         return true;
      }
      
      public function hasNewPlant(param1:int) : Boolean
      {
         var _loc3_:int = 0;
         var _loc4_:Dto_PlantInfo = null;
         var _loc2_:int = this._curUnlockPlantList.length;
         _loc3_ = 0;
         while(_loc3_ < _loc2_)
         {
            if((_loc4_ = this._curUnlockPlantList[_loc3_] as Dto_PlantInfo).plantId == param1)
            {
               if(_loc4_.isNew == true)
               {
                  return true;
               }
               return false;
            }
            _loc3_++;
         }
         return false;
      }
      
      public function clearCurStageNewPlantTag() : void
      {
         var _loc2_:int = 0;
         var _loc3_:Dto_PlantInfo = null;
         var _loc1_:int = this._curUnlockPlantList.length;
         _loc2_ = 0;
         while(_loc2_ < _loc1_)
         {
            _loc3_ = this._curUnlockPlantList[_loc2_] as Dto_PlantInfo;
            _loc3_.isNew = false;
            _loc2_++;
         }
      }
      
      public function getTalentInfoById(param1:int) : Dto_TalentInfo
      {
         return this.m_talentDic[param1];
      }
      
      public function getTalentLevelByPlant(param1:int) : int
      {
         var _loc4_:uint = 0;
         var _loc5_:Dto_TalentInfo = null;
         var _loc6_:PlantTalentSetting = null;
         var _loc2_:int = 0;
         var _loc3_:Array = [];
         for each(_loc5_ in this.m_talentDic)
         {
            if(_loc5_.hasStudy)
            {
               if((_loc6_ = SettingsModel.instance.plantTalentSets.getPlantTalentSetById(_loc5_.talentId)).plantId == param1)
               {
                  _loc4_++;
                  if(_loc2_ < _loc5_.talentId)
                  {
                     _loc2_ = _loc5_.talentId;
                     _loc3_.push(_loc5_.talentId);
                  }
               }
            }
         }
         return _loc4_;
      }
   }
}
