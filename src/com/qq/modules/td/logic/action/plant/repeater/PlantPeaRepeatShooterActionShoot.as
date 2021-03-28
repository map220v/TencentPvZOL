package com.qq.modules.td.logic.action.plant.repeater
{
   import asgui.events.FrameEvent;
   import com.qq.modules.td.command.game.TDFireBulletCmd;
   import com.qq.modules.td.logic.action.plant.peashooter.PlantPeaShooterActionShoot;
   import com.qq.modules.td.logic.talent.TalentManager;
   
   public class PlantPeaRepeatShooterActionShoot extends PlantPeaShooterActionShoot
   {
       
      
      private var defaultBulletNum:int = 2;
      
      public function PlantPeaRepeatShooterActionShoot()
      {
         super();
      }
      
      override protected function onShoot(param1:FrameEvent) : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         if(param1.frameLabel == "shoot")
         {
            _loc2_ = this.defaultBulletNum + TalentManager.instance.getPlusBulletNum(_plant.plantData.plantStaticInfo);
            _loc3_ = 30 * (_loc2_ - 1);
            _loc4_ = 0;
            while(_loc4_ < _loc2_)
            {
               _loc3_ = 30 * (_loc2_ - 1 - _loc4_);
               TDFireBulletCmd.shoot(_plant,_plant.curAttackTarget,_plant.plantData.plantStaticInfo.baseInfo.bulletType,_plant.model.staticInfo.firePosBoneName,_loc3_);
               _loc4_++;
            }
         }
         _plant.setAttackTarget(null);
      }
   }
}
