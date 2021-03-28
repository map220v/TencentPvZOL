package com.qq.modules.td.command.game
{
   import com.qq.constant.td.TDConstant;
   import com.qq.modules.td.command.effects.TDEffectCmd;
   import com.qq.modules.td.data.map.TDMapTileData;
   import com.qq.modules.td.logic.numeric.TDDamageCaculete;
   import com.qq.modules.td.logic.talent.TalentManager;
   import com.qq.modules.td.logic.unit.basic.IGameObject;
   import com.qq.modules.td.logic.unit.plant.BasicPlant;
   import com.qq.modules.td.model.TDGameInfo;
   import flash.geom.Rectangle;
   import org.as3commons.logging.api.getLogger;
   import org.robotlegs.extend.command.StrongRobotlegCommand;
   
   public class TDExplodeCommand extends StrongRobotlegCommand
   {
       
      
      public function TDExplodeCommand()
      {
         super();
      }
      
      public function explodeForPlant(param1:Object, param2:int = 9999, param3:Boolean = true, param4:Boolean = false) : void
      {
         if(param1 == null)
         {
            return;
         }
         var _loc5_:* = param1.plantData.plantStaticInfo.baseInfo.isAttackFlight == 1;
         var _loc6_:* = param1.plantData.plantStaticInfo.baseInfo.isAttackObj == 1;
         var _loc7_:IGameObject;
         if((_loc7_ = param1 as IGameObject).objectModel.staticInfo.hasParam(TDConstant.Plant_Param_DamageRangeW) && _loc7_.objectModel.staticInfo.hasParam(TDConstant.Plant_Param_DamageRangeH))
         {
            this.explodeForPixel(_loc7_,param2,_loc5_,param3,_loc6_,param4);
         }
         else if(_loc7_.objectModel.staticInfo.hasParam(TDConstant.Plant_Param_DamageTileCol) && _loc7_.objectModel.staticInfo.hasParam(TDConstant.Plant_Param_DamageTileRow))
         {
            this.explodeForTile(_loc7_,param2,_loc5_,param3,_loc6_,param4);
         }
      }
      
      private function explodeForPixel(param1:IGameObject, param2:int = 9999, param3:Boolean = false, param4:Boolean = false, param5:Boolean = true, param6:Boolean = false) : void
      {
         var _loc7_:int = param1.objectModel.staticInfo.getParam(TDConstant.Plant_Param_DamageRangeW);
         var _loc8_:int = param1.objectModel.staticInfo.getParam(TDConstant.Plant_Param_DamageRangeH);
         var _loc9_:int = param1.objectModel.tileIndex;
         var _loc10_:Rectangle = TDGameInfo.getInstance().getEffectRect(_loc9_,_loc7_,_loc8_);
         this.plantExplodeDamage(param1,_loc10_,param2,param3,param4,param5,param6);
      }
      
      private function explodeForTile(param1:IGameObject, param2:int = 9999, param3:Boolean = false, param4:Boolean = false, param5:Boolean = true, param6:Boolean = false) : void
      {
         var _loc7_:int = param1.objectModel.staticInfo.getParam(TDConstant.Plant_Param_DamageTileCol);
         var _loc8_:int = param1.objectModel.staticInfo.getParam(TDConstant.Plant_Param_DamageTileRow);
         var _loc9_:TDMapTileData;
         if((_loc9_ = TDGameInfo.getInstance().getRoadTileByGamePos(param1.x,param1.y)) == null)
         {
            getLogger().error("爆炸对象不在格子中");
            return;
         }
         var _loc10_:int = _loc9_.index;
         var _loc11_:Rectangle = TDGameInfo.getInstance().getEffectRectByRoadTile(_loc10_,_loc7_,_loc8_);
         this.plantExplodeDamage(param1,_loc11_,param2,param3,param4,param5,param6);
      }
      
      public function plantExplodeDamage(param1:Object, param2:Rectangle, param3:int = 9999, param4:Boolean = false, param5:Boolean = false, param6:Boolean = true, param7:Boolean = false) : void
      {
         var _loc13_:IGameObject = null;
         var _loc8_:BasicPlant;
         if(!(_loc8_ = param1 as BasicPlant))
         {
            return;
         }
         if(_loc8_.plantData.plantStaticInfo.baseInfo.bombEffectID != 0)
         {
            TDEffectCmd.playBombEffect(_loc8_.plantData.plantStaticInfo.baseInfo.bombEffectID,_loc8_.x,_loc8_.y);
         }
         var _loc9_:Array = new Array();
         var _loc10_:Array = TDGameInfo.getInstance().getZombieList(null,TDConstant.TDCamp_Enemy,param4,param5,param6);
         var _loc11_:int = TalentManager.instance.getPlusAttackNum(_loc8_.plantData.plantStaticInfo);
         param3 += _loc11_;
         var _loc12_:int = 0;
         for each(_loc13_ in _loc10_)
         {
            if(param2.intersects(_loc13_.explodeEffectArea))
            {
               if(_loc12_ < param3)
               {
                  _loc9_.push(_loc13_);
                  _loc12_++;
               }
            }
         }
         TDDamageCaculete.caculatePlantDamage(_loc8_,_loc9_,param7);
      }
   }
}
