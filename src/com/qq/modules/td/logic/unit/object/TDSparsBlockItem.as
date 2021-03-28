package com.qq.modules.td.logic.unit.object
{
   import com.qq.constant.td.TDConstant;
   import com.qq.modules.td.data.map.TDMapTileData;
   import com.qq.modules.td.logic.unit.basic.IGameObject;
   import com.qq.modules.td.logic.unit.unitFunctor.SparsGroup;
   import com.qq.modules.td.logic.unit.zombie.BasicZombie;
   import com.qq.modules.td.model.TDGameInfo;
   import tencent.tools.group.GroupManager;
   import tencent.tools.group.IGroupTarget;
   
   public class TDSparsBlockItem extends TDNormalObject implements IGroupTarget
   {
       
      
      public function TDSparsBlockItem()
      {
         super();
         setVisible(false);
      }
      
      override public function changeHp(param1:int, param2:int, param3:int, param4:IGameObject) : Boolean
      {
         var _loc5_:SparsGroup;
         (_loc5_ = GroupManager.getInstance().getGroupFromID(SparsGroup.NAME) as SparsGroup).changeHP(param1,this);
         return false;
      }
      
      override public function update() : void
      {
         super.update();
         this.checkBlocked();
      }
      
      private function checkBlocked() : void
      {
         var _loc4_:BasicZombie = null;
         var _loc5_:TDMapTileData = null;
         var _loc1_:Array = TDGameInfo.getInstance().getZombieList([this.model.roadIndex]);
         var _loc2_:int = _loc1_.length;
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            _loc4_ = _loc1_[_loc3_] as BasicZombie;
            if(!(_loc5_ = TDGameInfo.getInstance().getRoadTileByGamePos(_loc4_.x,_loc4_.y)))
            {
               return;
            }
            if(this.model.column == _loc5_.roadCol && this.model.roadIndex == _loc5_.roadRow)
            {
               _loc4_.model.addBuff(TDConstant.TDBuffID_Block,_loc4_);
            }
            _loc3_++;
         }
      }
      
      override protected function updateHPBar() : void
      {
      }
   }
}
