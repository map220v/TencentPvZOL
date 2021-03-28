package com.qq.modules.commEmbattle.command
{
   import org.robotlegs.extend.ExtendContext;
   import org.robotlegs.extend.command.StrongRobotlegCommandEvent;
   
   public class CommEmbattleCmd
   {
       
      
      public function CommEmbattleCmd()
      {
         super();
      }
      
      public static function openEmbattle(param1:uint, param2:Object, param3:Function, param4:Array = null, param5:Boolean = false, param6:Object = null) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("CommEmbattleCommand","openEmbattle",[param1,param2,param3,param4,param5,param6]));
      }
      
      public static function openEmbattleShow(param1:Array, param2:Boolean = true) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("CommEmbattleCommand","openEmbattleShow",[param1,param2]));
      }
      
      public static function openEmbattleShowWithDto(param1:Object, param2:Boolean = true, param3:Object = null) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("CommEmbattleCommand","openEmbattleShowWithDto",[param1,param2,param3]));
      }
      
      public static function openEmbattleShowWithCardDtoList(param1:Vector.<Array>, param2:Boolean = true) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("CommEmbattleCommand","openEmbattleShowWithCardDtoList",[param1,param2]));
      }
      
      public static function switchMultyCardDtoList(param1:int) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("CommEmbattleCommand","switchMultyCardDtoList",[param1]));
      }
   }
}
