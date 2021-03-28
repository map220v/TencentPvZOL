package com.qq.modules.td.logic.action.zombie.mechDisco
{
   import com.qq.constant.td.TDConstant;
   import com.qq.constant.td.TDSoundID;
   import com.qq.modules.td.command.game.TDGameObjectCmd;
   import com.qq.modules.td.command.game.sound.TDSoundCmd;
   import com.qq.modules.td.data.map.TDMapTileData;
   import com.qq.modules.td.logic.action.zombie.BasicZombieAction;
   import com.qq.modules.td.model.TDGameInfo;
   import flash.events.Event;
   import flash.geom.Point;
   
   public class ZActionMechDiscoDance extends BasicZombieAction
   {
       
      
      private const SUMMON_NUM:int = 4;
      
      public function ZActionMechDiscoDance()
      {
         super();
      }
      
      override public function enterState(param1:Array = null) : void
      {
         super.enterState(param1);
         _gameObject.setFrozenAI(true);
         _gameObject.setTimeRecord(TDConstant.TimeRecord_ZombieDuration,TDGameInfo.getInstance().getCurGameTime());
         _gameObject.animation.addEventListener(Event.COMPLETE,this.onFinishStartDace);
         _gameObject.animation.gotoAndPlay("dance_start");
      }
      
      private function onFinishStartDace(param1:Event) : void
      {
         _gameObject.animation.removeEventListener(Event.COMPLETE,this.onFinishStartDace);
         _gameObject.animation.gotoAndPlay("dance_idle");
         _gameObject.animation.addEventListener(Event.COMPLETE,this.onFinishDance);
         this.summonZombie();
      }
      
      private function onFinishDance(param1:Event) : void
      {
         _gameObject.animation.removeEventListener(Event.COMPLETE,this.onFinishDance);
         _gameObject.animation.addEventListener(Event.COMPLETE,this.onFinishDanceEnd);
         _gameObject.animation.gotoAndPlay("dance_end");
      }
      
      private function onFinishDanceEnd(param1:Event) : void
      {
         _gameObject.animation.removeEventListener(Event.COMPLETE,this.onFinishDanceEnd);
         _gameObject.setFrozenAI(false);
         _gameObject.setAction();
      }
      
      private function summonZombie() : void
      {
         var _loc3_:Point = null;
         var _loc4_:int = 0;
         var _loc1_:Array = [];
         var _loc2_:TDMapTileData = TDGameInfo.getInstance().getRoadTileByGamePos(_zombie.x,_zombie.y);
         if(_loc2_)
         {
            if(_loc2_.roadRow > TDGameInfo.getInstance().minRow)
            {
               if(_loc2_.roadCol > TDGameInfo.getInstance().minCol)
               {
                  _loc1_.push([-1,-1]);
               }
               if(_loc2_.roadCol < TDGameInfo.getInstance().maxCol)
               {
                  _loc1_.push([-1,1]);
               }
            }
            if(_loc2_.roadRow < TDGameInfo.getInstance().maxRow)
            {
               if(_loc2_.roadCol > TDGameInfo.getInstance().minCol)
               {
                  _loc1_.push([1,-1]);
               }
               if(_loc2_.roadCol < TDGameInfo.getInstance().maxCol)
               {
                  _loc1_.push([1,1]);
               }
            }
            if(_loc1_.length > 0)
            {
               _loc4_ = 0;
               while(_loc4_ < this.SUMMON_NUM)
               {
                  _loc3_ = TDGameInfo.getInstance().getZomebiePosByTile(_loc2_.roadCol + _loc1_[_loc4_ % _loc1_.length][1],_loc2_.roadRow + _loc1_[_loc4_ % _loc1_.length][0]);
                  TDGameObjectCmd.addGameObjectByPos(TDConstant.UnitCatalog_Zombie,TDConstant.ZombieType_FutureJetpackDisco,_loc3_.x,_loc3_.y);
                  _loc4_++;
               }
               TDSoundCmd.playSound(TDSoundID.Future_Disco_Mvmt_Summon);
            }
         }
      }
      
      override public function leaveState() : void
      {
         super.leaveState();
         _gameObject.animation.removeEventListener(Event.COMPLETE,this.onFinishStartDace);
         _gameObject.animation.removeEventListener(Event.COMPLETE,this.onFinishDance);
         _gameObject.animation.removeEventListener(Event.COMPLETE,this.onFinishDanceEnd);
      }
   }
}
