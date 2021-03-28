package com.qq.modules.td.logic.bt_ai.aiNode.aiCode.plant
{
   import asgui.blit.display.IBlitClip;
   import asgui.blit.display.IBlitDisplayContainer;
   import com.qq.CommandName;
   import com.qq.constant.td.TDConstant;
   import com.qq.modules.basic.event.CommonEvent;
   import com.qq.modules.td.command.game.TDGameObjectCmd;
   import com.qq.modules.td.logic.bt_ai.aiNode.BaseNodePvz;
   import com.qq.modules.td.logic.bt_ai.aiNode.executeNode.ExeDoAction;
   import com.qq.modules.td.logic.talent.TalentManager;
   import com.qq.modules.td.logic.unit.plant.BasicPlant;
   import com.qq.modules.td.model.TDGameInfo;
   import com.qq.utils.CommandDispatcher;
   import com.qq.utils.DelayManager;
   import com.qq.utils.blit.QBlitUI;
   import flash.events.MouseEvent;
   
   public class AI_plant_PrismGrass extends BaseNodePvz
   {
       
      
      private var _blitContainer:IBlitDisplayContainer;
      
      private var _clickClipCovered:Boolean;
      
      private var _clickTime:int;
      
      private var _delayID:int;
      
      private var castTimes:int = 0;
      
      public function AI_plant_PrismGrass(param1:int = 30)
      {
         super(param1);
      }
      
      override protected function initlize() : void
      {
         super.initlize();
         if(selfObj)
         {
            CommandDispatcher._dispatcher.addEventListener(CommandName.TD_Double_Click_Special_Skill,this.onDoubleClickSpecialSkill);
            this.addArea();
         }
      }
      
      override public function calculate() : Boolean
      {
         var _loc1_:int = 0;
         if(this.castTimes == 0 && TalentManager.instance.getCastSkillAfterPlantTimes((selfObj as BasicPlant).plantData.plantStaticInfo,selfObj.uid) == 0)
         {
            ++this.castTimes;
            TDGameObjectCmd.releaseSpecialSkill(selfObj.uid,false);
         }
         else if(selfObj.getRunningProp(TDConstant.Gameobject_Prop_IsSleeping) == null || selfObj.getRunningProp(TDConstant.Gameobject_Prop_IsSleeping) == false)
         {
            ExeDoAction.calculateStatic(selfObj,TDConstant.PlantAction_Idle);
            _loc1_ = selfObj.objectModel.staticInfo.getParam(TDConstant.Plant_Param_PrismGrass_Attack_Cost) as int;
            if(TDGameInfo.getInstance().fuel.get() > 0)
            {
               this.setClickClipEnable(false);
            }
            else if(TDGameInfo.getInstance().sun.get() < _loc1_)
            {
               this.setClickClipEnable(false);
            }
            else
            {
               this.setClickClipEnable(true);
            }
         }
         else
         {
            this.setClickClipEnable(false);
         }
         return true;
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         if(this._clickTime > 0)
         {
            this.clearClickStatus();
            this.onDoubleClick();
         }
         else
         {
            ++this._clickTime;
            this._delayID = DelayManager.getInstance().addDelay(200,this.clearClickStatus);
         }
      }
      
      private function onDoubleClick() : void
      {
         if(selfObj.getActionID() == TDConstant.PPrismGrassSpecialSkill)
         {
            return;
         }
         var _loc1_:int = selfObj.objectModel.staticInfo.getParam(TDConstant.Plant_Param_PrismGrass_Attack_Cost) as int;
         if(TDGameInfo.getInstance().sun.get() < _loc1_)
         {
            return;
         }
         if(selfObj.getRunningProp(TDConstant.Gameobject_Prop_IsSleeping) == null || selfObj.getRunningProp(TDConstant.Gameobject_Prop_IsSleeping) == false)
         {
            ExeDoAction.calculateStatic(selfObj,TDConstant.PPrismGrass_Attack);
         }
      }
      
      private function clearClickStatus() : void
      {
         this._clickTime = 0;
         DelayManager.getInstance().removeDelay(this._delayID);
      }
      
      private function onDoubleClickSpecialSkill(param1:CommonEvent) : void
      {
         if(param1.param == selfObj)
         {
            this.onDoubleClick();
         }
      }
      
      override public function dispose() : void
      {
         if(selfObj)
         {
            CommandDispatcher._dispatcher.removeEventListener(CommandName.TD_Double_Click_Special_Skill,this.onDoubleClickSpecialSkill);
            this.removeArea();
         }
         super.dispose();
      }
      
      private function addArea() : void
      {
         var _loc1_:IBlitClip = null;
         if(this._clickClipCovered)
         {
            return;
         }
         this.removeArea();
         this._clickClipCovered = true;
         if(selfObj.damageArea.width == 0 || selfObj.damageArea.height == 0)
         {
            _loc1_ = QBlitUI.createClipByRect(50,50,0);
         }
         else
         {
            _loc1_ = QBlitUI.createClipByRect(selfObj.damageArea.width,selfObj.damageArea.height,0);
         }
         _loc1_.x = selfObj.damageArea.x;
         _loc1_.y = selfObj.damageArea.y;
         this._blitContainer = QBlitUI.createContainer();
         this._blitContainer.AddChild(_loc1_);
         selfObj.frontLayer.addChild(this._blitContainer.asset);
         this.setClickClipEnable(true);
         this._blitContainer.addEventListener(MouseEvent.CLICK,this.onClick);
      }
      
      private function removeArea() : void
      {
         if(!this._clickClipCovered)
         {
            return;
         }
         this._clickClipCovered = false;
         if(this._blitContainer)
         {
            this._blitContainer.removeEventListener(MouseEvent.CLICK,this.onClick);
            selfObj.frontLayer.removeChild(this._blitContainer.asset);
            this._blitContainer = null;
         }
         this.setClickClipEnable(false);
      }
      
      private function setClickClipEnable(param1:Boolean) : void
      {
         selfObj.frontLayer.mouseChildren = param1;
      }
   }
}
