package com.qq.modules.td.logic.bt_ai.aiNode.executeNode
{
   import com.qq.constant.td.TDConstant;
   import com.qq.modules.td.logic.bt_ai.aiNode.BaseNodePvz;
   import com.qq.modules.td.logic.unit.object.TDSun;
   import com.qq.modules.td.model.TDGameInfo;
   import tencent.tools.behaviourTrees.BehaviourTreeNodeType;
   
   public class ExeCatchSun extends BaseNodePvz
   {
       
      
      public function ExeCatchSun()
      {
         super(BehaviourTreeNodeType.EXECUTE);
      }
      
      override public function calculate() : Boolean
      {
         var _loc2_:TDSun = null;
         var _loc3_:int = 0;
         if(selfObj.getActionID() == TDConstant.ZAction_CatchSun || selfObj.getActionID() == TDConstant.ZAction_CatchSunEnd)
         {
            return true;
         }
         var _loc1_:Array = TDGameInfo.getInstance().getGameObjectMapByCatalgAndType(TDConstant.UnitCatalog_Object,TDConstant.UnitType_Sun);
         _loc1_ = _loc1_.concat(TDGameInfo.getInstance().getGameObjectMapByCatalgAndType(TDConstant.UnitCatalog_Object,TDConstant.UnitType_PlantSun));
         _loc1_ = _loc1_.concat(TDGameInfo.getInstance().getGameObjectMapByCatalgAndType(TDConstant.UnitCatalog_Object,TDConstant.UnitType_BigSun));
         var _loc4_:int = _loc1_.length;
         var _loc5_:Boolean = false;
         _loc3_ = 0;
         while(_loc3_ < _loc4_)
         {
            _loc2_ = _loc1_[_loc3_];
            if(_loc2_.beCatchingStep == 0)
            {
               _loc5_ = true;
               break;
            }
            _loc3_++;
         }
         if(!_loc5_)
         {
            return false;
         }
         selfObj.setAction(TDConstant.ZAction_CatchSun);
         return true;
      }
   }
}
