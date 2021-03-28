package com.qq.modules.td.logic.unit.plant
{
   import com.qq.CommandName;
   import com.qq.modules.td.logic.talent.TalentManager;
   import com.qq.modules.td.logic.unit.basic.IGameObject;
   import com.qq.utils.CommandDispatcher;
   
   public class HayrickPlant extends BasicPlant
   {
       
      
      public function HayrickPlant()
      {
         super();
      }
      
      override protected function deadHandler(param1:int, param2:int, param3:IGameObject) : void
      {
         var _loc4_:int;
         if((_loc4_ = TalentManager.instance.getPlantRebornTimes(this.plantData.plantStaticInfo,this.uid)) == 0)
         {
            CommandDispatcher.send(CommandName.TD_PLANT_REBORN,this);
            this.objectModel.curHp.set(this.objectModel.maxHp.get());
         }
         else
         {
            dispose();
         }
      }
   }
}
