package com.qq.modules.td.logic.action.plant.laserbean
{
   import asgui.blit.bone.BlitBoneFrameChild;
   import com.qq.constant.td.TDConstant;
   import com.qq.constant.td.TDSoundID;
   import com.qq.modules.td.command.game.sound.TDSoundCmd;
   import com.qq.modules.td.logic.action.plant.basic.PlantSpecialSkillAction;
   import com.qq.modules.td.logic.bt_ai.aiUtils.TDSearchTargetUtils;
   import com.qq.modules.td.logic.numeric.TDDamageCaculete;
   import com.qq.modules.td.logic.unit.basic.IGameObject;
   import flash.events.Event;
   import flash.geom.Rectangle;
   
   public class PLaserbeanActionSpecialSkill extends PlantSpecialSkillAction
   {
       
      
      private var _isAttacking:Boolean;
      
      protected var moveBone:BlitBoneFrameChild;
      
      private var _uidArr:Array;
      
      public function PLaserbeanActionSpecialSkill()
      {
         super();
      }
      
      override public function enterState(param1:Array = null) : void
      {
         super.enterState(param1);
         this._isAttacking = false;
         this._uidArr = [];
         _plant.animation.gotoAndPlay(TDConstant.PlantAnmi_Plantfood_on);
         _plant.animation.addEventListener(Event.COMPLETE,this.onFinishPlantfood_on);
      }
      
      private function onFinishPlantfood_on(param1:Event) : void
      {
         _plant.animation.removeEventListener(Event.COMPLETE,this.onFinishPlantfood_on);
         this._isAttacking = true;
         _plant.animation.gotoAndPlay(TDConstant.PlantAnmi_Plantfood);
         _plant.animation.addEventListener(Event.COMPLETE,this.onFinishPlantfood);
      }
      
      private function onFinishPlantfood(param1:Event) : void
      {
         _plant.animation.removeEventListener(Event.COMPLETE,this.onFinishPlantfood);
         this._isAttacking = false;
         _plant.animation.gotoAndPlay(TDConstant.PlantAnmi_Plantfood_off);
         _plant.animation.addEventListener(Event.COMPLETE,this.onFinishPlantfood_off);
      }
      
      private function onFinishPlantfood_off(param1:Event) : void
      {
         _plant.animation.removeEventListener(Event.COMPLETE,this.onFinishPlantfood_off);
         finishSpecialSkill();
      }
      
      override public function runningState() : void
      {
         var _loc1_:BlitBoneFrameChild = null;
         var _loc2_:Rectangle = null;
         var _loc3_:Vector.<IGameObject> = null;
         var _loc4_:IGameObject = null;
         super.runningState();
         if(this._isAttacking)
         {
            _loc1_ = _plant.animation.getFrameChild("laserbean_blast_base");
            if(_loc1_)
            {
               _loc2_ = new Rectangle(_plant.x + _loc1_.m.tx - 150,_plant.y - 50,100,50);
               _loc3_ = TDSearchTargetUtils.searchTargetForPlant(_plant,[_loc2_],[_plant.objectModel.roadIndex]);
               for each(_loc4_ in _loc3_)
               {
                  if(this._uidArr.indexOf(_loc4_.uid) < 0)
                  {
                     this._uidArr.push(_loc4_.uid);
                     TDDamageCaculete.caculatePlantAttckDamage(_plant,_loc4_,0,true);
                  }
               }
               TDSoundCmd.playSound(TDSoundID.LaserBean_Food);
            }
         }
      }
      
      override public function leaveState() : void
      {
         super.leaveState();
         _plant.animation.removeEventListener(Event.COMPLETE,this.onFinishPlantfood_on);
         _plant.animation.removeEventListener(Event.COMPLETE,this.onFinishPlantfood);
         _plant.animation.removeEventListener(Event.COMPLETE,this.onFinishPlantfood_off);
         this._uidArr = null;
      }
   }
}
