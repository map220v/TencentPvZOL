package com.qq.modules.td.logic.action.zombie.basic
{
   import com.qq.constant.td.TDConstant;
   import com.qq.modules.td.logic.action.zombie.BasicZombieAction;
   
   public class ZombieActionCarried extends BasicZombieAction
   {
       
      
      public function ZombieActionCarried()
      {
         super();
      }
      
      override public function enterState(param1:Array = null) : void
      {
         var _loc4_:Array = null;
         var _loc5_:int = 0;
         var _loc6_:String = null;
         super.enterState(param1);
         var _loc2_:Array = _gameObject.animation.getAllLabelName();
         var _loc3_:* = _loc2_.indexOf(TDConstant.ZombieAnmi_Fly) >= 0;
         if(_loc3_)
         {
            _gameObject.animation.gotoAndPlay(TDConstant.ZombieAnmi_Fly,true);
         }
         else
         {
            _loc4_ = new Array();
            _loc5_ = 0;
            while(_loc5_ < _loc2_.length)
            {
               if((_loc6_ = _loc2_[_loc5_]).indexOf(TDConstant.ZombieAnmi_Idle) != -1)
               {
                  _loc4_.push(_loc6_);
               }
               _loc5_++;
            }
            _gameObject.animation.gotoAndPlay(_loc4_[int(Math.random() * _loc4_.length)],true);
         }
      }
   }
}
