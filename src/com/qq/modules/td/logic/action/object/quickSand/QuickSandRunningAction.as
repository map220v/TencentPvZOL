package com.qq.modules.td.logic.action.object.quickSand
{
   import com.qq.constant.td.TDConstant;
   import com.qq.modules.td.command.game.TDGameObjectCmd;
   import com.qq.modules.td.logic.action.basic.BasicAction;
   import com.qq.modules.td.logic.numeric.TDCheckCollision;
   import com.qq.modules.td.logic.unit.basic.IGameObject;
   import com.qq.modules.td.model.TDGameInfo;
   import flash.geom.Rectangle;
   
   public class QuickSandRunningAction extends BasicAction
   {
       
      
      public function QuickSandRunningAction()
      {
         super();
      }
      
      override public function enterState(param1:Array = null) : void
      {
         super.enterState(param1);
         _gameObject.animation.gotoAndPlay("idle",true);
      }
      
      override public function runningState() : void
      {
         var _loc5_:IGameObject = null;
         var _loc1_:Array = TDGameInfo.getInstance().getZombieList(null,0,false,true,false);
         var _loc2_:int = _loc1_.length;
         var _loc3_:Rectangle = TDCheckCollision.getNewObjRect(_gameObject,_gameObject.attackArea);
         var _loc4_:int = 0;
         while(_loc4_ < _loc2_)
         {
            if(!(_loc5_ = _loc1_[_loc4_]).objectModel.checkState(TDConstant.TDUnitState_OnConvey))
            {
               if(!_loc5_.objectModel.hasBuff(TDConstant.TDBuffID_UsedConvey))
               {
                  if(_loc3_.contains(_loc5_.x,_loc5_.y))
                  {
                     _loc5_.objectModel.addBuff(TDConstant.TDBuffID_Convey,_loc5_);
                     _loc5_.objectModel.addBuff(TDConstant.TDBuffID_UsedConvey,_loc5_);
                     TDGameObjectCmd.addConveyEffect(_loc5_,_gameObject.uid,_loc3_.x);
                  }
               }
            }
            _loc4_++;
         }
      }
   }
}
