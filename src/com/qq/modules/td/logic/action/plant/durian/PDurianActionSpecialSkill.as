package com.qq.modules.td.logic.action.plant.durian
{
   import com.qq.CommandName;
   import com.qq.constant.td.TDConstant;
   import com.qq.modules.td.command.game.TDExplodeCmd;
   import com.qq.modules.td.command.game.sound.TDSoundCmd;
   import com.qq.modules.td.logic.action.plant.basic.PlantSpecialSkillAction;
   import com.qq.modules.td.logic.numeric.TDDamageCaculete;
   import com.qq.modules.td.logic.talent.TalentManager;
   import com.qq.utils.CommandDispatcher;
   import flash.events.Event;
   
   public class PDurianActionSpecialSkill extends PlantSpecialSkillAction
   {
       
      
      public function PDurianActionSpecialSkill()
      {
         super();
      }
      
      override public function enterState(param1:Array = null) : void
      {
         super.enterState(param1);
         _plant.animation.gotoAndPlay(TDConstant.PlantAnmi_Plantfood);
         _plant.animation.addEventListener(Event.COMPLETE,this.onFinishAttack);
      }
      
      private function onFinishAttack(param1:Event) : void
      {
         _plant.animation.removeEventListener(Event.COMPLETE,this.onFinishAttack);
         _plant.animation.addEventListener(Event.COMPLETE,this.onBoomCompleted);
         _plant.animation.gotoAndPlay(TDConstant.PlantAnmi_Mash);
         _plant.killBySelfExplode = true;
         TDSoundCmd.potatoMineExplode();
         CommandDispatcher.send(CommandName.TD_PlayShakeEffect);
         TDExplodeCmd.explodeForPlant(_plant,int.MAX_VALUE,true,true);
      }
      
      private function onBoomCompleted(param1:Event) : void
      {
         var _loc3_:Number = NaN;
         _plant.animation.removeEventListener(Event.COMPLETE,this.onBoomCompleted);
         finishSpecialSkill();
         var _loc2_:Number = TalentManager.instance.getAddRate(_plant.plantData.plantStaticInfo);
         if(_loc2_ > 0)
         {
            _loc3_ = Math.random() * 100;
            if(_loc3_ < _loc2_)
            {
               _plant.animation.gotoAndPlay(TDConstant.PlantAnmi_Idle);
               TDDamageCaculete.executeDamage(_plant,0 - _plant.objectModel.curHp.get() * 0.5,TDConstant.AttackType_Normal,TDConstant.AttackMode_Normal,_plant);
            }
         }
         else
         {
            _gameObject.dispose();
         }
      }
      
      override public function leaveState() : void
      {
         _plant.animation.removeEventListener(Event.COMPLETE,this.onBoomCompleted);
         _plant.animation.removeEventListener(Event.COMPLETE,this.onFinishAttack);
         super.leaveState();
      }
   }
}
