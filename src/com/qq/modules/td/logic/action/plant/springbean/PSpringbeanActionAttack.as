package com.qq.modules.td.logic.action.plant.springbean
{
   import com.qq.constant.td.TDConstant;
   import com.qq.modules.td.data.map.TDMapTileData;
   import com.qq.modules.td.logic.action.plant.BasicPlantAction;
   import com.qq.modules.td.logic.bt_ai.aiNode.executeNode.plant.ExePlantResetDuration;
   import com.qq.modules.td.logic.talent.TalentManager;
   import com.qq.modules.td.logic.unit.basic.IGameObject;
   import com.qq.modules.td.model.TDGameInfo;
   import com.qq.modules.td.view.game.layer.floor.TDFloorManager;
   import flash.events.Event;
   import net.sakri.flash.math.MathUtil;
   
   public class PSpringbeanActionAttack extends BasicPlantAction
   {
       
      
      public function PSpringbeanActionAttack()
      {
         super();
      }
      
      override public function enterState(param1:Array = null) : void
      {
         super.enterState(param1);
         _plant.setFrozenAI(true);
         ExePlantResetDuration.calculate(_plant);
         _plant.setRunningProp(TDConstant.Gameobject_Prop_IsSleeping,true);
         _plant.setRunningProp(TDConstant.Gameobject_Prop_IsReadyToAttack,false);
         this.kickOut(_plant.curAttackTarget);
         _plant.animation.gotoAndPlay(TDConstant.PlantAnmi_Attack);
         _plant.animation.addEventListener(Event.COMPLETE,this.onFinishAction);
      }
      
      override public function leaveState() : void
      {
         _plant.animation.removeEventListener(Event.COMPLETE,this.onFinishAction);
         _plant.cleanAttackTarget();
         super.leaveState();
      }
      
      private function onFinishAction(param1:Event) : void
      {
         _plant.animation.removeEventListener(Event.COMPLETE,this.onFinishAction);
         _plant.setAction();
         _plant.setFrozenAI(false);
      }
      
      private function kickOut(param1:IGameObject) : void
      {
         if(param1 == null || !param1.isVaild)
         {
            return;
         }
         var _loc2_:TDMapTileData = this.getTargetTile(param1);
         if(_loc2_)
         {
            if(TalentManager.instance.getKickAwayEnable(_plant.plantData.plantStaticInfo))
            {
               param1.setAction(TDConstant.ObjectAction_KickedAway);
            }
            else
            {
               param1.setAction(TDConstant.ZAction_KickedOut,[TDGameInfo.getInstance().getZomebiePosByTile(_loc2_.roadCol,_loc2_.roadRow)]);
            }
         }
      }
      
      private function getTargetTile(param1:IGameObject) : TDMapTileData
      {
         var _loc2_:TDMapTileData = TDGameInfo.getInstance().getRoadTileByGamePos(param1.x,param1.y);
         if(!_loc2_)
         {
            return null;
         }
         var _loc3_:int = _loc2_.roadRow;
         var _loc4_:int = MathUtil.constrainNumber(_loc2_.roadCol - 1,TDGameInfo.getInstance().minCol,TDGameInfo.getInstance().maxCol);
         if(TDFloorManager.instance.hasWaterAt(_loc3_,_loc4_))
         {
            return TDGameInfo.getInstance().getRoadTileInf(_loc4_,_loc3_);
         }
         _loc3_ = MathUtil.constrainNumber(_loc2_.roadRow - 1,TDGameInfo.getInstance().minRow,TDGameInfo.getInstance().maxRow);
         _loc4_ = _loc2_.roadCol;
         if(TDFloorManager.instance.hasWaterAt(_loc3_,_loc4_))
         {
            return TDGameInfo.getInstance().getRoadTileInf(_loc4_,_loc3_);
         }
         _loc3_ = MathUtil.constrainNumber(_loc2_.roadRow + 1,TDGameInfo.getInstance().minRow,TDGameInfo.getInstance().maxRow);
         _loc4_ = _loc2_.roadCol;
         if(TDFloorManager.instance.hasWaterAt(_loc3_,_loc4_))
         {
            return TDGameInfo.getInstance().getRoadTileInf(_loc4_,_loc3_);
         }
         _loc3_ = _loc2_.roadRow;
         _loc4_ = MathUtil.constrainNumber(_loc2_.roadCol - 1,TDGameInfo.getInstance().minCol,TDGameInfo.getInstance().maxCol);
         return TDGameInfo.getInstance().getRoadTileInf(_loc4_,_loc3_);
      }
   }
}
