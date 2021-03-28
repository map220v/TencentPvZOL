package com.gems
{
   public interface IGemEffector
   {
       
      
      function playExchangeFailed(param1:GemWar, param2:GemBase, param3:GemBase, param4:Function) : void;
      
      function playExchangeSucceed(param1:GemWar, param2:GemBase, param3:GemBase, param4:Vector.<GemBase>, param5:Function) : void;
      
      function playFallEffect(param1:GemWar, param2:Vector.<GemBase>, param3:Vector.<GemBase>, param4:Function) : void;
      
      function playDisappear(param1:Vector.<GemBase>, param2:Function) : void;
   }
}
