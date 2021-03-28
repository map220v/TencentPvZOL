package com.qq.modules.td.view.game.ui
{
   import com.qq.CommandName;
   import com.qq.modules.basic.event.CommonEvent;
   import com.qq.modules.basic.view.BasicScreenMediator;
   
   public class TDNewTipPanelMediator extends BasicScreenMediator
   {
       
      
      [Inject]
      public var view:TDNewTipPanel;
      
      public function TDNewTipPanelMediator()
      {
         super();
      }
      
      override protected function initListener() : void
      {
         super.initListener();
         addContextListener(CommandName.TDAddNewZombieTip,this.onAddNewZombieTip);
         addContextListener(CommandName.TD_CleanGameSence,this.onCleanGameSence);
      }
      
      private function onAddNewZombieTip(param1:CommonEvent) : void
      {
         var _loc2_:int = param1.readCustomParam_Number("zombieType");
         var _loc3_:TDNewTipView = new TDNewTipView();
         this.view.list.addChild(_loc3_);
         _loc3_.reset({"zombieType":_loc2_});
      }
      
      private function onCleanGameSence(param1:CommonEvent) : void
      {
         while(this.view.list.numChildren > 0)
         {
            this.view.list.removeChildAt(0);
         }
      }
   }
}
