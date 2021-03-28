package com.qq.modules.td.logic.bt_ai.aiNode.aiCode.zombie
{
   import com.qq.constant.td.TDConstant;
   import com.qq.modules.td.data.map.TDMapTileData;
   import com.qq.modules.td.logic.bt_ai.aiNode.BaseNodePvz;
   import com.qq.modules.td.logic.bt_ai.aiNode.executeNode.ExeDoAction;
   import com.qq.modules.td.logic.bt_ai.aiNode.requireNode.ReqCurAction;
   import com.qq.modules.td.logic.bt_ai.aiNode.requireNode.ReqZombieDurationExpire;
   import com.qq.modules.td.logic.unit.basic.IGameObject;
   import com.qq.modules.td.model.TDGameInfo;
   
   public class AI_Zombie_Qin_Archer extends BaseNodePvz
   {
       
      
      private var _shootStartX:int;
      
      public function AI_Zombie_Qin_Archer()
      {
         super();
         this._shootStartX = -1;
      }
      
      override public function calculate() : Boolean
      {
         var _loc1_:TDMapTileData = null;
         var _loc2_:Array = null;
         var _loc3_:IGameObject = null;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:IGameObject = null;
         if(this._shootStartX == -1)
         {
            _loc1_ = TDGameInfo.getInstance().getRoadTileInf(0,1);
            this._shootStartX = _loc1_.rect.right - _loc1_.rect.width * 0.3;
         }
         if(ReqCurAction.calculate(selfObj,true,TDConstant.ZAction_Archer_Shoot))
         {
            return true;
         }
         if(selfObj.x < this._shootStartX)
         {
            _loc2_ = TDGameInfo.getInstance().getPlantListByRoadIndex([selfObj.objectModel.roadIndex]);
            _loc4_ = int.MIN_VALUE;
            if(_loc2_.length > 0)
            {
               _loc5_ = _loc2_.length;
               _loc6_ = 0;
               while(_loc6_ < _loc5_)
               {
                  if((_loc7_ = _loc2_[_loc6_]).x < selfObj.x)
                  {
                     if(_loc7_.x > _loc4_)
                     {
                        _loc4_ = _loc7_.x;
                        _loc3_ = _loc7_;
                     }
                  }
                  _loc6_++;
               }
            }
            if(_loc3_ != null)
            {
               if(selfObj.getRunningProp(TDConstant.GameObject_Prop_Archer_IsKneel) == 0)
               {
                  ExeDoAction.calculateStatic(selfObj,TDConstant.ZAction_Archer_StartShoot);
                  return true;
               }
               if(ReqZombieDurationExpire.calculateStatic(selfObj,true))
               {
                  selfObj.setAttackTarget(_loc3_);
                  ExeDoAction.calculateStatic(selfObj,TDConstant.ZAction_Archer_Shoot);
                  return true;
               }
               if(ReqCurAction.calculate(selfObj,false,TDConstant.ZAction_Archer_WaitShoot))
               {
                  ExeDoAction.calculateStatic(selfObj,TDConstant.ZAction_Archer_WaitShoot);
               }
               return true;
            }
            if(selfObj.getRunningProp(TDConstant.GameObject_Prop_Archer_IsKneel) == 1)
            {
               ExeDoAction.calculateStatic(selfObj,TDConstant.ZAction_Archer_EndShoot);
               return true;
            }
         }
         if(ReqCurAction.calculate(selfObj,false,TDConstant.ZAction_Walk))
         {
            ExeDoAction.calculateStatic(selfObj,TDConstant.ZAction_Walk);
         }
         return true;
      }
   }
}
