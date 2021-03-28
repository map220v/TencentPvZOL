package com.qq.modules.sound.command
{
   import org.robotlegs.extend.ExtendContext;
   import org.robotlegs.extend.command.StrongRobotlegCommandEvent;
   
   public class UISoundCmd
   {
       
      
      public function UISoundCmd()
      {
         super();
      }
      
      public static function play_tutorial_hint() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("UISoundCommand","play_tutorial_hint",[]));
      }
      
      public static function play_block_unlock() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("UISoundCommand","play_block_unlock",[]));
      }
      
      public static function play_block_zoom_in() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("UISoundCommand","play_block_zoom_in",[]));
      }
      
      public static function play_block_zoom_out() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("UISoundCommand","play_block_zoom_out",[]));
      }
      
      public static function play_block_highlight() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("UISoundCommand","play_block_highlight",[]));
      }
      
      public static function play_button_click(param1:Object) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("UISoundCommand","play_button_click",[param1]));
      }
      
      public static function play_button_backCity() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("UISoundCommand","play_button_backCity",[]));
      }
      
      public static function play_popup_window() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("UISoundCommand","play_popup_window",[]));
      }
      
      public static function UI_collect() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("UISoundCommand","UI_collect",[]));
      }
      
      public static function collect_star() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("UISoundCommand","collect_star",[]));
      }
      
      public static function mission_complete() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("UISoundCommand","mission_complete",[]));
      }
      
      public static function mail_open() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("UISoundCommand","mail_open",[]));
      }
      
      public static function mail_delete() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("UISoundCommand","mail_delete",[]));
      }
      
      public static function mail_delivery() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("UISoundCommand","mail_delivery",[]));
      }
      
      public static function suitcase_open() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("UISoundCommand","suitcase_open",[]));
      }
      
      public static function plant_lab_gift_learn() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("UISoundCommand","plant_lab_gift_learn",[]));
      }
      
      public static function plant_lab_gift_unlock() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("UISoundCommand","plant_lab_gift_unlock",[]));
      }
      
      public static function plant_water() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("UISoundCommand","plant_water",[]));
      }
      
      public static function lab_skill_levelup() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("UISoundCommand","lab_skill_levelup",[]));
      }
      
      public static function lab_table_out() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("UISoundCommand","lab_table_out",[]));
      }
      
      public static function lab_table_back() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("UISoundCommand","lab_table_back",[]));
      }
      
      public static function lab_skill_product() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("UISoundCommand","lab_skill_product",[]));
      }
      
      public static function bar_enter() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("UISoundCommand","bar_enter",[]));
      }
      
      public static function bar_out() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("UISoundCommand","bar_out",[]));
      }
      
      public static function cardbag_open() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("UISoundCommand","cardbag_open",[]));
      }
      
      public static function turn_card() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("UISoundCommand","turn_card",[]));
      }
      
      public static function collect_card() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("UISoundCommand","collect_card",[]));
      }
      
      public static function home_enter() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("UISoundCommand","home_enter",[]));
      }
      
      public static function home_menu_drop_down() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("UISoundCommand","home_menu_drop_down",[]));
      }
      
      public static function home_menu_drop_up() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("UISoundCommand","home_menu_drop_up",[]));
      }
      
      public static function home_plant_decompose() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("UISoundCommand","home_plant_decompose",[]));
      }
      
      public static function home_plant_product() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("UISoundCommand","home_plant_product",[]));
      }
      
      public static function home_plant_levelup_hint() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("UISoundCommand","home_plant_levelup_hint",[]));
      }
      
      public static function plant_levelup() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("UISoundCommand","plant_levelup",[]));
      }
      
      public static function plant_starup_swith_in() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("UISoundCommand","plant_starup_swith_in",[]));
      }
      
      public static function plant_starup_select() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("UISoundCommand","plant_starup_select",[]));
      }
      
      public static function plant_starup() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("UISoundCommand","plant_starup",[]));
      }
      
      public static function thermometer_up() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("UISoundCommand","thermometer_up",[]));
      }
      
      public static function thermometer_down() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("UISoundCommand","thermometer_down",[]));
      }
      
      public static function home_enhance_swith_in() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("UISoundCommand","home_enhance_swith_in",[]));
      }
      
      public static function home_enhance_swith_out() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("UISoundCommand","home_enhance_swith_out",[]));
      }
      
      public static function home_plant_enhance() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("UISoundCommand","home_plant_enhance",[]));
      }
      
      public static function leader_medal_pickup() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("UISoundCommand","leader_medal_pickup",[]));
      }
      
      public static function leader_medal_puddown() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("UISoundCommand","leader_medal_puddown",[]));
      }
   }
}
