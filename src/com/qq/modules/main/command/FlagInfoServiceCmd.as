package com.qq.modules.main.command
{
   import com.tencent.protobuf.Int64;
   import org.robotlegs.extend.ExtendContext;
   import org.robotlegs.extend.command.StrongRobotlegCommandEvent;
   
   public class FlagInfoServiceCmd
   {
       
      
      public function FlagInfoServiceCmd()
      {
         super();
      }
      
      public static function initFlagInfo() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("FlagInfoServiceCommand","initFlagInfo",[]));
      }
      
      public static function getDtoFromServer(param1:int, param2:Int64, param3:Int64) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("FlagInfoServiceCommand","getDtoFromServer",[param1,param2,param3]));
      }
      
      public static function getDtoFromeServerByStringPara(param1:String) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("FlagInfoServiceCommand","getDtoFromeServerByStringPara",[param1]));
      }
      
      public static function getCard_RawAttribute(param1:Array) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("FlagInfoServiceCommand","getCard_RawAttribute",[param1]));
      }
   }
}
