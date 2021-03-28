package com.qq.modules.td.data.game.unit
{
   import com.qq.constant.td.TDConstant;
   import com.qq.modules.td.data.game.ITDStaticData;
   import com.qq.modules.td.data.game.unit.ce.TDZombieTemplateCE;
   import com.qq.utils.data.PData;
   import flash.utils.Dictionary;
   import org.as3commons.logging.api.getLogger;
   
   public class TDZombieStaticInfo extends TDZombieTemplateCE implements ITDStaticData
   {
       
      
      [Inject]
      public var armorType:PData;
      
      public var DropPartAnimName:String;
      
      public var DropPartNameList:Array;
      
      public var DropPartTypeList:Array;
      
      public var DropPartRelatedPartList:Array;
      
      public var DropPartRelatedShowPartList:Array;
      
      public var armorData:Array;
      
      public var lootList:Array;
      
      public var InitHideBones:Array;
      
      private var _attackHeightArr:Array;
      
      public var enterActionIDList:Array;
      
      public var deathActionIDList:Array;
      
      private var _isSort:Number = 1;
      
      public var DropPartArmorList:Array;
      
      public function TDZombieStaticInfo()
      {
         super();
         this.armorType = new PData();
         this.armorData = new Array();
         this.lootList = new Array();
         this.InitHideBones = [];
      }
      
      public static function getDefencePercent(param1:Dictionary, param2:int) : Number
      {
         if(param1 == null)
         {
            getLogger("TD").error("防御系数错误");
            return 0;
         }
         if(param1[param2] == null)
         {
            return 0;
         }
         return param1[param2];
      }
      
      public function get attackHeightArr() : Array
      {
         return this._attackHeightArr;
      }
      
      override public function load(param1:Object) : void
      {
         var _loc2_:Array = null;
         var _loc4_:String = null;
         var _loc5_:Array = null;
         var _loc6_:String = null;
         var _loc7_:Array = null;
         var _loc8_:String = null;
         var _loc9_:Array = null;
         var _loc10_:Array = null;
         var _loc11_:* = false;
         var _loc14_:String = null;
         var _loc15_:Array = null;
         var _loc16_:String = null;
         var _loc17_:Array = null;
         var _loc18_:Array = null;
         var _loc19_:Array = null;
         var _loc20_:Array = null;
         var _loc21_:String = null;
         var _loc22_:Array = null;
         var _loc23_:Array = null;
         super.load(param1);
         _resFileName = String(param1.resName);
         this.DropPartNameList = new Array();
         var _loc3_:Array = splitStr(String(param1.dropPartNameList),"|");
         for each(_loc4_ in _loc3_)
         {
            _loc17_ = splitStr(_loc4_,":");
            this.DropPartNameList.push(_loc17_);
         }
         this.DropPartAnimName = String(param1.dropPartAnimName);
         this.DropPartTypeList = splitStr(String(param1.dropPartTypeList),"|");
         this.DropPartRelatedPartList = new Array();
         _loc5_ = splitStr(String(param1.dropPartRelatedPartList),"|");
         for each(_loc6_ in _loc5_)
         {
            _loc18_ = splitStr(_loc6_,":");
            this.DropPartRelatedPartList.push(_loc18_);
         }
         this.DropPartRelatedShowPartList = new Array();
         _loc7_ = splitStr(String(param1.dropPartRelatedPartShowList),"|");
         for each(_loc8_ in _loc7_)
         {
            _loc19_ = splitStr(_loc8_,":");
            this.DropPartRelatedShowPartList.push(_loc19_);
         }
         _loc9_ = splitStr(String(armorExitBoneNameList),"|");
         _loc10_ = splitStr(String(!!param1.hasOwnProperty("defencePartNoExitBoneNameList") ? param1.defencePartNoExitBoneNameList : ""),"|");
         _loc11_ = int(param1.armorIsIron) == 1;
         this.DropPartArmorList = splitStr(String(dropPartArmorList),"|");
         _loc2_ = new Array();
         if(armorHp > 0)
         {
            _loc2_[TDConstant.Armor_Name] = armorBone;
            _loc2_[TDConstant.Armor_RelpaceBoneName] = armorReplaceBone;
            _loc2_[TDConstant.Armor_PackageName] = armorPackageName;
            _loc2_[TDConstant.Armor_TextureName] = armorTexture;
            _loc2_[TDConstant.Armor_Hp] = _loc2_[TDConstant.Armor_MaxHp] = armorHp;
            _loc2_[TDConstant.Armor_State] = _loc2_[TDConstant.Armor_MaxState] = armorTotalState;
            _loc2_[TDConstant.Armor_ExitBoneNameList] = splitStr(String(param1.armorExitBoneNameList),"|");
            _loc2_[TDConstant.Armor_NoExitBoneNameList] = splitStr(String(param1.armorNoExitBoneNameList),"|");
            _loc2_[TDConstant.Armor_DropImmediately] = isDropArmorImmediately;
            _loc2_[TDConstant.Aromr_isIron] = _loc11_;
            _loc2_[TDConstant.Armor_AllPartName] = splitStr(armorAllPartName,"|");
            this.armorData.push(_loc2_);
         }
         var _loc12_:String;
         if((_loc12_ = param1.defenceValue) != null)
         {
            _loc20_ = splitStr(_loc12_,"|");
            for each(_loc21_ in _loc20_)
            {
               _loc22_ = splitStr(_loc21_,":");
               defenceValue[int(_loc22_[0])] = _loc22_[1];
            }
         }
         this.enterActionIDList = splitStr(this.enterActionIDs,"|");
         this.deathActionIDList = splitStr(String(this.deathActionIDs),"|");
         var _loc13_:Array = splitStr(String(param1.lootPercent),"|");
         for each(_loc14_ in _loc13_)
         {
            _loc23_ = splitStr(_loc14_,":");
            this.lootList.push(_loc23_);
         }
         this.InitHideBones = splitStr(initHideBones,"|");
         this._attackHeightArr = [];
         _loc15_ = splitStr(attackHeight,"|");
         for each(_loc16_ in _loc15_)
         {
            this._attackHeightArr.push(int(_loc16_));
         }
      }
      
      public function getLootItemID(param1:Number) : int
      {
         var _loc2_:Array = null;
         param1 *= 100;
         for each(_loc2_ in this.lootList)
         {
            if(param1 < _loc2_[0])
            {
               return _loc2_[1];
            }
         }
         return 0;
      }
      
      public function get isSort() : Number
      {
         return this._isSort;
      }
   }
}
