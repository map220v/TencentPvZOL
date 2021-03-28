package com.qq.modules.td.view.ui
{
   import com.qq.CommandName;
   import com.qq.modules.basic.event.CommonEvent;
   import com.qq.modules.basic.view.BasicScreenMediator;
   
   public class TDBossHpBarCtMediator extends BasicScreenMediator
   {
       
      
      [Inject]
      public var view:TDBossHpBarCt;
      
      public function TDBossHpBarCtMediator()
      {
         super();
      }
      
      override protected function initListener() : void
      {
         super.initListener();
         this.view.visible = false;
         addContextListener(CommandName.TD_ShowOrHideBossHpBar,this.onShowOrHide);
         addContextListener(CommandName.TD_BossHpChange,this.onChangeHp);
      }
      
      private function onShowOrHide(param1:CommonEvent) : void
      {
         this.view.visible = Boolean(param1.param);
         if(this.view.visible)
         {
            this.view.setValue(100,100);
         }
      }
      
      private function onChangeHp(param1:CommonEvent) : void
      {
         this.view.setValue(param1.readCustomParam_Number("curHp"),param1.readCustomParam_Number("maxHp"));
      }
   }
}
