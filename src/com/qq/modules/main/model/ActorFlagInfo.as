package com.qq.modules.main.model
{
   public class ActorFlagInfo
   {
       
      
      private var _flagInfo:Array;
      
      public function ActorFlagInfo()
      {
         super();
         this._flagInfo = new Array();
      }
      
      public function reset(param1:Array) : void
      {
         this._flagInfo = param1;
      }
      
      public function getFlagInfoByID(param1:int) : int
      {
         if(this._flagInfo[param1] == null)
         {
            return 0;
         }
         return this._flagInfo[param1];
      }
      
      public function setFlagInfoByID(param1:int, param2:int) : void
      {
         this._flagInfo[param1] = param2;
      }
      
      public function delFlagByID(param1:int) : void
      {
         delete this._flagInfo[param1];
      }
      
      public function hasFlagByID(param1:int) : Boolean
      {
         return this._flagInfo[param1] != null;
      }
   }
}
