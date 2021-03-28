package com.qq.modules.main.model.templates
{
   import asgui.utils.StringUtil;
   import com.qq.data.DataCacheManager;
   import com.qq.templates.font.FontNormal;
   import com.qq.utils.db.ClientDBTableName;
   
   public class CardHealthTemplateFactory
   {
      
      private static var _instance:CardHealthTemplateFactory;
       
      
      private var _cardHealths:Array;
      
      public function CardHealthTemplateFactory()
      {
         super();
         this._cardHealths = DataCacheManager.getInstance().getTemplateCacheData(ClientDBTableName.TABLE_CARD_HEALTH,CardHealthTemplate);
      }
      
      public static function get instance() : CardHealthTemplateFactory
      {
         if(!_instance)
         {
            _instance = new CardHealthTemplateFactory();
         }
         return _instance;
      }
      
      public function getCardHealth() : Array
      {
         return this._cardHealths;
      }
      
      public function getCardHealthInfo(param1:int) : CardHealthTemplate
      {
         var _loc2_:CardHealthTemplate = null;
         var _loc3_:int = 0;
         while(_loc3_ < this._cardHealths.length)
         {
            if(param1 >= this._cardHealths[_loc3_].lowHp)
            {
               _loc2_ = this._cardHealths[_loc3_];
            }
            _loc3_++;
         }
         return _loc2_;
      }
      
      public function getCardHealthInfoById(param1:int) : CardHealthTemplate
      {
         var _loc2_:CardHealthTemplate = null;
         var _loc3_:int = 0;
         while(_loc3_ < this._cardHealths.length)
         {
            if(CardHealthTemplate(this._cardHealths[_loc3_]).id == param1)
            {
               _loc2_ = this._cardHealths[_loc3_];
            }
            _loc3_++;
         }
         return _loc2_;
      }
      
      public function getCardHealthTip(param1:int) : String
      {
         var _loc3_:uint = 0;
         var _loc2_:CardHealthTemplate = this.getCardHealthInfo(param1);
         if(_loc2_.id == 5)
         {
            return StringUtil.substitute(FontNormal.CARD_HEALTH_FULL,_loc2_.lowHp);
         }
         _loc3_ = this.getCardHealthInfoById(_loc2_.id + 1).lowHp;
         return StringUtil.substitute(FontNormal.CARD_HEALTH_NOT_FULL,_loc3_,_loc2_.powRate);
      }
   }
}
