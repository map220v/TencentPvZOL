package com.qq.modules.td.logic.talent.talentEffect
{
   import com.qq.CommandName;
   import com.qq.modules.basic.event.CommonEvent;
   import com.qq.modules.td.data.game.unit.TDPlantStaticInfo;
   import com.qq.utils.CommandDispatcher;
   import flash.utils.Dictionary;
   
   public class TalentSameTargetBulletType extends TalentPlusAttackPower
   {
       
      
      private var attackTime:int;
      
      private var bulletType:int;
      
      private var attackPowerRate:int;
      
      private var unitDic:Dictionary;
      
      private var firstAttack:Dictionary;
      
      public function TalentSameTargetBulletType()
      {
         this.unitDic = new Dictionary();
         this.firstAttack = new Dictionary();
         super();
      }
      
      override public function setData(param1:Array) : void
      {
         this.attackTime = param1[0];
         this.bulletType = param1[1];
         this.attackPowerRate = param1[2];
         super.setData([0,this.attackPowerRate,100]);
         CommandDispatcher._dispatcher.addEventListener(CommandName.TD_BE_ATTACKED,this.beAttackedHandler);
      }
      
      private function beAttackedHandler(param1:CommonEvent) : void
      {
         var _loc2_:int = param1.param.fromUid;
         var _loc3_:int = param1.param.toUid;
         if(!this.unitDic[_loc2_])
         {
            this.unitDic[_loc2_] = [0,0];
         }
         if(this.unitDic[_loc2_][0] == _loc3_)
         {
            this.unitDic[_loc2_][1] += 1;
            if(this.unitDic[_loc2_][1] > this.attackTime)
            {
               this.unitDic[_loc2_][1] = 0;
            }
         }
         else
         {
            this.unitDic[_loc2_][0] = _loc3_;
            this.unitDic[_loc2_][1] = 1;
         }
      }
      
      public function getBulletType(param1:TDPlantStaticInfo, param2:int) : int
      {
         if(hasSamePlantType(param1) && this.unitDic[param2] == null && this.firstAttack[param2] == null)
         {
            this.firstAttack[param2] = 1;
            return this.bulletType;
         }
         if(hasSamePlantType(param1) && this.unitDic[param2])
         {
            if(this.unitDic[param2][1] == this.attackTime)
            {
               return this.bulletType;
            }
         }
         return param1.baseInfo.bulletType;
      }
      
      public function getPlusBulletAttackPower(param1:TDPlantStaticInfo, param2:int) : int
      {
         if(hasSamePlantType(param1) && this.unitDic[param2] == null)
         {
            this.unitDic[param2] = [0,this.attackTime];
         }
         if(hasSamePlantType(param1) && this.unitDic[param2])
         {
            if(this.unitDic[param2][1] == this.attackTime)
            {
               return getPlusAttackPower(param1,0);
            }
         }
         return 0;
      }
      
      override public function dispose() : void
      {
         CommandDispatcher._dispatcher.removeEventListener(CommandName.TD_BE_ATTACKED,this.beAttackedHandler);
      }
   }
}
