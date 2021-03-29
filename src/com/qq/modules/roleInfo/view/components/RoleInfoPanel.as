package com.qq.modules.roleInfo.view.components
{
   import asgui.containers.HBox;
   import com.qq.constant.roleInfo.RoleInfoPanelID;
   import com.qq.display.QCanvas;
   
   public class RoleInfoPanel extends QCanvas
   {
       
      
      public var hbox:HBox;
      
      public var roleHead:RoleHead;
      
      public var roleBuffBar:RoleBuffBar;
      
      private var _cacheBarList:Array;
      
      public function RoleInfoPanel()
      {
         super(RoleInfoPanelMediator);
      }
      
      override public function InitializeComponent() : void
      {
         super.InitializeComponent();
         this.roleHead = new RoleHead();
         this.roleHead.x = 5;
         this.roleHead.y = 11;
         addChild(this.roleHead);
         this.hbox = new HBox();
         this.hbox.SetStyle("horizontalGap","3");
         this.hbox.x = 100;
         this.hbox.y = 12;
         addChild(this.hbox);
         this.roleBuffBar = new RoleBuffBar();
         this.roleBuffBar.x = 143;
         this.roleBuffBar.y = 73;
         addChild(this.roleBuffBar);
      }
      
      public function getBar(param1:int, param2:Boolean = false) : BasicRoleBar
      {
         var _loc3_:BasicRoleBar = null;
         if(this._cacheBarList == null)
         {
            this._cacheBarList = new Array();
         }
         if(this._cacheBarList[param1] == null)
         {
            if(param2)
            {
               switch(param1)
               {
                  case RoleInfoPanelID.Bar_Exp:
                     _loc3_ = new RoleExpBar();
                     break;
                  case RoleInfoPanelID.Bar_Sun:
                     _loc3_ = new RoleSunBar();
                     break;
                  case RoleInfoPanelID.Bar_Coin:
                     _loc3_ = new RoleCoinBar();
                     break;
                  case RoleInfoPanelID.Bar_Physical:
                     _loc3_ = new RolePhysicalBar();
                     break;
                  case RoleInfoPanelID.Bar_GoldDiamond:
                     _loc3_ = new RoleGoldDiamondBar();
                     break;
                  case RoleInfoPanelID.Bar_FriendPoint:
                     _loc3_ = new RoleFriendPointBar();
                     break;
                  case RoleInfoPanelID.Bar_Vip:
                     _loc3_ = new RoleVipBar();
                     break;
                  case RoleInfoPanelID.Bar_GiftDiamondBar:
                     _loc3_ = new RoleGiftDiamondBar();
                     break;
                  case RoleInfoPanelID.Bar_LightBar:
                     _loc3_ = new RoleLightBar();
                     break;
                  case RoleInfoPanelID.Bar_RoleMudBar:
                     _loc3_ = new RoleMudBar();
               }
               this._cacheBarList[param1] = _loc3_;
            }
         }
         else
         {
            _loc3_ = this._cacheBarList[param1];
         }
         return _loc3_;
      }
      
      public function resetBar() : void
      {
         while(this.hbox.numChildren > 0)
         {
            this.hbox.removeChildAt(0);
         }
      }
      
      public function addBar(param1:int) : void
      {
         var _loc2_:BasicRoleBar = this.getBar(param1);
         this.hbox.addChild(_loc2_);
      }
      
      override public function reset(param1:Object = null) : void
      {
         var _loc3_:BasicRoleBar = null;
         var _loc2_:* = int(int(param1));
         if(_loc2_ == 0)
         {
            _loc2_ = RoleInfoPanelID.Bar_Exp | RoleInfoPanelID.Bar_Coin | RoleInfoPanelID.Bar_Physical | RoleInfoPanelID.Bar_GoldDiamond | RoleInfoPanelID.Bar_Vip | RoleInfoPanelID.Bar_GiftDiamondBar | RoleInfoPanelID.Bar_RoleBuffBar;
         }
         this.resetBar();
         if(_loc2_ & RoleInfoPanelID.Bar_Exp)
         {
            _loc3_ = this.getBar(RoleInfoPanelID.Bar_Exp,true);
            this.hbox.addChild(_loc3_);
         }
         if(_loc2_ & RoleInfoPanelID.Bar_Vip)
         {
            _loc3_ = this.getBar(RoleInfoPanelID.Bar_Vip,true);
            this.hbox.addChild(_loc3_);
         }
         if(_loc2_ & RoleInfoPanelID.Bar_GoldDiamond)
         {
            _loc3_ = this.getBar(RoleInfoPanelID.Bar_GoldDiamond,true);
            this.hbox.addChild(_loc3_);
         }
         if(_loc2_ & RoleInfoPanelID.Bar_GiftDiamondBar)
         {
            _loc3_ = this.getBar(RoleInfoPanelID.Bar_GiftDiamondBar,true);
            this.hbox.addChild(_loc3_);
         }
         if(_loc2_ & RoleInfoPanelID.Bar_Coin)
         {
            _loc3_ = this.getBar(RoleInfoPanelID.Bar_Coin,true);
            this.hbox.addChild(_loc3_);
         }
         if(_loc2_ & RoleInfoPanelID.Bar_Physical)
         {
            _loc3_ = this.getBar(RoleInfoPanelID.Bar_Physical,true);
            this.hbox.addChild(_loc3_);
         }
         if(_loc2_ & RoleInfoPanelID.Bar_FriendPoint)
         {
            _loc3_ = this.getBar(RoleInfoPanelID.Bar_FriendPoint,true);
            this.hbox.addChild(_loc3_);
         }
         if(_loc2_ & RoleInfoPanelID.Bar_RoleMudBar)
         {
            _loc3_ = this.getBar(RoleInfoPanelID.Bar_RoleMudBar,true);
            this.hbox.addChild(_loc3_);
         }
         if(_loc2_ & RoleInfoPanelID.Bar_Sun)
         {
            _loc3_ = this.getBar(RoleInfoPanelID.Bar_Sun,true);
            this.hbox.addChild(_loc3_);
         }
         if(_loc2_ & RoleInfoPanelID.Bar_LightBar)
         {
            _loc3_ = this.getBar(RoleInfoPanelID.Bar_LightBar,true);
            this.hbox.addChild(_loc3_);
         }
         if(_loc2_ & RoleInfoPanelID.Bar_RoleBuffBar)
         {
            this.roleBuffBar.visible = true;
         }
         else
         {
            this.roleBuffBar.visible = false;
         }
         super.reset(param1);
      }
      
      override public function Dispose() : void
      {
         this._cacheBarList = null;
         super.Dispose();
      }
   }
}
