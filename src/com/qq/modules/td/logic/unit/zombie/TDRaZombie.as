package com.qq.modules.td.logic.unit.zombie
{
   import com.qq.constant.td.TDConstant;
   import com.qq.modules.td.logic.unit.object.TDSun;
   import com.qq.modules.td.model.TDGameInfo;
   
   public class TDRaZombie extends BasicZombie
   {
       
      
      public var lastSetCatchingTime:Number = 0;
      
      public function TDRaZombie()
      {
         super();
      }
      
      override public function setAction(param1:String = null, param2:Array = null, param3:Boolean = false) : void
      {
         super.setAction(param1,param2,param3);
      }
      
      override public function Dispose() : void
      {
         var _loc2_:TDSun = null;
         var _loc1_:Array = TDGameInfo.getInstance().getGameObjectMapByCatalgAndType(TDConstant.UnitCatalog_Object,TDConstant.UnitType_Sun);
         _loc1_ = _loc1_.concat(TDGameInfo.getInstance().getGameObjectMapByCatalgAndType(TDConstant.UnitCatalog_Object,TDConstant.UnitType_PlantSun));
         _loc1_ = _loc1_.concat(TDGameInfo.getInstance().getGameObjectMapByCatalgAndType(TDConstant.UnitCatalog_Object,TDConstant.UnitType_BigSun));
         for each(_loc2_ in _loc1_)
         {
            if(_loc2_ && _loc2_.zombieCatcher && _loc2_.zombieCatcher.uid == this.uid)
            {
               _loc2_.zombieCatcher = null;
            }
         }
         super.Dispose();
      }
   }
}
