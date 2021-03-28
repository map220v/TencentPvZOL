package com.qq.modules.main.model
{
   import flash.utils.Dictionary;
   import org.robotlegs.mvcs.Actor;
   
   public class StoreModel extends Actor
   {
       
      
      private var buyItemFunc:Dictionary;
      
      public var curItemShopId:uint;
      
      public var itemCount:int;
      
      public function StoreModel()
      {
         super();
         this.buyItemFunc = new Dictionary();
      }
      
      public function addItemBackFunc(param1:uint, param2:Function, param3:Array) : void
      {
         this.buyItemFunc[param1] = {
            "backFunc":param2,
            "params":param3
         };
      }
      
      public function removeItemBackFunc(param1:uint) : void
      {
         delete this.buyItemFunc[param1];
      }
      
      public function applyItemBackFunc(param1:uint) : void
      {
         var _loc3_:Function = null;
         var _loc4_:Object = null;
         var _loc2_:Object = this.buyItemFunc[param1];
         if(_loc2_)
         {
            _loc3_ = _loc2_.backFunc;
            _loc4_ = _loc2_.params;
            _loc3_.apply(this,_loc4_);
         }
      }
   }
}
