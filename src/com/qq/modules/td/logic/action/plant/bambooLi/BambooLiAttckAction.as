package com.qq.modules.td.logic.action.plant.bambooLi
{
   import asgui.events.FrameEvent;
   import com.qq.modules.td.command.effects.TDEffectCmd;
   import com.qq.modules.td.command.game.sound.TDSoundCmd;
   import com.qq.modules.td.data.map.TDMapTileData;
   import com.qq.modules.td.logic.action.plant.BasicPlantAction;
   import com.qq.modules.td.logic.numeric.TDDamageCaculete;
   import com.qq.modules.td.model.TDGameInfo;
   import flash.events.Event;
   
   public class BambooLiAttckAction extends BasicPlantAction
   {
      
      private static const Direction_Top:int = 1;
      
      private static const Direction_Left:int = 2;
      
      private static const Direction_Right:int = 4;
      
      private static const Direction_Bottom:int = 8;
       
      
      private var _attackActionNames:Array;
      
      public function BambooLiAttckAction()
      {
         super();
         this._attackActionNames = new Array();
         this._attackActionNames[0] = "attack";
         this._attackActionNames[Direction_Left] = "attack3";
         this._attackActionNames[Direction_Top | Direction_Left] = "attack4";
         this._attackActionNames[Direction_Bottom | Direction_Left] = "attack5";
         this._attackActionNames[Direction_Top | Direction_Right] = "attack1";
         this._attackActionNames[Direction_Right] = "attack";
         this._attackActionNames[Direction_Right | Direction_Bottom] = "attack2";
      }
      
      override public function enterState(param1:Array = null) : void
      {
         var _loc4_:TDMapTileData = null;
         super.enterState(param1);
         var _loc2_:* = 0;
         if(_gameObject.curAttackTarget != null)
         {
            if(_loc4_ = TDGameInfo.getInstance().getRoadTileByIndex(_gameObject.objectModel.tileIndex))
            {
               if(_gameObject.curAttackTarget.y > _loc4_.rect.bottom)
               {
                  _loc2_ |= Direction_Bottom;
               }
               else if(_gameObject.curAttackTarget.y < _loc4_.rect.top)
               {
                  _loc2_ |= Direction_Top;
               }
               if(_gameObject.curAttackTarget.x > _gameObject.x)
               {
                  _loc2_ |= Direction_Right;
               }
               else
               {
                  _loc2_ |= Direction_Left;
               }
            }
         }
         var _loc3_:String = this._attackActionNames[_loc2_];
         if(_loc3_ != null)
         {
            _loc3_ = this._attackActionNames[0];
         }
         _gameObject.animation.gotoAndPlay(this._attackActionNames[_loc2_],false);
         _gameObject.animation.addEventListener(FrameEvent.MOVEMENT_FRAME_EVENT,this.onAttack);
         _gameObject.animation.addEventListener(Event.COMPLETE,this.onCompleteAttack);
      }
      
      private function onAttack(param1:FrameEvent) : void
      {
         if(param1.frameLabel == "hit")
         {
            TDSoundCmd.bambooLiNoramlAttack();
            TDDamageCaculete.caculatePlantAttckDamage(_plant,_gameObject.curAttackTarget);
            TDEffectCmd.playBambooLiHitEffect(_gameObject,_gameObject.curAttackTarget);
         }
      }
      
      private function onCompleteAttack(param1:Event) : void
      {
         _gameObject.animation.removeEventListener(Event.COMPLETE,this.onCompleteAttack);
         _gameObject.setAttackTarget(null);
         _gameObject.setAction();
      }
      
      override public function leaveState() : void
      {
         _gameObject.animation.removeEventListener(FrameEvent.MOVEMENT_FRAME_EVENT,this.onAttack);
         _gameObject.animation.removeEventListener(Event.COMPLETE,this.onCompleteAttack);
         super.leaveState();
      }
   }
}
