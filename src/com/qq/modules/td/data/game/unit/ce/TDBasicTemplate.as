package com.qq.modules.td.data.game.unit.ce
{
   import com.qq.modules.basic.data.IStaticData;
   import com.qq.modules.td.data.game.unit.basic.TDGameObjectStaticData;
   import org.as3commons.logging.api.getLogger;
   import tencent.base.utils.StringUtil;
   
   public class TDBasicTemplate implements IStaticData
   {
       
      
      private var _initBuffList:Array;
      
      private var _needShade:Boolean;
      
      protected var _resFileName:String;
      
      private var _type:int;
      
      private var _extraBoneData:Array;
      
      public var effectResNames:Vector.<String>;
      
      private var _actionNameList:Array;
      
      private var _actionRateList:Array;
      
      public var childAnim:String;
      
      private var _firePosBoneName:String;
      
      private var _firePosOffsetX:int;
      
      private var _firePosOffsetY:int;
      
      private var _butterPosList:Array;
      
      private var _params:Array;
      
      public function TDBasicTemplate()
      {
         this._extraBoneData = [];
         this.effectResNames = new Vector.<String>();
         this._actionNameList = [];
         this._actionRateList = [];
         this._params = [];
         super();
      }
      
      public static function splitStr(param1:String, param2:String) : Array
      {
         var _loc3_:Array = null;
         param1 = StringUtil.trim(param1);
         if(param1.length == 0)
         {
            _loc3_ = new Array();
            _loc3_.length = 0;
         }
         else
         {
            _loc3_ = param1.split(param2);
         }
         return _loc3_;
      }
      
      public function load(param1:Object) : void
      {
         var _loc6_:String = null;
         var _loc7_:Array = null;
         var _loc8_:String = null;
         var _loc9_:Array = null;
         var _loc10_:Array = null;
         var _loc11_:int = 0;
         var _loc12_:String = null;
         var _loc13_:Array = null;
         var _loc14_:String = null;
         var _loc15_:Array = null;
         var _loc16_:String = null;
         var _loc17_:String = null;
         var _loc18_:String = null;
         var _loc19_:Array = null;
         var _loc20_:Array = null;
         var _loc21_:Array = null;
         var _loc22_:Array = null;
         var _loc23_:Array = null;
         var _loc24_:int = 0;
         var _loc25_:Array = null;
         var _loc26_:String = null;
         var _loc27_:Array = null;
         var _loc28_:String = null;
         var _loc29_:Array = null;
         var _loc30_:* = null;
         var _loc31_:String = null;
         var _loc2_:String = !!param1.hasOwnProperty("params") ? param1.params : null;
         if(_loc2_ != null && _loc2_.length > 0)
         {
            _loc7_ = splitStr(_loc2_,"|");
            for each(_loc8_ in _loc7_)
            {
               _loc9_ = splitStr(_loc8_,":");
               this.setParam(_loc9_[0],_loc9_[1]);
            }
         }
         this._type = param1.id;
         var _loc3_:String = StringUtil.trim(!!param1.hasOwnProperty("effectResName") ? param1.effectResName : "");
         if(_loc3_.length > 0)
         {
            this.effectResNames = Vector.<String>(_loc3_.split("|"));
         }
         else
         {
            this.effectResNames = new Vector.<String>();
         }
         var _loc4_:String = param1.actionList;
         var _loc5_:Array = splitStr(_loc4_,"|");
         for each(_loc6_ in _loc5_)
         {
            _loc10_ = splitStr(_loc6_,":");
            this.actionNameList.push(_loc10_[0]);
            if((_loc11_ = int(_loc10_[1])) == 0 && this.hasOwnProperty("frameRate"))
            {
               _loc11_ = this["frameRate"];
            }
            this.actionRateList[_loc10_[0]] = _loc11_;
         }
         if(param1.hasOwnProperty("firePosInfo"))
         {
            if((_loc12_ = param1.firePosInfo).length > 0)
            {
               if((_loc13_ = splitStr(_loc12_,"|")).length != 3)
               {
                  getLogger("TD").error("射击点位置参数错误");
               }
               else
               {
                  this._firePosBoneName = _loc13_[0];
                  this._firePosOffsetX = _loc13_[1];
                  this._firePosOffsetY = _loc13_[2];
               }
            }
         }
         this._butterPosList = new Array();
         if(param1.hasOwnProperty("butterPosInfo"))
         {
            if((_loc14_ = param1.butterPosInfo).length > 0)
            {
               _loc15_ = splitStr(_loc14_,"|");
               for each(_loc16_ in _loc15_)
               {
                  this._butterPosList.push(splitStr(_loc16_,":"));
               }
            }
         }
         if(param1.hasOwnProperty("extraAssetName") && param1.hasOwnProperty("extraAssetRelatedBone"))
         {
            _loc17_ = param1.extraAssetName;
            _loc18_ = param1.extraAssetRelatedBone;
            if(_loc17_.length > 0 && _loc18_.length > 0)
            {
               _loc19_ = splitStr(_loc17_,"|");
               _loc20_ = splitStr(param1.extraAssetBoneName,"|");
               _loc21_ = splitStr(_loc18_,"|");
               _loc22_ = new Array();
               if(param1.hasOwnProperty("extraAssetDefaultAnim"))
               {
                  _loc22_ = splitStr(param1.extraAssetDefaultAnim,"|");
               }
               _loc23_ = new Array();
               if(param1.hasOwnProperty("extraAssetOffset"))
               {
                  _loc23_ = splitStr(param1.extraAssetOffset,"|");
               }
               if(_loc19_.length != _loc21_.length && _loc20_.length != _loc21_.length)
               {
                  getLogger("TD").error("外部加载部件数量不一致");
               }
               else
               {
                  _loc24_ = 0;
                  while(_loc24_ < _loc19_.length)
                  {
                     _loc25_ = new Array();
                     _loc26_ = _loc19_[_loc24_];
                     _loc27_ = splitStr(_loc26_,":");
                     _loc25_[TDGameObjectStaticData.Additional_PackageID] = _loc27_[0];
                     _loc25_[TDGameObjectStaticData.Additional_AssetName] = _loc27_[1];
                     _loc25_[TDGameObjectStaticData.Additional_AssetBoneName] = _loc20_[_loc24_];
                     _loc25_[TDGameObjectStaticData.Additional_AssetRelatedBone] = _loc21_[_loc24_];
                     if(_loc22_[_loc24_] != null)
                     {
                        _loc25_[TDGameObjectStaticData.Additional_AssetDefaultAnim] = _loc22_[_loc24_];
                     }
                     else
                     {
                        _loc25_[TDGameObjectStaticData.Additional_AssetDefaultAnim] = null;
                     }
                     if(_loc23_[_loc24_] != null)
                     {
                        _loc29_ = (_loc28_ = _loc23_[_loc24_]).split(":");
                        for(_loc30_ in _loc29_)
                        {
                           _loc29_[_loc30_] = int(_loc29_[_loc30_]);
                        }
                        _loc25_[TDGameObjectStaticData.Additional_AssetOffsetParam] = _loc29_;
                     }
                     else
                     {
                        _loc25_[TDGameObjectStaticData.Additional_AssetOffsetParam] = null;
                     }
                     this.extraBoneData.push(_loc25_);
                     _loc24_++;
                  }
               }
            }
         }
         if(param1.hasOwnProperty("initBuffListStr"))
         {
            if((_loc31_ = String(param1.initBuffListStr)).length > 0)
            {
               this._initBuffList = splitStr(_loc31_,":");
            }
         }
         if(param1.hasOwnProperty("needShade"))
         {
            this._needShade = int(param1.needShade) == 1;
         }
         else
         {
            this._needShade = false;
         }
      }
      
      public function get resFileName() : String
      {
         return this._resFileName;
      }
      
      public function get type() : int
      {
         return this._type;
      }
      
      public function get extraBoneData() : Array
      {
         return this._extraBoneData;
      }
      
      public function get actionNameList() : Array
      {
         return this._actionNameList;
      }
      
      public function get actionRateList() : Array
      {
         return this._actionRateList;
      }
      
      public function get firePosBoneName() : String
      {
         return this._firePosBoneName;
      }
      
      public function get firePosOffsetX() : int
      {
         return this._firePosOffsetX;
      }
      
      public function get firePosOffsetY() : int
      {
         return this._firePosOffsetY;
      }
      
      public function get butterPosList() : Array
      {
         return this._butterPosList;
      }
      
      public function setParam(param1:int, param2:Object) : void
      {
         this._params[param1] = param2;
      }
      
      public function getParamStr(param1:int) : String
      {
         if(this._params[param1] == null)
         {
            return "";
         }
         return this._params[param1];
      }
      
      public function getParam(param1:int) : Number
      {
         if(this._params[param1] == null)
         {
            return 0;
         }
         return this._params[param1];
      }
      
      public function hasParam(param1:int) : Boolean
      {
         if(this._params[param1] == null)
         {
            return false;
         }
         return true;
      }
      
      public function get initBuffList() : Array
      {
         return this._initBuffList;
      }
      
      public function get isNeedShade() : Boolean
      {
         return this._needShade;
      }
   }
}
