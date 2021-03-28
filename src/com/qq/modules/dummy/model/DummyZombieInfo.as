package com.qq.modules.dummy.model
{
   import PVZ.Cmd.Dto_FightPuppetInfo;
   import PVZ.Cmd.Dto_FightPuppetSkillInfo;
   import PVZ.Cmd.Dto_PuppetFullInfo;
   import PVZ.Cmd.Dto_PuppetSkillInfo;
   import PVZ.Cmd.Dto_PuppetSparInfo;
   import com.qq.GameGloble;
   import com.qq.modules.dummy.DummyConst;
   import com.qq.modules.dummy.DummyGlobel;
   import com.qq.modules.dummy.model.templates.ce.DummyLevelTemplateCE;
   import com.qq.modules.dummy.model.templates.ce.DummyPropTemplateCE;
   
   public class DummyZombieInfo
   {
       
      
      public var id:int;
      
      private var _template:DummyZombieTemplate;
      
      private var _equipmentList:Array;
      
      private var _fullInfo:Dto_PuppetFullInfo;
      
      private var _batteDummyInfo:Dto_FightPuppetInfo;
      
      public function DummyZombieInfo(param1:int)
      {
         super();
         this.id = param1;
         this._template = DummyDataFactory.getInstance().getDummyZombieInfoByID(param1);
         this._equipmentList = new Array();
      }
      
      public function resetDtoInfo(param1:Object) : void
      {
         var _loc2_:Array = null;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:Dto_PuppetSparInfo = null;
         if(param1 is Dto_PuppetFullInfo)
         {
            this._fullInfo = param1 as Dto_PuppetFullInfo;
            this.cleanAllEquipment();
            _loc2_ = this._fullInfo.spar;
            if(_loc2_ != null)
            {
               _loc3_ = _loc2_.length;
               _loc4_ = 0;
               while(_loc4_ < _loc3_)
               {
                  if((_loc5_ = _loc2_[_loc4_]).level != 0)
                  {
                     this.resetEquipmentInfo(_loc4_ + 1,_loc5_.quality,_loc5_.level);
                  }
                  _loc4_++;
               }
            }
         }
         else if(param1 is Dto_FightPuppetInfo)
         {
            this._batteDummyInfo = param1 as Dto_FightPuppetInfo;
         }
      }
      
      public function getTemplate() : DummyZombieTemplate
      {
         return this._template;
      }
      
      public function get iconID() : String
      {
         if(this._template == null)
         {
            return "";
         }
         return this._template.iconID;
      }
      
      public function get level() : int
      {
         if(this._fullInfo != null)
         {
            return this._fullInfo.level;
         }
         if(this._batteDummyInfo != null)
         {
            return this._batteDummyInfo.level;
         }
         return 1;
      }
      
      public function set level(param1:int) : void
      {
         if(this._fullInfo != null)
         {
            this._fullInfo.level = param1;
         }
         else if(this._batteDummyInfo != null)
         {
            this._batteDummyInfo.level = param1;
         }
      }
      
      public function get quilty() : int
      {
         if(this._fullInfo != null)
         {
            return this._fullInfo.quality;
         }
         if(this._batteDummyInfo != null)
         {
            return this._batteDummyInfo.quality;
         }
         if(this._template != null)
         {
            return this._template.compositeQuilty;
         }
         return 100;
      }
      
      public function set quilty(param1:int) : void
      {
         if(this._fullInfo != null)
         {
            this._fullInfo.quality = param1;
         }
         if(this._batteDummyInfo != null)
         {
            this._batteDummyInfo.quality = param1;
         }
      }
      
      public function get quiltyType() : int
      {
         return int(this.quilty / 100);
      }
      
      public function get quitlyLv() : int
      {
         return int(this.quilty % 10);
      }
      
      public function get star() : int
      {
         if(this._fullInfo != null)
         {
            return this._fullInfo.star;
         }
         if(this._batteDummyInfo != null)
         {
            return this._batteDummyInfo.star;
         }
         if(this._template != null)
         {
            return this._template.compositeStar;
         }
         return 1;
      }
      
      public function set star(param1:int) : void
      {
         if(this._fullInfo != null)
         {
            this._fullInfo.star = param1;
         }
         if(this._batteDummyInfo != null)
         {
            this._batteDummyInfo.star = param1;
         }
      }
      
      public function get name() : String
      {
         if(this._template == null)
         {
            return null;
         }
         return this._template.name;
      }
      
      public function get rarity() : int
      {
         if(this._template == null)
         {
            return 1;
         }
         return this._template.rarity;
      }
      
      public function get activeSkillId() : int
      {
         if(this._fullInfo != null && this._fullInfo.activeSkill != null)
         {
            return this._fullInfo.activeSkill.id;
         }
         if(this._batteDummyInfo != null && this._batteDummyInfo.activeSkill != null)
         {
            return this._batteDummyInfo.activeSkill.id;
         }
         if(this._template == null)
         {
            return 0;
         }
         return this._template.activeSkillId;
      }
      
      public function get activeSkillLevel() : int
      {
         if(this._fullInfo != null && this._fullInfo.activeSkill != null)
         {
            return this._fullInfo.activeSkill.level;
         }
         if(this._batteDummyInfo != null && this._batteDummyInfo.activeSkill != null)
         {
            return this._batteDummyInfo.activeSkill.level;
         }
         return 1;
      }
      
      public function set activeSkillLevel(param1:int) : void
      {
         if(this._fullInfo != null && this._fullInfo.activeSkill != null)
         {
            this._fullInfo.activeSkill.level = param1;
         }
         if(this._batteDummyInfo != null && this._batteDummyInfo.activeSkill != null)
         {
            this._batteDummyInfo.passiveSkill.level = param1;
         }
      }
      
      public function get activeSkillName() : String
      {
         if(this.activeSkillId == 0)
         {
            return "";
         }
         var _loc1_:DummyZombieSkillTemplate = DummyDataFactory.getInstance().getSkillInfoByID(this.activeSkillId);
         return _loc1_.name;
      }
      
      public function get activeSkillDesc() : String
      {
         return DummyGlobel.getSkillDesc(this.activeSkillId,this.activeSkillLevel);
      }
      
      public function setSkillInfo(param1:int, param2:int, param3:Boolean) : void
      {
         var _loc4_:Dto_PuppetSkillInfo = null;
         var _loc5_:Dto_FightPuppetSkillInfo = null;
         if(this._fullInfo != null)
         {
            if(param3)
            {
               _loc4_ = this._fullInfo.passiveSkill;
            }
            else
            {
               _loc4_ = this._fullInfo.activeSkill;
            }
         }
         if(_loc4_ != null)
         {
            _loc4_.id = param1;
            _loc4_.level = param2;
         }
         if(this._batteDummyInfo != null)
         {
            if(param3)
            {
               _loc5_ = this._batteDummyInfo.passiveSkill;
            }
            else
            {
               _loc5_ = this._batteDummyInfo.activeSkill;
            }
         }
         if(_loc5_ != null)
         {
            _loc5_.id = param1;
            _loc5_.level = param2;
         }
      }
      
      public function get passiveSkillId() : int
      {
         if(this._fullInfo != null && this._fullInfo.passiveSkill != null)
         {
            return this._fullInfo.passiveSkill.id;
         }
         if(this._batteDummyInfo != null && this._batteDummyInfo.passiveSkill != null)
         {
            return this._batteDummyInfo.passiveSkill.id;
         }
         if(this._template == null)
         {
            return 0;
         }
         return this._template.passiveSkillId;
      }
      
      public function get passiveSkillName() : String
      {
         if(this.passiveSkillId == 0)
         {
            return "";
         }
         var _loc1_:DummyZombieSkillTemplate = DummyDataFactory.getInstance().getSkillInfoByID(this.passiveSkillId);
         return _loc1_.name;
      }
      
      public function get passiveSkillLevel() : int
      {
         if(this._fullInfo != null && this._fullInfo.passiveSkill != null)
         {
            return this._fullInfo.passiveSkill.level;
         }
         if(this._batteDummyInfo != null && this._batteDummyInfo.passiveSkill != null)
         {
            return this._batteDummyInfo.passiveSkill.level;
         }
         return 1;
      }
      
      public function set passiveSkillLevel(param1:int) : void
      {
         if(this._fullInfo != null && this._fullInfo.passiveSkill != null)
         {
            this._fullInfo.passiveSkill.level = param1;
         }
         if(this._batteDummyInfo != null && this._batteDummyInfo.passiveSkill != null)
         {
            this._batteDummyInfo.passiveSkill.level = param1;
         }
      }
      
      public function get passiveSkillDesc() : String
      {
         return DummyGlobel.getSkillDesc(this.passiveSkillId,this.passiveSkillLevel);
      }
      
      public function get powerList() : Array
      {
         return null;
      }
      
      public function get fightPower() : int
      {
         var _loc1_:int = 0;
         var _loc2_:Array = this.getAllPropList();
         if(_loc2_ == null)
         {
            return 0;
         }
         return int(GameGloble.caculateFightPower(_loc2_[DummyConst.Attr_Attack],_loc2_[DummyConst.Attr_Defense],_loc2_[DummyConst.Attr_HP],_loc2_[DummyConst.Attr_Ability],_loc2_[DummyConst.Attr_Critical],_loc2_[DummyConst.Attr_Hit],_loc2_[DummyConst.Attr_Dodge],_loc2_[DummyConst.Attr_Tough],true));
      }
      
      public function get fightPowerOnlySelf() : int
      {
         var _loc1_:int = 0;
         var _loc2_:Array = this.getPropList();
         if(_loc2_ == null)
         {
            return 0;
         }
         return int(GameGloble.caculateFightPower(_loc2_[DummyConst.Attr_Attack],_loc2_[DummyConst.Attr_Defense],_loc2_[DummyConst.Attr_HP],_loc2_[DummyConst.Attr_Ability],_loc2_[DummyConst.Attr_Critical],_loc2_[DummyConst.Attr_Hit],_loc2_[DummyConst.Attr_Dodge],_loc2_[DummyConst.Attr_Tough],true));
      }
      
      public function get fightPowerOnlyEquipment() : int
      {
         var _loc1_:int = 0;
         var _loc2_:Array = this.getEquipmentPropList();
         if(_loc2_ == null)
         {
            return 0;
         }
         return int(GameGloble.caculateFightPower(_loc2_[DummyConst.Attr_Attack],_loc2_[DummyConst.Attr_Defense],_loc2_[DummyConst.Attr_HP],_loc2_[DummyConst.Attr_Ability],_loc2_[DummyConst.Attr_Critical],_loc2_[DummyConst.Attr_Hit],_loc2_[DummyConst.Attr_Dodge],_loc2_[DummyConst.Attr_Tough],true));
      }
      
      public function get speed() : int
      {
         if(this._template == null)
         {
            return 0;
         }
         var _loc1_:DummyPropTemplateCE = DummyDataFactory.getInstance().getPropInfoByID(this._template.type,this._template.rarity,this.quilty);
         if(_loc1_ == null)
         {
            return 0;
         }
         var _loc2_:Number = DummyDataFactory.getInstance().getDummyStarPercentBuffByID(this.star);
         var _loc3_:int = (_loc1_.baseSpeed + this.level * _loc1_.growSpeed) * _loc2_;
         var _loc4_:DummyZombieSkillTemplate = DummyDataFactory.getInstance().getSkillInfoByID(this.activeSkillId);
         var _loc5_:DummyActiveSkillInfoTemplate = DummyDataFactory.getInstance().getSkillActiveInfoByActiveID(_loc4_.activeSkillInfoID);
         _loc3_ += _loc5_.baseValue + _loc5_.growValue * this.activeSkillLevel;
         var _loc6_:DummyZombieSkillTemplate = DummyDataFactory.getInstance().getSkillInfoByID(this.passiveSkillId);
         var _loc7_:DummyActiveSkillInfoTemplate = DummyDataFactory.getInstance().getSkillActiveInfoByActiveID(_loc6_.activeSkillInfoID);
         _loc3_ += _loc7_.baseValue + _loc7_.growValue * this.passiveSkillLevel;
         return int(_loc3_ * 6);
      }
      
      public function get speedOnlyEquipment() : int
      {
         var _loc2_:* = null;
         var _loc3_:DummyEquipmentInfo = null;
         if(this._fullInfo == null)
         {
            return 0;
         }
         var _loc1_:int = 0;
         for(_loc2_ in this._equipmentList)
         {
            _loc3_ = this._equipmentList[_loc2_];
            if(_loc3_ != null)
            {
               _loc1_ += _loc3_.speed;
            }
         }
         return _loc1_;
      }
      
      public function getAllPropList() : Array
      {
         if(this._template == null)
         {
            return null;
         }
         var _loc1_:Array = this.getPropList();
         if(_loc1_ == null)
         {
            return null;
         }
         var _loc2_:Array = this.getEquipmentPropList();
         if(_loc2_ != null)
         {
            _loc1_[DummyConst.Attr_Attack] += _loc2_[DummyConst.Attr_Attack];
            _loc1_[DummyConst.Attr_Defense] += _loc2_[DummyConst.Attr_Defense];
            _loc1_[DummyConst.Attr_HP] += _loc2_[DummyConst.Attr_HP];
            _loc1_[DummyConst.Attr_Ability] += _loc2_[DummyConst.Attr_Ability];
            _loc1_[DummyConst.Attr_Hit] += _loc2_[DummyConst.Attr_Hit];
            _loc1_[DummyConst.Attr_Dodge] += _loc2_[DummyConst.Attr_Dodge];
            _loc1_[DummyConst.Attr_Critical] += _loc2_[DummyConst.Attr_Critical];
            _loc1_[DummyConst.Attr_Tough] += _loc2_[DummyConst.Attr_Tough];
         }
         return _loc1_;
      }
      
      public function getEquipmentPropList() : Array
      {
         var _loc2_:* = null;
         var _loc3_:DummyEquipmentInfo = null;
         var _loc4_:Array = null;
         var _loc1_:Array = new Array();
         _loc1_[DummyConst.Attr_Attack] = 0;
         _loc1_[DummyConst.Attr_Defense] = 0;
         _loc1_[DummyConst.Attr_HP] = 0;
         _loc1_[DummyConst.Attr_Ability] = 0;
         _loc1_[DummyConst.Attr_Hit] = 0;
         _loc1_[DummyConst.Attr_Dodge] = 0;
         _loc1_[DummyConst.Attr_Critical] = 0;
         _loc1_[DummyConst.Attr_Tough] = 0;
         if(this._template == null)
         {
            return _loc1_;
         }
         if(this._equipmentList != null)
         {
            for(_loc2_ in this._equipmentList)
            {
               _loc3_ = this._equipmentList[_loc2_];
               if(_loc3_ != null)
               {
                  _loc4_ = _loc3_.getPropList(_loc3_.quilty,_loc3_.level);
                  _loc1_[DummyConst.Attr_Attack] += _loc4_[DummyConst.Attr_Attack];
                  _loc1_[DummyConst.Attr_Defense] += _loc4_[DummyConst.Attr_Defense];
                  _loc1_[DummyConst.Attr_HP] += _loc4_[DummyConst.Attr_HP];
                  _loc1_[DummyConst.Attr_Ability] += _loc4_[DummyConst.Attr_Ability];
                  _loc1_[DummyConst.Attr_Hit] += _loc4_[DummyConst.Attr_Hit];
                  _loc1_[DummyConst.Attr_Dodge] += _loc4_[DummyConst.Attr_Dodge];
                  _loc1_[DummyConst.Attr_Critical] += _loc4_[DummyConst.Attr_Critical];
                  _loc1_[DummyConst.Attr_Tough] += _loc4_[DummyConst.Attr_Tough];
               }
            }
         }
         return _loc1_;
      }
      
      public function getDisplayEquipmentPropList() : Array
      {
         var _loc1_:Array = this.getEquipmentPropList();
         _loc1_[DummyConst.Attr_Attack] = int(_loc1_[DummyConst.Attr_Attack] / 100);
         _loc1_[DummyConst.Attr_Defense] = int(_loc1_[DummyConst.Attr_Defense] / 100);
         _loc1_[DummyConst.Attr_HP] = int(_loc1_[DummyConst.Attr_HP] / 100);
         _loc1_[DummyConst.Attr_Ability] = int(_loc1_[DummyConst.Attr_Ability] / 100);
         return _loc1_;
      }
      
      public function getPropList() : Array
      {
         if(this._template == null)
         {
            return null;
         }
         var _loc1_:DummyPropTemplateCE = DummyDataFactory.getInstance().getPropInfoByID(this._template.type,this._template.rarity,this.quilty);
         if(_loc1_ == null)
         {
            return null;
         }
         var _loc2_:Number = DummyDataFactory.getInstance().getDummyStarPercentBuffByID(this.star);
         var _loc3_:Array = new Array();
         _loc3_[DummyConst.Attr_Attack] = int((_loc1_.baseAttack + this.level * _loc1_.growAttack) * _loc2_) * 6;
         _loc3_[DummyConst.Attr_Defense] = int((_loc1_.baseDefense + this.level * _loc1_.growDefense) * _loc2_) * 6;
         _loc3_[DummyConst.Attr_HP] = int((_loc1_.baseHp + this.level * _loc1_.growHp) * _loc2_) * 6;
         _loc3_[DummyConst.Attr_Ability] = int((_loc1_.baseAbilty + this.level * _loc1_.growAbilty) * _loc2_) * 6;
         _loc3_[DummyConst.Attr_Hit] = int((_loc1_.baseHit + this.level * _loc1_.growHit) * _loc2_) * 6;
         _loc3_[DummyConst.Attr_Dodge] = int((_loc1_.baseDodge + this.level * _loc1_.growDodge) * _loc2_) * 6;
         _loc3_[DummyConst.Attr_Critical] = int((_loc1_.baseCritical + this.level * _loc1_.growCritical) * _loc2_) * 6;
         _loc3_[DummyConst.Attr_Tough] = int((_loc1_.baseTough + this.level * _loc1_.growTough) * _loc2_) * 6;
         return _loc3_;
      }
      
      public function getDisplayPropList() : Array
      {
         var _loc1_:Array = this.getPropList();
         _loc1_[DummyConst.Attr_Attack] = int(_loc1_[DummyConst.Attr_Attack] / 100);
         _loc1_[DummyConst.Attr_Defense] = int(_loc1_[DummyConst.Attr_Defense] / 100);
         _loc1_[DummyConst.Attr_HP] = int(_loc1_[DummyConst.Attr_HP] / 100);
         _loc1_[DummyConst.Attr_Ability] = int(_loc1_[DummyConst.Attr_Ability] / 100);
         return _loc1_;
      }
      
      public function getDisplayGrowValue() : int
      {
         if(this._template == null)
         {
            return 0;
         }
         var _loc1_:DummyPropTemplateCE = DummyDataFactory.getInstance().getPropInfoByID(this._template.type,this._template.rarity,this.quilty);
         if(_loc1_ == null)
         {
            return 0;
         }
         var _loc2_:Number = DummyDataFactory.getInstance().getDummyStarPercentBuffByID(this.star);
         var _loc3_:int = GameGloble.caculateFightPower(_loc1_.growAttack * 6,_loc1_.growDefense * 6,_loc1_.growHp * 6,_loc1_.growAbilty * 6,_loc1_.growCritical * 6,_loc1_.growHit * 6,_loc1_.growDodge * 6,_loc1_.growTough * 6,true);
         var _loc4_:Number = DummyDataFactory.getInstance().getDummyStarPercentBuffByID(this.star);
         return _loc3_ * _loc4_;
      }
      
      public function getEquipmentInfoByType(param1:int) : DummyEquipmentInfo
      {
         return this._equipmentList[param1];
      }
      
      private function setEquipmentInfo(param1:int, param2:DummyEquipmentInfo) : void
      {
         this._equipmentList[param1] = param2;
      }
      
      public function getEquipmentList() : Array
      {
         return this._equipmentList;
      }
      
      public function cleanAllEquipment() : void
      {
         this._equipmentList = new Array();
      }
      
      public function resetEquipmentInfo(param1:int, param2:int, param3:int) : void
      {
         var _loc4_:DummyEquipmentInfo;
         if((_loc4_ = this.getEquipmentInfoByType(param1)) == null)
         {
            _loc4_ = new DummyEquipmentInfo();
            this.setEquipmentInfo(param1,_loc4_);
         }
         _loc4_.loadInfo(param1,param2,param3);
      }
      
      public function get exp() : int
      {
         if(this._fullInfo != null)
         {
            return this._fullInfo.exp;
         }
         return 0;
      }
      
      public function set exp(param1:int) : void
      {
         if(this._fullInfo != null)
         {
            this._fullInfo.exp = param1;
         }
      }
      
      public function get maxExp() : int
      {
         var _loc1_:DummyLevelTemplateCE = null;
         if(this._fullInfo != null)
         {
            _loc1_ = DummyDataFactory.getInstance().getLevelInfoByLevel(this.level);
            if(_loc1_ != null)
            {
               return _loc1_.exp;
            }
         }
         return 0;
      }
      
      public function isMaxLevel() : Boolean
      {
         return this.level >= this.maxLevel;
      }
      
      public function get maxLevel() : int
      {
         var _loc3_:int = 0;
         var _loc1_:int = DummyDataFactory.getInstance().getZombieMaxLvByRoleLv(GameGloble.actorModel.actorLevel);
         var _loc2_:DummyZombieQuiltyTemplate = DummyDataFactory.getInstance().getZombieQuiltyInfoByID(this.quilty);
         if(_loc2_ != null)
         {
            _loc3_ = Math.min(_loc2_.maxLV,_loc1_);
            return int(Math.min(_loc3_,DummyDataFactory.getInstance().getZombieMaxLv()));
         }
         return 0;
      }
      
      public function isPassiveSkill(param1:int) : Boolean
      {
         if(this.passiveSkillId == 0)
         {
            return false;
         }
         var _loc2_:DummyZombieSkillTemplate = DummyDataFactory.getInstance().getSkillInfoByID(this.passiveSkillId);
         if(_loc2_ == null)
         {
            return false;
         }
         var _loc3_:DummyZombieSkillTemplate = DummyDataFactory.getInstance().getSkillInfoByID(param1);
         if(_loc3_ == null)
         {
            return false;
         }
         if(_loc2_.baseSkillID == _loc3_.baseSkillID)
         {
            return true;
         }
         return false;
      }
   }
}
