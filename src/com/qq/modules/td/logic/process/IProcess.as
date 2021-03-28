package com.qq.modules.td.logic.process
{
   public interface IProcess
   {
       
      
      function update() : void;
      
      function reset() : void;
      
      function dispose() : void;
      
      function pause() : void;
      
      function resume() : void;
      
      function get time() : int;
      
      function doProcess() : void;
   }
}
