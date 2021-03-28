package com.qq.modules.td.logic.talent.talentEffect
{
   import com.qq.CommandName;
   import com.qq.modules.basic.event.CommonEvent;
   import com.qq.modules.td.logic.unit.plant.BasicPlant;
   import com.qq.utils.CommandDispatcher;
   import flash.utils.Dictionary;
   
   public class TalentCastSkillAfterPlant extends TalentEffect implements ITalentEffect
   {
       
      
      private var _plantId:int;
      
      private var _castRate:int;
      
      private var _castTimeDic:Dictionary;
      
      public function TalentCastSkillAfterPlant()
      {
         this._castTimeDic = new Dictionary();
         super();
      }
      
      override public function setData(param1:Array) : void
      {
         super.setData(param1);
         this._plantId = param1[0];
         this._castRate = param1[1];
         CommandDispatcher._dispatcher.addEventListener(CommandName.TD_StartSkill,this.onStartSkillHandler);
      }
      
      private function onStartSkillHandler(param1:CommonEvent) : void
      {
         var _loc2_:BasicPlant = param1.param as BasicPlant;
         if(_loc2_.plantData.plantStaticInfo.type == this._plantId)
         {
            if(this._castTimeDic[_loc2_.uid] == null)
            {
               this._castTimeDic[_loc2_.uid] = 1;
            }
         }
      }
      
      public function getCastSkillTimes(param1:int) : int
      {
         if(this._castTimeDic[param1] > 1)
         {
            return -1;
         }
         if(Math.random() * 100 <= this._castRate)
         {
            if(this._castTimeDic[param1] == null)
            {
               this._castTimeDic[param1] = 0;
            }
            else
            {
               this._castTimeDic[param1] += 1;
            }
         }
         if(this._castTimeDic[param1] == 0)
         {
            return 0;
         }
         this._castTimeDic[param1] = 1;
         return -1;
      }
      
      override public function dispose() : void
      {
         CommandDispatcher._dispatcher.removeEventListener(CommandName.TD_StartSkill,this.onStartSkillHandler);
         this._castTimeDic = null;
         super.dispose();
      }
   }
}
