package com.qq.modules.td.logic.action.zombie.basic
{
   import asgui.events.FrameEvent;
   import com.qq.constant.td.TDConstant;
   import com.qq.modules.td.command.game.TDFireBulletCmd;
   import com.qq.modules.td.data.map.TDMapTileData;
   import com.qq.modules.td.logic.action.zombie.BasicZombieAction;
   import com.qq.modules.td.model.TDGameInfo;
   import flash.events.Event;
   import flash.geom.Point;
   
   public class ZombieActionThrowItem extends BasicZombieAction
   {
       
      
      private var _minRangeTile:int = 2;
      
      private var _maxRangeTile:int = 5;
      
      private var _isMulRow:Boolean;
      
      public function ZombieActionThrowItem()
      {
         super();
      }
      
      override public function enterState(param1:Array = null) : void
      {
         super.enterState(param1);
         _gameObject.animation.gotoAndPlay("power",1);
         _gameObject.animation.addEventListener(FrameEvent.MOVEMENT_FRAME_EVENT,this.onThrow);
         _gameObject.animation.addEventListener(Event.COMPLETE,this.onFinish);
      }
      
      private function onFinish(param1:Event = null) : void
      {
         _gameObject.animation.removeEventListener(Event.COMPLETE,this.onFinish);
         _gameObject.setAction();
         _gameObject.setTimeRecord(TDConstant.TimeRecord_ZombieDuration,TDGameInfo.getInstance().getCurGameTime());
      }
      
      private function onThrow(param1:FrameEvent) : void
      {
         var _loc2_:TDMapTileData = null;
         if(param1.frameLabel == "throw")
         {
            _loc2_ = this.getTargetTile();
            if(_loc2_)
            {
               TDFireBulletCmd.zombieThrowItem(_zombie.objectModel.staticInfo.getParam(TDConstant.Zombie_Param_BulletType),new Point(_zombie.x,_zombie.y - 40),new Point(_loc2_.rect.x + _loc2_.rect.width * 0.5,_loc2_.rect.y + _loc2_.rect.height * 0.5));
            }
         }
      }
      
      override public function leaveState() : void
      {
         _gameObject.animation.removeEventListener(FrameEvent.MOVEMENT_FRAME_EVENT,this.onThrow);
         _gameObject.animation.removeEventListener(Event.COMPLETE,this.onFinish);
      }
      
      private function getTargetTile() : TDMapTileData
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:Array = null;
         var _loc1_:TDMapTileData = TDGameInfo.getInstance().getRoadTileByGamePos(_gameObject.x,_gameObject.y);
         if(_loc1_)
         {
            _loc2_ = Math.min(_loc1_.roadCol + this._minRangeTile,TDGameInfo.getInstance().maxCol);
            _loc3_ = Math.min(_loc1_.roadCol + this._maxRangeTile,TDGameInfo.getInstance().maxCol);
            return (_loc4_ = TDGameInfo.getInstance().getRoadTileArr(_loc2_,_loc3_,_loc1_.roadRow,_loc1_.roadRow))[int(Math.random() * _loc4_.length)];
         }
         return null;
      }
   }
}
