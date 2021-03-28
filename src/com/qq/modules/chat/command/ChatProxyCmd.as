package com.qq.modules.chat.command
{
   import com.tencent.protobuf.Int64;
   import org.robotlegs.extend.ExtendContext;
   import org.robotlegs.extend.command.StrongRobotlegCommandEvent;
   
   public class ChatProxyCmd
   {
       
      
      public function ChatProxyCmd()
      {
         super();
      }
      
      public static function sendMsg(param1:int, param2:String, param3:Int64 = null, param4:int = 0, param5:Int64 = null) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("ChatProxyCommand","sendMsg",[param1,param2,param3,param4,param5]));
      }
      
      public static function getChatData() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("ChatProxyCommand","getChatData",[]));
      }
      
      public static function outputErrorText(param1:String) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("ChatProxyCommand","outputErrorText",[param1]));
      }
      
      public static function showItem(param1:Object) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("ChatProxyCommand","showItem",[param1]));
      }
      
      public static function addBlackList(param1:Int64) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("ChatProxyCommand","addBlackList",[param1]));
      }
      
      public static function removeBlackList(param1:Int64) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("ChatProxyCommand","removeBlackList",[param1]));
      }
      
      public static function getBlackList() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("ChatProxyCommand","getBlackList",[]));
      }
   }
}
