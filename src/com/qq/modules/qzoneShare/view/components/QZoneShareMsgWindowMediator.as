package com.qq.modules.qzoneShare.view.components
{
   import PVZ.Cmd.E_QzoneShareType;
   import com.qq.display.CardItemFactory;
   import com.qq.modules.basic.view.BasicScreenMediator;
   import com.qq.modules.main.model.SettingsModel;
   import com.qq.modules.qzoneShare.model.QZoneShareProxy;
   import com.qq.modules.qzoneShare.model.templates.QZoneShareTempFactory;
   import com.qq.modules.qzoneShare.model.templates.ce.QZoneShareTemplate;
   import com.qq.modules.qzoneShare.view.QZoneShareMsgWindow;
   import com.qq.modules.td.data.game.unit.TDPlantStaticInfo;
   import com.qq.utils.UrlManager;
   import flash.events.Event;
   import flash.events.MouseEvent;
   
   public class QZoneShareMsgWindowMediator extends BasicScreenMediator
   {
       
      
      [Inject]
      public var view:QZoneShareMsgWindow;
      
      [Inject]
      public var qzoneShareProxy:QZoneShareProxy;
      
      public function QZoneShareMsgWindowMediator()
      {
         super();
      }
      
      override protected function init() : void
      {
         var _loc2_:TDPlantStaticInfo = null;
         super.init();
         var _loc1_:QZoneShareTemplate = QZoneShareTempFactory.instance.getQZoneShareTempById(this.qzoneShareProxy.curShareId);
         this.view.txt_desc.text = _loc1_.rightDesc;
         this.view.title = _loc1_.winTitle;
         if(this.qzoneShareProxy.shareType == E_QzoneShareType.E_QzoneShareType_Card)
         {
            _loc2_ = SettingsModel.instance.TDPlantSetting.getPlantInfoByID(this.qzoneShareProxy.cardId);
            this.view.img_icon.source = CardItemFactory.getIconURL(this.qzoneShareProxy.cardId,0);
         }
         else
         {
            this.view.img_icon.source = UrlManager.getUrl(UrlManager.URL_QZoneShare,_loc1_.leftImg + ".png");
         }
      }
      
      override protected function initListener() : void
      {
         super.initListener();
         addComponentListener(this.view.btn_share,MouseEvent.CLICK,this.onClickShare);
         addComponentListener(this.view.img_icon,Event.COMPLETE,this.onImgComplete);
      }
      
      private function onImgComplete(param1:Event) : void
      {
         this.view.img_icon.width = this.view.img_icon.mcHolder.width;
         this.view.img_icon.height = this.view.img_icon.mcHolder.height;
      }
      
      private function onClickShare(param1:MouseEvent) : void
      {
         this.view.Close();
      }
      
      override public function dispose() : void
      {
         super.dispose();
      }
   }
}
