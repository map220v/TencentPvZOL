package com.ied.pptc.tconnd
{
   import flash.utils.ByteArray;
   
   interface TConnDInterface
   {
       
      
      function setTimeout(param1:uint) : void;
      
      function setCloseMode(param1:uint) : void;
      
      function send(param1:ByteArray, param2:Function = null, param3:Function = null, param4:uint = 0) : void;
      
      function closeConnect() : void;
   }
}
