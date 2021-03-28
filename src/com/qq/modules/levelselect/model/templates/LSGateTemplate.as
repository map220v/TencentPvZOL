package com.qq.modules.levelselect.model.templates
{
   import com.qq.modules.bag.model.vo.BagProxy;
   import com.qq.modules.bag.model.vo.ItemVO;
   import com.qq.modules.levelselect.model.templates.ce.LSGateTemplateCE;
   import com.qq.templates.font.FontHKHB;
   import tencent.base.utils.StringUtil;
   
   public class LSGateTemplate extends LSGateTemplateCE
   {
       
      
      public function LSGateTemplate()
      {
         super();
      }
      
      public function getUnlockTip() : String
      {
         var _loc1_:String = "";
         if(needStars > 0)
         {
            _loc1_ = _loc1_.concat("塔防成就x",needStars);
         }
         _loc1_ = _loc1_.concat(this.getItemNeedString());
         return StringUtil.substitute(FontHKHB.LEVEL_SELECT_UNLOCKTIP,_loc1_);
      }
      
      public function getUnlockAlert() : String
      {
         var _loc1_:String = "";
         if(needStars > 0)
         {
            _loc1_ = _loc1_.concat("塔防成就x",needStars);
         }
         _loc1_ = _loc1_.concat(this.getItemNeedString());
         _loc1_ = StringUtil.substitute(FontHKHB.LEVEL_SELECT_UNLOCKTIP,_loc1_);
         return _loc1_ + "?";
      }
      
      public function checkEnoughStar(param1:int) : Boolean
      {
         return param1 >= needStars;
      }
      
      public function checkEnoughItem(param1:BagProxy) : Boolean
      {
         var _loc3_:ItemVO = null;
         var _loc2_:Vector.<ItemVO> = this.getNeedItems();
         for each(_loc3_ in _loc2_)
         {
            if(_loc3_.amount > param1.getItemNumByItemID(_loc3_.itemId))
            {
               return false;
            }
         }
         return true;
      }
      
      public function checkUnlockable(param1:int, param2:BagProxy) : Boolean
      {
         return this.checkEnoughStar(param1) && this.checkEnoughItem(param2);
      }
      
      public function getItemNeedString() : String
      {
         var _loc3_:int = 0;
         var _loc4_:ItemVO = null;
         var _loc1_:String = "";
         var _loc2_:Vector.<ItemVO> = this.getNeedItems();
         _loc3_ = 0;
         while(_loc3_ < _loc2_.length)
         {
            _loc4_ = _loc2_[_loc3_];
            _loc1_ += _loc4_.template.name + "x" + _loc4_.amount + " ";
            _loc3_++;
         }
         return _loc1_;
      }
      
      public function getNeedItems() : Vector.<ItemVO>
      {
         var _loc3_:int = 0;
         var _loc4_:String = null;
         var _loc5_:Array = null;
         var _loc6_:ItemVO = null;
         var _loc1_:Vector.<ItemVO> = new Vector.<ItemVO>();
         var _loc2_:Array = needItems.split(";");
         _loc3_ = 0;
         while(_loc3_ < _loc2_.length)
         {
            if((_loc4_ = _loc2_[_loc3_]).length > 1)
            {
               _loc5_ = _loc4_.split(":");
               _loc6_ = new ItemVO(_loc5_[0],_loc5_[1]);
               _loc1_.push(_loc6_);
            }
            _loc3_++;
         }
         return _loc1_;
      }
   }
}
