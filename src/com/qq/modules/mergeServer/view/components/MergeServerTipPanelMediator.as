package com.qq.modules.mergeServer.view.components
{
   import asgui.controls.Text;
   import asgui.managers.PopUpManager;
   import com.qq.modules.basic.view.BasicScreenMediator;
   import flash.events.MouseEvent;
   
   public class MergeServerTipPanelMediator extends BasicScreenMediator
   {
       
      
      [Inject]
      public var view:MergeServerTipPanel;
      
      private var m_vecText:Vector.<Text>;
      
      public function MergeServerTipPanelMediator()
      {
         super();
      }
      
      override protected function init() : void
      {
         super.init();
      }
      
      override public function reset(param1:Object = null) : void
      {
         var _loc2_:Array = param1 as Array;
         var _loc3_:int = 0;
         while(_loc3_ < 3)
         {
            if(_loc2_[_loc3_] <= 0)
            {
               this.view.contentBox.removeChild(this.view.GetChildById("txtTip_" + _loc3_));
            }
            _loc3_++;
         }
         this.view.contentBox.visible = true;
      }
      
      override protected function initListener() : void
      {
         super.initListener();
         this.addComponentListener(this.view.btnOK,MouseEvent.CLICK,this.onBtnOKClick);
      }
      
      private function onBtnOKClick(param1:MouseEvent) : void
      {
         PopUpManager.RemovePopUp(this.view);
      }
      
      override public function dispose() : void
      {
         super.dispose();
      }
   }
}
