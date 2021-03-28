package com.qq.modules.lab.constant
{
   public class LabConst
   {
      
      public static const LAB_GET_ALL_INFO_EVENT:String = "LAB_GET_ALL_INFO_EVENT";
      
      public static const LAB_UPGRADE_SUCCEED_EVENT:String = "LAB_UPGRADE_SUCCEED_EVENT";
      
      public static const LAB_PRODUCE_SUCCEED_EVENT:String = "LAB_PRODUCE_SUCCEED_EVENT";
      
      public static const LAB_SYNC_UNLOCK_LAB_EVENT:String = "LAB_SYNC_UNLOCK_LAB_EVENT";
      
      public static const LAB_SWITCH_MODE_EVENT:String = "LAB_SWITCH_MODE_EVENT";
      
      public static const CLICK_LAB_UPGRADE_BTN_EVENT:String = "click_lab_upgrade_btn_event";
      
      public static const ENLARGE_PRODUCE_TECH_EVENT:String = "enlarge_produce_tech_event";
      
      public static const QUIT_ENLARGE_SCREEN:String = "quit_enlarge_screen";
      
      public static const PLAY_FLY_CARTOON_EVENT:String = "PLAY_FLY_CARTOON_EVENT";
      
      public static const FLY_CARTOON_COMPLETE_EVENT:String = "fly_cartoon_complete_event";
      
      public static const LAB_UPGRADE_MODE:int = 1;
      
      public static const LAB_PRODUCE_MODE:int = 2;
      
      private static var LAB_ATTR_NAME_DICT:Array;
      
      {
         setup();
      }
      
      public function LabConst()
      {
         super();
      }
      
      private static function setup() : void
      {
         LAB_ATTR_NAME_DICT = [];
         LAB_ATTR_NAME_DICT[1] = "攻击";
         LAB_ATTR_NAME_DICT[2] = "防御";
         LAB_ATTR_NAME_DICT[3] = "生命";
         LAB_ATTR_NAME_DICT[4] = "护盾";
         LAB_ATTR_NAME_DICT[5] = "技力";
         LAB_ATTR_NAME_DICT[6] = "命中";
         LAB_ATTR_NAME_DICT[7] = "闪避";
         LAB_ATTR_NAME_DICT[8] = "暴击";
         LAB_ATTR_NAME_DICT[9] = "韧性";
         LAB_ATTR_NAME_DICT[10] = "免疫";
      }
      
      public static function getLabAttrName(param1:int) : String
      {
         return LAB_ATTR_NAME_DICT[param1] as String;
      }
   }
}
