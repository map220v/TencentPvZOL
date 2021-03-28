package com.qq.modules.td.command.effects
{
   import org.robotlegs.extend.ExtendContext;
   import org.robotlegs.extend.command.StrongRobotlegCommandEvent;
   
   public class TDEffectCmd
   {
       
      
      public function TDEffectCmd()
      {
         super();
      }
      
      public static function playClipAt(param1:String, param2:int, param3:int, param4:Boolean = false, param5:String = "top", param6:Boolean = false, param7:Object = null, param8:Boolean = true, param9:Function = null) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("TDEffectCommand","playClipAt",[param1,param2,param3,param4,param5,param6,param7,param8,param9]));
      }
      
      public static function playAnimAt(param1:String, param2:int, param3:int, param4:Boolean = false, param5:String = "top", param6:Number = 1) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("TDEffectCommand","playAnimAt",[param1,param2,param3,param4,param5,param6]));
      }
      
      public static function playRewardEndAnimation() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("TDEffectCommand","playRewardEndAnimation",[]));
      }
      
      public static function onFinishRewardEndAnimation() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("TDEffectCommand","onFinishRewardEndAnimation",[]));
      }
      
      public static function playTDFinishing(param1:int, param2:int, param3:Function = null) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("TDEffectCommand","playTDFinishing",[param1,param2,param3]));
      }
      
      public static function playTraceAtGameObject(param1:*, param2:Object) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("TDEffectCommand","playTraceAtGameObject",[param1,param2]));
      }
      
      public static function playFlashToGameObject(param1:int, param2:int, param3:Object) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("TDEffectCommand","playFlashToGameObject",[param1,param2,param3]));
      }
      
      public static function playBombEffect(param1:int, param2:int, param3:int) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("TDEffectCommand","playBombEffect",[param1,param2,param3]));
      }
      
      public static function playDirtEffect(param1:int, param2:int) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("TDEffectCommand","playDirtEffect",[param1,param2]));
      }
      
      public static function playZombieCharredEffect(param1:Object) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("TDEffectCommand","playZombieCharredEffect",[param1]));
      }
      
      public static function playArmorResistEffect(param1:Object) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("TDEffectCommand","playArmorResistEffect",[param1]));
      }
      
      public static function playBambooLiHitEffect(param1:Object, param2:Object) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("TDEffectCommand","playBambooLiHitEffect",[param1,param2]));
      }
      
      public static function playBlitAnimation(param1:int, param2:int, param3:int, param4:Object = null) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("TDEffectCommand","playBlitAnimation",[param1,param2,param3,param4]));
      }
      
      public static function showArrowTargetEffect(param1:int, param2:int) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("TDEffectCommand","showArrowTargetEffect",[param1,param2]));
      }
      
      public static function hideArrowTargetEffect(param1:int) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("TDEffectCommand","hideArrowTargetEffect",[param1]));
      }
      
      public static function showWaterSplash(param1:int, param2:int, param3:Boolean = true) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("TDEffectCommand","showWaterSplash",[param1,param2,param3]));
      }
      
      public static function showBgEffect(param1:int, param2:int, param3:int) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("TDEffectCommand","showBgEffect",[param1,param2,param3]));
      }
   }
}
