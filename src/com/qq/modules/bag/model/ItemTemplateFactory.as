package com.qq.modules.bag.model
{
   import PVZ.Cmd.Dto_ItemTableInfo;
   import com.qq.data.DataCacheManager;
   import com.qq.modules.bag.model.templates.ce.FourFrameBagInfoCE;
   import com.qq.utils.db.ClientDBTableName;
   
   public class ItemTemplateFactory
   {
      
      private static var _instance:ItemTemplateFactory;
       
      
      private var cacheBagItemTemplateArr:Array;
      
      private var _fourFrameBagList:Array;
      
      public function ItemTemplateFactory()
      {
         super();
      }
      
      public static function get instance() : ItemTemplateFactory
      {
         if(_instance == null)
         {
            _instance = new ItemTemplateFactory();
         }
         return _instance;
      }
      
      public function getBagItemName(param1:int) : String
      {
         this.build();
         var _loc2_:BagItemTemplate = this.getBagItemTemplateById(param1);
         if(_loc2_ == null)
         {
            return "";
         }
         return _loc2_.name;
      }
      
      public function getBagItemTemplateById(param1:int) : BagItemTemplate
      {
         this.build();
         return this.cacheBagItemTemplateArr[param1];
      }
      
      public function getBagItemTemplateByType(param1:int) : Vector.<BagItemTemplate>
      {
         var _loc3_:BagItemTemplate = null;
         this.build();
         var _loc2_:Vector.<BagItemTemplate> = new Vector.<BagItemTemplate>();
         for each(_loc3_ in this.cacheBagItemTemplateArr)
         {
            if(_loc3_.type == param1)
            {
               _loc2_.push(_loc3_);
            }
         }
         _loc2_.sort(this.sortItemID);
         return _loc2_;
      }
      
      private function sortItemID(param1:BagItemTemplate, param2:BagItemTemplate) : int
      {
         if(param1.id > param2.id)
         {
            return 1;
         }
         if(param1.id < param2.id)
         {
            return -1;
         }
         return 0;
      }
      
      public function getBagItemTemplateBySubType(param1:int) : Vector.<BagItemTemplate>
      {
         var _loc3_:BagItemTemplate = null;
         this.build();
         var _loc2_:Vector.<BagItemTemplate> = new Vector.<BagItemTemplate>();
         for each(_loc3_ in this.cacheBagItemTemplateArr)
         {
            if(_loc3_.subType == param1)
            {
               _loc2_.push(_loc3_);
            }
         }
         return _loc2_;
      }
      
      private function build() : void
      {
         var _loc1_:Vector.<BagItemTemplate> = null;
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:BagItemTemplate = null;
         if(this.cacheBagItemTemplateArr == null)
         {
            this.cacheBagItemTemplateArr = new Array();
            _loc1_ = Vector.<BagItemTemplate>(DataCacheManager.getInstance().getTemplateCacheData(ClientDBTableName.Table_ItemInfo,BagItemTemplate));
            _loc2_ = _loc1_.length;
            _loc3_ = 0;
            while(_loc3_ < _loc2_)
            {
               _loc4_ = _loc1_[_loc3_];
               this.cacheBagItemTemplateArr[_loc4_.id] = _loc4_;
               _loc3_++;
            }
         }
      }
      
      public function addBagItemTemplate(param1:Dto_ItemTableInfo) : void
      {
         var _loc2_:BagItemTemplate = null;
         if(this.getBagItemTemplateById(param1.id) == null)
         {
            _loc2_ = new BagItemTemplate();
            _loc2_.load(param1);
            this.cacheBagItemTemplateArr[_loc2_.id] = _loc2_;
         }
      }
      
      public function getFourFrameBagInfoByItemID(param1:int) : FourFrameBagInfoCE
      {
         var _loc2_:Vector.<FourFrameBagInfoCE> = null;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:FourFrameBagInfoCE = null;
         if(this._fourFrameBagList == null)
         {
            _loc2_ = Vector.<FourFrameBagInfoCE>(DataCacheManager.getInstance().getTemplateCacheData(ClientDBTableName.TABLE_FOUR_FRAME_BAG,FourFrameBagInfoCE));
            this._fourFrameBagList = new Array();
            _loc3_ = _loc2_.length;
            _loc4_ = 0;
            while(_loc4_ < _loc3_)
            {
               _loc5_ = _loc2_[_loc4_];
               this._fourFrameBagList[_loc5_.id] = _loc5_;
               _loc4_++;
            }
         }
         return this._fourFrameBagList[param1];
      }
   }
}
