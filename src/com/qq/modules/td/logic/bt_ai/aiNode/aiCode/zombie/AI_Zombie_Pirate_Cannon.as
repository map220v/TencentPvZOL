package com.qq.modules.td.logic.bt_ai.aiNode.aiCode.zombie
{
   import com.qq.constant.td.TDConstant;
   import com.qq.modules.td.data.map.TDMapTileData;
   import com.qq.modules.td.logic.bt_ai.aiNode.BaseNodePvz;
   import com.qq.modules.td.logic.bt_ai.aiNode.executeNode.ExeDoAction;
   import com.qq.modules.td.logic.bt_ai.aiNode.requireNode.ReqZombieDurationExpire;
   import com.qq.modules.td.model.TDGameInfo;
   
   public class AI_Zombie_Pirate_Cannon extends BaseNodePvz
   {
       
      
      private var firstSummonFinished:Boolean;
      
      public function AI_Zombie_Pirate_Cannon(param1:int = 30)
      {
         super(param1);
      }
      
      override public function calculate() : Boolean
      {
         if(!this.hasArriveAtTargetX())
         {
            ExeDoAction.calculateStatic(selfObj,TDConstant.ZAction_Walk);
         }
         else if(!this.firstSummonFinished)
         {
            this.firstSummonFinished = true;
            ExeDoAction.calculateStatic(selfObj,TDConstant.ZAction_Pirate_Cannon_Summon);
         }
         else if(ReqZombieDurationExpire.calculateStatic(selfObj,true))
         {
            ExeDoAction.calculateStatic(selfObj,TDConstant.ZAction_Pirate_Cannon_Summon);
         }
         else
         {
            ExeDoAction.calculateStatic(selfObj,TDConstant.ZAction_Idle);
         }
         return true;
      }
      
      private function hasArriveAtTargetX() : Boolean
      {
         var _loc2_:Number = NaN;
         var _loc1_:TDMapTileData = TDGameInfo.getInstance().getRoadTileInf(TDGameInfo.getInstance().minCol,selfObj.objectModel.roadIndex);
         if(_loc1_)
         {
            _loc2_ = _loc1_.rect.x + _loc1_.rect.width;
            if(selfObj.x <= _loc2_)
            {
               return true;
            }
         }
         return false;
      }
   }
}
