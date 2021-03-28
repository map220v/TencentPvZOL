package com.qq.modules.td.logic.talent.talentEffect
{
   import com.qq.CommandName;
   import com.qq.modules.basic.event.CommonEvent;
   import com.qq.modules.td.logic.unit.plant.BasicPlant;
   import com.qq.utils.CommandDispatcher;
   import flash.utils.Dictionary;
   
   public class TalentTransformAfterKillSomeZombie extends TalentEffect implements ITalentEffect
   {
       
      
      private var _plantId:int;
      
      private var _transformToPlantId:int;
      
      private var _killZombieNum:int;
      
      private var _hasKilledZombieNumDic:Dictionary;
      
      public function TalentTransformAfterKillSomeZombie()
      {
         this._hasKilledZombieNumDic = new Dictionary();
         super();
      }
      
      override public function setData(param1:Array) : void
      {
         super.setData(param1);
         this._plantId = param1[0];
         this._transformToPlantId = param1[1];
         this._killZombieNum = param1[2];
         CommandDispatcher._dispatcher.addEventListener(CommandName.TD_ZOMBIE_KILLED_BY_PLANT,this.zombieKilledByPlantHandler);
      }
      
      private function zombieKilledByPlantHandler(param1:CommonEvent) : void
      {
         var _loc2_:BasicPlant = param1.param as BasicPlant;
         if(_loc2_ && _loc2_.plantData.plantStaticInfo.type == this._plantId)
         {
            if(this._hasKilledZombieNumDic[_loc2_.uid] == null)
            {
               this._hasKilledZombieNumDic[_loc2_.uid] = 1;
            }
            else
            {
               this._hasKilledZombieNumDic[_loc2_.uid] += 1;
            }
         }
      }
      
      public function getTimeToTransformId(param1:int) : int
      {
         var _loc2_:int = int(this._hasKilledZombieNumDic[param1]);
         if(_loc2_ == this._killZombieNum)
         {
            return this._transformToPlantId;
         }
         return 0;
      }
      
      override public function dispose() : void
      {
         CommandDispatcher._dispatcher.removeEventListener(CommandName.TD_ZOMBIE_KILLED_BY_PLANT,this.zombieKilledByPlantHandler);
         this._hasKilledZombieNumDic = null;
         super.dispose();
      }
   }
}
