package com.qq.modules.td.data.game.unit
{
   import com.qq.GameGloble;
   import com.qq.data.DataCacheManager;
   import com.qq.display.CardItemFactory;
   import com.qq.modules.td.data.game.ITDStaticData;
   import com.qq.modules.td.data.game.unit.ce.TDPlantTypeTemplateCE;
   import com.qq.utils.UrlManager;
   import com.qq.utils.db.ClientDBTableName;
   
   public class TDPlantBaseStaticInfo extends TDPlantTypeTemplateCE implements ITDStaticData
   {
       
      
      public var InitHideBones:Array;
      
      private var _specialSkillParamList:Array;
      
      private var _cardHideBoneList:Array;
      
      private var _isSort:Number = 1;
      
      public function TDPlantBaseStaticInfo()
      {
         super();
         this.InitHideBones = [];
         this._specialSkillParamList = new Array();
      }
      
      override public function load(param1:Object) : void
      {
         var _loc3_:String = null;
         var _loc4_:Array = null;
         super.load(param1);
         _resFileName = String(param1.resName);
         this.InitHideBones = splitStr(initHideBones,"|");
         var _loc2_:Array = splitStr(specialSkillParam,"|");
         for each(_loc3_ in _loc2_)
         {
            _loc4_ = _loc3_.split(":");
            this._specialSkillParamList[_loc4_[0]] = _loc4_[1];
         }
      }
      
      public function get resFileUrl() : String
      {
         return UrlManager.getUrl(UrlManager.Url_TDPlantAnmi,resFileName + "." + GameGloble.BONE_FILE_EXT);
      }
      
      public function getResFileUrl(param1:int = 0) : String
      {
         if(param1 == 1)
         {
            return UrlManager.getUrl(UrlManager.Url_TDPlantAnmi,resFileName + "_" + param1 + "x." + GameGloble.BONE_FILE_EXT);
         }
         return UrlManager.getUrl(UrlManager.Url_TDPlantAnmi,resFileName + "." + GameGloble.BONE_FILE_EXT);
      }
      
      public function get prePlant() : TDPlantBaseStaticInfo
      {
         return DataCacheManager.getInstance().getTemplateDataById(ClientDBTableName.Table_PlantTypeInfo,prePlantType,TDPlantBaseStaticInfo);
      }
      
      public function get iconUrl() : String
      {
         return CardItemFactory.getIconURL(iconID);
      }
      
      public function get cardHideBoneList() : Array
      {
         if(!this._cardHideBoneList)
         {
            this._cardHideBoneList = cardHideBone.split("|");
         }
         return this._cardHideBoneList;
      }
      
      public function get isSort() : Number
      {
         return this._isSort;
      }
      
      public function getSpecialSkillParam(param1:int) : int
      {
         return int(this._specialSkillParamList[param1]);
      }
      
      public function getSpecialSkillParamStr(param1:int) : String
      {
         return String(this._specialSkillParamList[param1]);
      }
   }
}
