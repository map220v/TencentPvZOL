package com.qq.modules.main.model.vo
{
   public class LevelObserver
   {
       
      
      private var m_level:int;
      
      private var m_callBack:Function;
      
      private var m_params:Array;
      
      private var m_runOnce:Boolean;
      
      public function LevelObserver(param1:int, param2:Function = null, param3:Array = null, param4:Boolean = true)
      {
         super();
         this.m_level = param1;
         this.m_callBack = param2;
         this.m_params = param3;
         this.m_runOnce = param4;
      }
      
      public static function sortByLevel(param1:LevelObserver, param2:LevelObserver) : int
      {
         return param1.level - param2.level;
      }
      
      public function get level() : int
      {
         return this.m_level;
      }
      
      public function check(param1:int) : Boolean
      {
         return this.m_level <= param1;
      }
      
      public function get runOnce() : Boolean
      {
         return this.m_runOnce;
      }
      
      public function excute() : void
      {
         if(this.m_callBack != null)
         {
            if(this.m_params != null)
            {
               this.m_callBack.apply(null,this.m_params);
            }
            else
            {
               this.m_callBack.apply(null);
            }
         }
      }
   }
}
