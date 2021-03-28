package com.qq.modules.main.model
{
   import PVZ.Cmd.Dto_DiamondInfo;
   import PVZ.Cmd.Dto_DiamondLevel;
   import flash.utils.Dictionary;
   
   public class PrivilegeDiamond
   {
       
      
      private var m_dicLevel:Dictionary;
      
      private var m_tag:uint;
      
      public function PrivilegeDiamond()
      {
         super();
         this.m_dicLevel = new Dictionary();
      }
      
      public static function create(param1:uint, param2:Array) : PrivilegeDiamond
      {
         var _loc4_:Dto_DiamondLevel = null;
         var _loc3_:PrivilegeDiamond = new PrivilegeDiamond();
         _loc3_.tag = param1;
         if(param2)
         {
            for each(_loc4_ in param2)
            {
               _loc3_.setLevel(_loc4_.type,_loc4_.level);
            }
         }
         return _loc3_;
      }
      
      public static function createByInfo(param1:Dto_DiamondInfo) : PrivilegeDiamond
      {
         if(param1)
         {
            return create(param1.flag,param1.diamondLevel);
         }
         return null;
      }
      
      public function setLevel(param1:uint, param2:uint) : void
      {
         this.m_dicLevel[param1] = param2;
      }
      
      public function getLevel(param1:uint) : uint
      {
         return this.m_dicLevel[param1];
      }
      
      public function set tag(param1:uint) : void
      {
         this.m_tag = param1;
      }
      
      public function get tag() : uint
      {
         return this.m_tag;
      }
   }
}
