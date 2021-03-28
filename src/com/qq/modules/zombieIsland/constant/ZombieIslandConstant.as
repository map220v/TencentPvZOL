package com.qq.modules.zombieIsland.constant
{
   import PVZ.Cmd.BattleTargetType;
   import com.qq.modules.embattle.constant.EmbattleConst;
   
   public class ZombieIslandConstant
   {
      
      public static const SCENE_W:Number = 1440;
      
      public static const SCENE_H:Number = 650;
      
      public static var curMode:int;
      
      public static const ISLAND_TYPE_ZOMBIE:int = 1;
      
      public static const ISLAND_TYPE_BOX:int = 2;
      
      public static const ISLAND_STATE_UPDATE:String = "island_state_update";
      
      public static const ISLAND_BOX_UPDATE:String = "island_box_update";
      
      public static const ISLAND_REFRESH_INFO:String = "island_refresh_info";
      
      public static const ISLAND_UPDATE_NORMAL_STAGE_NUM:String = "ISLAND_UPDATE_NORMAL_STAGE_NUM";
      
      public static const ISLAND_UPDATE_ADV_STAGE_NUM:String = "ISLAND_UPDATE_ADV_STAGE_NUM";
      
      public static const ISLAND_SET_PRE_CARD:String = "ISLAND_SET_PRE_CARD";
      
      public static const ISLAND_PRE_CARD_UPDATE:String = "ISLAND_PRE_CARD_UPDATE";
      
      public static const ISLAND_SEL_BOX_ISLAND:String = "island_sel_box_island";
      
      public static const ISLAND_SHOW_BOX_ISLAND:String = "island_show_box_island";
      
      public static const ISLAND_EVER_WIDTH:Number = 1480;
      
      public static const ISLAND_POS_ARR:Array = [[118,380],[475,235],[850,316],[1190,242]];
      
      public static const STONE_POS_ARR:Array = [[238,219],[575,196],[960,230],[1290,212]];
      
      public static const ISLAND_PRE_CARD_BOUNDS:int = 16;
      
      public static const Mode_Normal:int = 0;
      
      public static const Mode_Adv:int = 1;
       
      
      public function ZombieIslandConstant()
      {
         super();
      }
      
      public static function getMaxBGWidth(param1:int) : int
      {
         if(param1 == Mode_Normal)
         {
            return 4440;
         }
         return 3700;
      }
      
      public static function getIslandNum(param1:int) : int
      {
         if(param1 == Mode_Normal)
         {
            return 12;
         }
         return 10;
      }
      
      public static function getBattleTypeByMode(param1:int) : int
      {
         if(param1 == Mode_Normal)
         {
            return BattleTargetType.BattleTargetType_ZombieIsland;
         }
         return BattleTargetType.BattleTargetType_NewZombieIsland;
      }
      
      public static function getEmbattleTypeByMode(param1:int) : int
      {
         if(param1 == Mode_Normal)
         {
            return EmbattleConst.MODE_ZOMBIE_ISLAND;
         }
         return EmbattleConst.MODE_ZOMBIE_ADV_ISLAND;
      }
   }
}
