package com.qq.modules.levelselect.model.templates
{
   import com.qq.modules.bag.model.vo.ItemVO;
   import com.qq.modules.levelselect.model.templates.ce.LSLevelTemplateCE;
   
   public class LSLevelTemplate extends LSLevelTemplateCE
   {
       
      
      public var achievementList:Array;
      
      private var _bonusItemVec:Vector.<ItemVO>;
      
      public function LSLevelTemplate()
      {
         super();
         this.achievementList = new Array();
      }
      
      override public function load(param1:Object) : void
      {
         var _loc2_:Array = null;
         var _loc3_:String = null;
         var _loc4_:Array = null;
         super.load(param1);
         if(achievementInfo.length > 0)
         {
            _loc2_ = achievementInfo.split("|");
            for each(_loc3_ in _loc2_)
            {
               _loc4_ = _loc3_.split(":");
               this.achievementList.push(_loc4_);
            }
         }
      }
      
      public function get bonusItemVec() : Vector.<ItemVO>
      {
         var _loc1_:Array = null;
         var _loc2_:Array = null;
         var _loc3_:String = null;
         if(!this._bonusItemVec)
         {
            this._bonusItemVec = new Vector.<ItemVO>();
            if(bonusItems && bonusItems != "")
            {
               _loc1_ = bonusItems.split("|");
               for each(_loc3_ in _loc1_)
               {
                  _loc2_ = _loc3_.split(":");
                  this._bonusItemVec.push(new ItemVO(_loc2_[0],_loc2_[1]));
               }
            }
         }
         return this._bonusItemVec;
      }
   }
}
