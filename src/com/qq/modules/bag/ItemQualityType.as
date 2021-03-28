package com.qq.modules.bag
{
   public class ItemQualityType
   {
      
      public static const NORMAL_TYPE:int = 1;
      
      public static const UNCOMMON_TYPE:int = 2;
      
      public static const RARE_TYPE:int = 3;
      
      public static const EPIC_TYPE:int = 4;
      
      public static const LEGENDARY_TYPE:int = 5;
      
      public static const BEST_TYPE:int = 6;
       
      
      public function ItemQualityType()
      {
         super();
      }
      
      public static function getQuiltyName(param1:int) : String
      {
         var _loc2_:String = null;
         switch(param1)
         {
            case NORMAL_TYPE:
               _loc2_ = "普通";
               break;
            case UNCOMMON_TYPE:
               _loc2_ = "优秀";
               break;
            case RARE_TYPE:
               _loc2_ = "高级";
               break;
            case EPIC_TYPE:
               _loc2_ = "稀有";
               break;
            case LEGENDARY_TYPE:
               _loc2_ = "传奇";
               break;
            default:
               _loc2_ = "史诗";
         }
         return _loc2_;
      }
      
      public static function getQualityColor(param1:int) : String
      {
         var _loc2_:String = null;
         switch(param1)
         {
            case ItemQualityType.UNCOMMON_TYPE:
               _loc2_ = "#36ca46";
               break;
            case ItemQualityType.RARE_TYPE:
               _loc2_ = "#0078ff";
               break;
            case ItemQualityType.EPIC_TYPE:
               _loc2_ = "#c739c0";
               break;
            case ItemQualityType.LEGENDARY_TYPE:
               _loc2_ = "#ffa11e";
               break;
            case ItemQualityType.BEST_TYPE:
               _loc2_ = "#fefc81";
               break;
            default:
               _loc2_ = "#ffffff";
         }
         return _loc2_;
      }
      
      public static function getQualityColorValue(param1:int) : Number
      {
         var _loc2_:Number = NaN;
         switch(param1)
         {
            case ItemQualityType.UNCOMMON_TYPE:
               _loc2_ = 204917318;
               break;
            case ItemQualityType.RARE_TYPE:
               _loc2_ = 30975;
               break;
            case ItemQualityType.EPIC_TYPE:
               _loc2_ = 13056448;
               break;
            case ItemQualityType.LEGENDARY_TYPE:
               _loc2_ = 16752926;
               break;
            case ItemQualityType.BEST_TYPE:
               _loc2_ = 16710785;
               break;
            default:
               _loc2_ = 16777215;
         }
         return _loc2_;
      }
   }
}
