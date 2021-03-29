package com.qq.modules.roleInfo.view.components
{
   import com.qq.display.QCanvas;
   
   public class RoleBuffBar extends QCanvas
   {
      
      private static const ICON_WIDTH:int = 30;
      
      public static const ICON_AVOID_WAR:String = "ICON_AVOID_WAR";
      
      public static const ICON_PLANT_HEALTH:String = "ICON_PLANT_HEALTH";
      
      public static const ICON_ARENA:String = "ICON_ARENA";
      
      public static const ICON_MONTH_CARD:String = "ICON_MONTH_CARD";
      
      public static const ICON_CASTLE:String = "ICON_CASTLE";
      
      public static const ICON_SECONDARY_PASSWORD:String = "ICON_SECONDARY_PASSWORD";
      
      private static const BUFF_ICON_SORT:Array = [ICON_AVOID_WAR,ICON_ARENA,ICON_PLANT_HEALTH,ICON_CASTLE,ICON_SECONDARY_PASSWORD,ICON_MONTH_CARD];
       
      
      private var _iconArr:Vector.<RoleBuffIcon>;
      
      public function RoleBuffBar()
      {
         super(RoleBuffBarMediator);
      }
      
      override public function InitializeComponent() : void
      {
         super.InitializeComponent();
         this._iconArr = new Vector.<RoleBuffIcon>();
      }
      
      public function addBuffIcon(param1:String) : void
      {
         var _loc2_:RoleBuffIcon = null;
         if(this.hasBuffIcon(param1))
         {
            return;
         }
         switch(param1)
         {
            case ICON_AVOID_WAR:
               _loc2_ = new RoleAvoidWarIcon();
               break;
            case ICON_PLANT_HEALTH:
               _loc2_ = new RoleHealthIcon();
               break;
            case ICON_ARENA:
               _loc2_ = new RoleArenaIcon();
               break;
            case ICON_MONTH_CARD:
               _loc2_ = new RoleMonthCardIcon();
               break;
            case ICON_CASTLE:
               _loc2_ = new RoleCastleIcon();
               break;
            case ICON_SECONDARY_PASSWORD:
               _loc2_ = new SecondaryPasswordIcon();
         }
         _loc2_.name = param1;
         addChild(_loc2_);
         this._iconArr.push(_loc2_);
         this.layout();
      }
      
      public function getBuffIcon(param1:String) : RoleBuffIcon
      {
         var _loc2_:RoleBuffIcon = null;
         for each(_loc2_ in this._iconArr)
         {
            if(_loc2_.name == param1)
            {
               return _loc2_;
            }
         }
         return null;
      }
      
      public function hasBuffIcon(param1:String) : Boolean
      {
         return this.getBuffIcon(param1) != null;
      }
      
      private function layout() : void
      {
         var _loc1_:int = 0;
         var _loc2_:RoleBuffIcon = null;
         var _loc3_:String = null;
         for each(_loc3_ in BUFF_ICON_SORT)
         {
            _loc2_ = this.getBuffIcon(_loc3_);
            if(_loc2_)
            {
               _loc2_.x = _loc1_ * ICON_WIDTH;
               _loc1_++;
            }
         }
      }
      
      override public function Dispose() : void
      {
         super.Dispose();
      }
   }
}
