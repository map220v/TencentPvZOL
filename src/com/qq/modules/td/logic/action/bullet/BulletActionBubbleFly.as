package com.qq.modules.td.logic.action.bullet
{
   import com.qq.constant.td.TDConstant;
   import com.qq.modules.td.data.map.TDMapTileData;
   import com.qq.modules.td.logic.bt_ai.aiUtils.TDSearchTargetUtils;
   import com.qq.modules.td.logic.numeric.TDCheckCollision;
   import com.qq.modules.td.logic.unit.basic.IGameObject;
   import com.qq.modules.td.logic.unit.zombie.BasicZombie;
   import com.qq.modules.td.model.TDGameInfo;
   
   public class BulletActionBubbleFly extends BulletActionLine
   {
       
      
      private var _speed:int;
      
      private var _maxX:Number;
      
      public function BulletActionBubbleFly()
      {
         super();
      }
      
      override public function enterState(param1:Array = null) : void
      {
         var _loc3_:TDMapTileData = null;
         super.enterState(param1);
         var _loc2_:int = TDGameInfo.getInstance().minRow;
         while(_loc2_ <= TDGameInfo.getInstance().maxRow)
         {
            _loc3_ = TDGameInfo.getInstance().getRoadTileInf(TDGameInfo.getInstance().minCol,_loc2_);
            if(_loc3_)
            {
               this._maxX = _loc3_.rect.right;
               break;
            }
            _loc2_++;
         }
         _bullet.animation.gotoAndPlay("idle",true);
      }
      
      override protected function getFireTarget() : IGameObject
      {
         var _loc1_:IGameObject = null;
         var _loc3_:BasicZombie = null;
         var _loc2_:Array = TDSearchTargetUtils.getZombieList(_bullet,!!_bullet.bulletData.bulletStaticInfo.isMulRow ? null : [_targetRoadIndex]);
         for each(_loc3_ in _loc2_)
         {
            if(_loc3_ != null)
            {
               if(_loc3_.objectModel.curHp.get() > 0)
               {
                  if(!_loc3_.objectModel.hasBuff(TDConstant.TDBuffID_God))
                  {
                     if(!_loc3_.objectModel.hasBuff(TDConstant.TDBuffID_BubbleSround))
                     {
                        if(!_loc3_.objectModel.hasBuff(TDConstant.TDBuffID_Special_BubbleSround))
                        {
                           if(_loc3_.zombieData.zombiestaticInfo.bodySize != 4)
                           {
                              if(_loc3_.zombieData.zombiestaticInfo.getParam(TDConstant.Zombie_Param_IsMachine) != 1)
                              {
                                 if(TDCheckCollision.isCollision(_bullet,_bullet.damageArea,_loc3_,_loc3_.damageArea))
                                 {
                                    _loc1_ = _loc3_;
                                    break;
                                 }
                              }
                           }
                        }
                     }
                  }
               }
            }
         }
         return _loc1_;
      }
      
      override protected function updateBulletState() : void
      {
         var _loc1_:IGameObject = this.getFireTarget();
         if(_loc1_ != null)
         {
            _bullet.setAction(TDConstant.BAction_ForBubbleSround,[_loc1_]);
         }
         else if(_bullet.x + _bullet.damageArea.width >= this._maxX)
         {
            _bullet.setAction(TDConstant.BAction_Disappear);
         }
      }
   }
}
