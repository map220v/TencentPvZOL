package com.qq.modules.td.logic.action.plant.kernalpult
{
   import asgui.events.FrameEvent;
   import com.qq.constant.td.TDConstant;
   import com.qq.modules.td.command.game.TDFireBulletCmd;
   import com.qq.modules.td.command.game.sound.TDSoundCmd;
   import com.qq.modules.td.logic.action.plant.basic.PlantSpecialSkillAction;
   import com.qq.modules.td.logic.bt_ai.aiUtils.TDSearchTargetUtils;
   import com.qq.modules.td.logic.unit.basic.IGameObject;
   import flash.events.Event;
   
   public class PlantKernalpultActionSpecialSkill extends PlantSpecialSkillAction
   {
       
      
      public function PlantKernalpultActionSpecialSkill()
      {
         super();
      }
      
      override public function enterState(param1:Array = null) : void
      {
         super.enterState(param1);
         _plant.animation.gotoAndPlay(TDConstant.PlantAnmi_Plantfood);
         _plant.animation.addEventListener(Event.COMPLETE,this.completeHandler);
         _plant.animation.addEventListener(FrameEvent.MOVEMENT_FRAME_EVENT,this.onShoot);
      }
      
      private function onShoot(param1:FrameEvent) : void
      {
         var _loc2_:Array = null;
         var _loc3_:int = 0;
         var _loc4_:Array = null;
         var _loc5_:int = 0;
         var _loc6_:String = null;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         if(param1.frameLabel == "shoot")
         {
            _loc2_ = TDSearchTargetUtils.getZombieList(_plant);
            _loc3_ = _loc2_.length;
            _loc4_ = [];
            _loc5_ = 0;
            while(_loc5_ < _loc3_)
            {
               if((_loc2_[_loc5_] as IGameObject).x > _plant.x)
               {
                  _loc4_.push(_loc2_[_loc5_]);
               }
               _loc5_++;
            }
            _loc6_ = _plant.plantData.plantStaticInfo.baseInfo.getSpecialSkillParamStr(TDConstant.SpecialSkill_Param_ShootBoneName);
            _loc7_ = _loc4_.length;
            _loc8_ = 0;
            while(_loc8_ < _loc7_)
            {
               TDFireBulletCmd.shoot(_plant,_loc4_[_loc8_],PlantKernalpultActionBuffShoot.BUFF_BULLET_ID,_loc6_);
               _loc8_++;
            }
            TDSoundCmd.playPlantSpecialAttack(_gameObject.objectModel.staticInfo.type);
         }
         _plant.setAttackTarget(null);
      }
      
      protected function completeHandler(param1:Event) : void
      {
         _plant.animation.removeEventListener(Event.COMPLETE,this.completeHandler);
         _plant.animation.removeEventListener(FrameEvent.MOVEMENT_FRAME_EVENT,this.onShoot);
         _plant.setFrozenAI(false);
      }
   }
}
