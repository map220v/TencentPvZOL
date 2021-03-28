package com.qq.modules.td.logic.action.zombie.monkeyCharmer
{
   import asgui.events.FrameEvent;
   import com.qq.constant.td.TDConstant;
   import com.qq.modules.td.command.game.TDGameObjectCmd;
   import com.qq.modules.td.data.map.TDMapTileData;
   import com.qq.modules.td.logic.TDFactory;
   import com.qq.modules.td.logic.action.zombie.BasicZombieAction;
   import com.qq.modules.td.logic.unit.basic.IGameObject;
   import com.qq.modules.td.logic.unit.plant.BasicPlant;
   import com.qq.modules.td.model.TDGameInfo;
   import flash.events.Event;
   
   public class ZActionMonkeyCharmerThrow extends BasicZombieAction
   {
       
      
      private var _targetPlant:BasicPlant;
      
      public function ZActionMonkeyCharmerThrow()
      {
         super();
      }
      
      override public function enterState(param1:Array = null) : void
      {
         super.enterState(param1);
         this._targetPlant = param1[0] as BasicPlant;
         _gameObject.setFrozenAI(true);
         _gameObject.animation.addEventListener(Event.COMPLETE,this.onFinish);
         _gameObject.animation.addEventListener(FrameEvent.MOVEMENT_FRAME_EVENT,this.onShoot);
         _gameObject.animation.gotoAndPlay("throw",1);
      }
      
      override public function leaveState() : void
      {
         _gameObject.animation.removeEventListener(Event.COMPLETE,this.onFinish);
         _gameObject.animation.removeEventListener(FrameEvent.MOVEMENT_FRAME_EVENT,this.onShoot);
         super.leaveState();
      }
      
      override public function dispose() : void
      {
         super.dispose();
         this._targetPlant = null;
      }
      
      private function onFinish(param1:Event = null) : void
      {
         _gameObject.animation.removeEventListener(Event.COMPLETE,this.onFinish);
         _gameObject.setAction();
         _gameObject.setFrozenAI(false);
      }
      
      private function onShoot(param1:FrameEvent) : void
      {
         var _loc2_:TDMapTileData = null;
         var _loc3_:IGameObject = null;
         if(this._targetPlant.isVaild)
         {
            if(param1.frameLabel == "throw")
            {
               _loc2_ = TDGameInfo.getInstance().getRoadTileByGamePos(_gameObject.x,_gameObject.y);
               TDGameObjectCmd.popZombieInArea([TDConstant.ZombieType_Monkey],_gameObject.x + 55,_gameObject.y - 170,this._targetPlant.objectModel.column,this._targetPlant.objectModel.column,[_zombie.objectModel.roadIndex]);
               _loc3_ = TDGameInfo.getInstance().getGameObjctByUID(TDFactory.getLastUnitUin());
               _loc3_.setAttackTarget(this._targetPlant);
               _zombie.setRunningProp(TDConstant.Gameobject_Prop_IsHaveDisposableObj,false);
               _zombie.setBoneVisible("monkey_*",false);
            }
         }
      }
   }
}
