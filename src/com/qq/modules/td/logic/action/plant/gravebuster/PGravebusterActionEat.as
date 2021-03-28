package com.qq.modules.td.logic.action.plant.gravebuster
{
   import com.greensock.TweenLite;
   import com.qq.constant.td.TDConstant;
   import com.qq.modules.td.command.game.sound.TDSoundCmd;
   import com.qq.modules.td.logic.action.plant.BasicPlantAction;
   import com.qq.modules.td.logic.talent.TalentManager;
   import com.qq.modules.td.logic.unit.basic.IGameObject;
   import com.qq.modules.td.model.TDGameInfo;
   import flash.events.Event;
   
   public class PGravebusterActionEat extends BasicPlantAction
   {
       
      
      public function PGravebusterActionEat()
      {
         super();
      }
      
      override public function enterState(param1:Array = null) : void
      {
         super.enterState(param1);
         _plant.animation.gotoAndPlay("attack",1);
         _plant.animation.addEventListener(Event.COMPLETE,this.onFinishEat);
         TDSoundCmd.graveEatTomb();
      }
      
      private function onFinishEat(param1:Event) : void
      {
         var _loc5_:IGameObject = null;
         _plant.animation.removeEventListener(Event.COMPLETE,this.onFinishEat);
         var _loc2_:Array = TDGameInfo.getInstance().getGameObjectMapByCatalgAndType(TDConstant.UnitCatalog_Object,TDConstant.UnitType_TDTomb);
         var _loc3_:int = _loc2_.length;
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            if((_loc5_ = _loc2_[_loc4_]).objectModel.tileIndex == _plant.objectModel.tileIndex)
            {
               _loc5_.changeHp(-int.MAX_VALUE,TDConstant.AttackType_Normal,TDConstant.AttackMode_Normal,_plant);
               _loc5_.dispose();
               break;
            }
            _loc4_++;
         }
         _plant.animation.gotoAndPlay("disappear");
         _plant.animation.addEventListener(Event.COMPLETE,this.onDisappear);
      }
      
      private function onDisappear(param1:Event) : void
      {
         _plant.animation.removeEventListener(Event.COMPLETE,this.onDisappear);
         TweenLite.to(_gameObject,1.5,{
            "alpha":0,
            "onComplete":this.onComplete
         });
         TalentManager.instance.getDropSun(_plant.plantData.plantStaticInfo.baseInfo,_plant);
      }
      
      private function onComplete() : void
      {
         if(_gameObject == null || !_gameObject.isVaild)
         {
            return;
         }
         _gameObject.dispose();
      }
      
      override public function leaveState() : void
      {
         super.leaveState();
         _plant.animation.removeEventListener(Event.COMPLETE,this.onFinishEat);
         _plant.animation.removeEventListener(Event.COMPLETE,this.onDisappear);
      }
   }
}
