package com.qq.modules.td.logic.action.plant.icepea
{
   import asgui.events.FrameEvent;
   import com.qq.constant.td.TDConstant;
   import com.qq.constant.td.TDObjTypeID;
   import com.qq.modules.td.command.game.TDGameObjectCmd;
   import com.qq.modules.td.data.map.TDMapTileData;
   import com.qq.modules.td.logic.TDFactory;
   import com.qq.modules.td.logic.action.plant.basic.PlantSpecialSkillAction;
   import com.qq.modules.td.logic.unit.basic.IGameObject;
   import com.qq.modules.td.logic.unit.zombie.BasicZombie;
   import com.qq.modules.td.model.TDGameInfo;
   import flash.events.Event;
   
   public class PIcepeaActionSpecialSkill extends PlantSpecialSkillAction
   {
       
      
      private var m_icePath:IGameObject;
      
      public function PIcepeaActionSpecialSkill()
      {
         super();
      }
      
      override public function enterState(param1:Array = null) : void
      {
         super.enterState(param1);
         _plant.animation.gotoAndPlay(TDConstant.PlantAnmi_Plantfood_on);
         _plant.animation.addEventListener(Event.COMPLETE,this.onFinishPlantFoodOn);
      }
      
      protected function onFinishPlantFoodOn(param1:Event) : void
      {
         _plant.animation.removeEventListener(Event.COMPLETE,this.onFinishPlantFoodOn);
         _plant.animation.gotoAndPlay(TDConstant.PlantAnmi_Plantfood);
         _plant.animation.addEventListener(FrameEvent.MOVEMENT_FRAME_EVENT,this.onShoot);
         _plant.animation.addEventListener(Event.COMPLETE,this.onFinishPlantFood);
      }
      
      private function onShoot(param1:FrameEvent) : void
      {
         var _loc2_:TDMapTileData = null;
         var _loc3_:Array = null;
         var _loc4_:IGameObject = null;
         if(param1.frameLabel == "shoot" && _plant)
         {
            _loc2_ = TDGameInfo.getInstance().getRoadTileByGamePos(_plant.x,_plant.y);
            if(_loc2_)
            {
               TDGameObjectCmd.addNormalGameObjectByPos(TDObjTypeID.Obj_Icepea_Frozen_Path,_loc2_.rect.x + _loc2_.rect.width,_loc2_.rect.y,null,true);
               this.m_icePath = TDGameInfo.getInstance().getGameObjctByUID(TDFactory.getLastUnitUin());
            }
            _loc3_ = TDGameInfo.getInstance().getZombieList([_plant.objectModel.roadIndex],0,true);
            for each(_loc4_ in _loc3_)
            {
               if(_loc4_ is BasicZombie && _loc4_.x > _plant.x)
               {
                  _loc4_.objectModel.addBuff(TDConstant.TDBuffID_Special_Icepea,_plant);
               }
            }
            _plant.animation.removeEventListener(FrameEvent.MOVEMENT_FRAME_EVENT,this.onShoot);
         }
      }
      
      private function onFinishPlantFood(param1:Event) : void
      {
         _plant.animation.removeEventListener(Event.COMPLETE,this.onFinishPlantFood);
         _plant.animation.gotoAndPlay(TDConstant.PlantAnmi_Plantfood_off);
         _plant.animation.addEventListener(Event.COMPLETE,this.onFinishPlantFoodOff);
      }
      
      protected function onFinishPlantFoodOff(param1:Event) : void
      {
         _plant.animation.removeEventListener(Event.COMPLETE,this.onFinishPlantFoodOff);
         finishSpecialSkill();
      }
      
      override public function leaveState() : void
      {
         super.leaveState();
         _plant.animation.removeEventListener(Event.COMPLETE,this.onFinishPlantFoodOn);
         _plant.animation.removeEventListener(Event.COMPLETE,this.onFinishPlantFood);
         _plant.animation.removeEventListener(Event.COMPLETE,this.onFinishPlantFoodOff);
         _plant.animation.removeEventListener(FrameEvent.MOVEMENT_FRAME_EVENT,this.onShoot);
         if(this.m_icePath)
         {
            this.m_icePath.Dispose();
         }
      }
   }
}
