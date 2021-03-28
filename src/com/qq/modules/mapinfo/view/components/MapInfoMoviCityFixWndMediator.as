package com.qq.modules.mapinfo.view.components
{
   import com.qq.constant.ItemID;
   import com.qq.display.QAlert;
   import com.qq.modules.activity.view.components.ActivityItemTooptip;
   import com.qq.modules.bag.model.ItemTemplateFactory;
   import com.qq.modules.bag.model.vo.BagProxy;
   import com.qq.modules.bag.model.vo.ItemVO;
   import com.qq.modules.bag.view.components.BagItemIcon;
   import com.qq.modules.basic.view.BasicScreenMediator;
   import com.qq.modules.main.command.CmdStoreProxyCmd;
   import com.qq.modules.main.model.ActorModel;
   import com.qq.modules.map.model.MapProxy;
   import com.qq.modules.mapinfo.command.MapInfoProxyCmd;
   import com.qq.templates.font.FontNormal;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   
   public class MapInfoMoviCityFixWndMediator extends BasicScreenMediator
   {
       
      
      [Inject]
      public var view:MapInfoMoviCityFixWnd;
      
      [Inject]
      public var bagProxy:BagProxy;
      
      [Inject]
      public var mapProxy:MapProxy;
      
      [Inject]
      public var actorModel:ActorModel;
      
      private var _movePos:Point;
      
      public function MapInfoMoviCityFixWndMediator()
      {
         super();
      }
      
      override protected function init() : void
      {
         super.init();
         if(this.view.defaultCell)
         {
            this.view.txtX.text = this.view.defaultCell.x.toString();
            this.view.txtY.text = this.view.defaultCell.y.toString();
         }
         var _loc1_:BagItemIcon = new BagItemIcon();
         _loc1_.toolTipClass = ActivityItemTooptip;
         var _loc2_:ItemVO = new ItemVO(ItemID.MOVE_CITY_TOKEN,1);
         _loc1_.setTemplate(_loc2_.template,false,false);
         _loc1_.setItemNum(_loc2_.amount);
         _loc1_.toolTip = _loc2_.itemId;
         _loc1_.x = 19;
         _loc1_.y = 16;
         this.view.addChild(_loc1_);
      }
      
      override protected function initListener() : void
      {
         super.initListener();
         this.view.btnCancel.addEventListener(MouseEvent.CLICK,this.clickHandler,false,0,true);
         this.view.btnConfirm.addEventListener(MouseEvent.CLICK,this.clickHandler,false,0,true);
         this.view.btnClose.addEventListener(MouseEvent.CLICK,this.clickHandler,false,0,true);
      }
      
      protected function clickHandler(param1:MouseEvent) : void
      {
         var _loc2_:int = 0;
         switch(param1.currentTarget)
         {
            case this.view.btnCancel:
            case this.view.btnClose:
               this.view.Close();
               break;
            case this.view.btnConfirm:
               this._movePos = new Point(int(this.view.txtX.text),int(this.view.txtY.text));
               _loc2_ = this.actorModel.getOpenMapNeedLevelNotSatified(this.mapProxy.areaId);
               if(_loc2_ > 0)
               {
                  QAlert.Show("等级不足，需要等级：" + _loc2_);
               }
               else if(this.actorModel.battleCardModel.currentInOutState)
               {
                  QAlert.Show(FontNormal.MOVE_CITY_IS_OUT);
               }
               else if(this.bagProxy.getItemNumByItemID(ItemID.MOVE_CITY_TOKEN) >= 1)
               {
                  MapInfoProxyCmd.moveCityFix(this.view.areaId,this._movePos);
               }
               else
               {
                  CmdStoreProxyCmd.buyByItemID(ItemID.MOVE_CITY_TOKEN,1,ItemTemplateFactory.instance.getBagItemName(ItemID.MOVE_CITY_TOKEN),0,MapInfoProxyCmd.moveCityFix,[this.view.areaId,this._movePos],4);
               }
               this.view.Close();
         }
      }
      
      override public function dispose() : void
      {
         super.dispose();
      }
   }
}
