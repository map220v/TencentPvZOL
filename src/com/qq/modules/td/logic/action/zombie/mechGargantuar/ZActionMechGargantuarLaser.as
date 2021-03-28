package com.qq.modules.td.logic.action.zombie.mechGargantuar
{
   import com.qq.constant.td.TDConstant;
   import com.qq.modules.td.command.game.TDFireBulletCmd;
   import com.qq.modules.td.data.map.TDMapTileData;
   import com.qq.modules.td.logic.action.zombie.BasicZombieAction;
   import com.qq.modules.td.logic.numeric.TDCheckCollision;
   import com.qq.modules.td.logic.unit.basic.IGameObject;
   import com.qq.modules.td.logic.unit.zombie.BasicZombie;
   import com.qq.modules.td.model.TDGameInfo;
   import flash.geom.Point;
   import flash.utils.clearTimeout;
   import flash.utils.setTimeout;
   import net.sakri.flash.math.MathUtil;
   
   public class ZActionMechGargantuarLaser extends BasicZombieAction
   {
       
      
      private var m_interval:int;
      
      public function ZActionMechGargantuarLaser()
      {
         super();
      }
      
      override public function enterState(param1:Array = null) : void
      {
         super.enterState(param1);
         if(_gameObject.getRunningProp(TDConstant.Gameobject_Prop_Mech_Gargantuar_Has_Summoned) == true)
         {
            (_gameObject as BasicZombie).setBoneVisible("pod",false);
         }
         var _loc2_:Array = [];
         _loc2_.push(new Point(_gameObject.x - 55,_gameObject.y - 125));
         var _loc3_:Array = this.findTargetTileAndObject();
         _loc2_.push(_loc3_[0]);
         _loc2_.push(_loc3_[1]);
         TDFireBulletCmd.shoot(_gameObject,_gameObject.curAttackTarget,TDConstant.BulletType_Laser,null,0,0,1,false,null,_loc2_);
         this.m_interval = setTimeout(this.finish,3000);
      }
      
      private function finish() : void
      {
         clearTimeout(this.m_interval);
         if(_gameObject)
         {
            _gameObject.setTimeRecord(TDConstant.TimeRecord_ZombieDuration,TDGameInfo.getInstance().getCurGameTime());
            _gameObject.setAction();
         }
      }
      
      private function findTargetTileAndObject() : Array
      {
         var _loc8_:int = 0;
         var _loc9_:TDMapTileData = null;
         var _loc10_:IGameObject = null;
         var _loc11_:Array = null;
         var _loc1_:int = 2;
         var _loc2_:TDMapTileData = TDGameInfo.getInstance().getRoadTileByGamePos(_gameObject.x,_gameObject.y);
         if(_loc2_)
         {
            if(_loc2_.roadCol > 2)
            {
               _loc1_ = MathUtil.constrainNumber(_loc2_.roadCol + 1,2,TDGameInfo.getInstance().maxCol);
            }
         }
         var _loc3_:int = MathUtil.getRandomIntInRange(TDGameInfo.getInstance().minRow,TDGameInfo.getInstance().maxRow);
         var _loc4_:int = MathUtil.getRandomIntInRange(_loc1_,TDGameInfo.getInstance().maxCol);
         var _loc5_:TDMapTileData = TDGameInfo.getInstance().getRoadTileInf(_loc4_,_loc3_);
         var _loc6_:Array = [];
         var _loc7_:int = TDGameInfo.getInstance().minRow;
         while(_loc7_ <= TDGameInfo.getInstance().maxRow)
         {
            _loc8_ = _loc1_;
            while(_loc8_ <= TDGameInfo.getInstance().maxCol)
            {
               _loc9_ = TDGameInfo.getInstance().getRoadTileInf(_loc8_,_loc7_);
               if(_loc10_ = this.checkTileHasPlantOrZombie(_loc9_))
               {
                  _loc6_.push([_loc9_,_loc10_]);
               }
               _loc8_++;
            }
            _loc7_++;
         }
         if(_loc6_.length > 0)
         {
            return _loc6_[MathUtil.getRandomIntInRange(0,_loc6_.length - 1)];
         }
         return [_loc5_,null];
      }
      
      private function checkTileHasPlantOrZombie(param1:TDMapTileData) : IGameObject
      {
         var _loc2_:IGameObject = null;
         var _loc4_:Array = null;
         var _loc5_:BasicZombie = null;
         var _loc3_:Array = TDGameInfo.getInstance().getPlantByTileIndex(param1.index);
         if(_loc3_.length > 0)
         {
            _loc2_ = _loc3_[0];
         }
         else
         {
            _loc4_ = TDGameInfo.getInstance().getZombieList([param1.roadIndex]);
            for each(_loc5_ in _loc4_)
            {
               if(_loc5_ != _gameObject && TDCheckCollision.isIntersectRect(param1.rect,_loc5_,_loc5_.damageArea))
               {
                  _loc2_ = _loc5_;
                  break;
               }
            }
         }
         return _loc2_;
      }
   }
}
