package com.qq.modules.embattle.view.comps
{
   import asgui.events.DragEvent;
   import asgui.managers.DragManager;
   import asgui.managers.ToolTipManager;
   import com.qq.GameGloble;
   import com.qq.constant.BattleCardStatus;
   import com.qq.display.QAlert;
   import com.qq.modules.card.model.vo.CardItemVO;
   import com.qq.modules.embattle.command.EmbattleDragCmd;
   import com.qq.modules.embattle.constant.EmbattleConst;
   import com.qq.modules.embattle.model.EmbattleModel;
   import com.qq.modules.embattle.service.EmbattleService;
   import com.qq.modules.login.service.LoginService;
   import flash.events.MouseEvent;
   import org.robotlegs.mvcs.Mediator;
   
   public class DragableCardMediator extends Mediator
   {
       
      
      [Inject]
      public var embattleService:EmbattleService;
      
      [Inject]
      public var loginService:LoginService;
      
      private var _click:Boolean;
      
      public function DragableCardMediator()
      {
         super();
      }
      
      override public function onRemove() : void
      {
         if(this.view)
         {
            this.view.removeEventListener(MouseEvent.MOUSE_DOWN,this.mouseDownHandler);
            this.view.removeEventListener(MouseEvent.MOUSE_UP,this.mouseUpHandler);
            DragManager.impl.removeEventListener(DragEvent.DRAG_START,this.startDragHandler);
            DragManager.impl.removeEventListener(DragEvent.DRAG_COMPLETE,this.endDragHandler);
            ToolTipManager.RegisterToolTip(this.view,null);
            DragManager.RemoveReceiver(this.view);
         }
      }
      
      override public function onRegister() : void
      {
         if(this.view)
         {
            this.view.addEventListener(MouseEvent.MOUSE_DOWN,this.mouseDownHandler);
            this.view.addEventListener(MouseEvent.MOUSE_UP,this.mouseUpHandler);
            DragManager.impl.addEventListener(DragEvent.DRAG_START,this.startDragHandler);
            DragManager.impl.addEventListener(DragEvent.DRAG_COMPLETE,this.endDragHandler);
            DragManager.RemoveReceiver(this.view);
            DragManager.AddReceiver(this.view);
         }
      }
      
      private function endDragHandler(param1:DragEvent) : void
      {
         DragManager.RemoveReceiver(this.view);
         DragManager.AddReceiver(this.view);
      }
      
      private function startDragHandler(param1:DragEvent) : void
      {
         DragManager.RemoveReceiver(this.view);
      }
      
      protected function mouseDownHandler(param1:MouseEvent) : void
      {
         if(!EmbattleModel.getInstance().isCityBuildingZoomOut)
         {
            return;
         }
         if(DragManager.impl.isDragging)
         {
            this._click = false;
            return;
         }
         this.startDragSelf(param1);
         this._click = true;
      }
      
      protected function mouseUpHandler(param1:MouseEvent) : void
      {
         if(this.view.data && EmbattleModel.getInstance().dragingCardId == CardItemVO(this.view.data).uid && this._click)
         {
            param1.stopPropagation();
         }
      }
      
      private function startDragSelf(param1:MouseEvent) : void
      {
         if(!this.view.data)
         {
            return;
         }
         var _loc2_:CardItemVO = this.view.data as CardItemVO;
         if((EmbattleModel.getInstance().embattleMode === EmbattleConst.MODE_HOME || EmbattleModel.getInstance().embattleMode === EmbattleConst.MODE_MAP) && GameGloble.actorModel.battleCardModel.getCardStatus(_loc2_.uid) == BattleCardStatus.FORMATION_OUT)
         {
            QAlert.Show("该植物不在家园中，不能移动他");
            return;
         }
         if(this.view.visible)
         {
            EmbattleDragCmd.startCardDrag(this.view,param1);
         }
      }
      
      public function get view() : DragableCard
      {
         return this.viewComponent as DragableCard;
      }
   }
}
