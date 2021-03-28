package com.qq.modules.td.logic.action.plant.bubbleFlower
{
   import asgui.events.FrameEvent;
   import com.qq.constant.td.TDConstant;
   import com.qq.modules.td.logic.action.plant.basic.PlantSpecialSkillAction;
   import com.qq.modules.td.logic.numeric.TDDamageCaculete;
   import com.qq.modules.td.logic.unit.zombie.BasicZombie;
   import com.qq.modules.td.model.TDGameInfo;
   import flash.events.Event;
   
   public class PBubbleFlowerSpecialSkill extends PlantSpecialSkillAction
   {
       
      
      public function PBubbleFlowerSpecialSkill()
      {
         super();
      }
      
      override public function enterState(param1:Array = null) : void
      {
         super.enterState(param1);
         _plant.animation.gotoAndPlay("skill");
         _plant.animation.addEventListener(Event.COMPLETE,this.finishSkill);
         _plant.animation.addEventListener(FrameEvent.MOVEMENT_FRAME_EVENT,this.onShoot);
      }
      
      protected function onShoot(param1:FrameEvent) : void
      {
         var _loc2_:Array = null;
         var _loc3_:BasicZombie = null;
         var _loc4_:Number = NaN;
         if(param1.frameLabel == "shoot")
         {
            _plant.animation.removeEventListener(FrameEvent.MOVEMENT_FRAME_EVENT,this.onShoot);
            _loc2_ = TDGameInfo.getInstance().getGameObjectMapByCatalg(TDConstant.UnitCatalog_Zombie);
            for each(_loc3_ in _loc2_)
            {
               if(_loc3_ != null)
               {
                  if(_loc3_.objectModel.curHp.get() > 0)
                  {
                     if(!_loc3_.objectModel.hasBuff(TDConstant.TDBuffID_God))
                     {
                        if(_loc3_.zombieData.zombiestaticInfo.bodySize != 4)
                        {
                           if(_loc3_.zombieData.zombiestaticInfo.getParam(TDConstant.Zombie_Param_IsMachine) != 1)
                           {
                              _loc3_.objectModel.removeBuff(TDConstant.TDBuffID_Special_BubbleSround);
                              _loc3_.objectModel.addBuff(TDConstant.TDBuffID_Special_BubbleSround,null);
                              _loc3_.objectModel.removeBuff(TDConstant.TDBuffID_BubbleSround);
                              _loc4_ = TDDamageCaculete.getPlantAttckDamage(_plant,_loc3_,true);
                              TDDamageCaculete.executeDamage(_loc3_,_loc4_,TDConstant.AttackType_Normal,TDConstant.AttackMode_Normal,_plant);
                           }
                        }
                     }
                  }
               }
            }
         }
      }
      
      protected function finishSkill(param1:Event) : void
      {
         _plant.animation.removeEventListener(Event.COMPLETE,this.finishSkill);
         _plant.animation.removeEventListener(FrameEvent.MOVEMENT_FRAME_EVENT,this.onShoot);
         finishSpecialSkill();
      }
      
      override public function leaveState() : void
      {
         _plant.animation.removeEventListener(Event.COMPLETE,this.finishSkill);
         _plant.animation.removeEventListener(FrameEvent.MOVEMENT_FRAME_EVENT,this.onShoot);
         super.leaveState();
      }
   }
}
