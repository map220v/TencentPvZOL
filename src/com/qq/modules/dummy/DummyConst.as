package com.qq.modules.dummy
{
   public class DummyConst
   {
      
      public static const PanelID_Setting:int = 0;
      
      public static const PanelID_Composite:int = 1;
      
      public static const PanelID_DrawCard:int = 2;
      
      public static const PanelID_Exchange:int = 3;
      
      public static const PanelID_Illustration:int = 4;
      
      public static const Equipment_Arms:int = 1;
      
      public static const Equipment_Head:int = 2;
      
      public static const Equipment_Clothes:int = 3;
      
      public static const Equipment_Pants:int = 4;
      
      public static const Equipment_Gloves:int = 5;
      
      public static const Equipment_Shoes:int = 6;
      
      public static const Total_Equipment:int = 6;
      
      public static const InfoPanel_Skill:int = 0;
      
      public static const InfoPanel_Prop:int = 1;
      
      public static const InfoPanel_Material:int = 2;
      
      public static const Fuben_Mode_Normal:int = 1;
      
      public static const Fuben_Mode_Elite:int = 2;
      
      public static const MaxSettingDummy:int = 5;
      
      public static const DummyEvent_Show_ExchangePanel:String = "DummyEvent_Show_ExchangePanel";
      
      public static const DummyEvent_Hide_ExchangePanel:String = "DummyEvent_Hide_ExchangePanel";
      
      public static const DummyEvent_DummyZombieList_Inited:String = "DummyEvent_DummyZombieList_Inited";
      
      public static const DummyEvent_Update_Lineup:String = "DummyEvent_Update_Lineup";
      
      public static const DummyEvent_Update_Composite_Info:String = "DummyEvent_Update_Composite_Info";
      
      public static const DummyEvent_Switch_Panel:String = "DummyEvent_Switch_Panel";
      
      public static const DummyEvent_Update_DummyDetail_Info:String = "DummyEvent_Update_DummyDetail_Info";
      
      public static const DummyEvent_Update_DummyEquipment_Info:String = "DummyEvent_Update_DummyEquipment_Info";
      
      public static const DummyEvent_Update_DummyEquipment_LevelUP:String = "DummyEvent_Update_DummyEquipment_LevelUP";
      
      public static const DummyEvent_Update_Zombie_StarUp:String = "DummyEvent_Update_Zombie_StarUp";
      
      public static const DummyEvent_Update_Zombie_Levelup:String = "DummyEvent_Update_Zombie_Levelup";
      
      public static const DummyEvent_Update_Zombie_Add_Exp:String = "DummyEvent_Update_Zombie_Add_Exp";
      
      public static const DummyEvent_Update_Zombie_Quilty:String = "DummyEvent_Update_Zombie_Quilty";
      
      public static const DummyEvent_Update_Zombie_Skill_LevelUp:String = "DummyEvent_Update_Zombie_Skill_LevelUp";
      
      public static const DummyEvent_Update_Zombie_Skill_Active:String = "DummyEvent_Update_Zombie_Skill_Active";
      
      public static const DummyEvent_SkillPoint_Change:String = "DummyEvent_SkillPoint_Change";
      
      public static const DummyEvent_Energy_Change:String = "DummyEvent_Energy_Change";
      
      public static const DummyEvent_Fuben_Chapter_Update:String = "DummyEvent_Fuben_Chapter_Update";
      
      public static const DummyEvent_Fuben_Stage_Info_Init:String = "DummyEvent_Fuben_Stage_Info_Init";
      
      public static const DummyEvent_Fuben_Stage_Info_Update:String = "DummyEvent_Fuben_Stage_Info_Update";
      
      public static const DummyEvent_Fuben_Level_Result_Update:String = "DummyEvent_Fuben_Level_Result_Update";
      
      public static const DummyEvent_Fuben_Sweep_Result_Update:String = "DummyEvent_Fuben_Sweep_Result_Update";
      
      public static const DummyEvent_Init_Draw_Info:String = "DummyEvent_Init_Draw_Info";
      
      public static const DummyEvent_Update_Draw_Info:String = "DummyEvent_Update_Draw_Info";
      
      public static const DummyEvent_Play_Draw_Effect:String = "DummyEvent_Play_Draw_Effect";
      
      public static const DummyEvent_Call_Card_Again:String = "DummyEvent_Call_Card_Again";
      
      public static const DummyEvent_Goto_Get_Material:String = "DummyEvent_Goto_Get_Material";
      
      public static const DummyEvent_Exchange_DragDummy:String = "DummyEvent_Exchange_DragDummy";
      
      public static const DummyEvent_Exchange_SetDummy:String = "DummyEvent_Exchange_SetDummy";
      
      public static const DummyEvent_Exchange_Success:String = "DummyEvent_Exchange_Success";
      
      public static const Dummy_DragCardListSize:int = 12;
      
      public static const Dummy_ROW_SIZE:uint = 3;
      
      public static const Text_Dummy_Draw_Tip1:String = "再捕获 <font color=\'#00FF00\'>{0}</font> 次必得{1}";
      
      public static const Text_Dummy_Draw_Tip2:String = "免费捕获次数：<font  color=\'#00FF00\'>{0}次</font>";
      
      public static const Text_Dummy_Draw_Tip3:String = "下次免费捕获时间<font   color=\'#00FF00\'>{0}</font>";
      
      public static const Text_Dummy_Draw_Tip4:String = "<font color=\'#00FF00\'>本次免费</font>";
      
      public static const Text_Dummy_Levelup_Tip1:String = "当前傀儡等级: {0} 装备升级上限: {1}";
      
      public static const Text_Dummy_Rankup_Tip1:String = "建议使用 {0} x {1} 晋品，<font color=\'#00FF00\'>可保留傀儡装备及其战力</font>。请选择是否使用傀儡原石？";
      
      public static const Text_Dummy_Buy_Tip1:String = "<font color=\'#ffffff\'>{0}:{1}/{2}，每{3}秒恢复{4}点</font>";
      
      public static const Text_Rule1:String = "<font color=\'#ffffff\'><font color=\'#ffff00\'>● 背景</font><br> 令人兴奋的是，博士操控僵尸的秘密终被破解，部分种类僵尸被植物完全征服。这些僵尸将为正义而战，为植物带来大量属性和独特技能，我们守卫家园的力量大大加强！<br><font color=\'#ffff00\'>● 傀儡</font><br> 升级：使用培养液可以提升傀儡经验；傀儡品质越高，解锁等级上限越高<br> 升星：需要集齐指定数量的对应傀儡碎片；星级越高，成长值越高<br> 晋品：将全部六件装备的品质和等级升满后可以晋升傀儡品质（装备将被消耗，或使用傀儡原石替代装备消耗）<br><font color=\'#ffff00\'>● 装备</font><br> 合成：使用图纸与碎片可以合成或晋级为对应品质的装备<br> 升级：需要消耗金币和装备碎片；装备等级不可超过傀儡等级<br><font color=\'#ffff00\'>● 技能</font><br> 技能：每个傀儡都拥有一个主动技能和一个被动技能<br> 升级：需要使用金币、技能点和技能光盘；技能点每5分钟自动恢复1点，技能光盘可通过游戏活动获得</font>";
      
      public static const Text_Rule2:String = "<font color=\'#ffffff\'>1、傀儡战境在小镇55级时开启，之后依次解锁新的章节<br>2、傀儡战境共已开启10个章节，每个章节有6小关，分为普通和精英2种模式<br>3、挑战和扫荡关卡需要消耗能量。能量每5分钟恢复1点，每天可以购买16次<br>4、挑战关卡的过程中不可恢复生命，中途退出不返还能量<br>5、精英关卡每天最多挑战和扫荡10次<br>6、关卡获得三星评价后可以进行扫荡：1-7回合内获得胜利获得三星，8-9回合获得两星，10-30回合获得一星</font>";
      
      public static const Text_Priviege_Need_VIP:String = "僵尸战境无需3星扫荡需要{0}，是否开通？";
      
      public static const Text_Active_Requirement:String = "<font color=\'{1}\'>傀儡{0}星</font>  <font color=\'{4}\'>{2}达到{3}级</font> <font color=\'{5}\'>{6}</font>";
      
      public static const Text_Add_Speed_Desc:String = "增加先攻{0}";
      
      public static const Text_Active_Skill_Tip:String = "技能达到{0}级，可激活 {1}";
      
      public static const Text_Dummy_Draw_UseItem_Tip:String = "本次将消耗 {0} x {1},是否确定使用？";
      
      public static const Text_Dummy_Draw_UseDiamond_Tip:String = "购买{1}个{0}需要花费<font color=\'#00ff00\'>{2}{3}</font>，并进行{5}次{4}，是否继续？";
      
      public static const Text_Dummy_Skill_Tip:String = "<font color=\'#00FF00\'>{0}</font>:<br>{1}<br><br>";
      
      public static const Text_Dummy_Combine_Star_Str:String = "星级之和至少为{0}";
      
      public static const Text_Dummy_Combine_Level_Str:String = "等级之和至少为{0}";
      
      public static const DummyBuff_Val_Type_Direct:int = 1;
      
      public static const DummyBuff_Val_Type_Percent:int = 2;
      
      public static const Dummy_Combine_Type_Star:int = 1;
      
      public static const Dummy_Combine_Type_Level:int = 2;
      
      public static const Attr_Attack:int = 1;
      
      public static const Attr_Defense:int = 2;
      
      public static const Attr_HP:int = 3;
      
      public static const Attr_Ability:int = 4;
      
      public static const Attr_Hit:int = 5;
      
      public static const Attr_Dodge:int = 6;
      
      public static const Attr_Critical:int = 7;
      
      public static const Attr_Tough:int = 8;
      
      public static const EquipmentState_None:int = 0;
      
      public static const EquipmentState_LevelUp:int = 1;
      
      public static const EquipmentState_Promotion:int = 2;
      
      public static const EquipmentState_MaxLevel:int = 3;
      
      public static const ZombieState_None:int = 0;
      
      public static const ZombieState_LevelUp:int = 1;
      
      public static const ZombieState_Promotion:int = 2;
      
      public static const ZombieState_MaxLevel:int = 3;
      
      public static const FubenStage_Fight_Ready:int = 0;
      
      public static const FubenStage_Fight_Close:int = 1;
      
      public static const FubenStage_State_Lock_NotPassPrevNormalStage:int = 0;
      
      public static const FubenStage_State_Lock_NotPassPrevEliteStage:int = 3;
      
      public static const FubenStage_State_Lock_NotPassPrevStage:int = 4;
      
      public static const FubenStage_Stage_Lock_NotMeetLevel:int = 1;
      
      public static const FubenStage_State_Lock_NotPassCurNormalStage:int = 5;
      
      public static const FubenStage_Open:int = 2;
      
      public static const Skill_Update_State_Lv_Max:int = 1;
      
      public static const Skill_Update_State_Not_Use:int = 2;
      
      public static const Skill_Update_Not_Meet_Actvie_Requirement:int = 3;
      
      public static const Skill_Update_State_Item_NotEnough:int = 4;
      
      public static const Skill_Active_State_Item_NotEnough:int = 5;
      
      public static const Skill_Update_State_OK:int = 6;
      
      public static const Skill_Update_Ready_To_Active:int = 7;
      
      public static const Exchange_Left:int = 0;
      
      public static const Exchange_Right:int = 1;
       
      
      public function DummyConst()
      {
         super();
      }
   }
}
