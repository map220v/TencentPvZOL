package com.qq.modules.td.logic.action.zombie.bengbu
{
   import asgui.events.FrameEvent;
   import com.qq.constant.td.TDConstant;
   import com.qq.modules.td.logic.action.zombie.BasicZombieAction;
   import com.qq.modules.td.logic.unit.zombie.BasicZombie;
   import com.qq.modules.td.model.TDGameInfo;
   import flash.events.Event;
   
   public class ZActionBengbuCastSkill extends BasicZombieAction
   {
       
      
      public function ZActionBengbuCastSkill()
      {
         super();
      }
      
      override public function enterState(param1:Array = null) : void
      {
         super.enterState(param1);
         _zombie.animation.gotoAndPlay("skill_on");
         _zombie.animation.addEventListener(Event.COMPLETE,this.onCompleteSkillOn);
         _zombie.animation.addEventListener(FrameEvent.MOVEMENT_FRAME_EVENT,this.onShoot);
         _zombie.setFrozenAI(true);
         _zombie.setTimeRecord(TDConstant.TimeRecord_ZombieDuration,TDGameInfo.getInstance().getCurGameTime());
         this.checkHp();
      }
      
      protected function onShoot(param1:FrameEvent) : void
      {
         if(param1.frameLabel == "shoot")
         {
            _zombie.animation.removeEventListener(FrameEvent.MOVEMENT_FRAME_EVENT,this.onShoot);
            _zombie.setRunningProp(TDConstant.Gameobject_Prop_Bengbu_Hidden,true);
            _zombie.setRunningProp(TDConstant.Gameobject_Prop_Bengbu_Hidden_Time,TDGameInfo.getInstance().getCurGameTime());
         }
      }
      
      protected function onCompleteSkillOn(param1:Event) : void
      {
         _zombie.animation.removeEventListener(FrameEvent.MOVEMENT_FRAME_EVENT,this.onShoot);
         _zombie.animation.removeEventListener(Event.COMPLETE,this.onCompleteSkillOn);
         _zombie.animation.gotoAndPlay("skill_idle",true);
         _zombie.setFrozenAI(false);
         this.checkHp();
      }
      
      override public function leaveState() : void
      {
         _zombie.animation.removeEventListener(FrameEvent.MOVEMENT_FRAME_EVENT,this.onShoot);
         _zombie.animation.removeEventListener(Event.COMPLETE,this.onCompleteSkillOn);
         super.leaveState();
      }
      
      private function checkHp() : void
      {
         var _loc1_:Number = NaN;
         var _loc2_:Number = NaN;
         var _loc3_:Number = NaN;
         var _loc4_:int = 0;
         if(_zombie.zombieData && _zombie.zombieData.armorData && _zombie.zombieData.armorData.length > 0)
         {
            _loc1_ = _zombie.zombieData.armorData[0][TDConstant.Armor_Hp];
            _loc2_ = _zombie.zombieData.armorData[0][TDConstant.Armor_MaxHp];
            _loc3_ = _loc1_ / _loc2_;
            if(_loc3_ >= 0.67)
            {
               _loc4_ = 3;
            }
            else if(_loc3_ >= 0.34)
            {
               _loc4_ = 2;
            }
            else if(_loc3_ > 0)
            {
               _loc4_ = 1;
            }
            if(_loc4_)
            {
               switch(_loc4_)
               {
                  case 1:
                     (_zombie as BasicZombie).setBoneVisible("Zombie_Clam_Left_Hull_003",true);
                     (_zombie as BasicZombie).setBoneVisible("Zombie_Clam_Left_Hull_002",false);
                     (_zombie as BasicZombie).setBoneVisible("Zombie_Clam_Left_Hull_001",false);
                     (_zombie as BasicZombie).setBoneVisible("Zombie_Clam_Right_Hull_003",true);
                     (_zombie as BasicZombie).setBoneVisible("Zombie_Clam_Right_Hull_002",false);
                     (_zombie as BasicZombie).setBoneVisible("Zombie_Clam_Right_Hull_001",false);
                     break;
                  case 2:
                     (_zombie as BasicZombie).setBoneVisible("Zombie_Clam_Left_Hull_003",false);
                     (_zombie as BasicZombie).setBoneVisible("Zombie_Clam_Left_Hull_002",true);
                     (_zombie as BasicZombie).setBoneVisible("Zombie_Clam_Left_Hull_001",false);
                     (_zombie as BasicZombie).setBoneVisible("Zombie_Clam_Right_Hull_003",false);
                     (_zombie as BasicZombie).setBoneVisible("Zombie_Clam_Right_Hull_002",true);
                     (_zombie as BasicZombie).setBoneVisible("Zombie_Clam_Right_Hull_001",false);
                     break;
                  case 3:
                     (_zombie as BasicZombie).setBoneVisible("Zombie_Clam_Left_Hull_003",false);
                     (_zombie as BasicZombie).setBoneVisible("Zombie_Clam_Left_Hull_002",false);
                     (_zombie as BasicZombie).setBoneVisible("Zombie_Clam_Left_Hull_001",true);
                     (_zombie as BasicZombie).setBoneVisible("Zombie_Clam_Right_Hull_003",false);
                     (_zombie as BasicZombie).setBoneVisible("Zombie_Clam_Right_Hull_002",false);
                     (_zombie as BasicZombie).setBoneVisible("Zombie_Clam_Right_Hull_001",true);
               }
            }
         }
      }
   }
}
