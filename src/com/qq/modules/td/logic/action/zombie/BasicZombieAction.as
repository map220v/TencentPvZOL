package com.qq.modules.td.logic.action.zombie
{
   import asgui.blit.bone.BlitBoneFrameChild;
   import com.qq.constant.td.TDConstant;
   import com.qq.modules.td.data.game.unit.TDZombieData;
   import com.qq.modules.td.logic.action.basic.BasicAction;
   import com.qq.modules.td.logic.unit.basic.IGameObject;
   import com.qq.modules.td.logic.unit.zombie.BasicZombie;
   
   public class BasicZombieAction extends BasicAction
   {
       
      
      protected var _zombie:BasicZombie;
      
      protected var _zombieModel:TDZombieData;
      
      public function BasicZombieAction()
      {
         super();
      }
      
      override public function setGameObject(param1:IGameObject, param2:String) : void
      {
         super.setGameObject(param1,param2);
         this._zombie = param1 as BasicZombie;
         this._zombieModel = this._zombie.model as TDZombieData;
      }
      
      override public function runningState() : void
      {
      }
      
      public function getWalkLayerInfo() : Array
      {
         var _loc5_:BlitBoneFrameChild = null;
         var _loc6_:BlitBoneFrameChild = null;
         var _loc1_:Number = 0;
         var _loc2_:Number = 0;
         var _loc3_:Number = 0;
         var _loc4_:Vector.<BlitBoneFrameChild>;
         if((_loc4_ = this._zombie.animation.animationData.getChildFrameArray(TDConstant.Ground_LayerName,this._zombie.animation.getLastLabel())) != null && _loc4_.length > 1)
         {
            _loc5_ = _loc4_[0];
            _loc6_ = _loc4_[_loc4_.length - 1];
            _loc1_ = Math.abs(_loc5_.m.tx - _loc6_.m.tx);
            _loc2_ = Math.abs(_loc5_.m.ty - _loc6_.m.ty);
            _loc3_ = _loc4_.length / this._zombie.animation.swfFrameRate;
            return [_loc1_,_loc3_,_loc2_];
         }
         return null;
      }
      
      override public function dispose() : void
      {
         this._zombie = null;
         this._zombieModel = null;
         super.dispose();
      }
   }
}
