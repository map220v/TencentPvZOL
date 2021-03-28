package com.qq.modules.td.logic.bt_ai.aiNode.aiCode.plant
{
   import asgui.blit.display.IBlitClip;
   import asgui.blit.display.IBlitDisplayContainer;
   import com.qq.CommandName;
   import com.qq.GameGloble;
   import com.qq.constant.td.TDConstant;
   import com.qq.modules.basic.event.CommonEvent;
   import com.qq.modules.td.data.map.TDMapTileData;
   import com.qq.modules.td.logic.TDUILayerManager;
   import com.qq.modules.td.logic.bt_ai.aiNode.BaseNodePvz;
   import com.qq.modules.td.logic.bt_ai.aiNode.executeNode.ExeDoAction;
   import com.qq.modules.td.logic.unit.plant.BasicPlant;
   import com.qq.modules.td.logic.unit.plant.OxygenAlagePlant;
   import com.qq.modules.td.model.TDGameInfo;
   import com.qq.utils.CommandDispatcher;
   import com.qq.utils.DelayManager;
   import com.qq.utils.blit.QBlitUI;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   
   public class AI_plant_OxygenAlgae extends BaseNodePvz
   {
       
      
      private var _buffAdded:Boolean;
      
      private var _blitContainer:IBlitDisplayContainer;
      
      private var _clickClipCovered:Boolean;
      
      private var _clickTime:int;
      
      private var _delayID:int;
      
      public function AI_plant_OxygenAlgae(param1:int = 30)
      {
         super(param1);
      }
      
      override protected function initlize() : void
      {
         super.initlize();
         if(selfObj)
         {
            CommandDispatcher._dispatcher.removeEventListener(CommandName.TD_Double_Click_Special_Skill,this.onDoubleClickSpecialSkill);
            GameGloble.stage.addEventListener(MouseEvent.MOUSE_MOVE,this.onMouseMove);
            this.addArea();
            (selfObj as OxygenAlagePlant).showLevelBar();
         }
      }
      
      override public function calculate() : Boolean
      {
         if(this._buffAdded)
         {
         }
         ExeDoAction.calculateStatic(selfObj,TDConstant.PlantAction_Idle);
         if(TDGameInfo.getInstance().fuel.get() > 0)
         {
            this.setClickClipEnable(false);
         }
         else
         {
            this.setClickClipEnable(true);
         }
         return true;
      }
      
      private function onMouseMove(param1:MouseEvent) : void
      {
         var _loc2_:Number = NaN;
         var _loc3_:Number = NaN;
         var _loc4_:Point = null;
         var _loc5_:TDMapTileData = null;
         var _loc6_:Array = null;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:BasicPlant = null;
         if(TDGameInfo.getInstance().isRunningGame)
         {
            _loc2_ = GameGloble.stage.mouseX;
            _loc3_ = GameGloble.stage.mouseY;
            _loc4_ = TDUILayerManager.effectLayer.globalToLocal(new Point(_loc2_,_loc3_));
            if((_loc5_ = TDGameInfo.getInstance().getRoadTileByScreenPos(_loc4_.x,_loc4_.y)) != null)
            {
               if((_loc6_ = TDGameInfo.getInstance().getPlantByTileIndex(_loc5_.index)).length > 0)
               {
                  _loc7_ = _loc6_.length;
                  _loc8_ = 0;
                  while(_loc8_ < _loc7_)
                  {
                     if((_loc9_ = _loc6_[_loc8_] as BasicPlant).uid == selfObj.uid)
                     {
                        (selfObj as OxygenAlagePlant).showIndicateArea();
                        break;
                     }
                     _loc8_++;
                  }
               }
            }
         }
      }
      
      private function onDoubleClickSpecialSkill(param1:CommonEvent) : void
      {
         if(param1.param == selfObj)
         {
            this.onDoubleClick();
         }
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
            this._delayID = DelayManager.getInstance().addDelay(250,this.clearClickStatus);
         }
      }
      
      private function onDoubleClick() : void
      {
         (selfObj as OxygenAlagePlant).supplyLevelup();
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
      
      private function clearClickStatus() : void
      {
         this._clickTime = 0;
         DelayManager.getInstance().removeDelay(this._delayID);
      }
      
      private function setClickClipEnable(param1:Boolean) : void
      {
         selfObj.frontLayer.mouseChildren = param1;
      }
      
      override public function dispose() : void
      {
         if(selfObj)
         {
            CommandDispatcher._dispatcher.removeEventListener(CommandName.TD_Double_Click_Special_Skill,this.onDoubleClickSpecialSkill);
            GameGloble.stage.removeEventListener(MouseEvent.MOUSE_MOVE,this.onMouseMove);
            this.removeArea();
         }
         super.dispose();
      }
   }
}
