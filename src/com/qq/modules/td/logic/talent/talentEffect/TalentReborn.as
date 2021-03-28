package com.qq.modules.td.logic.talent.talentEffect
{
   import com.qq.CommandName;
   import com.qq.modules.basic.event.CommonEvent;
   import com.qq.modules.td.logic.unit.plant.BasicPlant;
   import com.qq.utils.CommandDispatcher;
   import flash.utils.Dictionary;
   
   public class TalentReborn extends TalentEffect implements ITalentEffect
   {
       
      
      private var _plantId:int;
      
      private var _rate:Number;
      
      private var _rebornTimeDic:Dictionary;
      
      public function TalentReborn()
      {
         this._rebornTimeDic = new Dictionary();
         super();
      }
      
      override public function setData(param1:Array) : void
      {
         super.setData(param1);
         this._plantId = param1[0];
         this._rate = param1[1];
         CommandDispatcher._dispatcher.addEventListener(CommandName.TD_PLANT_REBORN,this.onPlantRebornHandler);
      }
      
      private function onPlantRebornHandler(param1:CommonEvent) : void
      {
         var _loc2_:BasicPlant = param1.param as BasicPlant;
         if(_loc2_.plantData.plantStaticInfo.type == this._plantId)
         {
            if(this._rebornTimeDic[_loc2_.uid] == null)
            {
               this._rebornTimeDic[_loc2_.uid] = 1;
            }
         }
      }
      
      public function getRebornTimes(param1:int) : int
      {
         if(this._rebornTimeDic[param1] > 1)
         {
            return -1;
         }
         if(Math.random() * 100 <= this._rate)
         {
            if(this._rebornTimeDic[param1] == null)
            {
               this._rebornTimeDic[param1] = 0;
            }
            else
            {
               this._rebornTimeDic[param1] += 1;
            }
         }
         if(this._rebornTimeDic[param1] == 0)
         {
            return 0;
         }
         this._rebornTimeDic[param1] = 1;
         return -1;
      }
      
      override public function dispose() : void
      {
         CommandDispatcher._dispatcher.removeEventListener(CommandName.TD_PLANT_REBORN,this.onPlantRebornHandler);
         this._rebornTimeDic = null;
         super.dispose();
      }
   }
}
