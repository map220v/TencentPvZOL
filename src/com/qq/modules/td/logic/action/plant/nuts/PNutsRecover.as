package com.qq.modules.td.logic.action.plant.nuts
{
   import com.qq.constant.td.TDConstant;
   import com.qq.modules.td.logic.action.plant.BasicPlantAction;
   import com.qq.modules.td.model.TDGameInfo;
   import flash.events.Event;
   
   public class PNutsRecover extends BasicPlantAction
   {
       
      
      public function PNutsRecover()
      {
         super();
      }
      
      override public function enterState(param1:Array = null) : void
      {
         super.enterState(param1);
         if(_plant.objectModel.curHp.get() == 0)
         {
            _plant.animation.gotoAndPlay("plant");
         }
         else
         {
            _plant.animation.gotoAndPlay("recover");
            _plant.setRunningProp(TDConstant.Gameobject_Prop_Nuts_Heal_Time,TDGameInfo.getInstance().getCurGameTime());
         }
         _plant.animation.addEventListener(Event.COMPLETE,this.onAnimComplete);
         _plant.setFrozenAI(true);
         _plant.objectModel.curHp.set(_plant.objectModel.maxHp.get());
         _plant.isSleep = false;
      }
      
      protected function onAnimComplete(param1:Event) : void
      {
         _plant.animation.removeEventListener(Event.COMPLETE,this.onAnimComplete);
         _plant.setFrozenAI(false);
         _plant.setAction();
      }
   }
}
