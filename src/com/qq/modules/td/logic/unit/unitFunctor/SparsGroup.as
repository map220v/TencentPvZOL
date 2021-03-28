package com.qq.modules.td.logic.unit.unitFunctor
{
   import com.qq.modules.basic.event.CommonEvent;
   import com.qq.modules.td.logic.unit.basic.IGameObject;
   import flash.events.EventDispatcher;
   import tencent.tools.group.BaseGroup;
   
   public class SparsGroup extends BaseGroup
   {
      
      public static const NAME:String = "SPARS";
      
      public static const EVENT_CHANGE_HP:String = "EVENT_CHANGE_HP";
       
      
      private var _dispatcher:EventDispatcher;
      
      public function SparsGroup()
      {
         super();
         this._dispatcher = new EventDispatcher();
      }
      
      public function get dispatcher() : EventDispatcher
      {
         return this._dispatcher;
      }
      
      public function changeHP(param1:int, param2:IGameObject) : void
      {
         var _loc3_:Object = new Object();
         _loc3_.changeHP = param1;
         _loc3_.attackTarget = param2;
         this.dispatcher.dispatchEvent(new CommonEvent(EVENT_CHANGE_HP,_loc3_));
      }
   }
}
