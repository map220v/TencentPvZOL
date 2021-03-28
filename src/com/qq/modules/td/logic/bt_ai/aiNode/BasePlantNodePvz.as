package com.qq.modules.td.logic.bt_ai.aiNode
{
   import com.qq.modules.td.logic.unit.plant.BasicPlant;
   
   public class BasePlantNodePvz extends BaseNodePvz
   {
       
      
      public var plant:BasicPlant;
      
      public function BasePlantNodePvz(param1:int = 30)
      {
         super(param1);
      }
      
      override public function setStaticParams(param1:Array) : void
      {
         super.setStaticParams(param1);
         this.plant = selfObj as BasicPlant;
      }
      
      override public function dispose() : void
      {
         this.plant = null;
         super.dispose();
      }
   }
}
