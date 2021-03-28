package com.qq.modules.td.logic.action.plant.nuts
{
   import com.qq.constant.td.TDConstant;
   import com.qq.constant.td.TDObjTypeID;
   import com.qq.modules.td.command.game.TDGameObjectCmd;
   import com.qq.modules.td.data.map.TDMapTileData;
   import com.qq.modules.td.logic.TDFactory;
   import com.qq.modules.td.logic.action.plant.basic.PlantSpecialSkillAction;
   import com.qq.modules.td.logic.unit.object.TDNutsShield;
   import com.qq.modules.td.model.TDGameInfo;
   import flash.events.Event;
   
   public class PNutsSpecialSkill extends PlantSpecialSkillAction
   {
       
      
      public function PNutsSpecialSkill()
      {
         super();
      }
      
      override public function enterState(param1:Array = null) : void
      {
         super.enterState(param1);
         _plant.animation.gotoAndPlay(TDConstant.PlantAnmi_Plantfood);
         _plant.animation.addEventListener(Event.COMPLETE,this.onFinishPlantFood);
      }
      
      private function onFinishPlantFood(param1:Event) : void
      {
         var _loc2_:Boolean = false;
         var _loc4_:TDNutsShield = null;
         var _loc5_:TDMapTileData = null;
         var _loc6_:TDNutsShield = null;
         _plant.animation.removeEventListener(Event.COMPLETE,this.onFinishPlantFood);
         var _loc3_:Array = TDGameInfo.getInstance().getGameObjectMapByCatalgAndType(TDConstant.UnitCatalog_Object,TDObjTypeID.Obj_Nuts_Shield);
         for each(_loc4_ in _loc3_)
         {
            if(_loc4_.columnIndex == _plant.objectModel.column)
            {
               _loc2_ = true;
               _loc4_.objData.curHp.set(_loc4_.objectModel.maxHp.get());
               break;
            }
         }
         if(!_loc2_)
         {
            _loc5_ = TDGameInfo.getInstance().getRoadTileInf(_plant.objectModel.column,0.5 * (TDGameInfo.getInstance().minRow + TDGameInfo.getInstance().maxRow));
            TDGameObjectCmd.addGameObjectByPos(TDConstant.UnitCatalog_Object,TDObjTypeID.Obj_Nuts_Shield,_loc5_.rect.right,_loc5_.rect.y + 0 * _loc5_.rect.height);
            (_loc6_ = TDGameInfo.getInstance().getGameObjctByUID(TDFactory.getLastUnitUin()) as TDNutsShield).columnIndex = _plant.objectModel.column;
         }
         finishSpecialSkill();
      }
      
      override public function leaveState() : void
      {
         super.leaveState();
         _plant.animation.removeEventListener(Event.COMPLETE,this.onFinishPlantFood);
      }
   }
}
