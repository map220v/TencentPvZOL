package com.qq.modules.friend.model.vo
{
   import PVZ.Cmd.Dto_FriendFightInfo;
   import com.qq.modules.friend.model.templates.FriendLogTemplate;
   import com.qq.modules.friend.model.templates.FriendLogTemplateFactory;
   
   public class FriendFightLogVo
   {
       
      
      public var dto:Dto_FriendFightInfo;
      
      private var _tempalte:FriendLogTemplate;
      
      public function FriendFightLogVo(param1:Dto_FriendFightInfo)
      {
         super();
         this.dto = param1;
      }
      
      public function get tempalte() : FriendLogTemplate
      {
         if(this._tempalte == null)
         {
            this._tempalte = FriendLogTemplateFactory.instance.getFriendLogTemplate(this.dto.type);
         }
         return this._tempalte;
      }
      
      public function getDesc() : String
      {
         var _loc1_:String = this.tempalte.desc;
         _loc1_ = _loc1_.replace("{role_name}",this.dto.name);
         while(_loc1_.indexOf("[") != -1)
         {
            _loc1_ = _loc1_.replace("[","<");
         }
         return _loc1_.replace(/]/g,">");
      }
   }
}
