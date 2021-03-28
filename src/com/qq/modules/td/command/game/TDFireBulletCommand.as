package com.qq.modules.td.command.game
{
   import com.qq.CommandName;
   import com.qq.constant.td.TDConstant;
   import com.qq.modules.td.data.map.TDMapTileData;
   import com.qq.modules.td.logic.TDFactory;
   import com.qq.modules.td.logic.unit.basic.IGameObject;
   import com.qq.modules.td.logic.unit.bullet.BasicBullet;
   import com.qq.modules.td.logic.unit.object.TDZombieThrowItem;
   import com.qq.modules.td.model.TDGameInfo;
   import com.qq.utils.CommandDispatcher;
   import com.qq.utils.DMath;
   import flash.geom.Point;
   import org.as3commons.logging.api.getLogger;
   import org.robotlegs.extend.command.StrongRobotlegCommand;
   
   public class TDFireBulletCommand extends StrongRobotlegCommand
   {
       
      
      public function TDFireBulletCommand()
      {
         super();
      }
      
      public function shoot(param1:Object, param2:Object, param3:int, param4:String, param5:int = 0, param6:int = 0, param7:int = 1, param8:Boolean = false, param9:Point = null, param10:Array = null, param11:int = 1) : void
      {
         var _loc13_:Number = NaN;
         var _loc14_:Number = NaN;
         var _loc15_:Point = null;
         var _loc12_:IGameObject;
         if((_loc12_ = param1 as IGameObject) == null)
         {
            getLogger("TD").error("子弹射击者不存在");
            return;
         }
         if(param4 == "" || param4 == null)
         {
            _loc13_ = _loc12_.x + param5;
            _loc14_ = _loc12_.y + param6;
         }
         else
         {
            if(!(_loc15_ = _loc12_.getFireBonePos(param4)))
            {
               throw new Error("未找到指定骨骼");
            }
            _loc13_ = _loc15_.x + param5;
            _loc14_ = _loc15_.y + param6;
         }
         this.addBullet(_loc12_,param3,param11,param2 as IGameObject,_loc13_,_loc14_,param7,param8,param9,0,param10);
      }
      
      public function addBullet(param1:Object, param2:int, param3:int, param4:Object, param5:int = 0, param6:int = 0, param7:int = 1, param8:Boolean = false, param9:Point = null, param10:int = 0, param11:Array = null) : void
      {
         var _loc12_:BasicBullet;
         (_loc12_ = TDFactory.createBullet(param2)).setFireInfo(param1 as IGameObject,param3,param4 as IGameObject,param7,param8,param9,param10,param11);
         CommandDispatcher.send(CommandName.TD_Add_UnitToBulletLayer,{
            "object":_loc12_,
            "x":param5,
            "y":param6
         });
      }
      
      public function zombieThrowTombBone(param1:Object) : void
      {
         var _loc2_:IGameObject = param1 as IGameObject;
         if(_loc2_ == null)
         {
            return;
         }
         var _loc3_:Array = TDGameInfo.getInstance().getTileIDBuildTombList(_loc2_.x);
         if(_loc3_.length == 0)
         {
            return;
         }
         var _loc4_:int = DMath.randNum(0,_loc3_.length - 1);
         var _loc5_:int = _loc3_[_loc4_];
         var _loc6_:TDMapTileData;
         if((_loc6_ = TDGameInfo.getInstance().getRoadTileByIndex(_loc5_)) == null)
         {
            return;
         }
         _loc6_.setState(TDConstant.RoadTileState_Ready_Add_Tomb);
         var _loc8_:TDZombieThrowItem;
         var _loc7_:IGameObject;
         if((_loc8_ = (_loc7_ = TDFactory.createGameobject(TDConstant.UnitCatalog_Object,TDConstant.UnitType_ThrowBone)) as TDZombieThrowItem) == null)
         {
            return;
         }
         _loc8_.throwTargetX = _loc6_.rect.x + _loc6_.rect.width * 0.5;
         _loc8_.throwTargetY = _loc6_.rect.y + _loc6_.rect.height * 0.5;
         var _loc9_:Point = _loc2_.getFireBonePos("zombie_egypt_tr_bone");
         CommandDispatcher.send(CommandName.TD_Add_UnitToBulletLayer,{
            "object":_loc7_,
            "x":_loc9_.x,
            "y":_loc9_.y
         });
      }
      
      public function zombieThrowItem(param1:int, param2:Point, param3:Point) : void
      {
         var _loc4_:IGameObject = TDFactory.createGameobject(TDConstant.UnitCatalog_Object,param1);
         CommandDispatcher.send(CommandName.TD_Add_UnitToBulletLayer,{
            "object":_loc4_,
            "x":param2.x,
            "y":param2.y
         });
         _loc4_.setAction(TDConstant.ObjectAction_BeThrew,[param3]);
      }
   }
}
