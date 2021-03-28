package com.qq.modules.guide.model
{
   public class GuideData
   {
       
      
      public var keys:Array;
      
      public var initObjs:Array;
      
      public var objs:Array;
      
      private var m_orderID:int;
      
      private var m_vecWait:Vector.<int>;
      
      public function GuideData()
      {
         var _loc1_:* = undefined;
         this.keys = [];
         super();
         this.initObjs = new GuideInitCode().main();
         this.objs = [];
         for(_loc1_ in this.initObjs)
         {
            this.objs[_loc1_] = this.initObjs[_loc1_];
         }
         this.m_vecWait = new Vector.<int>();
      }
      
      public function set waitList(param1:Array) : void
      {
         var _loc2_:int = 0;
         this.m_vecWait.length = 0;
         if(param1)
         {
            for each(_loc2_ in param1)
            {
               this.m_vecWait.push(_loc2_);
            }
         }
         this.m_orderID = this.firstOrderID;
      }
      
      private function get firstOrderID() : int
      {
         if(this.m_vecWait.length > 0)
         {
            this.m_vecWait.sort(this.compareWait);
            return this.m_vecWait[0];
         }
         return 0;
      }
      
      private function compareWait(param1:int, param2:int) : int
      {
         return param1 - param2;
      }
      
      public function finish(param1:int) : void
      {
         var _loc2_:int = this.m_vecWait.indexOf(param1);
         if(_loc2_ >= 0)
         {
            this.m_vecWait.splice(_loc2_,1);
         }
         this.m_orderID = this.firstOrderID;
      }
      
      public function getObjByType(... rest) : Object
      {
         var _loc2_:int = 0;
         var _loc3_:* = "";
         _loc2_ = 0;
         while(_loc2_ < rest.length)
         {
            if(_loc3_.length != 0)
            {
               _loc3_ += "_";
            }
            _loc3_ += rest[_loc2_];
            _loc2_++;
         }
         return this.objs[_loc3_];
      }
      
      public function get orderID() : int
      {
         return this.m_orderID;
      }
      
      public function getObjByName(param1:String) : Object
      {
         return this.objs[param1];
      }
      
      public function getKeyValue(param1:String) : String
      {
         return this.keys[param1];
      }
   }
}
