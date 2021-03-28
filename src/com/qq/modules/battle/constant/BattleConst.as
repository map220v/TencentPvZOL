package com.qq.modules.battle.constant
{
   import flash.geom.Point;
   import org.as3commons.logging.api.getLogger;
   
   public class BattleConst
   {
      
      public static const BATTLE_MODULE_OPEN:String = "BATTLE_MODULE_OPEN";
      
      public static const BATTLE_MODULE_CLOSE:String = "BATTLE_MODULE_CLOSE";
      
      public static const BATTLE_CLOSE:String = "BATTLE_CLOSE";
      
      public static const BATTLE_RESET:String = "BATTLE_RESET";
      
      public static const BATTLE_INIT:String = "BATTLE_INIT";
      
      public static const BATTLE_READY:String = "BATTLE_READY";
      
      public static const BATTLE_RUN:String = "BATTLE_RUN";
      
      public static const BATTLE_END:String = "BATTLE_END";
      
      public static const BATTLE_REMOVE_FROM_OTHER:String = "BATTLE_REMOVE_FROM_OTHER";
      
      public static const BATTLE_ADD_DISPLAY:String = "BATTLE_ADD_UNIT";
      
      public static const BATTLE_REMOVE_DISPLAY:String = "BATTLE_REMOVE_UNIT";
      
      public static const BATTLE_SORT_UNIT:String = "BATTLE_SORT_UNIT";
      
      public static const BATTLE_ADD_TOP_EFFECT:String = "BATTLE_ADD_TOP_EFFECT";
      
      public static const BATTLE_ROUND_CHANGE:String = "BATTLE_ROUND_CHANGE";
      
      public static const BATTLE_FLY_CHEST:String = "BATTLE_FLY_CHEST";
      
      public static const ANCHORY:int = 20;
      
      public static const GRID_WIDTH:int = 93;
      
      public static const GRID_HEIGHT:int = 112;
      
      public static const GRID_WIDTH_NUM:int = 8;
      
      public static const GRID_HEIGHT_NUM:int = 3;
      
      public static const VIEW_WIDTH:int = 900;
      
      public static const VIEW_HEIGHT:int = 675;
      
      public static const unitDepthMaping:Array = [2,5,9,12,16,19,1,4,8,11,15,18,0,3,7,10,14,17];
      
      public static const unitPointMaping:Array = [[2,0],[2,0],[2,1],[2,1],[2,2],[2,2],[1,0],[1,0],[1,1],[1,1],[1,2],[1,2],[0,0],[0,0],[0,1],[0,1],[0,2],[0,2]];
      
      public static const BUFF_TYPE_CARD:int = 0;
      
      public static const BUFF_TYPE_DMMMY:int = 1;
      
      public static const Event_AddResidentBuff:String = "Event_AddResidentBuff";
       
      
      public function BattleConst()
      {
         super();
      }
      
      public static function getColIndexByPosIndex(param1:int) : int
      {
         switch(param1)
         {
            case 1:
            case 2:
            case 7:
            case 8:
            case 13:
            case 14:
               return 1;
            case 3:
            case 4:
            case 9:
            case 10:
            case 15:
            case 16:
               return 2;
            case 5:
            case 6:
            case 11:
            case 12:
            case 17:
            case 18:
               return 3;
            default:
               return 1;
         }
      }
      
      public static function isLeft(param1:int) : Boolean
      {
         return param1 % 2 == 1;
      }
      
      public static function getCardXYByPosindex(param1:int) : Point
      {
         var _loc2_:Point = new Point();
         if(param1 > 100)
         {
            _loc2_.x = BattleConst.GRID_WIDTH * 3.5 + (param1 % 2 == 1 ? -1 : 1) * (BattleConst.GRID_WIDTH + 20);
            _loc2_.y = -10;
            return _loc2_;
         }
         var _loc3_:Array = unitPointMaping[param1 - 1];
         if(param1 % 2 == 0)
         {
            _loc2_.x = (GRID_WIDTH_NUM - _loc3_[0] - 1) * GRID_WIDTH;
            _loc2_.y = _loc3_[1] * GRID_HEIGHT;
         }
         else
         {
            _loc2_.x = _loc3_[0] * GRID_WIDTH;
            _loc2_.y = _loc3_[1] * GRID_HEIGHT;
         }
         return _loc2_;
      }
      
      public static function getAnimaXYByGridXY(param1:int) : Point
      {
         var _loc2_:Point = getCardXYByPosindex(param1);
         _loc2_.x += BattleConst.GRID_WIDTH * 0.5;
         _loc2_.y += BattleConst.GRID_HEIGHT - BattleConst.ANCHORY;
         return _loc2_;
      }
      
      public static function getCardPosIndexByUnitPoint(param1:Array) : int
      {
         var _loc2_:int = unitPointMaping.length;
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            if(unitPointMaping[_loc3_][0] == param1[0] && unitPointMaping[_loc3_][1] == param1[1])
            {
               return _loc3_ + 1;
            }
            _loc3_++;
         }
         getLogger("battle").error("can\'t get posIndex By unitPoint: " + param1);
         return 0;
      }
      
      public static function getVerticalByIndex(param1:int) : int
      {
         var _loc2_:int = 0;
         return int(int((param1 - 1) / 6));
      }
      
      public static function getHorizontalByIndex(param1:int) : int
      {
         var _loc2_:int = 0;
         return int(int((param1 % 6 - 1) / 2));
      }
      
      public static function isDummyZombieByPos(param1:int) : Boolean
      {
         return param1 >= 100;
      }
   }
}
