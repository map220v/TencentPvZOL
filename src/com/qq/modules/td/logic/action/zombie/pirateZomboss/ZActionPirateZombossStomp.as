package com.qq.modules.td.logic.action.zombie.pirateZomboss
{
   import asgui.events.FrameEvent;
   import com.qq.modules.td.command.game.TDGameObjectCmd;
   import com.qq.modules.td.data.map.TDMapTileData;
   import com.qq.modules.td.logic.action.zombie.BasicZombieAction;
   import com.qq.modules.td.model.TDGameInfo;
   import flash.events.Event;
   
   public class ZActionPirateZombossStomp extends BasicZombieAction
   {
       
      
      public function ZActionPirateZombossStomp()
      {
         super();
      }
      
      override public function enterState(param1:Array = null) : void
      {
         super.enterState(param1);
         _gameObject.setFrozenAI(true);
         _gameObject.animation.addEventListener(Event.COMPLETE,this.onFinish);
         _gameObject.animation.addEventListener(FrameEvent.MOVEMENT_FRAME_EVENT,this.onStomp);
         _gameObject.animation.gotoAndPlay("stomp",1);
      }
      
      private function onStomp(param1:FrameEvent) : void
      {
         var _loc2_:TDMapTileData = null;
         var _loc3_:int = 0;
         if(param1.frameLabel == "stomp_high" || param1.frameLabel == "stomp_low")
         {
            _loc2_ = TDGameInfo.getInstance().getRoadTileByGamePos(_zombie.x,_zombie.y);
            if(_loc2_)
            {
               _loc3_ = param1.frameLabel == "stomp_high" ? int(_loc2_.roadRow) : int(_loc2_.roadRow + 1);
               TDGameObjectCmd.destoryObjByTile(_loc3_,_loc2_.roadCol + 2);
            }
         }
      }
      
      private function onFinish(param1:Event) : void
      {
         _gameObject.animation.removeEventListener(Event.COMPLETE,this.onFinish);
         _gameObject.setAction();
         _gameObject.setFrozenAI(false);
      }
      
      override public function leaveState() : void
      {
         _gameObject.animation.removeEventListener(Event.COMPLETE,this.onFinish);
         _gameObject.animation.removeEventListener(FrameEvent.MOVEMENT_FRAME_EVENT,this.onStomp);
         super.leaveState();
      }
   }
}
