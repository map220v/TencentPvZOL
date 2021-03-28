package com.qq.modules.td.logic.action.plant.nitrationMushroom
{
   import asgui.events.FrameEvent;
   import com.qq.constant.td.TDConstant;
   import com.qq.modules.td.command.game.TDFireBulletCmd;
   import com.qq.modules.td.command.game.sound.TDSoundCmd;
   import com.qq.modules.td.data.map.TDMapTileData;
   import com.qq.modules.td.logic.action.plant.basic.PlantSpecialSkillAction;
   import com.qq.modules.td.logic.talent.TalentManager;
   import com.qq.modules.td.model.TDGameInfo;
   import flash.events.Event;
   import flash.utils.clearTimeout;
   import flash.utils.setTimeout;
   import net.sakri.flash.math.MathUtil;
   
   public class PNitrationMushroomSpecialSkill extends PlantSpecialSkillAction
   {
       
      
      public function PNitrationMushroomSpecialSkill()
      {
         super();
      }
      
      override public function enterState(param1:Array = null) : void
      {
         var t:int = 0;
         var params:Array = param1;
         super.enterState(params);
         _plant.animation.gotoAndPlay(TDConstant.PlantAnmi_Plantfood_on);
         _plant.animation.addEventListener(Event.COMPLETE,this.onFinishPlantFoodOn);
         var delay:Number = MathUtil.getRandomNumberInRange(0.1,0.3);
         t = setTimeout(function():void
         {
            clearTimeout(t);
            onShoot(null);
         },delay * 1000);
      }
      
      protected function onFinishPlantFoodOn(param1:Event) : void
      {
         _plant.animation.removeEventListener(Event.COMPLETE,this.onFinishPlantFoodOn);
         _plant.animation.gotoAndPlay(TDConstant.PlantAnmi_Plantfood);
         _plant.animation.addEventListener(Event.COMPLETE,this.onFinishPlantFood);
      }
      
      private function onShoot(param1:FrameEvent) : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:TDMapTileData = null;
         if(_plant)
         {
            _loc2_ = TalentManager.instance.getBulletType(_plant.plantData.plantStaticInfo,_plant.uid);
            _loc3_ = TDGameInfo.getInstance().minRow;
            while(_loc3_ <= TDGameInfo.getInstance().maxRow)
            {
               if(_loc4_ = TDGameInfo.getInstance().getRoadTileInf(_plant.objectModel.column,_loc3_))
               {
                  TDFireBulletCmd.shoot(_plant,_plant.curAttackTarget,_loc2_,null,0,0,1,true,null,[_loc4_.index,0]);
               }
               _loc3_++;
            }
            TDSoundCmd.playPlantSpecialAttack(_gameObject.objectModel.staticInfo.type);
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
      }
   }
}
