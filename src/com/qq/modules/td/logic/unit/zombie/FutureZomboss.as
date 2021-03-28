package com.qq.modules.td.logic.unit.zombie
{
   import com.qq.constant.td.TDConstant;
   
   public class FutureZomboss extends PirateZomboss
   {
       
      
      private var stun_times:Array;
      
      public function FutureZomboss()
      {
         this.stun_times = [0,0];
         super();
      }
      
      override public function update() : void
      {
         super.update();
         this.updateDamageBoneState();
      }
      
      private function updateDamageBoneState() : void
      {
         var _loc1_:Number = objectModel.curHp.get();
         var _loc2_:Number = objectModel.maxHp.get();
         var _loc3_:Number = _loc1_ / _loc2_;
         if(_loc3_ >= 1)
         {
            this.setDamageBoneVisible(0);
         }
         else if(_loc3_ >= 5 / 6)
         {
            this.setDamageBoneVisible(1);
         }
         else if(_loc3_ >= 4 / 6)
         {
            this.setDamageBoneVisible(2);
         }
         else if(_loc3_ >= 3 / 6)
         {
            this.setDamageBoneVisible(3);
            if(this.stun_times[0] == 0)
            {
               this.stun_times[0] = 1;
               this.enterStun();
            }
         }
         else if(_loc3_ >= 2 / 6)
         {
            this.setDamageBoneVisible(4);
         }
         else if(_loc3_ >= 1 / 6)
         {
            this.setDamageBoneVisible(5);
            if(this.stun_times[1] == 0)
            {
               this.stun_times[1] = 1;
               this.enterStun();
            }
         }
         else
         {
            this.setDamageBoneVisible(6);
         }
      }
      
      private function enterStun() : void
      {
         setAction(TDConstant.ZAction_FutureZomboss_Stun);
      }
      
      private function setDamageBoneVisible(param1:int) : void
      {
         if(this.animation == null)
         {
            return;
         }
         var _loc2_:int = 1;
         while(_loc2_ <= 6)
         {
            if(_loc2_ > param1)
            {
               setBoneVisible("Zomboss_Damage_State_" + _loc2_ + "_Dome",false);
            }
            else
            {
               setBoneVisible("Zomboss_Damage_State_" + _loc2_ + "_Dome",true);
            }
            _loc2_++;
         }
      }
   }
}
