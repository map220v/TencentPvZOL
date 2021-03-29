package com.qq.modules.temple.command
{
   import com.tencent.protobuf.Int64;
   import org.robotlegs.extend.ExtendContext;
   import org.robotlegs.extend.command.StrongRobotlegCommandEvent;
   
   public class TempleViewCmd
   {
       
      
      public function TempleViewCmd()
      {
         super();
      }
      
      public static function openWarInfo() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("TempleViewCommand","openWarInfo",[]));
      }
      
      public static function openTempleWindow(param1:int, param2:int, param3:int) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("TempleViewCommand","openTempleWindow",[param1,param2,param3]));
      }
      
      public static function openUnionWindow(param1:Int64) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("TempleViewCommand","openUnionWindow",[param1]));
      }
   }
}
