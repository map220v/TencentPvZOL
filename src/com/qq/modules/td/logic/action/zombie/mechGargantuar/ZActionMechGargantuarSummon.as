package com.qq.modules.td.logic.action.zombie.mechGargantuar
{
   import asgui.events.FrameEvent;
   import com.qq.constant.td.TDConstant;
   import com.qq.modules.td.command.game.TDGameObjectCmd;
   import com.qq.modules.td.data.map.TDMapTileData;
   import com.qq.modules.td.logic.action.zombie.BasicZombieAction;
   import com.qq.modules.td.logic.bt_ai.aiUtils.TDSearchTargetUtils;
   import com.qq.modules.td.logic.unit.zombie.BasicZombie;
   import com.qq.modules.td.model.TDGameInfo;
   import flash.events.Event;
   import net.sakri.flash.math.MathUtil;
   
   public class ZActionMechGargantuarSummon extends BasicZombieAction
   {
       
      
      public function ZActionMechGargantuarSummon()
      {
         super();
      }
      
      override public function enterState(param1:Array = null) : void
      {
         super.enterState(param1);
         _gameObject.setFrozenAI(true);
         _gameObject.animation.addEventListener(Event.COMPLETE,this.onFinish);
         _gameObject.animation.addEventListener(FrameEvent.MOVEMENT_FRAME_EVENT,this.onFire);
         this._gameObject.animation.gotoAndPlay("fire");
      }
      
      protected function onFire(param1:FrameEvent) : void
      {
         var _loc2_:TDMapTileData = null;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         if(param1.frameLabel == "shoot")
         {
            _loc2_ = TDGameInfo.getInstance().getRoadTileInf(this.getCorrectColumn(_zombie.objectModel.roadIndex),_zombie.objectModel.roadIndex);
            if(_loc2_)
            {
               _loc3_ = MathUtil.getRandomIntInRange(TDGameInfo.getInstance().minRow,TDGameInfo.getInstance().maxRow);
               TDGameObjectCmd.popZombieInArea([TDConstant.ZombieType_Bug_Bot_Imp],_gameObject.x + 55,_gameObject.y - 170,_loc2_.roadCol,_loc2_.roadCol,[_loc3_]);
               while((_loc4_ = MathUtil.getRandomIntInRange(TDGameInfo.getInstance().minRow,TDGameInfo.getInstance().maxRow)) == _loc3_)
               {
               }
               TDGameObjectCmd.popZombieInArea([TDConstant.ZombieType_Bug_Bot_Imp],_gameObject.x + 55,_gameObject.y - 170,_loc2_.roadCol,_loc2_.roadCol,[_loc4_]);
               _gameObject.setRunningProp(TDConstant.Gameobject_Prop_Mech_Gargantuar_Has_Summoned,true);
               (_gameObject as BasicZombie).setBoneVisible("pod",false);
            }
         }
      }
      
      private function getCorrectColumn(param1:int) : uint
      {
         var _loc6_:TDMapTileData = null;
         var _loc2_:int = TDGameInfo.getInstance().minCol;
         var _loc3_:TDMapTileData = TDGameInfo.getInstance().getRoadTileByGamePos(_gameObject.x,_gameObject.y);
         if(_loc3_)
         {
            _loc2_ = _loc3_.roadCol;
         }
         var _loc4_:int = _loc2_ + 1;
         while(_loc4_ <= _loc2_ + 2)
         {
            if(_loc6_ = TDGameInfo.getInstance().getRoadTileInf(_loc4_,param1))
            {
               if(TDSearchTargetUtils.searchTargetNutsShieldByColumn(_loc4_) != null)
               {
                  return _loc4_ - 1;
               }
               if(_loc6_.constainsPlantHeight(TDConstant.PlantHeightType_High))
               {
                  return _loc4_;
               }
            }
            _loc4_++;
         }
         var _loc5_:int = TDGameInfo.getInstance().maxCol - (_gameObject as BasicZombie).zombieData.zombiestaticInfo.getParam(TDConstant.Zombie_Param_Speedup_TileColumn);
         return Math.min(_loc2_ + 2,_loc5_);
      }
      
      private function onFinish(param1:Event = null) : void
      {
         _gameObject.animation.removeEventListener(Event.COMPLETE,this.onFinish);
         _gameObject.animation.removeEventListener(FrameEvent.MOVEMENT_FRAME_EVENT,this.onFire);
         _gameObject.setAction();
         _gameObject.setFrozenAI(false);
      }
      
      override public function leaveState() : void
      {
         _gameObject.animation.removeEventListener(Event.COMPLETE,this.onFinish);
         _gameObject.animation.removeEventListener(FrameEvent.MOVEMENT_FRAME_EVENT,this.onFire);
         super.leaveState();
      }
   }
}
