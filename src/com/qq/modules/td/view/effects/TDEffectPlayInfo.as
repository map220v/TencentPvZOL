package com.qq.modules.td.view.effects
{
   public class TDEffectPlayInfo
   {
       
      
      public var frameLabe:String;
      
      public var loopCount:int;
      
      public var playTime:int;
      
      public function TDEffectPlayInfo(param1:String = null, param2:int = 1, param3:int = 0)
      {
         super();
         this.frameLabe = param1;
         this.loopCount = param2;
         this.playTime = param3;
      }
      
      public function get isOnLoop() : Boolean
      {
         return this.loopCount > 0;
      }
   }
}
