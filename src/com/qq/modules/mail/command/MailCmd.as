package com.qq.modules.mail.command
{
   import com.tencent.protobuf.Int64;
   import org.robotlegs.extend.ExtendContext;
   import org.robotlegs.extend.command.StrongRobotlegCommandEvent;
   
   public class MailCmd
   {
       
      
      public function MailCmd()
      {
         super();
      }
      
      public static function openMailWin_write(param1:Int64, param2:String, param3:String) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("MailCommand","openMailWin_write",[param1,param2,param3]));
      }
      
      public static function findFirstAttachment() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("MailCommand","findFirstAttachment",[]));
      }
      
      public static function openMailWin(param1:int = 1) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("MailCommand","openMailWin",[param1]));
      }
      
      public static function playItemFly(param1:Object) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("MailCommand","playItemFly",[param1]));
      }
      
      public static function openMail(param1:Object) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("MailCommand","openMail",[param1]));
      }
   }
}
