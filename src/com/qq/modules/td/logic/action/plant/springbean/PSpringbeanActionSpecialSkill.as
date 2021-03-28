package com.qq.modules.td.logic.action.plant.springbean
{
   import asgui.events.FrameEvent;
   import com.qq.constant.td.TDConstant;
   import com.qq.modules.td.data.map.TDMapTileData;
   import com.qq.modules.td.logic.action.plant.basic.PlantSpecialSkillAction;
   import com.qq.modules.td.logic.bt_ai.aiUtils.TDSearchTargetUtils;
   import com.qq.modules.td.logic.unit.basic.IGameObject;
   import com.qq.modules.td.model.TDGameInfo;
   import com.qq.modules.td.view.game.layer.floor.TDFloorManager;
   import flash.events.Event;
   import net.sakri.flash.math.MathUtil;
   
   public class PSpringbeanActionSpecialSkill extends PlantSpecialSkillAction
   {
       
      
      public function PSpringbeanActionSpecialSkill()
      {
         super();
      }
      
      override public function enterState(param1:Array = null) : void
      {
         super.enterState(param1);
         _plant.animation.gotoAndPlay(TDConstant.PlantAnmi_Plantfood);
         _plant.animation.addEventListener(Event.COMPLETE,this.onFinishAction);
         _plant.animation.addEventListener(FrameEvent.MOVEMENT_FRAME_EVENT,this.onHit);
      }
      
      override public function runningState() : void
      {
         super.runningState();
      }
      
      override public function leaveState() : void
      {
         super.leaveState();
      }
      
      private function onHit(param1:FrameEvent) : void
      {
         var _loc2_:Array = null;
         var _loc3_:IGameObject = null;
         if(param1.frameLabel == "hit")
         {
            _plant.animation.removeEventListener(FrameEvent.MOVEMENT_FRAME_EVENT,this.onHit);
            _loc2_ = TDSearchTargetUtils.getZombieList(_plant,null,true,null,[TDConstant.ZombieCatalog_Boss]);
            for each(_loc3_ in _loc2_)
            {
               this.kickOut(_loc3_);
            }
         }
      }
      
      private function onFinishAction(param1:Event) : void
      {
         finishSpecialSkill();
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
            param1.setAction(TDConstant.ZAction_KickedOut,[TDGameInfo.getInstance().getZomebiePosByTile(_loc2_.roadCol,_loc2_.roadRow)]);
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
