package com.qq.modules.temple.command
{
   import com.tencent.protobuf.Int64;
   import org.robotlegs.extend.ExtendContext;
   import org.robotlegs.extend.command.StrongRobotlegCommandEvent;
   
   public class TempleProxyCmd
   {
       
      
      public function TempleProxyCmd()
      {
         super();
      }
      
      public static function getTempleInfo(param1:int, param2:int, param3:int) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("TempleProxyCommand","getTempleInfo",[param1,param2,param3]));
      }
      
      public static function doSetOut(param1:int, param2:int, param3:uint) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("TempleProxyCommand","doSetOut",[param1,param2,param3]));
      }
      
      public static function getGuarderInfo(param1:int, param2:int) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("TempleProxyCommand","getGuarderInfo",[param1,param2]));
      }
      
      public static function detectUnionInfo(param1:Int64, param2:int) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("TempleProxyCommand","detectUnionInfo",[param1,param2]));
      }
   }
}
