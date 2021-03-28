package com.qq.modules.fuben.model.templates
{
   import asgui.utils.StringUtil;
   import com.qq.modules.bag.model.vo.ItemVO;
   import com.qq.modules.fuben.model.templates.ce.HDFubenTemplateCE;
   
   public class HDFubenTemplate extends HDFubenTemplateCE
   {
       
      
      private var _itemsRequired:Vector.<ItemVO>;
      
      private var _itemsOptional:Vector.<ItemVO>;
      
      public function HDFubenTemplate()
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
               this._itemsOptional.push(new ItemVO(_loc2_[0],_loc2_[1]));
               _loc3_++;
            }
         }
         return this._itemsOptional;
      }
   }
}
