package com.qq.modules.td.logic.action.object.effect
{
   import com.qq.constant.td.TDConstant;
   import com.qq.modules.td.command.effects.TDEffectCmd;
   import com.qq.modules.td.command.game.sound.TDSoundCmd;
   import com.qq.modules.td.data.map.TDMapTileData;
   import com.qq.modules.td.logic.action.zombie.BasicZombieAction;
   import com.qq.modules.td.model.TDGameInfo;
   import flash.geom.Point;
   
   public class TDZombieWalkToAnotherRowAction extends BasicZombieAction
   {
       
      
      private const FRAME_LEN:int = 40;
      
      private var _changePath:Vector.<Point>;
      
      public function TDZombieWalkToAnotherRowAction()
      {
         super();
      }
      
      override public function enterState(param1:Array = null) : void
      {
         var _loc4_:Point = null;
         var _loc6_:Boolean = false;
         var _loc7_:TDMapTileData = null;
         var _loc8_:Boolean = false;
         var _loc9_:TDMapTileData = null;
         var _loc10_:int = 0;
         var _loc11_:TDMapTileData = null;
         super.enterState(param1);
         _zombie.setFrozenAI(true);
         var _loc2_:int = _zombie.zombieData.roadIndex;
         if(_loc2_ <= 1)
         {
            _loc2_++;
         }
         else if(_loc2_ >= TDGameInfo.getInstance().getRoadNum())
         {
            _loc2_--;
         }
         else
         {
            if(_loc7_ = TDGameInfo.getInstance().getRoadTileByGamePos(_zombie.x,_zombie.y))
            {
               if(_loc9_ = TDGameInfo.getInstance().getRoadTileInf(_loc7_.roadCol,_loc7_.roadRow - 1))
               {
                  if((_loc10_ = TDGameInfo.getInstance().getRoadTileState(_loc9_)) & TDConstant.RoadTileState_Has_WATER)
                  {
                     _loc6_ = true;
                  }
               }
            }
            if(_loc7_ = TDGameInfo.getInstance().getRoadTileByGamePos(_zombie.x,_zombie.y))
            {
               if(_loc11_ = TDGameInfo.getInstance().getRoadTileInf(_loc7_.roadCol,_loc7_.roadRow + 1))
               {
                  if((_loc10_ = TDGameInfo.getInstance().getRoadTileState(_loc11_)) & TDConstant.RoadTileState_Has_WATER)
                  {
                     _loc8_ = true;
                  }
               }
            }
            if(_loc6_)
            {
               _loc2_++;
            }
            else if(_loc8_)
            {
               _loc2_--;
            }
            else if(Math.random() > 0.5)
            {
               _loc2_++;
            }
            else
            {
               _loc2_--;
            }
         }
         var _loc3_:Point = new Point(_zombie.x - 10,TDGameInfo.getInstance().getZombieStartWalkPos(_loc2_).y);
         _zombie.zombieData.path = null;
         _zombie.zombieData.roadIndex = _loc2_;
         this._changePath = new Vector.<Point>();
         var _loc5_:int = 1;
         while(_loc5_ <= this.FRAME_LEN)
         {
            _loc4_ = new Point(_zombie.x + (_loc3_.x - _zombie.x) * _loc5_ / this.FRAME_LEN,_zombie.y + (_loc3_.y - _zombie.y) * _loc5_ / this.FRAME_LEN);
            this._changePath.push(_loc4_);
            _loc5_++;
         }
         _zombie.zombieData.addBuff(TDConstant.TDBuffID_God,_zombie);
         _zombie.setRunningProp(TDConstant.Gameobject_Prop_IsResetWalkPath,true);
      }
      
      override public function runningState() : void
      {
         var _loc1_:Point = null;
         var _loc2_:TDMapTileData = null;
         var _loc3_:int = 0;
         if(this._changePath.length > 0)
         {
            _loc1_ = this._changePath.shift();
            _zombie.setLocation(_loc1_.x,_loc1_.y);
         }
         else
         {
            _zombie.zombieData.removeBuff(TDConstant.TDBuffID_God);
            _zombie.setFrozenAI(false);
            _loc2_ = TDGameInfo.getInstance().getRoadTileByGamePos(_zombie.x,_zombie.y);
            if(_loc2_)
            {
               _loc3_ = TDGameInfo.getInstance().getRoadTileState(_loc2_);
               if(_loc3_ & TDConstant.RoadTileState_Has_WATER)
               {
                  TDEffectCmd.showWaterSplash(_zombie.x,_zombie.y);
                  TDSoundCmd.zombieDropWater();
                  _zombie.Dispose();
               }
            }
         }
         super.runningState();
      }
      
      override public function leaveState() : void
      {
         _zombie.zombieData.removeBuff(TDConstant.TDBuffID_God);
         super.leaveState();
      }
   }
}
