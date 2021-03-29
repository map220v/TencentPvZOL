package com.qq.modules.levelselect.view.components
{
   import com.qq.constant.ItemID;
   import com.qq.modules.bag.BagGlobals;
   import com.qq.modules.bag.model.vo.BagProxy;
   import com.qq.modules.basic.view.BasicScreenMediator;
   import com.qq.modules.levelselect.LSGlobals;
   import com.qq.modules.levelselect.model.LSProxy;
   import com.qq.templates.font.FontNormal;
   import com.qq.utils.UrlManager;
   import flash.events.Event;
   
   public class LSMainIconMediator extends BasicScreenMediator
   {
       
      
      [Inject]
      public var view:LSMainIcon;
      
      [Inject]
      public var proxy:LSProxy;
      
      [Inject]
      public var bagProxy:BagProxy;
      
      public function LSMainIconMediator()
      {
         super();
      }
      
      override protected function init() : void
      {
         super.init();
         switch(this.view.type)
         {
            case 1:
               this.addContextListener(LSGlobals.LS_STAGE_INFO_UPDATED,this.onStageUpdate);
               this.view.toolTip = FontNormal.LS_ICON_Achievements_TOOLTIP;
               break;
            case 2:
               this.view.img.source = UrlManager.getUrl(0,"swf/icons/main_ui/ticket.swf");
               this.view.toolTip = FontNormal.LS_ICON_KEY_TOOLTIP;
               addContextListener(BagGlobals.BAG_ITEM_CHANGED,this.onStageUpdate);
               this.update();
         }
      }
      
      private function onStageUpdate(param1:Event) : void
      {
         this.update();
      }
      
      public function update() : void
      {
         switch(this.view.type)
         {
            case 1:
               if(this.proxy.data)
               {
                  this.view.txtNum.text = "x" + this.proxy.data.star;
               }
               break;
            case 2:
               this.view.txtNum.text = "x" + this.bagProxy.getItemNumByItemID(ItemID.TD_KEY);
         }
      }
      
      override protected function initListener() : void
      {
         super.initListener();
      }
      
      override public function dispose() : void
      {
         super.dispose();
      }
   }
}
