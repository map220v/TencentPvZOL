package com.qq.modules.mapinfo.view.components
{
   public class MapInfoHelpArmyWD extends MapInfoHelpArmyWDCE
   {
       
      
      public function MapInfoHelpArmyWD(param1:Class = null)
      {
         super(MapInfoHelpArmyWDMediator);
      }
      
      override public function InitializeComponent() : void
      {
         var _loc2_:MapInfoHelpArmyWDCell = null;
         super.InitializeComponent();
         txt_info.SetStyle("color","#EDE963");
         var _loc1_:int = 0;
         while(_loc1_ < 9)
         {
            _loc2_ = new MapInfoHelpArmyWDCell();
            _loc2_.name = "cell" + _loc1_;
            _loc2_.setData();
            box.addChild(_loc2_);
            _loc2_.width = this.width - 73;
            _loc1_++;
         }
         box.SetStyle("verticalGap","5");
         box.SetStyle("paddingTop","2");
      }
   }
}
