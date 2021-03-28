package com.qq.utils.lua
{
   public class LuaManager
   {
      
      private static var _impl:LuaManager;
       
      
      private var lua:LuaInstance;
      
      public function LuaManager()
      {
         super();
         this.lua = new LuaInstance();
      }
      
      public static function get impl() : LuaManager
      {
         if(_impl == null)
         {
            _impl = new LuaManager();
         }
         return _impl;
      }
      
      public static function doString(param1:String) : void
      {
         impl.doString(param1);
      }
      
      public function doString(param1:String) : void
      {
         if(param1 == null || param1.length == 0)
         {
            return;
         }
         this.lua.doString(param1);
      }
   }
}
