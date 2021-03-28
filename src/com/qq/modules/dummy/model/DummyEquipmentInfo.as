package com.qq.modules.dummy.model
{
   import com.qq.GameGloble;
   import com.qq.modules.dummy.DummyConst;
   
   public class DummyEquipmentInfo
   {
       
      
      private var _template:DummyEquipmentTemplate;
      
      private var _type:int;
      
      private var _level:int;
      
      public function DummyEquipmentInfo()
      {
         super();
      }
      
      public function loadInfo(param1:int, param2:int, param3:int) : void
      {
         this._template = DummyDataFactory.getInstance().getEquipmentInfoBy(param1,param2);
         this._type = param1;
         this._level = param3;
      }
      
      public function get type() : int
      {
         return this._type;
      }
      
      public function get speed() : int
      {
         var _loc1_:DummyEquipmentTemplate = DummyDataFactory.getInstance().getEquipmentInfoBy(this._type,this.quilty);
         if(_loc1_ != null)
         {
         }
         return 0;
      }
      
      public function get buildNeedItems() : Array
      {
         if(this._template == null)
         {
            return null;
         }
         return this._template.needItemList;
      }
      
      public function get name() : String
      {
         if(this._template == null)
         {
            return "";
         }
         return this._template.name;
      }
      
      public function get quilty() : int
      {
         if(this._template != null)
         {
            return this._template.quilty;
         }
         return 1;
      }
      
      public function isMaxQuilty() : Boolean
      {
         var _loc1_:int = DummyDataFactory.getInstance().getEquipmentMaxQuilty();
         return this.quilty >= _loc1_;
      }
      
      public function get level() : int
      {
         return this._level;
      }
      
      public function isMaxLevel() : Boolean
      {
         var _loc1_:DummyEquipmentQuiltyTemplate = DummyDataFactory.getInstance().getEquipmentQuiltyInfoByQuiltyID(this.quilty);
         return this.level >= _loc1_.maxLV;
      }
      
      public function get fightPower() : int
      {
         var _loc2_:* = null;
         var _loc3_:int = 0;
         if(this._template == null)
         {
            return 0;
         }
         var _loc1_:Array = this.getPropList(this.quilty,this.level);
         if(_loc1_ == null)
         {
            return 0;
         }
         for(_loc2_ in _loc1_)
         {
            _loc1_[_loc2_] = 6 * _loc1_[_loc2_];
         }
         return int(GameGloble.caculateFightPower(_loc1_[DummyConst.Attr_Attack],_loc1_[DummyConst.Attr_Defense],_loc1_[DummyConst.Attr_HP],_loc1_[DummyConst.Attr_Ability],_loc1_[DummyConst.Attr_Critical],_loc1_[DummyConst.Attr_Hit],_loc1_[DummyConst.Attr_Dodge],_loc1_[DummyConst.Attr_Tough],true));
      }
      
      public function getDisplayEquipmentPropList(param1:int, param2:int) : Array
      {
         var _loc3_:Array = this.getPropList(param1,param2);
         _loc3_[DummyConst.Attr_Attack] = int(_loc3_[DummyConst.Attr_Attack] / 100);
         _loc3_[DummyConst.Attr_Defense] = int(_loc3_[DummyConst.Attr_Defense] / 100);
         _loc3_[DummyConst.Attr_HP] = int(_loc3_[DummyConst.Attr_HP] / 100);
         _loc3_[DummyConst.Attr_Ability] = int(_loc3_[DummyConst.Attr_Ability] / 100);
         return _loc3_;
      }
      
      public function getPropList(param1:int, param2:int) : Array
      {
         var _loc3_:Array = new Array();
         var _loc4_:DummyEquipmentTemplate;
         if((_loc4_ = DummyDataFactory.getInstance().getEquipmentInfoBy(this._type,param1)) != null)
         {
            _loc3_[DummyConst.Attr_Attack] = _loc4_.baseAttack * 6;
            _loc3_[DummyConst.Attr_Defense] = _loc4_.baseDefense * 6;
            _loc3_[DummyConst.Attr_HP] = _loc4_.baseHp * 6;
            _loc3_[DummyConst.Attr_Ability] = _loc4_.baseAbilty * 6;
            _loc3_[DummyConst.Attr_Hit] = _loc4_.baseHit * 6;
            _loc3_[DummyConst.Attr_Dodge] = _loc4_.baseDodge * 6;
            _loc3_[DummyConst.Attr_Critical] = _loc4_.baseCritical * 6;
            _loc3_[DummyConst.Attr_Tough] = _loc4_.baseTough * 6;
         }
         else
         {
            _loc3_[DummyConst.Attr_Attack] = 0;
            _loc3_[DummyConst.Attr_Defense] = 0;
            _loc3_[DummyConst.Attr_HP] = 0;
            _loc3_[DummyConst.Attr_Ability] = 0;
            _loc3_[DummyConst.Attr_Hit] = 0;
            _loc3_[DummyConst.Attr_Dodge] = 0;
            _loc3_[DummyConst.Attr_Critical] = 0;
            _loc3_[DummyConst.Attr_Tough] = 0;
         }
         var _loc5_:Array = this.getGrowList(this.quilty,param2);
         _loc3_[DummyConst.Attr_Attack] += _loc5_[DummyConst.Attr_Attack];
         _loc3_[DummyConst.Attr_Defense] += _loc5_[DummyConst.Attr_Defense];
         _loc3_[DummyConst.Attr_HP] += _loc5_[DummyConst.Attr_HP];
         _loc3_[DummyConst.Attr_Ability] += _loc5_[DummyConst.Attr_Ability];
         _loc3_[DummyConst.Attr_Hit] += _loc5_[DummyConst.Attr_Hit];
         _loc3_[DummyConst.Attr_Dodge] += _loc5_[DummyConst.Attr_Dodge];
         _loc3_[DummyConst.Attr_Critical] += _loc5_[DummyConst.Attr_Critical];
         _loc3_[DummyConst.Attr_Tough] += _loc5_[DummyConst.Attr_Tough];
         return _loc3_;
      }
      
      public function getGrowList(param1:int, param2:int) : Array
      {
         var _loc3_:Array = new Array();
         param1 = Math.min(DummyDataFactory.getInstance().getEquipmentMaxQuilty(),param1);
         var _loc4_:int = 0;
         var _loc5_:DummyEquipmentQuiltyTemplate;
         if((_loc5_ = DummyDataFactory.getInstance().getEquipmentQuiltyInfoByQuiltyID(this.quilty)) != null)
         {
            _loc4_ = _loc5_.maxLV;
         }
         param2 = Math.min(_loc4_,param2);
         var _loc6_:DummyEquipmentTemplate;
         if((_loc6_ = DummyDataFactory.getInstance().getEquipmentInfoBy(this._type,param1)) != null)
         {
            _loc3_[DummyConst.Attr_Attack] = param2 * _loc6_.growAttack * 6;
            _loc3_[DummyConst.Attr_Defense] = param2 * _loc6_.growDefense * 6;
            _loc3_[DummyConst.Attr_HP] = param2 * _loc6_.growHp * 6;
            _loc3_[DummyConst.Attr_Ability] = param2 * _loc6_.growAbilty * 6;
            _loc3_[DummyConst.Attr_Hit] = param2 * _loc6_.growHit * 6;
            _loc3_[DummyConst.Attr_Dodge] = param2 * _loc6_.growDodge * 6;
            _loc3_[DummyConst.Attr_Critical] = param2 * _loc6_.growCritical * 6;
            _loc3_[DummyConst.Attr_Tough] = param2 * _loc6_.growTough * 6;
         }
         else
         {
            _loc3_[DummyConst.Attr_Attack] = 0;
            _loc3_[DummyConst.Attr_Defense] = 0;
            _loc3_[DummyConst.Attr_HP] = 0;
            _loc3_[DummyConst.Attr_Ability] = 0;
            _loc3_[DummyConst.Attr_Hit] = 0;
            _loc3_[DummyConst.Attr_Dodge] = 0;
            _loc3_[DummyConst.Attr_Critical] = 0;
            _loc3_[DummyConst.Attr_Tough] = 0;
         }
         return _loc3_;
      }
   }
}
