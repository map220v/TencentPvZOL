package com.qq.modules.battle.constant
{
   import com.qq.modules.battle.view.unit.UnitBase;
   import flash.display.DisplayObject;
   import flash.events.Event;
   import flash.geom.Point;
   
   public class BattleEvent extends Event
   {
       
      
      public var posIndex:int;
      
      public var display:UnitBase;
      
      public var displayEffect:DisplayObject;
      
      public var displayAddOnce:Boolean = false;
      
      public var posPoint:Point;
      
      public var isWin:Boolean;
      
      public var fightType:uint;
      
      public function BattleEvent(param1:String, param2:Boolean = false, param3:Boolean = false)
      {
         super(param1,param2,param3);
      }
   }
}
