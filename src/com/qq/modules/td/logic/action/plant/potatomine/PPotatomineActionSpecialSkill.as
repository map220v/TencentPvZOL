package com.qq.modules.td.logic.action.plant.potatomine
{
   import asgui.events.FrameEvent;
   import com.qq.constant.td.TDConstant;
   import com.qq.modules.td.command.game.TDGameObjectCmd;
   import com.qq.modules.td.command.game.sound.TDSoundCmd;
   import com.qq.modules.td.data.map.TDMapRoadData;
   import com.qq.modules.td.data.map.TDMapTileData;
   import com.qq.modules.td.logic.TDCropUtil;
   import com.qq.modules.td.logic.action.plant.basic.PlantSpecialSkillAction;
   import com.qq.modules.td.model.TDGameInfo;
   import flash.events.Event;
   
   public class PPotatomineActionSpecialSkill extends PlantSpecialSkillAction
   {
      
      private static const POTATO_ID:uint = 1500;
       
      
      private var _isShooting:Boolean = false;
      
      public function PPotatomineActionSpecialSkill()
      {
         super();
      }
      
      override public function enterState(param1:Array = null) : void
      {
         super.enterState(param1);
         _plant.animation.gotoAndPlay(TDConstant.PlantAnmi_Plantfood_on);
         _plant.animation.addEventListener(Event.COMPLETE,this.onFinishPlantfood_on);
         this._isShooting = false;
      }
      
      private function onFinishPlantfood_on(param1:Event) : void
      {
         _plant.animation.removeEventListener(Event.COMPLETE,this.onFinishPlantfood_on);
         _plant.animation.gotoAndPlay(TDConstant.PlantAnmi_Plantfood);
         _plant.animation.addEventListener(FrameEvent.MOVEMENT_FRAME_EVENT,this.onShoot);
         _plant.animation.addEventListener(Event.COMPLETE,this.onFinishPlantFood);
      }
      
      private function onFinishPlantFood(param1:Event) : void
      {
         _plant.animation.removeEventListener(Event.COMPLETE,this.onFinishPlantFood);
         _plant.animation.gotoAndPlay(TDConstant.PlantAnmi_Plantfood_off);
         _plant.animation.addEventListener(Event.COMPLETE,this.onFinishPlantfood_off);
      }
      
      private function onShoot(param1:FrameEvent) : void
      {
         var _loc2_:Array = null;
         var _loc3_:Array = null;
         var _loc4_:TDMapTileData = null;
         var _loc5_:TDMapRoadData = null;
         var _loc6_:int = 0;
         var _loc7_:Array = null;
         var _loc8_:int = 0;
         if(param1.frameLabel == "shoot")
         {
            _loc2_ = new Array();
            _loc3_ = new Array();
            for each(_loc5_ in TDGameInfo.getInstance().roadList)
            {
               for each(_loc4_ in _loc5_.tileList)
               {
                  if(TDCropUtil.isPermitAddPlant(POTATO_ID,_loc4_))
                  {
                     if(!_loc4_.hasState(TDConstant.RoadTileState_MILDEW))
                     {
                        _loc2_.push(_loc4_);
                     }
                  }
               }
            }
            if(_loc2_.length > 2)
            {
               _loc2_.sortOn("roadCol");
               _loc7_ = new Array();
               _loc8_ = 0;
               _loc8_ = 0;
               while(_loc8_ < _loc2_.length)
               {
                  if((_loc4_ = _loc2_[_loc8_]).roadCol <= _plant.objectModel.column)
                  {
                     _loc7_.push(_loc4_);
                  }
                  _loc8_++;
               }
               if(_loc7_.length > 2)
               {
                  _loc8_ = 0;
                  while(_loc8_ < 2)
                  {
                     _loc6_ = Math.floor(_loc7_.length * Math.random());
                     _loc3_.push(_loc7_[_loc6_]);
                     _loc7_.splice(_loc6_,1);
                     _loc8_++;
                  }
               }
               else
               {
                  _loc8_ = 0;
                  while(_loc8_ < 2)
                  {
                     _loc6_ = Math.floor(_loc2_.length * Math.random());
                     _loc3_.push(_loc2_[_loc6_]);
                     _loc2_.splice(_loc6_,1);
                     _loc8_++;
                  }
               }
            }
            else
            {
               _loc3_ = _loc2_;
            }
            TDGameObjectCmd.throwPotatoToRoadTile(_loc3_,_plant.x,_plant.y);
            TDSoundCmd.playPotatoSpecialAttack();
         }
      }
      
      private function onFinishPlantfood_off(param1:Event) : void
      {
         _plant.plantData.isCoolDown = true;
         _plant.animation.removeEventListener(Event.COMPLETE,this.onFinishPlantfood_off);
         finishSpecialSkill();
      }
      
      override public function leaveState() : void
      {
         super.leaveState();
         _plant.animation.removeEventListener(Event.COMPLETE,this.onFinishPlantfood_on);
         _plant.animation.removeEventListener(Event.COMPLETE,this.onFinishPlantFood);
         _plant.animation.removeEventListener(Event.COMPLETE,this.onFinishPlantfood_off);
         _plant.animation.removeEventListener(FrameEvent.MOVEMENT_FRAME_EVENT,this.onShoot);
      }
   }
}
