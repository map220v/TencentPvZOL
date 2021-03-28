package com.qq.modules.td.logic.action.zombie.peddler
{
   import com.qq.constant.td.TDConstant;
   import com.qq.modules.td.command.game.TDGameObjectCmd;
   import com.qq.modules.td.logic.action.zombie.BasicZombieAction;
   import com.qq.modules.td.logic.unit.zombie.BasicZombie;
   import com.qq.modules.td.model.TDGameInfo;
   import com.qq.modules.td.model.vo.TDUnitInitVO;
   import flash.events.Event;
   
   public class ZombiePeddlerSetDogAction extends BasicZombieAction
   {
       
      
      private var _lastTime:Number;
      
      public function ZombiePeddlerSetDogAction()
      {
         super();
      }
      
      override public function enterState(param1:Array = null) : void
      {
         super.enterState(param1);
         _gameObject.animation.addEventListener(Event.COMPLETE,this.onFinish);
         _gameObject.animation.gotoAndPlay("setPig",1);
      }
      
      override public function leaveState() : void
      {
         _gameObject.animation.removeEventListener(Event.COMPLETE,this.onFinish);
         super.leaveState();
      }
      
      private function onFinish(param1:Event) : void
      {
         _gameObject.animation.removeEventListener(Event.COMPLETE,this.onFinish);
         _gameObject.setAction();
         _gameObject.setTimeRecord(TDConstant.TimeRecord_ZombieDuration,TDGameInfo.getInstance().getCurGameTime());
         var _loc2_:TDUnitInitVO = new TDUnitInitVO();
         _loc2_.pathID = _zombie.zombieData.pathId;
         _loc2_.path = (_gameObject as BasicZombie).zombieData.getPathCopy();
         TDGameObjectCmd.addGameObjectByPos(TDConstant.UnitCatalog_Zombie,TDConstant.ZombieType_Qin_Pig,_gameObject.x - 50,_gameObject.y,null,_loc2_);
         _loc2_ = new TDUnitInitVO();
         _loc2_.path = (_gameObject as BasicZombie).zombieData.getPathCopy();
         _loc2_.pathID = _zombie.zombieData.pathId;
         TDGameObjectCmd.addGameObjectByPos(TDConstant.UnitCatalog_Zombie,TDConstant.ZombieType_Qin_Pig,_gameObject.x - 100,_gameObject.y,null,_loc2_);
      }
   }
}
