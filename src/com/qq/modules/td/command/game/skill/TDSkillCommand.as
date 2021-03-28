package com.qq.modules.td.command.game.skill
{
   import com.qq.constant.td.TDConstant;
   import com.qq.modules.td.command.game.TDFireBulletCmd;
   import com.qq.modules.td.command.game.TDGameObjectCmd;
   import com.qq.modules.td.data.game.skill.TDSkillInfo;
   import com.qq.modules.td.data.map.TDMapRoadData;
   import com.qq.modules.td.data.map.TDMapTileData;
   import com.qq.modules.td.logic.unit.basic.IGameObject;
   import com.qq.modules.td.model.TDGameInfo;
   import org.as3commons.logging.api.getLogger;
   import org.robotlegs.extend.command.StrongRobotlegCommand;
   
   public class TDSkillCommand extends StrongRobotlegCommand
   {
       
      
      public function TDSkillCommand()
      {
         super();
      }
      
      public function addZombieSpeedUpBuff(param1:Array = null, param2:Array = null) : void
      {
         var _loc4_:* = false;
         var _loc5_:IGameObject = null;
         var _loc3_:Array = TDGameInfo.getInstance().getZombieList();
         for each(_loc5_ in _loc3_)
         {
            _loc4_ = true;
            if(param1)
            {
               _loc4_ = param1.indexOf(_loc5_.uid) >= 0;
            }
            if(param2)
            {
               _loc4_ = param2.indexOf(_loc5_.uid) < 0;
            }
            if(_loc4_ && _loc5_.objectModel.isPermitMove())
            {
               _loc5_.objectModel.addBuff(TDConstant.TDBuffID_SpeedUp,_loc5_);
            }
         }
      }
      
      public function addZombieSpeedUpBuffWithGameObjects(param1:Array) : void
      {
         var _loc2_:IGameObject = null;
         for each(_loc2_ in param1)
         {
            if(_loc2_.objectModel.isPermitMove())
            {
               _loc2_.objectModel.addBuff(TDConstant.TDBuffID_SpeedUp_Sup,_loc2_);
            }
         }
      }
      
      public function changePath(param1:Object) : void
      {
         var _loc2_:TDSkillInfo = null;
         var _loc4_:Array = null;
         var _loc5_:int = 0;
         _loc2_ = param1 as TDSkillInfo;
         var _loc3_:String = _loc2_.skillPara[0] as String;
         switch(_loc3_)
         {
            case "removeById":
               TDGameObjectCmd.removeRoadById(int(_loc2_.skillPara[1]));
               break;
            case "addById":
               if((_loc4_ = _loc2_.skillPara[1] as Array).length > 0)
               {
                  _loc5_ = Math.random() * _loc4_.length;
                  TDGameObjectCmd.addRoadById(int(_loc4_[_loc5_]));
               }
         }
         getLogger().debug("CastChangePath:" + _loc3_);
      }
      
      public function changeTerrain(param1:Object) : void
      {
         var _loc2_:TDSkillInfo = param1 as TDSkillInfo;
         var _loc3_:String = _loc2_.skillPara[0] as String;
         switch(_loc3_)
         {
            case "add":
               break;
            case "remove":
               TDGameObjectCmd.removeMudsByColomn(_loc2_.skillPara[1]);
         }
      }
      
      public function castFireBall(param1:Object) : void
      {
         var _loc4_:TDMapRoadData = null;
         var _loc5_:Array = null;
         var _loc2_:TDSkillInfo = param1 as TDSkillInfo;
         var _loc3_:Array = _loc2_.skillPara;
         for each(_loc5_ in _loc3_)
         {
            _loc4_ = TDGameInfo.getInstance().getRoadInfo(_loc5_[int(Math.random() * _loc5_.length)]);
            TDFireBulletCmd.addBullet(null,TDConstant.BulletType_FireBall,TDConstant.TDCamp_Enemy,null,_loc4_.startX,_loc4_.endY - 80,-1,false,null,_loc4_.index);
         }
      }
      
      public function castQuickSand(param1:Object) : void
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc7_:TDMapTileData = null;
         var _loc9_:Array = null;
         var _loc2_:TDSkillInfo = param1 as TDSkillInfo;
         var _loc6_:Array = [];
         var _loc8_:int = 7;
         for each(_loc9_ in _loc2_.skillPara)
         {
            _loc3_ = _loc9_[0];
            _loc4_ = _loc9_[1];
            if(_loc7_ = TDGameInfo.getInstance().getRoadTileInf(_loc4_,_loc3_))
            {
               _loc5_ = _loc9_[2];
               (_loc6_ = [])[TDConstant.Gameobject_Prop_InitUnitParam] = _loc5_;
               TDGameObjectCmd.addNormalGameObjectByTile(TDConstant.UnitType_LongQuickSand,_loc7_,_loc6_);
            }
         }
      }
   }
}
