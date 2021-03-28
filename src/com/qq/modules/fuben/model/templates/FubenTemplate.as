package com.qq.modules.fuben.model.templates
{
   import asgui.utils.StringUtil;
   import com.qq.modules.bag.model.vo.ItemVO;
   import com.qq.modules.fuben.model.templates.ce.FubenTemplateCE;
   import flash.geom.Point;
   
   public class FubenTemplate extends FubenTemplateCE
   {
       
      
      private var _itemsRequired:Vector.<ItemVO>;
      
      private var _itemsOptional:Vector.<ItemVO>;
      
      private var _itemsImportantloot:Vector.<ItemVO>;
      
      private var _itemsFirst:Vector.<ItemVO>;
      
      public function FubenTemplate()
      {
         super();
      }
      
      public function getItemsRequired() : Vector.<ItemVO>
      {
         var _loc1_:Array = null;
         var _loc2_:Array = null;
         var _loc3_:int = 0;
         if(this._itemsRequired == null)
         {
            this._itemsRequired = new Vector.<ItemVO>();
            _loc1_ = this.bonusRequired.split(";");
            _loc3_ = 0;
            while(_loc3_ < _loc1_.length)
            {
               _loc2_ = String(_loc1_[_loc3_]).split(":");
               this._itemsRequired.push(new ItemVO(_loc2_[0],_loc2_[1]));
               _loc3_++;
            }
         }
         return this._itemsRequired;
      }
      
      public function getItemsOptional() : Vector.<ItemVO>
      {
         var _loc1_:Array = null;
         var _loc2_:Array = null;
         var _loc3_:int = 0;
         var _loc4_:Boolean = false;
         var _loc5_:int = 0;
         var _loc6_:ItemVO = null;
         if(this._itemsOptional == null)
         {
            this._itemsOptional = new Vector.<ItemVO>();
            if(StringUtil.trim(this.bonusOptional).length <= 1)
            {
               return this._itemsOptional;
            }
            _loc1_ = this.bonusOptional.split(";");
            _loc3_ = 0;
            while(_loc3_ < _loc1_.length)
            {
               _loc2_ = String(_loc1_[_loc3_]).split(":");
               _loc4_ = true;
               _loc5_ = 0;
               while(_loc5_ < this._itemsOptional.length)
               {
                  if((_loc6_ = this._itemsOptional[_loc5_]).itemId == _loc2_[0])
                  {
                     _loc6_.amount += _loc2_[1];
                     _loc4_ = false;
                     break;
                  }
                  _loc5_++;
               }
               if(_loc4_)
               {
                  this._itemsOptional.push(new ItemVO(_loc2_[0],_loc2_[1]));
               }
               _loc3_++;
            }
         }
         return this._itemsOptional;
      }
      
      public function getXyPoint() : Point
      {
         var _loc1_:Array = xy.split(",");
         return new Point(_loc1_[0],_loc1_[1]);
      }
      
      public function getItemsImportantloot() : Vector.<ItemVO>
      {
         var _loc1_:Array = null;
         var _loc2_:Array = null;
         var _loc3_:int = 0;
         if(this._itemsImportantloot == null)
         {
            this._itemsImportantloot = new Vector.<ItemVO>();
            if(StringUtil.trim(this.importantloot).length <= 1)
            {
               return this._itemsImportantloot;
            }
            _loc1_ = this.importantloot.split(";");
            _loc3_ = 0;
            while(_loc3_ < _loc1_.length)
            {
               if(_loc1_[_loc3_] > 0)
               {
                  this._itemsImportantloot.push(new ItemVO(_loc1_[_loc3_]));
               }
               _loc3_++;
            }
         }
         return this._itemsImportantloot;
      }
      
      public function getItemsFirst() : Vector.<ItemVO>
      {
         var _loc1_:Array = null;
         var _loc2_:Array = null;
         var _loc3_:int = 0;
         if(this._itemsFirst == null)
         {
            this._itemsFirst = new Vector.<ItemVO>();
            if(StringUtil.trim(this.bonusFirst).length <= 1)
            {
               return this._itemsFirst;
            }
            _loc1_ = this.bonusFirst.split(";");
            _loc3_ = 0;
            while(_loc3_ < _loc1_.length)
            {
               _loc2_ = String(_loc1_[_loc3_]).split(":");
               this._itemsFirst.push(new ItemVO(_loc2_[0],_loc2_[1]));
               _loc3_++;
            }
         }
         return this._itemsFirst;
      }
   }
}
