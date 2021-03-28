package com.qq.modules.td.view.game.ui
{
   import com.qq.CommandName;
   import com.qq.constant.td.TDConstant;
   import com.qq.modules.basic.event.CommonEvent;
   import com.qq.modules.basic.view.BasicScreenMediator;
   import com.qq.modules.td.logic.TDSpecialSkillTrigger;
   import com.qq.modules.td.logic.unit.plant.BasicPlant;
   import com.qq.modules.td.model.TDGameInfo;
   import com.qq.utils.CommandDispatcher;
   import com.qq.utils.DelayManager;
   import flash.events.MouseEvent;
   
   public class TDSpecailSkillCastIconMediator extends BasicScreenMediator
   {
       
      
      [Inject]
      public var view:TDSpecailSkillCastIcon;
      
      private var _clickTimes:int;
      
      private var _delayID:int;
      
      public function TDSpecailSkillCastIconMediator()
      {
         super();
      }
      
      override protected function initListener() : void
      {
         super.initListener();
         addComponentListener(this.view,MouseEvent.CLICK,this.onClick);
         addComponentListener(this.view,MouseEvent.MOUSE_OVER,this.onOver);
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         var _loc2_:BasicPlant = TDGameInfo.getInstance().getGameObjctByUID(TDSpecialSkillTrigger.getInstance().targetUID) as BasicPlant;
         if(_loc2_ && _loc2_.plantData.staticInfo.type == TDConstant.PlantType_PrismGrass || _loc2_.plantData.staticInfo.type == TDConstant.PlantType_Oxygenalage)
         {
            if(this._clickTimes == 0)
            {
               ++this._clickTimes;
               DelayManager.getInstance().removeDelay(this._delayID);
               this._delayID = DelayManager.getInstance().addDelay(200,this.triggerSpecialSkill);
            }
            else
            {
               this._clickTimes = 0;
               DelayManager.getInstance().removeDelay(this._delayID);
               CommandDispatcher._dispatcher.dispatchEvent(new CommonEvent(CommandName.TD_Double_Click_Special_Skill,_loc2_));
            }
         }
         else
         {
            TDSpecialSkillTrigger.getInstance().start();
            TDSpecialSkillTrigger.getInstance().releaseSpecialSkill(TDSpecialSkillTrigger.getInstance().targetUID);
         }
      }
      
      private function triggerSpecialSkill() : void
      {
         this._clickTimes = 0;
         DelayManager.getInstance().removeDelay(this._delayID);
         this._delayID = 0;
         var _loc1_:BasicPlant = TDGameInfo.getInstance().getGameObjctByUID(TDSpecialSkillTrigger.getInstance().targetUID) as BasicPlant;
         if(_loc1_ && _loc1_.plantData.staticInfo.type == TDConstant.PlantType_PrismGrass)
         {
            if(_loc1_.getActionID() != TDConstant.PPrismGrass_Attack)
            {
               TDSpecialSkillTrigger.getInstance().start();
               TDSpecialSkillTrigger.getInstance().releaseSpecialSkill(TDSpecialSkillTrigger.getInstance().targetUID);
            }
         }
         else if(_loc1_ && _loc1_.plantData.staticInfo.type == TDConstant.PlantType_Oxygenalage)
         {
            TDSpecialSkillTrigger.getInstance().start();
            TDSpecialSkillTrigger.getInstance().releaseSpecialSkill(TDSpecialSkillTrigger.getInstance().targetUID);
         }
      }
      
      private function onOver(param1:MouseEvent) : void
      {
         TDSpecialSkillTrigger.getInstance().stop();
         addComponentListener(this.view,MouseEvent.MOUSE_OUT,this.onOut);
      }
      
      private function onOut(param1:MouseEvent) : void
      {
         var _loc2_:BasicPlant = null;
         removeComponentListener(this.view,MouseEvent.MOUSE_OUT,this.onOut);
         if(TDSpecialSkillTrigger.getInstance().targetUID != -1)
         {
            _loc2_ = TDGameInfo.getInstance().getGameObjctByUID(TDSpecialSkillTrigger.getInstance().targetUID) as BasicPlant;
            if(_loc2_ != null)
            {
               _loc2_.removeFilter(TDConstant.TDFilter_SpecialSkillChoose);
            }
         }
         TDSpecialSkillTrigger.getInstance().start();
      }
   }
}
