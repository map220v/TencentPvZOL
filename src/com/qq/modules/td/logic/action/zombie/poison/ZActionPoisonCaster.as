package com.qq.modules.td.logic.action.zombie.poison
{
   import asgui.events.FrameEvent;
   import com.qq.constant.td.TDConstant;
   import com.qq.constant.td.TDObjTypeID;
   import com.qq.modules.td.command.game.TDGameObjectCmd;
   import com.qq.modules.td.data.map.TDMapTileData;
   import com.qq.modules.td.logic.TDFactory;
   import com.qq.modules.td.logic.action.zombie.BasicZombieAction;
   import com.qq.modules.td.logic.bt_ai.aiUtils.TDSearchTargetUtils;
   import com.qq.modules.td.logic.unit.object.TDZombieThrowItem;
   import com.qq.modules.td.model.TDGameInfo;
   import flash.events.Event;
   
   public class ZActionPoisonCaster extends BasicZombieAction
   {
       
      
      public function ZActionPoisonCaster()
      {
         super();
      }
      
      override public function enterState(param1:Array = null) : void
      {
         super.enterState(param1);
         _gameObject.setFrozenAI(true);
         _gameObject.animation.addEventListener(Event.COMPLETE,this.onFinish);
         _gameObject.animation.addEventListener(FrameEvent.MOVEMENT_FRAME_EVENT,this.onCaster);
         _gameObject.animation.gotoAndPlay("caster",1);
      }
      
      private function onFinish(param1:Event) : void
      {
         _gameObject.animation.removeEventListener(Event.COMPLETE,this.onFinish);
         _gameObject.setAction();
         _gameObject.setFrozenAI(false);
         _gameObject.setTimeRecord(TDConstant.TimeRecord_ZombieDuration,TDGameInfo.getInstance().getCurGameTime());
      }
      
      private function onCaster(param1:FrameEvent) : void
      {
         var _loc2_:TDMapTileData = null;
         var _loc3_:Boolean = false;
         var _loc4_:TDMapTileData = null;
         var _loc5_:int = 0;
         var _loc6_:uint = 0;
         var _loc7_:int = 0;
         var _loc8_:TDMapTileData = null;
         var _loc9_:TDZombieThrowItem = null;
         if(param1.frameLabel == "caster_out")
         {
            _loc2_ = TDGameInfo.getInstance().getRoadTileByGamePos(_gameObject.x,_gameObject.y);
            _loc3_ = false;
            _loc5_ = TDGameInfo.getInstance().getRoadIndex(_gameObject.y);
            if(_loc2_ == null)
            {
               _loc4_ = TDGameInfo.getInstance().getRoadTileInf(0,_loc5_);
            }
            else
            {
               _loc4_ = TDGameInfo.getInstance().getRoadTileInf(_loc2_.roadCol + 1,_loc5_);
            }
            _loc6_ = 3;
            if(_loc4_)
            {
               _loc7_ = 1;
               while(_loc7_ <= _loc6_)
               {
                  if(TDSearchTargetUtils.searchTargetNutsShieldByColumn(_loc4_.roadCol + _loc7_ - 1))
                  {
                     _loc6_ = _loc7_ - 1;
                     break;
                  }
                  _loc7_++;
               }
            }
            _loc7_ = 1;
            while(_loc7_ <= _loc6_)
            {
               if(_loc2_ == null)
               {
                  _loc8_ = TDGameInfo.getInstance().getRoadTileInf(_loc7_ - 1,_loc5_);
               }
               else
               {
                  _loc8_ = TDGameInfo.getInstance().getRoadTileInf(_loc2_.roadCol + _loc7_,_loc5_);
               }
               if(_loc8_)
               {
                  TDGameObjectCmd.addGameObjectByPos(TDConstant.UnitCatalog_Object,TDObjTypeID.Obj_Poison,_gameObject.x - _gameObject.animation.display.width * 0.85,_gameObject.y - _gameObject.animation.display.height * 0.6);
                  (_loc9_ = TDGameInfo.getInstance().getGameObjctByUID(TDFactory.getLastUnitUin()) as TDZombieThrowItem).throwTargetX = _loc8_.rect.x + _loc8_.rect.width * 0.5;
                  _loc9_.throwTargetY = _loc8_.rect.y + _loc8_.rect.height * 0.5;
                  _loc9_.setAction(TDConstant.PoisonAction_Fly);
               }
               _loc7_++;
            }
         }
      }
      
      override public function leaveState() : void
      {
         _gameObject.animation.removeEventListener(Event.COMPLETE,this.onFinish);
         _gameObject.animation.removeEventListener(FrameEvent.MOVEMENT_FRAME_EVENT,this.onCaster);
         super.leaveState();
      }
   }
}
