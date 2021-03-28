package com.qq.utils.lua
{
   import com.qq.modules.guide.GuideGlobals;
   import com.qq.modules.guide.command.GuideCmd;
   import com.qq.utils.CommandDispatcher;
   
   public final class Lua
   {
      
      public static var tmp:Object = {};
      
      public static var guideWdId:String;
       
      
      public function Lua()
      {
         super();
      }
      
      public static function callNpcDialogue(param1:Object) : void
      {
         GuideCmd.showGuide(param1);
      }
      
      public static function next() : void
      {
         CommandDispatcher.send(GuideGlobals.GuideDialogue_Next + "_" + guideWdId);
      }
      
      public static function registerGuide(param1:String, param2:Object) : void
      {
         GuideCmd.registerGuide(param1,param2);
      }
   }
}
