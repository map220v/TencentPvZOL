package com.qq.modules.fuben
{
   public final class FubenGlobals
   {
      
      public static const FUBEN_MAPS_UPDATED:String = "FUBEN_MAPS_UPDATED";
      
      public static const FUBEN_CHAPTER_UPDATED:String = "FUBEN_CHAPTER_UPDATED";
      
      public static const FUBEN_VIEW_CHAPTER_SWITCHED:String = "FUBEN_VIEW_CHAPTER_SWITCHED";
      
      public static const FUBEN_STAGE_NEW_OPEN:String = "FUBEN_STAGE_NEW_OPEN";
      
      public static const FUBEN_CHEST_OPENED:String = "FUBEN_CHEST_OPENED";
      
      public static var NEED_PUZZLE_SHOW:Boolean = false;
      
      public static var NEED_ENTER_CHAPTER:int = 0;
      
      public static var NEED_ENTER_MODE:int = 1;
      
      public static var NEED_ARROW_STAGE:int = 0;
      
      public static var IS_AGAIN_FIGHT:Boolean = false;
      
      public static var FUBEN_MODE_NORMAL:uint = 1;
      
      public static var FUBEN_MODE_ELITE:uint = 2;
      
      public static var FUBEN_MODE_UNION:uint = 3;
      
      public static var LAST_FIGHT_CHAPTER:int = 0;
      
      public static var LAST_FIGHT_MODE:int = 1;
      
      public static var TEMP_FIGHT_CHAPTER:int = 0;
      
      public static var TEMP_FIGHT_MODE:int = 1;
       
      
      public function FubenGlobals()
      {
         super();
      }
   }
}
