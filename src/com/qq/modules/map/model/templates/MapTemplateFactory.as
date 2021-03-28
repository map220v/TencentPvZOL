package com.qq.modules.map.model.templates
{
   import com.qq.data.DataCacheManager;
   import com.qq.modules.map.model.templates.ce.MapMineBuffTemplateCE;
   import com.qq.modules.map.model.templates.ce.MapMineInfoTemplateCE;
   import com.qq.modules.map.model.templates.ce.MapTempleTypeInfoTemplateCE;
   import com.qq.utils.db.ClientDBTableName;
   
   public class MapTemplateFactory
   {
      
      private static var _instance:MapTemplateFactory;
       
      
      private var cacheMapCellPropTemplate:Vector.<MapCellPropTemplate>;
      
      private var cacheMapCellSkinTemplate:Vector.<MapCellSkinTemplate>;
      
      private var cacheMapLevelTemplate:Vector.<MapLevelTemplate>;
      
      private var cacheMapValidTemple:Vector.<MapTempleTemplate>;
      
      private var cacheMapInvalidTemple:Vector.<MapTempleTemplate>;
      
      private var cacheMapTempleReward:Vector.<MapTempleRewardTemplate>;
      
      private var cacheMapTempleTypeInfo:Vector.<MapTempleTypeInfoTemplateCE>;
      
      private var cacheMapMineInfoTemplate:Vector.<MapMineInfoTemplateCE>;
      
      private var cacheMapMineBuffTemplate:Vector.<MapMineBuffTemplateCE>;
      
      public function MapTemplateFactory()
      {
         super();
      }
      
      public static function get instance() : MapTemplateFactory
      {
         if(_instance == null)
         {
            _instance = new MapTemplateFactory();
         }
         return _instance;
      }
      
      public function getMapCellPropTemplateById(param1:int) : MapCellPropTemplate
      {
         var _loc2_:int = 0;
         this.build();
         var _loc3_:int = this.cacheMapCellPropTemplate.length;
         _loc2_ = 0;
         while(_loc2_ < _loc3_)
         {
            if(this.cacheMapCellPropTemplate[_loc2_].id == param1)
            {
               return this.cacheMapCellPropTemplate[_loc2_];
            }
            _loc2_++;
         }
         return null;
      }
      
      public function getMapCellSkinTemplateById(param1:int) : MapCellSkinTemplate
      {
         var _loc2_:int = 0;
         this.build();
         var _loc3_:int = this.cacheMapCellSkinTemplate.length;
         _loc2_ = 0;
         while(_loc2_ < _loc3_)
         {
            if(this.cacheMapCellSkinTemplate[_loc2_].id == param1)
            {
               return this.cacheMapCellSkinTemplate[_loc2_];
            }
            _loc2_++;
         }
         return null;
      }
      
      public function get allTemple() : Vector.<MapTempleTemplate>
      {
         this.build();
         return this.cacheMapValidTemple;
      }
      
      public function getMapLevelTemplateById(param1:int) : MapLevelTemplate
      {
         var _loc2_:int = 0;
         this.build();
         var _loc3_:int = this.cacheMapLevelTemplate.length;
         _loc2_ = 0;
         while(_loc2_ < _loc3_)
         {
            if(this.cacheMapLevelTemplate[_loc2_].id == param1)
            {
               return this.cacheMapLevelTemplate[_loc2_];
            }
            _loc2_++;
         }
         return null;
      }
      
      public function getMapTempleTemplateById(param1:int) : MapTempleTemplate
      {
         var _loc2_:int = 0;
         this.build();
         var _loc3_:int = this.cacheMapValidTemple.length;
         _loc2_ = 0;
         while(_loc2_ < _loc3_)
         {
            if(this.cacheMapValidTemple[_loc2_].id == param1)
            {
               return this.cacheMapValidTemple[_loc2_];
            }
            _loc2_++;
         }
         return null;
      }
      
      public function getMapTempleType(param1:int) : Array
      {
         var _loc3_:MapTempleTemplate = null;
         this.build();
         var _loc2_:Array = [];
         for each(_loc3_ in this.cacheMapValidTemple)
         {
            if(_loc3_.area == param1)
            {
               if(_loc2_.indexOf(_loc3_.type) < 0)
               {
                  _loc2_.push(_loc3_.type);
               }
            }
         }
         return _loc2_;
      }
      
      public function checkPosValid(param1:int, param2:int, param3:int) : Boolean
      {
         var _loc4_:MapTempleTemplate = null;
         this.build();
         for each(_loc4_ in this.cacheMapInvalidTemple)
         {
            if(_loc4_.checkPos(param1,param2))
            {
               if(_loc4_.area == param3)
               {
                  return false;
               }
            }
         }
         return true;
      }
      
      public function getMapTempleTemplateByPos(param1:int, param2:int, param3:int) : MapTempleTemplate
      {
         var _loc4_:MapTempleTemplate = null;
         this.build();
         for each(_loc4_ in this.cacheMapValidTemple)
         {
            if(_loc4_.checkPos(param1,param2))
            {
               if(_loc4_.area == param3)
               {
                  return _loc4_;
               }
            }
         }
         return null;
      }
      
      public function getMapTempleTypeInfoByID(param1:int) : MapTempleTypeInfoTemplateCE
      {
         var _loc2_:int = 0;
         this.build();
         var _loc3_:int = this.cacheMapTempleTypeInfo.length;
         _loc2_ = 0;
         while(_loc2_ < _loc3_)
         {
            if(this.cacheMapTempleTypeInfo[_loc2_].id == param1)
            {
               return this.cacheMapTempleTypeInfo[_loc2_];
            }
            _loc2_++;
         }
         return null;
      }
      
      public function getMapMineInfoTemplate(param1:int) : MapMineInfoTemplateCE
      {
         this.build();
         var _loc2_:int = this.cacheMapMineInfoTemplate.length;
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            if(this.cacheMapMineInfoTemplate[_loc3_].id == param1)
            {
               return this.cacheMapMineInfoTemplate[_loc3_];
            }
            _loc3_++;
         }
         return null;
      }
      
      public function getMapMineBuffTemplate(param1:int) : MapMineBuffTemplateCE
      {
         var _loc2_:MapMineBuffTemplateCE = null;
         this.build();
         for each(_loc2_ in this.cacheMapMineBuffTemplate)
         {
            if(_loc2_.id == param1)
            {
               return _loc2_;
            }
         }
         return null;
      }
      
      public function getMapTempleTypeDescByID(param1:int) : String
      {
         var _loc2_:MapTempleTypeInfoTemplateCE = this.getMapTempleTypeInfoByID(param1);
         var _loc3_:String = _loc2_.desc;
         return _loc2_.desc;
      }
      
      public function getTempleReward(param1:int, param2:int) : MapTempleRewardTemplate
      {
         var _loc3_:MapTempleRewardTemplate = null;
         var _loc4_:MapTempleRewardTemplate = null;
         for each(_loc4_ in this.cacheMapTempleReward)
         {
            if(_loc4_.type == param1 && param2 >= _loc4_.count)
            {
               if(_loc3_ == null || _loc3_.count < _loc4_.count)
               {
                  _loc3_ = _loc4_;
               }
            }
         }
         return _loc3_;
      }
      
      private function build() : void
      {
         var _loc1_:Vector.<MapTempleTemplate> = null;
         var _loc2_:MapTempleTemplate = null;
         if(this.cacheMapCellPropTemplate == null)
         {
            this.cacheMapCellPropTemplate = Vector.<MapCellPropTemplate>(DataCacheManager.getInstance().getTemplateCacheData(ClientDBTableName.MapCellPropTemplate,MapCellPropTemplate));
         }
         if(this.cacheMapCellSkinTemplate == null)
         {
            this.cacheMapCellSkinTemplate = Vector.<MapCellSkinTemplate>(DataCacheManager.getInstance().getTemplateCacheData(ClientDBTableName.MapCellSkinTemplate,MapCellSkinTemplate));
         }
         if(this.cacheMapLevelTemplate == null)
         {
            this.cacheMapLevelTemplate = Vector.<MapLevelTemplate>(DataCacheManager.getInstance().getTemplateCacheData(ClientDBTableName.MapLevelTemplate,MapLevelTemplate));
         }
         if(this.cacheMapValidTemple == null)
         {
            _loc1_ = Vector.<MapTempleTemplate>(DataCacheManager.getInstance().getTemplateCacheData(ClientDBTableName.MapTempleTemplate,MapTempleTemplate));
            this.cacheMapValidTemple = new Vector.<MapTempleTemplate>();
            this.cacheMapInvalidTemple = new Vector.<MapTempleTemplate>();
            for each(_loc2_ in _loc1_)
            {
               if(_loc2_.isValid > 0)
               {
                  this.cacheMapValidTemple.push(_loc2_);
               }
               else
               {
                  this.cacheMapInvalidTemple.push(_loc2_);
               }
            }
         }
         if(this.cacheMapTempleReward == null)
         {
            this.cacheMapTempleReward = Vector.<MapTempleRewardTemplate>(DataCacheManager.getInstance().getTemplateCacheData(ClientDBTableName.MapTempleReward,MapTempleRewardTemplate));
         }
         if(this.cacheMapTempleTypeInfo == null)
         {
            this.cacheMapTempleTypeInfo = Vector.<MapTempleTypeInfoTemplateCE>(DataCacheManager.getInstance().getTemplateCacheData(ClientDBTableName.MapTempleTypeInfoTable,MapTempleTypeInfoTemplateCE));
         }
         if(this.cacheMapMineInfoTemplate == null)
         {
            this.cacheMapMineInfoTemplate = Vector.<MapMineInfoTemplateCE>(DataCacheManager.getInstance().getTemplateCacheData(ClientDBTableName.MapMineInfoTemplateTable,MapMineInfoTemplateCE));
         }
         if(this.cacheMapMineBuffTemplate == null)
         {
            this.cacheMapMineBuffTemplate = Vector.<MapMineBuffTemplateCE>(DataCacheManager.getInstance().getTemplateCacheData(ClientDBTableName.MapMineBuffTemplateTable,MapMineBuffTemplateCE));
         }
      }
   }
}
