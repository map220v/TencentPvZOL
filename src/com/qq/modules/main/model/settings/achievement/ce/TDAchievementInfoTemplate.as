package com.qq.modules.main.model.settings.achievement.ce
{
   import asgui.utils.StringUtil;
   import com.qq.modules.td.data.TDDataFactory;
   
   public class TDAchievementInfoTemplate extends TDAchievementInfoTemplateCE
   {
      
      private static const REPLACE_PLANT_NAME:String = "{plantName}";
       
      
      public function TDAchievementInfoTemplate()
      {
         super();
      }
      
      public function getDesc(param1:Array) : String
      {
         var _loc4_:Array = null;
         var _loc2_:String = this.desc;
         if(param1 == null)
         {
            return _loc2_;
         }
         var _loc3_:int = 0;
         while(_loc3_ < param1.length)
         {
            if((_loc4_ = param1[_loc3_])[0] == id)
            {
               _loc2_ = StringUtil.substitute(_loc2_,_loc4_);
               if(_loc2_.indexOf(REPLACE_PLANT_NAME) >= 0)
               {
                  _loc2_ = _loc2_.replace(REPLACE_PLANT_NAME,TDDataFactory.instance.getPlantBaseInfoByID(_loc4_[1]).name);
               }
            }
            _loc3_++;
         }
         return _loc2_;
      }
   }
}
