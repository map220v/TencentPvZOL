package com.qq.modules.friend.model.templates
{
   import com.qq.data.DataCacheManager;
   import com.qq.utils.db.ClientDBTableName;
   
   public class FriendLogTemplateFactory
   {
      
      private static var _instance:FriendLogTemplateFactory;
       
      
      private var cacheFriendLogTemplate:Vector.<FriendLogTemplate>;
      
      public function FriendLogTemplateFactory()
      {
         super();
      }
      
      public static function get instance() : FriendLogTemplateFactory
      {
         if(_instance == null)
         {
            _instance = new FriendLogTemplateFactory();
         }
         return _instance;
      }
      
      public function getFriendLogTemplate(param1:int) : FriendLogTemplate
      {
         var _loc2_:int = 0;
         this.build();
         var _loc3_:int = this.cacheFriendLogTemplate.length;
         _loc2_ = 0;
         while(_loc2_ < _loc3_)
         {
            if(this.cacheFriendLogTemplate[_loc2_].id == param1)
            {
               return this.cacheFriendLogTemplate[_loc2_];
            }
            _loc2_++;
         }
         return null;
      }
      
      private function build() : void
      {
         if(this.cacheFriendLogTemplate == null)
         {
            this.cacheFriendLogTemplate = Vector.<FriendLogTemplate>(DataCacheManager.getInstance().getTemplateCacheData(ClientDBTableName.FriendLogTemplate,FriendLogTemplate));
         }
      }
   }
}
