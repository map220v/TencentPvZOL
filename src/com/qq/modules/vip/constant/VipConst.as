package com.qq.modules.vip.constant
{
   import asgui.resources.AssetManager;
   import com.qq.modules.vip.model.templates.VipInfoFactory;
   import com.qq.modules.vip.model.templates.VipInfoSetting;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   
   public class VipConst
   {
      
      public static const GET_GIFT_SUCCESS:String = "GET_GIFT_SUCCESS";
      
      public static const SELF_VIP_CHANGE:String = "SELF_VIP_CHANGE";
      
      public static const MAX_DAY:int = 30;
      
      public static const CARD_LEVEL_1:int = 1;
      
      public static const CARD_LEVEL_2:int = 2;
      
      public static const CARD_LEVEL_3:int = 3;
      
      public static const CARD_LEVEL_BOUNDS:int = 4;
      
      public static const CARD_GOOD_IDS:Array = [0,7,8,9];
      
      public static const VIP_COUNT_TYPE_YEDI_REWARD:int = 1;
      
      public static const VIP_COUNT_TYPE_TRIAL_ROAD_NORMAL:int = 2;
      
      public static const VIP_COUNT_TYPE_YEDI_CHANCE:int = 3;
      
      public static const VIP_COUNT_TYPE_TRIAL_ROAD_HARD:int = 4;
      
      public static const BATTLE_SPEED_LEVEL:int = 6;
      
      public static const BATTLE_SPEED_LEVEL_2:int = 30;
      
      public static const VIP_FUBEN_SPEED:int = 1;
      
      public static const VIP_TD_SPEED:int = 2;
      
      public static const VIP_ROLE_ENERGY:int = 4;
      
      public static const VIP_FUBEN_SWEEP_TIME:int = 5;
      
      public static const VIP_FUBEN_TD_COIN_ADD:int = 6;
      
      public static const VIP_FARM_PROTECTE_TIME:int = 7;
      
      public static const VIP_PVP_FRIEND_POINT:int = 8;
      
      public static const VIP_TD_FUBEN_AVATOR:int = 9;
      
      public static const VIP_TD_SIGN_IN_NUM:int = 10;
      
      public static const VIP_TD_SIGN_IN_REWORD:int = 11;
      
      public static const VIP_TD_XIAO_JIN_LONG:int = 12;
      
      public static const VIP_PHYSICAL_GET:int = 13;
      
      public static const VIP_FUBEN_SWEEP:int = 14;
      
      public static const VIP_FUBEN_SWEEP_TEN:int = 15;
      
      public static const VIP_ZOMBIE_ISLEAD:int = 16;
       
      
      public function VipConst()
      {
         super();
      }
      
      public static function getVipFlag(param1:int, param2:String = "RECT") : Bitmap
      {
         var _loc3_:Bitmap = new Bitmap();
         if(param1 != 0)
         {
            _loc3_.bitmapData = getVipFlagSource(param1,param2);
         }
         return _loc3_;
      }
      
      public static function getVipFlagSource(param1:int, param2:String = "RECT") : BitmapData
      {
         var _loc3_:BitmapData = null;
         if(param1 >= 0 && param1 <= 3)
         {
            return AssetManager.GetNewClass("VIP_FLAG_" + param2 + "_" + param1) as BitmapData;
         }
         return null;
      }
      
      public static function getVipFlagByPrivilege(param1:int, param2:String = "RECT") : Bitmap
      {
         var _loc3_:int = VipInfoFactory.instance.getPrivilegeVipMinLevelInfoByID(param1);
         var _loc4_:int = 0;
         var _loc5_:VipInfoSetting;
         if((_loc5_ = VipInfoFactory.instance.getVipInfoById(_loc3_)) != null)
         {
            _loc4_ = _loc5_.level;
         }
         return getVipFlag(_loc4_,param2);
      }
   }
}
