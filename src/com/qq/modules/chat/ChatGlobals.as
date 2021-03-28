package com.qq.modules.chat
{
   import PVZ.Cmd.Dto_BlackListInfo;
   import com.qq.GameGloble;
   import com.qq.modules.basic.model.templates.ServerConfigTemplateFactory;
   import com.qq.modules.chat.command.ChatProxyCmd;
   import com.qq.modules.main.command.CommonCmd;
   import com.tencent.protobuf.Int64;
   
   public final class ChatGlobals
   {
      
      public static const CHAT_LINK_TYPE_PRIVATE:String = "private";
      
      public static const CHAT_DISPLAY_TYPE_INPUT:int = 1;
      
      public static const CHAT_DISPLAY_TYPE_UI:int = 2;
      
      public static const CHAT_DISPLAY_TYPE_ALL:int = 3;
      
      public static const CHAT_SENTENCE_ADDED:String = "CHAT_SENTENCE_ADDED";
      
      public static const CHAT_START_WHISPER:String = "CHAT_START_WHISPER";
      
      public static const CHAT_CLOSE_PANEL_EVENT:String = "CHAT_CLOSE_PANEL_EVENT";
      
      public static const CHAT_LINK_CLICK_EVENT:String = "CHAT_LINK_CLICK_EVENT";
      
      public static const CHAT_SHOW_ITEM_EVENT:String = "CHAT_SHOW_ITEM_EVENT";
      
      public static const CHAT_DO_SHOW_UI:String = "CHAT_DO_SHOW_UI";
      
      public static const CHAT_DO_HIDE_UI:String = "CHAT_DO_HIDE_UI";
      
      public static const CHAT_SWITCH_MODE:String = "CHAT_SWITCH_MODE";
      
      public static const CHAT_SEND_SYSTEM_MSG:String = "CHAT_SEND_SYSTEM_MSG";
      
      public static const CHAT_UPDATE_BLACK_LIST:String = "CHAT_UPDATE_BLACK_LIST";
      
      private static var _blackList:Array;
       
      
      public function ChatGlobals()
      {
         super();
      }
      
      public static function addIgnoreChat(param1:Int64, param2:String) : void
      {
         var _loc6_:Dto_BlackListInfo = null;
         if(GameGloble.actorModel.roleId.compare(param1))
         {
            CommonCmd.txtFly("不能屏蔽自己！",NaN,NaN,0,null,true);
            return;
         }
         var _loc3_:Array = getBlackList();
         if(_loc3_ == null)
         {
            return;
         }
         var _loc4_:int;
         if((_loc4_ = _loc3_.length) >= ServerConfigTemplateFactory.instance.iBlackListMaxNum)
         {
            CommonCmd.txtFly("您最多只能屏蔽" + ServerConfigTemplateFactory.instance.iBlackListMaxNum + "个玩家！",NaN,NaN,0,null,true);
            return;
         }
         var _loc5_:Boolean = false;
         for each(_loc6_ in _loc3_)
         {
            if(_loc6_ != null && _loc6_.roleid.compare(param1))
            {
               _loc5_ = true;
               break;
            }
         }
         if(!_loc5_)
         {
            ChatProxyCmd.addBlackList(param1);
            CommonCmd.txtFly("已屏蔽 " + param2,NaN,NaN,0,null,true);
            ChatProxyCmd.getBlackList();
         }
      }
      
      public static function setBlackList(param1:Array) : void
      {
         _blackList = param1;
      }
      
      public static function getBlackList() : Array
      {
         if(_blackList == null)
         {
            ChatProxyCmd.getBlackList();
            return null;
         }
         return _blackList;
      }
      
      public static function hasContainBlackList(param1:Int64) : Boolean
      {
         var _loc5_:Dto_BlackListInfo = null;
         if(param1 == null)
         {
            return false;
         }
         var _loc2_:Array = getBlackList();
         if(_loc2_ == null)
         {
            return false;
         }
         var _loc3_:int = _loc2_.length;
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            if((_loc5_ = _loc2_[_loc4_]) != null && _loc5_.roleid.compare(param1))
            {
               return true;
            }
            _loc4_++;
         }
         return false;
      }
      
      public static function removeFromBlackList(param1:Int64) : void
      {
         var _loc2_:Array = getBlackList();
         if(_loc2_ == null)
         {
            return;
         }
         var _loc3_:int = _loc2_.length;
         var _loc4_:Dto_BlackListInfo = null;
         var _loc5_:int = 0;
         while(_loc5_ < _loc3_)
         {
            if((_loc4_ = _loc2_[_loc5_]) != null && _loc4_.roleid.compare(param1))
            {
               ChatProxyCmd.removeBlackList(param1);
               CommonCmd.txtFly("已解除屏蔽 " + _loc4_.name,NaN,NaN,0,null,true);
               ChatProxyCmd.getBlackList();
               return;
            }
            _loc5_++;
         }
      }
   }
}
