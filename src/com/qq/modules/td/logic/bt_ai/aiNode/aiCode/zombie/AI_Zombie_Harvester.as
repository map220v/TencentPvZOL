package com.qq.modules.td.logic.bt_ai.aiNode.aiCode.zombie
{
   import com.qq.constant.td.TDConstant;
   import com.qq.modules.td.data.map.TDMapTileData;
   import com.qq.modules.td.logic.bt_ai.aiNode.BaseZombieNodePvz;
   import com.qq.modules.td.logic.bt_ai.aiNode.executeNode.ExeDoAction;
   import com.qq.modules.td.logic.unit.basic.IGameObject;
   import com.qq.modules.td.model.TDGameInfo;
   
   public class AI_Zombie_Harvester extends BaseZombieNodePvz
   {
       
      
      public function AI_Zombie_Harvester(param1:int = 30)
      {
         super(param1);
      }
      
      override public function calculate() : Boolean
      {
         var _loc1_:Array = this.getAttackTarget();
         if(_loc1_.length > 0)
         {
            ExeDoAction.calculateStatic(selfObj,TDConstant.ZAction_Harveseter_Eat,[_loc1_]);
         }
         else
         {
            ExeDoAction.calculateStatic(selfObj,TDConstant.ZAction_Walk);
         }
         return true;
      }
      
      private function getAttackTarget() : Array
      {
         var _loc3_:int = 0;
         var _loc4_:TDMapTileData = null;
         var _loc5_:Array = null;
         var _loc1_:Array = [];
         var _loc2_:TDMapTileData = TDGameInfo.getInstance().getRoadTileByGamePos(selfObj.x,selfObj.y);
         if(_loc2_)
         {
            _loc3_ = -1;
            while(_loc3_ <= 1)
            {
               if(_loc4_ = TDGameInfo.getInstance().getRoadTileInf(_loc2_.roadCol + 1,_loc2_.roadRow + _loc3_))
               {
                  _loc5_ = this.excludeGarlic(TDGameInfo.getInstance().getPlantByTileIndex(_loc4_.index));
                  _loc1_ = _loc1_.concat(_loc5_);
               }
               _loc3_++;
            }
         }
         else
         {
            _loc3_ = -1;
            while(_loc3_ <= 1)
            {
               if((_loc4_ = TDGameInfo.getInstance().getRoadTileInf(TDGameInfo.getInstance().minCol,selfObj.objectModel.roadIndex + _loc3_)) && selfObj.x > _loc4_.rect.right)
               {
                  _loc5_ = this.excludeGarlic(TDGameInfo.getInstance().getPlantByTileIndex(_loc4_.index));
                  _loc1_ = _loc1_.concat(_loc5_);
               }
               _loc3_++;
            }
         }
         return _loc1_;
      }
      
      private function excludeGarlic(param1:Array) : Array
      {
         var _loc4_:IGameObject = null;
         var _loc2_:Array = [];
         var _loc3_:int = param1.length - 1;
         while(_loc3_ >= 0)
         {
            _loc4_ = param1[_loc3_];
            _loc2_.push(_loc4_);
            _loc3_--;
         }
         return _loc2_;
      }
   }
}
