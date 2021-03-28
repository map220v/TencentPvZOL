package com.qq.constant.union
{
   import PVZ.Cmd.GuildPosition;
   import com.qq.display.ColorMatrix;
   import com.qq.templates.font.FontNormal;
   import com.qq.utils.DateUtils;
   import com.qq.utils.UrlManager;
   import flash.filters.ColorMatrixFilter;
   
   public class UnionConstant
   {
      
      public static const PlayerState_No_Union:int = 0;
      
      public static const PlayerState_Waiting_Approve:int = 1;
      
      public static const PlayerState_Waiting_CD:int = 2;
      
      public static const PlayerState_In_Union:int = 3;
      
      public static const ApplyUnionState_OK:int = 0;
      
      public static const ApplyUnionState_In_Union:int = 1;
      
      public static const ApplyUnionState_Waitting_Approve:int = 2;
      
      public static const ApplyUnionState_Apply_Max:int = 3;
      
      public static const ApplyUnionState_Waitting_CD:int = 4;
      
      public static const NPCType_Garden_Manager:int = 2;
      
      public static const NPCType_Bonus_Manager:int = 3;
      
      public static const NPCType_UnionFubenExchange_Manager:int = 4;
      
      public static const NPCType_Trade_Manager:int = 5;
      
      public static const NPCType_Func_Manager:int = 6;
      
      public static const NPCType_Skill_Manager:int = 7;
      
      public static const NPCList:Array = [NPCType_Garden_Manager,NPCType_Bonus_Manager,NPCType_UnionFubenExchange_Manager,NPCType_Func_Manager,NPCType_Skill_Manager];
      
      public static const Color_Surface_Total:int = 10;
      
      public static const Color_Sign_Total:int = 10;
      
      public static const Sign_Total:int = 10;
      
      public static const Surface_Total:int = 13;
      
      public static var colorList:Array = [[0,0,0,165],[0,0,0,-165],[0,0,10,50],[0,0,0,-130],[0,0,0,-65],[0,0,0,0],[0,0,0,110],[0,0,40,-40],[0,0,15,-100],[0,0,55,-150]];
      
      public static const UNION_DONATE_UNIT:int = 10000;
      
      public static const PostitionLevel_1:int = 100;
      
      public static const PostitionLevel_2:int = 90;
      
      public static const PostitionLevel_3:int = 80;
      
      public static const PostitionLevel_4:int = 0;
      
      public static const DonateTip:String = "1万金币={0}点经验+1点贡献值";
       
      
      public function UnionConstant()
      {
         super();
      }
      
      public static function getColorFilter(param1:int) : ColorMatrixFilter
      {
         if(param1 < 1 || param1 > Color_Surface_Total)
         {
            param1 = 1;
         }
         var _loc2_:Array = colorList[param1 - 1];
         var _loc3_:ColorMatrix = new ColorMatrix();
         _loc3_.adjustBrightness(_loc2_[0]);
         _loc3_.adjustContrast(_loc2_[1]);
         _loc3_.adjustSaturation(_loc2_[2]);
         _loc3_.adjustHue(_loc2_[3]);
         return new ColorMatrixFilter(_loc3_);
      }
      
      public static function getSurfaceUrl(param1:int, param2:Boolean) : String
      {
         var _loc3_:* = null;
         if(param1 < 1 || param1 > Surface_Total)
         {
            param1 = 1;
         }
         if(param2)
         {
            _loc3_ = "small/" + param1 + ".png";
         }
         else
         {
            _loc3_ = "big/" + param1 + ".png";
         }
         return UrlManager.getInstance().getUrl(UrlManager.Url_Union_Flag_Surface,_loc3_);
      }
      
      public static function getSignUrl(param1:int, param2:Boolean) : String
      {
         var _loc3_:* = null;
         if(param1 < 1 || param1 > Sign_Total)
         {
            param1 = 1;
         }
         if(param2)
         {
            _loc3_ = "small/" + param1 + ".png";
         }
         else
         {
            _loc3_ = "big/" + param1 + ".png";
         }
         return UrlManager.getInstance().getUrl(UrlManager.Url_Union_Flag_Sign,_loc3_);
      }
      
      public static function getUnionPostitionName(param1:int) : String
      {
         switch(param1)
         {
            case GuildPosition.GuildPosition_Leader:
               return FontNormal.Union_Postion_Leader;
            case GuildPosition.GuildPosition_DeputyLeader:
               return FontNormal.Union_Postion_DeputyLeader;
            case GuildPosition.GuildPosition_Elite:
               return FontNormal.Union_Postion_Elite;
            default:
               return FontNormal.Union_Postion_Member;
         }
      }
      
      public static function getUnionPostitionLevel(param1:int) : int
      {
         var _loc2_:int = 0;
         switch(param1)
         {
            case GuildPosition.GuildPosition_Leader:
               _loc2_ = PostitionLevel_1;
               break;
            case GuildPosition.GuildPosition_DeputyLeader:
               _loc2_ = PostitionLevel_2;
               break;
            case GuildPosition.GuildPosition_Elite:
               _loc2_ = PostitionLevel_3;
               break;
            case GuildPosition.GuildPosition_Member:
               _loc2_ = PostitionLevel_4;
               break;
            default:
               _loc2_ = PostitionLevel_4;
         }
         return _loc2_;
      }
      
      public static function getUnionUpgradePosition(param1:int) : int
      {
         if(param1 == GuildPosition.GuildPosition_Elite)
         {
            return GuildPosition.GuildPosition_DeputyLeader;
         }
         if(param1 == GuildPosition.GuildPosition_Member)
         {
            return GuildPosition.GuildPosition_Elite;
         }
         return GuildPosition.GuildPosition_None;
      }
      
      public static function getUnionDropPosition(param1:int) : int
      {
         if(param1 == GuildPosition.GuildPosition_Elite)
         {
            return GuildPosition.GuildPosition_Member;
         }
         if(param1 == GuildPosition.GuildPosition_DeputyLeader)
         {
            return GuildPosition.GuildPosition_Elite;
         }
         return GuildPosition.GuildPosition_None;
      }
      
      public static function getOfflineTime(param1:Number) : Number
      {
         if(param1 == 0)
         {
            param1 = DateUtils.getInstance().getServerTime();
         }
         return Number(Math.abs(DateUtils.getInstance().getInterval(param1)));
      }
      
      public static function getOfflineTimeDesc(param1:Number) : String
      {
         if(param1 == 0)
         {
            param1 = DateUtils.getInstance().getServerTime();
         }
         var _loc2_:Number = 24 * 3600;
         param1 = Math.abs(DateUtils.getInstance().getInterval(param1));
         if(param1 < _loc2_ * 1)
         {
            return FontNormal.Union_Offline_1_Day;
         }
         if(param1 < _loc2_ * 2)
         {
            return FontNormal.Union_Offline_2_Day;
         }
         if(param1 < _loc2_ * 3)
         {
            return FontNormal.Union_Offline_3_Day;
         }
         if(param1 < _loc2_ * 4)
         {
            return FontNormal.Union_Offline_4_Day;
         }
         if(param1 < _loc2_ * 5)
         {
            return FontNormal.Union_Offline_5_Day;
         }
         if(param1 < _loc2_ * 6)
         {
            return FontNormal.Union_Offline_6_Day;
         }
         if(param1 < _loc2_ * 7)
         {
            return FontNormal.Union_Offline_7_Day;
         }
         if(param1 < _loc2_ * 8)
         {
            return FontNormal.Union_Offline_8_Day;
         }
         if(param1 < _loc2_ * 14)
         {
            return FontNormal.Union_Offline_14_Day;
         }
         return FontNormal.Union_Offline_1_Month;
      }
   }
}
