package com.qq.modules.td.logic.action.zombie.quicksand
{
   import asgui.events.FrameEvent;
   import com.qq.constant.td.TDConstant;
   import com.qq.modules.td.command.game.TDGameObjectCmd;
   import com.qq.modules.td.logic.TDFactory;
   import com.qq.modules.td.logic.action.zombie.BasicZombieAction;
   import com.qq.modules.td.logic.unit.basic.IGameObject;
   import com.qq.modules.td.model.TDGameInfo;
   import flash.events.Event;
   
   public class ZActionThrowQuickSandAction extends BasicZombieAction
   {
       
      
      public function ZActionThrowQuickSandAction()
      {
         super();
      }
      
      override public function enterState(param1:Array = null) : void
      {
         super.enterState(param1);
         _zombie.animation.gotoAndPlay("skill",1);
         _zombie.animation.addEventListener(Event.COMPLETE,this.onPowerDownComplete,false,0,true);
         _zombie.animation.addEventListener(FrameEvent.MOVEMENT_FRAME_EVENT,this.onSkill);
      }
      
      private function onPowerDownComplete(param1:Event) : void
      {
         _zombie.animation.removeEventListener(Event.COMPLETE,this.onPowerDownComplete);
         _gameObject.setAction();
         _gameObject.setTimeRecord(TDConstant.TimeRecord_ZombieDuration,TDGameInfo.getInstance().getCurGameTime());
      }
      
      private function onSkill(param1:FrameEvent) : void
      {
         var _loc2_:Array = null;
         if(param1.frameLabel == "attack")
         {
            _loc2_ = this.getSandsRoad();
            if(_loc2_.length > 0)
            {
               TDGameObjectCmd.showQuickSand(_loc2_);
               _gameObject.setRunningProp(TDConstant.Gameobject_Prop_ThrowQuickSandID,TDFactory.getLastUnitUin());
            }
         }
      }
      
      override public function leaveState() : void
      {
         super.leaveState();
         _zombie.animation.removeEventListener(FrameEvent.MOVEMENT_FRAME_EVENT,this.onSkill);
         _zombie.animation.removeEventListener(Event.COMPLETE,this.onPowerDownComplete);
      }
      
      override public function dispose() : void
      {
         var _loc2_:IGameObject = null;
         var _loc1_:int = _gameObject.getRunningProp(TDConstant.Gameobject_Prop_ThrowQuickSandID);
         if(_loc1_ != 0)
         {
            _loc2_ = TDGameInfo.getInstance().getGameObjctByUID(_loc1_);
            if(_loc2_ != null)
            {
               _loc2_.setAction(TDConstant.QuickSandDisapperAction);
            }
         }
         super.dispose();
      }
      
      public function getSandsRoad() : Array
      {
         var _loc5_:int = 0;
         var _loc6_:IGameObject = null;
         var _loc1_:Array = [];
         var _loc2_:Array = TDGameInfo.getInstance().getGameObjectMapByCatalgAndType(TDConstant.UnitCatalog_Object,TDConstant.UnitType_QuickSand);
         if(_loc2_.length > 0)
         {
            return _loc1_;
         }
         var _loc3_:Array = new Array();
         var _loc4_:Array;
         if((_loc4_ = TDGameInfo.getInstance().getGameObjectMapByCatalgAndType(TDConstant.UnitCatalog_Object,TDConstant.UnitType_Conveyor)).length > 0)
         {
            _loc5_ = 0;
            while(_loc5_ < _loc4_.length)
            {
               _loc6_ = _loc4_[_loc5_];
               _loc3_.push(_loc6_.objectModel.roadIndex);
               _loc5_++;
            }
         }
         if(_loc3_.indexOf(2) == -1 && _loc3_.indexOf(3) == -1)
         {
            _loc1_.push(2);
         }
         if(_loc3_.indexOf(4) == -1 && _loc3_.indexOf(3) == -1)
         {
            _loc1_.push(4);
         }
         if(_loc3_.indexOf(2) == -1 && _loc3_.indexOf(4) == -1 && _loc3_.indexOf(3) == -1)
         {
            _loc1_.push(3);
         }
         return _loc1_;
      }
   }
}
