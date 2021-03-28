package com.qq.modules.dummy
{
   import PVZ.Cmd.Dto_PuppetFullInfo;
   import PVZ.Cmd.Dto_PuppetInfo;
   import PVZ.Cmd.Dto_PuppetSkillInfo;
   import PVZ.Cmd.Dto_PuppetSparInfo;
   import asgui.utils.StringUtil;
   import com.qq.GameGloble;
   import com.qq.display.EmbattlePlant;
   import com.qq.modules.bag.ItemQualityType;
   import com.qq.modules.bag.model.BagItemTemplate;
   import com.qq.modules.bag.model.ItemTemplateFactory;
   import com.qq.modules.dummy.model.DummyActiveSkillInfoTemplate;
   import com.qq.modules.dummy.model.DummyBuffTemplate;
   import com.qq.modules.dummy.model.DummyDataFactory;
   import com.qq.modules.dummy.model.DummyEquipmentInfo;
   import com.qq.modules.dummy.model.DummyEquipmentQuiltyTemplate;
   import com.qq.modules.dummy.model.DummyFubenStageInfo;
   import com.qq.modules.dummy.model.DummyFubenStageTemplate;
   import com.qq.modules.dummy.model.DummySkillUpdateTemplate;
   import com.qq.modules.dummy.model.DummyZombieInfo;
   import com.qq.modules.dummy.model.DummyZombieQuiltyTemplate;
   import com.qq.modules.dummy.model.DummyZombieSkillTemplate;
   import com.qq.modules.dummy.model.DummyZombieTemplate;
   import org.as3commons.logging.api.getLogger;
   
   public class DummyGlobel
   {
      
      public static var dragDummyID:int;
       
      
      public function DummyGlobel()
      {
         super();
      }
      
      public static function isPromotionEquipment(param1:DummyEquipmentInfo, param2:DummyZombieInfo) : Boolean
      {
         var _loc8_:Array = null;
         var _loc9_:DummyEquipmentQuiltyTemplate = null;
         if(param1 == null || param2 == null)
         {
            return false;
         }
         var _loc3_:DummyEquipmentQuiltyTemplate = DummyDataFactory.getInstance().getEquipmentQuiltyInfoByQuiltyID(param1.quilty);
         if(_loc3_ == null)
         {
            return false;
         }
         var _loc5_:Array;
         var _loc4_:DummyZombieQuiltyTemplate;
         var _loc6_:int = (_loc5_ = (_loc4_ = DummyDataFactory.getInstance().getZombieQuiltyInfoByID(param2.quilty)).needEquipmentList).length;
         var _loc7_:int = 0;
         while(_loc7_ < _loc6_)
         {
            _loc8_ = _loc5_[_loc7_];
            if(param1.type == _loc8_[0])
            {
               if(param1.quilty + 1 > _loc8_[1])
               {
                  return false;
               }
               break;
            }
            _loc7_++;
         }
         if(param1.level >= _loc3_.maxLV)
         {
            return (_loc9_ = DummyDataFactory.getInstance().getEquipmentQuiltyInfoByQuiltyID(param1.quilty + 1)) != null;
         }
         return false;
      }
      
      public static function isPromotionDummy(param1:DummyZombieInfo) : Boolean
      {
         var _loc6_:* = null;
         var _loc7_:DummyEquipmentInfo = null;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc10_:Array = null;
         if(param1 == null)
         {
            return false;
         }
         var _loc2_:Array = param1.getEquipmentList();
         if(_loc2_ == null)
         {
            return false;
         }
         var _loc3_:DummyZombieQuiltyTemplate = DummyDataFactory.getInstance().getZombieQuiltyInfoByID(param1.quilty);
         var _loc4_:Array = _loc3_.needEquipmentList;
         var _loc5_:int = 0;
         for(_loc6_ in _loc2_)
         {
            if((_loc7_ = _loc2_[_loc6_]) == null)
            {
               return false;
            }
            _loc8_ = _loc4_.length;
            _loc9_ = 0;
            while(_loc9_ < _loc8_)
            {
               if((_loc10_ = _loc4_[_loc9_])[0] == _loc6_)
               {
                  if(_loc7_.quilty != _loc10_[1] || _loc7_.level < _loc10_[2])
                  {
                     return false;
                  }
                  _loc5_++;
                  break;
               }
               _loc9_++;
            }
         }
         return _loc5_ >= DummyConst.Total_Equipment;
      }
      
      public static function conver2Dto_PuppetInfo(param1:DummyZombieInfo) : Dto_PuppetInfo
      {
         var _loc2_:Dto_PuppetInfo = new Dto_PuppetInfo();
         if(param1 == null)
         {
            _loc2_.baseId = 0;
         }
         else
         {
            _loc2_.baseId = param1.id;
         }
         return _loc2_;
      }
      
      public static function getSkillDesc(param1:int, param2:int) : String
      {
         var _loc6_:* = null;
         var _loc8_:DummyBuffTemplate = null;
         var _loc3_:DummyZombieSkillTemplate = DummyDataFactory.getInstance().getSkillInfoByID(param1);
         if(_loc3_ == null)
         {
            return "";
         }
         var _loc4_:int = (_loc3_.fixBaseValue + param2 * _loc3_.fixGrowValue) * 0.01;
         var _loc5_:* = (_loc3_.percentBaseValue * 0.0001 + _loc3_.percentGrowValue * 0.0001 * param2).toFixed(2) + "%";
         if(_loc3_.buffID != 0)
         {
            if((_loc8_ = DummyDataFactory.getInstance().getBuffInfoByID(_loc3_.buffID)) != null)
            {
               switch(_loc8_.valueType)
               {
                  case DummyConst.DummyBuff_Val_Type_Direct:
                     _loc6_ = int((_loc8_.baseValue + _loc8_.growValue * param2) * 0.01).toString();
                     break;
                  case DummyConst.DummyBuff_Val_Type_Percent:
                     _loc6_ = (_loc8_.baseValue * 0.001 + _loc8_.growValue * 0.001 * param2).toFixed(2) + "%";
               }
            }
         }
         return StringUtil.substitute(_loc3_.desc,_loc4_,_loc5_,_loc6_);
      }
      
      public static function getBuffDesc(param1:int, param2:int) : String
      {
         var _loc3_:* = null;
         var _loc4_:String = null;
         var _loc5_:DummyBuffTemplate;
         if((_loc5_ = DummyDataFactory.getInstance().getBuffInfoByID(param1)) != null)
         {
            if(param2 <= 0)
            {
               getLogger("battle").error("获取傀儡buff对应技能等级失败");
               param2 = 1;
            }
            switch(_loc5_.valueType)
            {
               case DummyConst.DummyBuff_Val_Type_Direct:
                  _loc3_ = ((_loc5_.baseValue + _loc5_.growValue * param2) * 0.01).toString();
                  break;
               case DummyConst.DummyBuff_Val_Type_Percent:
                  _loc3_ = (_loc5_.baseValue * 0.001 + _loc5_.growValue * 0.001 * param2).toFixed(2) + "%";
            }
            _loc4_ = StringUtil.substitute(_loc5_.desc,_loc3_);
         }
         else
         {
            _loc4_ = "";
         }
         return _loc4_;
      }
      
      public static function getEquipmentState(param1:DummyEquipmentInfo, param2:DummyZombieInfo) : int
      {
         if(param2 == null)
         {
            return DummyConst.EquipmentState_None;
         }
         if(param1 == null)
         {
            return DummyConst.EquipmentState_None;
         }
         if(isPromotionEquipment(param1,param2))
         {
            return DummyConst.EquipmentState_Promotion;
         }
         if(!param1.isMaxLevel() && param1.level < param2.level)
         {
            return DummyConst.EquipmentState_LevelUp;
         }
         return DummyConst.EquipmentState_MaxLevel;
      }
      
      public static function getLootItemFubenInfo(param1:int) : Array
      {
         var _loc7_:DummyFubenStageTemplate = null;
         var _loc8_:Array = null;
         var _loc9_:int = 0;
         var _loc2_:Array = new Array();
         var _loc3_:Array = DummyDataFactory.getInstance().getFubenStageList();
         var _loc4_:int = _loc3_.length;
         var _loc5_:String = param1.toString();
         var _loc6_:int = 0;
         while(_loc6_ < _loc4_)
         {
            if((_loc9_ = (_loc8_ = (_loc7_ = _loc3_[_loc6_]).getLootItemIDList()).indexOf(_loc5_)) != -1)
            {
               _loc2_.push(_loc7_.id);
            }
            _loc6_++;
         }
         return _loc2_;
      }
      
      public static function getDummyState(param1:DummyZombieInfo) : int
      {
         if(param1 == null)
         {
            return DummyConst.ZombieState_None;
         }
         if(isPromotionDummy(param1))
         {
            return DummyConst.ZombieState_Promotion;
         }
         if(!param1.isMaxLevel())
         {
            return DummyConst.ZombieState_LevelUp;
         }
         return DummyConst.ZombieState_MaxLevel;
      }
      
      public static function getDummyLevelUpTip(param1:DummyZombieInfo) : String
      {
         if(param1 == null)
         {
            return null;
         }
         if(param1.level + 1 > DummyDataFactory.getInstance().getZombieMaxLv())
         {
            return "已达到傀儡等级上限";
         }
         var _loc2_:int = DummyDataFactory.getInstance().getZombieMaxLvByRoleLv(GameGloble.actorModel.actorLevel);
         if(param1.level + 1 > _loc2_)
         {
            return "升级需要小镇等级达到" + _loc2_ + "级";
         }
         var _loc3_:DummyZombieQuiltyTemplate = DummyDataFactory.getInstance().getZombieQuiltyInfoByID(param1.quilty);
         if(_loc3_ != null)
         {
            if(param1.level + 1 > _loc3_.maxLV)
            {
               return "已达到当前品质最大等级，请晋品";
            }
         }
         return null;
      }
      
      public static function getDummyTeamToolTip(param1:Array) : String
      {
         var _loc5_:Dto_PuppetInfo = null;
         var _loc6_:DummyZombieTemplate = null;
         if(param1 == null)
         {
            return null;
         }
         var _loc2_:String = "上阵傀儡：<br>";
         var _loc3_:int = param1.length;
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            _loc5_ = param1[_loc4_];
            if((_loc6_ = DummyDataFactory.getInstance().getDummyZombieInfoByID(_loc5_.baseId)) != null)
            {
               _loc2_ = _loc2_.concat("<font color=\'",ItemQualityType.getQualityColor(int(_loc5_.quality / 100)),"\'>",_loc6_.name,"<font>");
               if(!_loc6_.isEnemy)
               {
                  _loc2_ = _loc2_.concat("<font color=\' Lv.",ItemQualityType.getQualityColor(int(_loc5_.quality / 100)),"\'>",_loc5_.level,"</font>");
               }
               _loc2_ = _loc2_.concat("<br>");
            }
            _loc4_++;
         }
         return _loc2_;
      }
      
      public static function getStageFightState(param1:DummyFubenStageInfo) : int
      {
         if(param1 == null)
         {
            return DummyConst.FubenStage_Fight_Close;
         }
         if(param1.leftTimes <= 0 && param1.totalLimitTimes > 0)
         {
            return DummyConst.FubenStage_Fight_Close;
         }
         return DummyConst.FubenStage_Fight_Ready;
      }
      
      public static function getDummyZombieNameAndQuilty(param1:DummyZombieInfo) : String
      {
         var _loc3_:String = null;
         var _loc2_:int = param1.quilty % 10;
         if(_loc2_ > 0)
         {
            _loc3_ = param1.name + " +" + _loc2_;
         }
         else
         {
            _loc3_ = param1.name;
         }
         return _loc3_;
      }
      
      public static function setDummyEmbattleView(param1:EmbattlePlant, param2:EmbattlePlant, param3:Array) : void
      {
         var _loc4_:int = 0;
         var _loc6_:Dto_PuppetInfo = null;
         if(param3 != null && param3.length > 0)
         {
            if((_loc6_ = param3[0]) != null)
            {
               _loc4_ = _loc6_.baseId;
            }
         }
         var _loc5_:DummyZombieTemplate;
         if((_loc5_ = DummyDataFactory.getInstance().getDummyZombieInfoByID(_loc4_)) == null)
         {
            param1.visible = false;
            param1.toolTip = null;
            param2.visible = false;
         }
         else
         {
            param2.visible = true;
            param1.visible = true;
            param1.toolTip = DummyGlobel.getDummyTeamToolTip(param3);
            param1.setDummyAssetUrl(_loc5_);
         }
      }
      
      public static function getDummyZombieInfo(param1:int, param2:int, param3:int, param4:int, param5:Array, param6:int, param7:int, param8:int, param9:int) : DummyZombieInfo
      {
         var _loc13_:DummyEquipmentInfo = null;
         var _loc14_:Dto_PuppetSkillInfo = null;
         var _loc15_:Dto_PuppetSparInfo = null;
         var _loc10_:DummyZombieInfo = new DummyZombieInfo(param1);
         var _loc11_:Dto_PuppetFullInfo;
         (_loc11_ = new Dto_PuppetFullInfo()).level = param2;
         _loc11_.star = param3;
         _loc11_.quality = param4;
         var _loc12_:Array = new Array();
         for each(_loc13_ in param5)
         {
            (_loc15_ = new Dto_PuppetSparInfo()).quality = _loc13_.quilty;
            _loc15_.level = _loc13_.level;
            _loc12_.push(_loc15_);
         }
         _loc11_.spar = _loc12_;
         (_loc14_ = new Dto_PuppetSkillInfo()).id = param6;
         _loc14_.level = param7;
         _loc11_.activeSkill = _loc14_;
         (_loc14_ = new Dto_PuppetSkillInfo()).id = param8;
         _loc14_.level = param9;
         _loc11_.passiveSkill = _loc14_;
         _loc10_.resetDtoInfo(_loc11_);
         return _loc10_;
      }
      
      public static function canSellDummyDrawing(param1:int) : Boolean
      {
         var _loc2_:BagItemTemplate = ItemTemplateFactory.instance.getBagItemTemplateById(param1);
         if(_loc2_ == null)
         {
            return false;
         }
         var _loc3_:DummyEquipmentQuiltyTemplate = DummyDataFactory.getInstance().getEquipmentQuiltyInfoByQuiltyID(_loc2_.quality);
         if(_loc3_ == null)
         {
            return false;
         }
         return _loc3_.compositeDrawingGenerateParam.length > 0;
      }
      
      public static function getSkillState(param1:int, param2:int, param3:DummyZombieInfo) : int
      {
         var _loc5_:DummyZombieSkillTemplate = null;
         var _loc6_:int = 0;
         var _loc7_:DummyActiveSkillInfoTemplate = null;
         var _loc8_:Array = null;
         if(param2 == 0)
         {
            if((_loc5_ = DummyDataFactory.getInstance().getParentSkillInfoBySkillID(param1)) != null && (_loc5_.id == param3.activeSkillId || _loc5_.id == param3.passiveSkillId))
            {
               if(_loc5_.id == param3.activeSkillId)
               {
                  _loc6_ = param3.activeSkillLevel;
               }
               else
               {
                  _loc6_ = param3.passiveSkillLevel;
               }
               if((_loc7_ = DummyDataFactory.getInstance().getSkillActiveInfoBySkillID(param1)) != null)
               {
                  if(_loc6_ >= _loc7_.needSkillLv && param3.star >= _loc7_.needDummyStar)
                  {
                     if((_loc8_ = getSkillNotEnoughItemList(param1,param2,false)).length > 0)
                     {
                        return DummyConst.Skill_Active_State_Item_NotEnough;
                     }
                     return DummyConst.Skill_Update_Ready_To_Active;
                  }
               }
            }
            return DummyConst.Skill_Update_Not_Meet_Actvie_Requirement;
         }
         if(isSkillOnceActvied(param1,param3))
         {
            return DummyConst.Skill_Update_State_Not_Use;
         }
         if(param2 >= DummyDataFactory.getInstance().getSkillMaxLevel(param1))
         {
            return DummyConst.Skill_Update_State_Lv_Max;
         }
         var _loc4_:Array;
         if((_loc4_ = getSkillNotEnoughItemList(param1,param2,true)).length > 0)
         {
            return DummyConst.Skill_Update_State_Item_NotEnough;
         }
         return DummyConst.Skill_Update_State_OK;
      }
      
      public static function isSkillOnceActvied(param1:int, param2:DummyZombieInfo) : Boolean
      {
         if(param2 == null)
         {
            return false;
         }
         var _loc3_:DummyZombieSkillTemplate = DummyDataFactory.getInstance().getSkillInfoByID(param1);
         if(_loc3_ == null)
         {
            return false;
         }
         var _loc4_:DummyZombieSkillTemplate = DummyDataFactory.getInstance().getSkillInfoByID(param2.activeSkillId);
         var _loc5_:DummyZombieSkillTemplate = DummyDataFactory.getInstance().getSkillInfoByID(param2.passiveSkillId);
         if(_loc4_ == null || _loc5_ == null)
         {
            return false;
         }
         var _loc6_:DummyZombieSkillTemplate = null;
         if(_loc4_.baseSkillID == _loc3_.baseSkillID)
         {
            _loc6_ = _loc4_;
         }
         if(_loc5_.baseSkillID == _loc3_.baseSkillID)
         {
            _loc6_ = _loc5_;
         }
         if(_loc6_ == null)
         {
            return false;
         }
         return param1 < _loc6_.id;
      }
      
      public static function getSkillNotEnoughItemList(param1:int, param2:int, param3:Boolean) : Array
      {
         var _loc6_:Array = null;
         var _loc9_:DummySkillUpdateTemplate = null;
         var _loc10_:DummyActiveSkillInfoTemplate = null;
         var _loc11_:Array = null;
         var _loc12_:int = 0;
         var _loc4_:Array = new Array();
         var _loc5_:DummyZombieSkillTemplate;
         if((_loc5_ = DummyDataFactory.getInstance().getSkillInfoByID(param1)) == null)
         {
            return _loc4_;
         }
         if(param3)
         {
            if((_loc9_ = DummyDataFactory.getInstance().getSkillUpdateTemplateByLv(param2,_loc5_.rarity)) == null)
            {
               return _loc4_;
            }
            _loc6_ = _loc9_.needItemList;
         }
         else
         {
            _loc6_ = (_loc10_ = DummyDataFactory.getInstance().getSkillActiveInfoBySkillID(param1)).getNeedItemList();
         }
         var _loc7_:int = _loc6_.length;
         var _loc8_:int = 0;
         while(_loc8_ < _loc7_)
         {
            _loc11_ = _loc6_[_loc8_];
            if((_loc12_ = GameGloble.bagProxy.getItemNumByItemID(_loc11_[0])) < _loc11_[1])
            {
               _loc4_.push(_loc11_);
            }
            _loc8_++;
         }
         return _loc4_;
      }
      
      public static function getDummyZombieExchangeItemNeed(param1:DummyZombieInfo, param2:DummyZombieInfo) : int
      {
         var _loc9_:DummyEquipmentInfo = null;
         var _loc10_:DummyEquipmentInfo = null;
         if(param1 == null || param2 == null)
         {
            return 0;
         }
         var _loc3_:int = Math.max(DummyDataFactory.getInstance().getDummyExchangeNeedNum(param1.quilty),DummyDataFactory.getInstance().getDummyExchangeNeedNum(param2.quilty));
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:Array;
         var _loc7_:int = (_loc6_ = param1.getEquipmentList()).length;
         var _loc8_:int = 0;
         while(_loc8_ < _loc7_)
         {
            if((_loc9_ = _loc6_[_loc8_]) != null)
            {
               _loc4_ += DummyDataFactory.getInstance().getEquipmentExchangeNeedNum(_loc9_.quilty);
            }
            _loc8_++;
         }
         _loc7_ = (_loc6_ = param2.getEquipmentList()).length;
         _loc8_ = 0;
         while(_loc8_ < _loc7_)
         {
            if((_loc10_ = _loc6_[_loc8_]) != null)
            {
               _loc5_ += DummyDataFactory.getInstance().getEquipmentExchangeNeedNum(_loc10_.quilty);
            }
            _loc8_++;
         }
         return int(_loc3_ + Math.max(_loc4_,_loc5_));
      }
   }
}
