package com.qq.modules.td.logic.unit.object
{
   import asgui.blit.display.IBlitClip;
   import asgui.blit.display.IBlitDisplayContainer;
   import asgui.controls.ToolTip;
   import com.qq.CommandName;
   import com.qq.GameGloble;
   import com.qq.constant.td.TDConstant;
   import com.qq.modules.basic.event.CommonEvent;
   import com.qq.modules.basic.model.templates.ServerConfigTemplateFactory;
   import com.qq.modules.main.command.CommonCmd;
   import com.qq.modules.td.command.TDProxyCmd;
   import com.qq.modules.td.command.game.TDGameCmd;
   import com.qq.modules.td.command.game.TDGameObjectCmd;
   import com.qq.modules.td.model.TDGameInfo;
   import com.qq.modules.td.model.TDStageInfo;
   import com.qq.modules.td.view.components.TDMowerPriceBar;
   import com.qq.templates.font.FontNormal;
   import com.qq.utils.CommandDispatcher;
   import com.qq.utils.UtilsManager;
   import com.qq.utils.blit.QBlitUI;
   import flash.events.MouseEvent;
   
   public class TDSampleMower extends TDNormalObject
   {
       
      
      private var mowerUI:TDMowerPriceBar;
      
      private var _blitContainer:IBlitDisplayContainer;
      
      private var _toolTip:ToolTip;
      
      private var _roadIndex:int;
      
      private var _price:int;
      
      public function TDSampleMower()
      {
         super();
      }
      
      override public function init(param1:Boolean = false, param2:Boolean = false) : void
      {
         super.init(param1,param2);
         this._toolTip = new ToolTip();
         this._price = ServerConfigTemplateFactory.instance.getTDToyCarBuyCost();
         this.addPriceUI();
         this.initListener();
      }
      
      private function addPriceUI() : void
      {
         var _loc1_:IBlitClip = null;
         this._toolTip.text = "花费<font color=\'#ffff00\'>" + this._price + "</font>" + "金钻补充一个小推车，只能补充" + ServerConfigTemplateFactory.instance.getTDToyCarBuyTimes() + "次哦！";
         this.mowerUI = new TDMowerPriceBar();
         this.mowerUI.setPrice(this._price);
         this.frontLayer.addChild(this.mowerUI.container.asset);
         this.mowerUI.container.asset.x = -25;
         this.mowerUI.container.asset.y = 10;
         if(this.damageArea.width == 0 || this.damageArea.height == 0)
         {
            _loc1_ = QBlitUI.createClipByRect(70,65,0);
            _loc1_.x = this.damageArea.x - 50;
            _loc1_.y = this.damageArea.y - 50;
         }
         else
         {
            _loc1_ = QBlitUI.createClipByRect(this.damageArea.width,this.damageArea.height,0);
            _loc1_.x = this.damageArea.x;
            _loc1_.y = this.damageArea.y;
         }
         this._blitContainer = QBlitUI.createContainer();
         this._blitContainer.AddChild(_loc1_);
         frontLayer.addChild(this._blitContainer.asset);
         this.frontLayer.mouseChildren = true;
         this._blitContainer.addEventListener(MouseEvent.CLICK,this.onMouseClick);
         this._blitContainer.addEventListener(MouseEvent.ROLL_OVER,this.onMouseOver);
         this._blitContainer.addEventListener(MouseEvent.ROLL_OUT,this.onMouseOut);
      }
      
      override protected function initListener() : void
      {
         setMouseEnable(true);
         setButtonMode(true);
         CommandDispatcher._dispatcher.addEventListener(CommandName.TD_Buy_Mower,this.onBuyMower);
      }
      
      private function onBuyMower(param1:CommonEvent) : void
      {
         if(param1.param == this._roadIndex)
         {
            TDGameObjectCmd.addGameObjectByPos(TDConstant.UnitCatalog_Object,TDStageInfo.getInstance().toyCarType,this.x - 14,this.y);
            this.Dispose();
         }
      }
      
      private function onMouseClick(param1:MouseEvent) : void
      {
         var event:MouseEvent = param1;
         if(TDGameInfo.getInstance().payAlertOpen)
         {
            TDGameCmd.pauseGame();
            CommonCmd.confirmUseDiamond(FontNormal.TD_PRIVILEGE_BUY_TOYCAR_ALERT,this._price,function():void
            {
               TDGameCmd.resumeGame();
               TDProxyCmd.buyMower(_price,_roadIndex);
            },function():void
            {
               onMouseOut(null);
               TDGameCmd.resumeGame();
            },0,true);
         }
         else
         {
            this.onMouseOut(null);
            TDProxyCmd.buyMower(this._price,this._roadIndex);
         }
      }
      
      private function onMouseOver(param1:MouseEvent) : void
      {
         GameGloble.stage.addChild(this._toolTip);
         this._toolTip.x = GameGloble.stage.mouseX;
         this._toolTip.y = GameGloble.stage.mouseY - 30;
      }
      
      private function onMouseOut(param1:MouseEvent) : void
      {
         if(this._toolTip && GameGloble.stage.contains(this._toolTip))
         {
            GameGloble.stage.removeChild(this._toolTip);
         }
      }
      
      override public function dispose(param1:Boolean = true) : void
      {
         CommandDispatcher._dispatcher.removeEventListener(CommandName.TD_Buy_Mower,this.onBuyMower);
         if(this.mowerUI)
         {
            this.mowerUI.Dispose();
         }
         if(this._blitContainer)
         {
            this._blitContainer.removeEventListener(MouseEvent.CLICK,this.onMouseClick);
            this._blitContainer.removeEventListener(MouseEvent.ROLL_OVER,this.onMouseOver);
            this._blitContainer.removeEventListener(MouseEvent.ROLL_OUT,this.onMouseOut);
            this._blitContainer.Dispose();
         }
         if(this._toolTip)
         {
            UtilsManager.removeFromContainer(this._toolTip);
            this._toolTip.Dispose();
         }
         this.mowerUI = null;
         this._blitContainer = null;
         this._toolTip = null;
         super.dispose(param1);
      }
      
      public function set roadIndex(param1:int) : void
      {
         this._roadIndex = param1;
      }
   }
}
