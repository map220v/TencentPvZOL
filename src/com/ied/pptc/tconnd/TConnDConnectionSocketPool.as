package com.ied.pptc.tconnd
{
   import flash.utils.ByteArray;
   
   class TConnDConnectionSocketPool extends TConnDConnection
   {
       
      
      private var _pool:TConnDSocketPool = null;
      
      function TConnDConnectionSocketPool(param1:String, param2:uint)
      {
         super(param1,param2);
         this._pool = new TConnDSocketPool(param1,param2);
      }
      
      override public function send(param1:ByteArray, param2:Function = null, param3:Function = null, param4:uint = 0) : void
      {
         if(param4 == 0)
         {
            param4 = _delay;
         }
         this._pool.getSocketHandler().send(param1,param2,param3,param4,_closemode);
      }
   }
}
