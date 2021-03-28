package com.qq.modules.main.logic.initData.basic
{
   public interface IInitDataTask
   {
       
      
      function start() : void;
      
      function finish() : void;
      
      function get isFinish() : Boolean;
      
      function get isRunning() : Boolean;
   }
}
