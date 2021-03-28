package com.qq.modules.entryIcon.model
{
   public class EntryIconVO
   {
       
      
      private var m_id:uint;
      
      private var m_callBack:Function;
      
      private var m_params:Array;
      
      private var m_needEffect:Boolean = false;
      
      private var m_isGroupIcon:Boolean;
      
      public function EntryIconVO(param1:uint, param2:Function = null, param3:Array = null, param4:Boolean = false)
      {
         super();
         this.m_id = param1;
         this.m_callBack = param2;
         this.m_params = param3;
         this.m_isGroupIcon = param4;
      }
      
      public function get type() : int
      {
         return 0;
      }
      
      public function set needEffect(param1:Boolean) : void
      {
         this.m_needEffect = param1;
      }
      
      public function get needEffect() : Boolean
      {
         return this.m_needEffect;
      }
      
      public function get id() : uint
      {
         return this.m_id;
      }
      
      public function get order() : Number
      {
         return 0;
      }
      
      public function applyCallBack() : void
      {
         if(this.m_callBack != null)
         {
            if(this.m_params != null)
            {
               this.m_callBack.apply(null,this.m_params);
            }
            else
            {
               this.m_callBack.apply();
            }
         }
      }
      
      public function get desc() : String
      {
         return "";
      }
      
      public function get isGroupIcon() : Boolean
      {
         return this.m_isGroupIcon;
      }
      
      public function hasPolicy(param1:int) : Boolean
      {
         return false;
      }
   }
}
