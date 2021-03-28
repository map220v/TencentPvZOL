package com.qq.modules.chat.command
{
   import com.tencent.protobuf.Int64;
   import org.robotlegs.extend.ExtendContext;
   import org.robotlegs.extend.command.StrongRobotlegCommandEvent;
   
   public class ChatViewCmd
   {
       
      
      public function ChatViewCmd()
      {
         super();
      }
      
      public static function startWhisper(param1:Int64, param2:String) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("ChatViewCommand","startWhisper",[param1,param2]));
      }
      
      public static function showUI() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("ChatViewCommand","showUI",[]));
      }
      
      public static function hideUI() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("ChatViewCommand","hideUI",[]));
      }
      
      public static function switchChatMode(param1:int, param2:int = 0) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("ChatViewCommand","switchChatMode",[param1,param2]));
      }
      
      public static function showIgnorePlayerWindow() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("ChatViewCommand","showIgnorePlayerWindow",[]));
      }
      
      public static function addSelfMsg(param1:int, param2:String) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("ChatViewCommand","addSelfMsg",[param1,param2]));
      }
   }
}
