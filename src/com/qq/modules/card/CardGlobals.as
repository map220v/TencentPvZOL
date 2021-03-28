package com.qq.modules.card
{
   import com.tencent.protobuf.Int64;
   import flash.display.DisplayObjectContainer;
   
   public final class CardGlobals
   {
      
      public static const HOME_CARD_DO_STRENGTHEN_EVENT:String = "home_card_do_strengthen_event";
      
      public static const HOME_CARD_DO_TRAIN_EVENT:String = "home_card_do_train_event";
      
      public static const HOME_CARD_DO_UPDATE_EVEVT:String = "home_card_do_update_event";
      
      public static const HOME_CARD_SELECT_CARD_EVENT:String = "HOME_CARD_SELECT_CARD_EVENT";
      
      public static const CARD_SET_SELECTED_BY_INDEX:String = "CARD_SET_SELETECTED_BY_INDEX";
      
      public static const CARD_SET_SELECTED_BY_UID:String = "CARD_SET_SELECTED_BY_UID";
      
      public static const CARD_REMOVE_SELECTED:String = "CARD_REMOVE_SELECTED";
      
      public static const CARD_SET_SELECTED_BY_FORGE_LEVEL:String = "CARD_SET_SELECTED_BY_FORGE_LEVEL";
      
      public static const CARD_UPGRADE_SUCCEED:String = "card_upgrade_succeed";
      
      public static const CARD_FORGE_SUCCEED:String = "card_forge_succeed";
      
      public static const STATE_HAS_FILL:int = 1;
      
      public static const STATE_NOT_FILL:int = 2;
      
      public static const STATE_CAN_FILL:int = 3;
      
      public static const STATE_NEED_CARD_LEVEL:int = 4;
      
      public static const CARD_RECYCLE_SUCCEED:String = "CARD_RECYCLE_SUCCEED";
      
      public static const CARD_AUTO_RECYCLE_SUCCEED:String = "CARD_AUTO_RECYCLE_SUCCEED";
      
      public static const CARD_PROP_UPDATED:String = "CARD_PROP_UPDATED";
      
      public static const CARD_ADDED:String = "CARD_ADDED";
      
      public static const CARD_DELETED:String = "CARD_DELETED";
      
      public static const CARD_AVATAR_INFO_UPDATE:String = "CARD_AVATAR_INFO_UPDATE";
      
      public static const CARD_AVATAR_INFO_FOREST:String = "CARD_AVATAR_INFO_FOREST";
      
      public static const CARD_AVATAR_GET_INFO:String = "CARD_AVATAR_GET_INFO";
      
      public static const CARD_EQUIP_SHOW_LIST_EVENT:String = "card_equip_show_list_event";
      
      public static const CARD_EQUIP_CLOSE_LIST_EVENT:String = "card_equip_close_list_event";
      
      public static const CARD_EQUIP_SELL_SUCCEED_EVENT:String = "card_equip_sell_succeed_event";
      
      public static const CARD_SWAP_ATTRIBUTE_EVENT:String = "CARD_SWAP_ATTRIBUTE_EVENT";
      
      public static const CARD_SWAP_CHANGE_CONFIG:String = "CARD_SWAP_CHANGE_CONFIG";
      
      public static const CARD_SWAP_ATTRIBUTE_LOST:String = "CARD_SWAP_ATTRIBUTE_LOST";
      
      public static const CARD_SWAP_GET_SWAP_CARDDNA_NEED_ITEM:String = "CARD_SWAP_GET_SWAP_CARDDNA_NEED_ITEM";
      
      public static const CHANGE_DAVE_TALK_EVENT:String = "change_dave_talk_event";
      
      public static const CARD_HOME_ENTERED:String = "CARD_HOME_ENTERED";
      
      public static const CARD_HOME_EXITED:String = "CARD_HOME_EXITED";
      
      public static const CARD_DO_SWITCH_SCENE:String = "CARD_DO_SWITCH_SCENE";
      
      public static const CARD_SCENE_TYPE_VIEW:int = 1;
      
      public static const CARD_SCENE_TYPE_UPGRADE:int = 2;
      
      public static const CARD_SCENE_TYPE_FORGE:int = 3;
      
      public static const CARD_SCENE_TYPE_CHEST:int = 4;
      
      public static const CARD_SCENE_TYPE_PUZZLE:int = 5;
      
      public static const CARD_SCENE_TYPE_EQUIPMENT:int = 6;
      
      public static const CARD_SCENE_TYPE_SWAP:int = 7;
      
      public static const CARD_SCENE_TYPE_BAPTIZE:int = 8;
      
      public static const CARD_SCENE_TYPE_CARDFRUIT:int = 9;
      
      public static const CARD_SCENE_TYPE_DNA:int = 10;
      
      public static const CARD_SCENE_TYPE_PLANTARMOR:int = 11;
      
      public static const CARD_SCENE_TYPE_PLANTENVOLUTION:int = 12;
      
      public static const CARD_DEBRIS_ITEM_ID:int = 2001;
      
      public static const MAX_FORGE_CONSUME_CARD_COUNT:int = 5;
      
      public static const TYPE_CHLOROPHYLL_COUNT:int = 5;
      
      public static const CARD_PUZZLE_FINISH:String = "CARD_PUZZLE_FINISH";
      
      public static const CARD_PUZZLE_FILL:String = "CARD_PUZZLE_FILL";
      
      public static const CARD_PUZZLE_INFO:String = "CARD_PUZZLE_INFO";
      
      public static const CARD_PUZZLE_SELECT:String = "CARD_PUZZLE_SELECT";
      
      public static const CARD_PUZZLE_TIP_CHANGE:String = "CARD_PUZZLE_TIP_CHANGE";
      
      public static const CARD_PUZZLE_ATTRIBUTE:String = "CARD_PUZZLE_ATTRIBUTE";
      
      public static const CARD_PUZZLE_EXCHANGE_SUCCESS:String = "CARD_PUZZLE_EXCHANGE_SUCCESS";
      
      public static const CARD_PUZZLE_LOAD_COMPLETE:String = "CARD_PUZZLE_LOAD_COMPLETE";
      
      public static const CARD_BAPTIZE_PRE_SELECT:String = "CARD_BAPTIZE_PRE_SELECT";
      
      public static const CARD_DO_SHOW_BEAN:String = "CARD_DO_SHOW_BEAN";
      
      public static const CARD_DO_HIDE_BEAN:String = "CARD_DO_HIDE_BEAN";
      
      public static var CARD_LAST_CARD_ID:Int64 = null;
      
      public static const CARD_DO_EXP_UPGRADE_SIM:String = "CARD_DO_EXP_UPGRADE_SIM";
      
      public static var CARD_TOP_LAYER:DisplayObjectContainer;
      
      public static const CARD_HOME_NO_SCALE_IDS:Array = [8500,8600];
      
      public static const CARD_DECK_SKILL_DESC_LIST:Array = ["攻击","防御","生命","护盾","技力","命中","闪避","暴击","韧性"];
      
      public static const CARD_SKILL_NORMAL:uint = 0;
      
      public static const CARD_SKILL_SKILL:uint = 1;
      
      public static const CARD_SKILL_LEADER:uint = 2;
      
      public static const CARD_SKILL_DECK:uint = 3;
      
      public static const CARD_SKILL_DESC_LIST:Array = ["普通攻击","大招技能","队长技能","套牌技能"];
      
      public static var CARD_RENDER_NUM:int = 11;
      
      public static var CARD_COUNT_PER_PAGE:int = 11;
      
      public static const CARD_LIST_BIG:int = 0;
      
      public static const CARD_LIST_SMALL:int = 1;
      
      public static const CARD_BAPTIZE_NORMAL_TIP:String = "较小几率提高属性<br>消耗：<br><font color=\'{2}\'>{0}x{1}</font>";
      
      public static const CARD_BAPTIZE_ADV_TIP:String = "较大几率提高属性<br>消耗：<br><font color=\'{2}\'>{0}x{1}</font>";
      
      public static const CARD_BAPTIZE_LUCKY_TIP:String = "必定提高属性<br>消耗：<br><font color=\'{2}\'>{0}x{1}</font>";
       
      
      public function CardGlobals()
      {
         super();
      }
   }
}
