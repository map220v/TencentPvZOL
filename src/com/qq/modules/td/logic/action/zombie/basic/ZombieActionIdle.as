package com.qq.modules.td.logic.action.zombie.basic
{
   import com.qq.constant.td.TDConstant;
   import com.qq.modules.td.logic.action.zombie.BasicZombieAction;
   import com.qq.modules.td.logic.unit.basic.IGameObject;
   import com.qq.utils.DMath;
   
   public class ZombieActionIdle extends BasicZombieAction
   {
       
      
      protected var _animFlagName:String;
      
      public function ZombieActionIdle()
      {
         super();
      }
      
      override public function setGameObject(param1:IGameObject, param2:String) : void
      {
         var _loc3_:Array = null;
         var _loc4_:Array = null;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:String = null;
         super.setGameObject(param1,param2);
         if(param1 != null)
         {
            _loc3_ = param1.animation.getAllLabelName();
            _loc4_ = new Array();
            _loc5_ = 0;
            while(_loc5_ < _loc3_.length)
            {
               if((_loc7_ = _loc3_[_loc5_]) == TDConstant.ZombieAnmi_Idle || _loc7_ == TDConstant.ZombieAnmi_Idle2)
               {
                  _loc4_.push(_loc7_);
               }
               _loc5_++;
            }
            _loc6_ = Math.max(0,DMath.randNum(0,_loc4_.length - 1));
            this._animFlagName = _loc4_[_loc6_];
         }
      }
      
      override public function enterState(param1:Array = null) : void
      {
         super.enterState(param1);
         _zombie.animation.gotoAndPlay(this._animFlagName,true);
      }
      
      override public function leaveState() : void
      {
      }
   }
}
