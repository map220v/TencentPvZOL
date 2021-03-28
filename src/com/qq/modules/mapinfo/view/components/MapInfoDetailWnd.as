package com.qq.modules.mapinfo.view.components
{
   import asgui.core.IListItemRenderer;
   import com.qq.modules.basic.view.components.QPagerSmall;
   import com.qq.utils.UrlManager;
   
   public class MapInfoDetailWnd extends MapInfoDetailWndCE
   {
      
      public static var instance:MapInfoDetailWnd;
       
      
      public var pager:QPagerSmall;
      
      public var initTabType:int;
      
      public function MapInfoDetailWnd(param1:int = 0)
      {
         this.initTabType = param1;
         super();
         instance = this;
      }
      
      override public function Dispose() : void
      {
         instance = null;
         super.Dispose();
      }
      
      override public function InitializeComponent() : void
      {
         var holder:MapInfoDetailWnd = null;
         super.InitializeComponent();
         this.pager = new QPagerSmall();
         this.pager.bottom = 0;
         this.pager.hcenter = 0;
         cContent.addChild(this.pager);
         this.list.itemRendererClass = MapInfoDetailItemRenderer;
         this.list.headerText = "update";
         this.list.SetStyle("headerHeight","32");
         this.list.SetStyle("headerPaddingTop","12");
         this.list.column.headerClass = MapInfoDetailItemRenderer;
         this.list.SetStyle("rollOverColor","#ffffffff");
         this.list.SetStyle("rollOverLineSkin","");
         holder = this;
         this.list.column.headerCreatingFunction = function(param1:int, param2:Class):IListItemRenderer
         {
            var _loc3_:MapInfoDetailItemRenderer = new param2() as MapInfoDetailItemRenderer;
            _loc3_.setBackSource(UrlManager.getUrl(0,"swf/mapinfo/detail_short_back_0.png"),false);
            return _loc3_;
         };
         this.list.itemRendererCreatedFunction = function(param1:IListItemRenderer, param2:int, param3:int):void
         {
            var _loc4_:String = null;
            var _loc5_:int = 0;
            if(param2 == 0)
            {
               _loc5_ = 2;
            }
            else if(param2 == MapInfoDetailWndMediator.ITEM_PER_PAGE - 1)
            {
               _loc5_ = 3;
            }
            else
            {
               _loc5_ = 2;
            }
            _loc4_ = UrlManager.getUrl(0,"swf/mapinfo/detail_short_back_" + _loc5_ + ".png");
            var _loc6_:MapInfoDetailItemRenderer;
            (_loc6_ = param1 as MapInfoDetailItemRenderer).holder = holder;
            _loc6_.setBackSource(_loc4_);
         };
         this.setTableType(0);
      }
      
      public function setTableType(param1:int) : void
      {
      }
   }
}
