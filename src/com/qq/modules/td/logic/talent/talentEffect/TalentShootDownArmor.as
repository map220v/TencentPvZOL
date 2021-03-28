package com.qq.modules.td.logic.talent.talentEffect
{
   import com.qq.CommandName;
   import com.qq.modules.basic.event.CommonEvent;
   import com.qq.modules.td.data.game.unit.TDPlantStaticInfo;
   import com.qq.utils.CommandDispatcher;
   import flash.utils.Dictionary;
   
   public class TalentShootDownArmor extends TalentEffect
   {
       
      
      private var attackTime:int;
      
      private var dropArmorRate:int;
      
      private var unitDic:Dictionary;
      
      private var firstAttack:Dictionary;
      
      public function TalentShootDownArmor()
      {
         this.unitDic = new Dictionary();
         this.firstAttack = new Dictionary();
         super();
      }
      
      override public function setData(param1:Array) : void
      {
         this.attackTime = param1[0];
         this.dropArmorRate = param1[1];
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
      
      public function isShootDownArmor(param1:TDPlantStaticInfo, param2:int) : Boolean
      {
         var _loc3_:Boolean = false;
         if(hasSamePlantType(param1) && this.unitDic[param2] == null)
         {
            this.unitDic[param2] = [0,0];
            _loc3_ = true;
         }
         if(hasSamePlantType(param1))
         {
            if(this.unitDic[param2][1] == this.attackTime)
            {
               _loc3_ = true;
            }
         }
         if(!_loc3_)
         {
            return false;
         }
         var _loc4_:Number;
         if((_loc4_ = Math.random() * 100) < this.dropArmorRate)
         {
            return true;
         }
         return false;
      }
      
      override public function dispose() : void
      {
         CommandDispatcher._dispatcher.removeEventListener(CommandName.TD_BE_ATTACKED,this.beAttackedHandler);
      }
   }
}
