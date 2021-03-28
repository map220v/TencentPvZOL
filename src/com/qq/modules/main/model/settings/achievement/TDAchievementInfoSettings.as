package com.qq.modules.main.model.settings.achievement
{
   import com.qq.modules.main.model.settings.achievement.ce.TDAchievementInfoTemplate;
   import com.qq.modules.main.model.settings.achievement.ce.TDAchievementInfoTemplateFactory;
   
   public class TDAchievementInfoSettings
   {
       
      
      private var settingList:Vector.<TDAchievementInfoTemplate>;
      
      public function TDAchievementInfoSettings()
      {
         super();
         this.settingList = TDAchievementInfoTemplateFactory.instance.cache;
      }
      
      public function getAchievementInfoById(param1:int) : TDAchievementInfoTemplate
      {
         var _loc2_:int = this.settingList.length;
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            if(this.settingList[_loc3_].id == param1)
            {
               return this.settingList[_loc3_];
            }
            _loc3_++;
         }
         return null;
      }
   }
}
