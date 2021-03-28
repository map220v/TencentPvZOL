package com.qq.modules.qzoneShare.view
{
   import asgui.controls.Button;
   import asgui.events.PopUpEvent;
   import asgui.managers.PopUpManager;
   import com.qq.modules.bag.model.ItemTemplateFactory;
   import com.qq.modules.basic.view.BasicScreenMediator;
   import com.qq.modules.qzoneShare.command.QZoneShareCmd;
   import com.qq.modules.qzoneShare.model.QZoneShareProxy;
   import com.qq.modules.qzoneShare.model.templates.QZoneShareTempFactory;
   import com.qq.modules.qzoneShare.model.templates.ce.QZoneShareTemplate;
   import flash.display.DisplayObject;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   
   public class QZoneShareBtnTipMediator extends BasicScreenMediator
   {
       
      
      [Inject]
      public var view:QZoneShareBtnTip;
      
      [Inject]
      public var qzoneShareProxy:QZoneShareProxy;
      
      public function QZoneShareBtnTipMediator()
      {
         super();
      }
      
      override protected function initialized() : void
      {
         super.initialized();
         var _loc1_:QZoneShareTemplate = QZoneShareTempFactory.instance.getQZoneShareTempById(this.qzoneShareProxy.curShareId);
         this.view.l_txt.text = "+     " + _loc1_.rewards[0].num;
         this.view.bagItem.setTemplate(ItemTemplateFactory.instance.getBagItemTemplateById(_loc1_.rewards[0].id),false);
      }
      
      override protected function initListener() : void
      {
         super.initListener();
         addComponentListener(this.view,Event.CHANGE,this.onDataChange);
         addComponentListener(this.view,Event.ENTER_FRAME,this.onEnterFrame);
         PopUpManager.impl.addEventListener(PopUpEvent.ADDED,this.onAddPopUp);
      }
      
      private function onAddPopUp(param1:PopUpEvent) : void
      {
         if(!(param1.window is QZoneShareBtnTip))
         {
            PopUpManager.AddPopUp(this.view,null,false,false);
         }
      }
      
      private function onDataChange(param1:Event) : void
      {
         var _loc2_:Button = this.view.data as Button;
         addComponentListener(_loc2_,MouseEvent.CLICK,this.onMouseClickShare);
         addComponentListener(_loc2_,Event.REMOVED_FROM_STAGE,this.onRemoveFromStageShare);
         this.onEnterFrame(param1);
      }
      
      private function onEnterFrame(param1:Event) : void
      {
         var _loc2_:Button = this.view.data as Button;
         var _loc3_:Point = _loc2_.localToGlobal(new Point());
         this.view.x = _loc3_.x + this.view.width / 2;
         this.view.y = _loc3_.y - this.view.height + 37;
      }
      
      private function onMouseClickShare(param1:MouseEvent) : void
      {
         var _loc2_:DisplayObject = param1.target as DisplayObject;
         QZoneShareCmd.showQZoneShareMsg(this.qzoneShareProxy.curShareId,this.qzoneShareProxy.descParam);
         if(Boolean(this.qzoneShareProxy.backFunc))
         {
            this.qzoneShareProxy.backFunc();
         }
         this.view.Close();
      }
      
      private function onRemoveFromStageShare(param1:Event) : void
      {
         this.view.Close();
      }
      
      override public function dispose() : void
      {
         PopUpManager.impl.removeEventListener(PopUpEvent.ADDED,this.onAddPopUp);
         super.dispose();
      }
   }
}
