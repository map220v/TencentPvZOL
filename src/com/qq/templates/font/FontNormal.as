package com.qq.templates.font
{
   import com.qq.modules.bag.model.ItemTemplateFactory;
   import tencent.base.utils.StringUtil;
   
   public class FontNormal
   {
      
      public static var DECREASE:String = "减少";
      
      public static var INCREASE:String = "增加";
      
      public static const Common_NoEnough_Coin:String = "金币不足";
      
      public static const Common_NoEnough_Diamond:String = "钻石不足";
      
      public static const Common_NoEnough_Energy:String = "体力不足";
      
      public static const PRICE_WITH_BLUE_VIP:String = "使用{0}钻石购买（蓝钻用户仅{1}钻石即可获得）";
      
      public static const BLUE_DIAMOND_GROW_REWARD:String = "{0}级可领取如下礼包";
      
      public static const BLUE_DIAMOND_TIP:String = "<font color=\'#89A0BC\'>更多蓝钻特权，请关注 </font><font color=\'#2A5997\'><u><a target=\'_blank\' href=\'{0}\'>蓝钻官网</a></u></font>";
      
      public static const RoleInfo_Tooltip_Exp:String = "小镇等级：{0}\n繁荣度：{1} / {2}\n通过冒险和每日任务可以获得小镇繁荣度";
      
      public static const RoleInfo_Tooltip_Sun:String = "阳光：{0}\n阳光用于学习塔防天赋能力\n通过塔防关卡可以获得阳光";
      
      public static const RoleInfo_Tooltip_MaxCoin:String = "\n<font color=\'#FF0000\'>金币超过金库存放上限，超出部分金币每日0点自动清空，请尽快使用！</font>";
      
      public static const RoleInfo_Tooltip_Coin:String = "金币：{0}\n金币用于强化卡牌、提升战力\n每天可以收获一定数量的金币";
      
      public static const RoleInfo_Tooltip_Physical:String = "体力：{0}\n体力用于挑战冒险关卡\n体力每过{1}分钟会自然恢复{2}点，上限为{3}";
      
      public static const RoleInfo_Tooltip_Diamond:String = "金钻：{0}<br>比钻石更为稀有的货币<br>有特殊用途，并兼容钻石的所有功能，可通过充值获得";
      
      public static const RoleInfo_Tooltip_GiftDiamond:String = "钻石：{0}<br>钻石可用于购买游戏内各种好东西<br>通过月卡返还、VIP返还、充值赠送或游戏内奖励获得";
      
      public static const RoleInfo_Tooltip_FriendPoint:String = "友情点：{0}\n可在酒吧中购买友情点植物卡包。通过与好友、盟友切磋；借用好友、盟友植物；竞技场战斗获得";
      
      public static const TD_Btn_Pause:String = "暂停游戏";
      
      public static const TD_Btn_Restart:String = "重新开始";
      
      public static const TD_Btn_Ext:String = "退出游戏";
      
      public static const TD_Str_PassLevelNum:String = "塔防通关";
      
      public static const TD_Str_ChooseFriendCardResult:String = "你已选用 <b><font color=\'#fffd5d\'>{0}</font></b> 的植物，你和 <b><font color=\'#fffd5d\'>{0}</font></b> 将会获得 <b><font color=\'#00FF00\'>{1}</font></b> 友情点";
      
      public static const TD_Str_SunBarTooltip:String = "种植植物需要消耗阳光";
      
      public static const TD_Str_FuelBarTooltip:String = "释放植物必杀需要消耗能量";
      
      public static const TD_Str_RainBarTooltip:String = "购买植物和使用技能需要消耗雨露值";
      
      public static const TD_Str_ForceStopGame_Tip:String = "游戏数据异常，请联系客服";
      
      public static const TD_Str_Exit_Tip:String = "确定要退出嘛？";
      
      public static const TD_Str_Guide_Level_Exit_Tip:String = "是否确定跳过引导关?";
      
      public static const TD_Str_DailyTD_Exit_Tip:String = "退出游戏会损失一次挑战次数，是否确定？(还剩余{0}次)";
      
      public static const Td_Str_DaiylTD_Exit_NoTimes:String = "你的挑战次数为0，退出将无法继续";
      
      public static const TD_Str_Noraml_Restart_Tip:String = "确定要重新开始？";
      
      public static const TD_Str_DailyTD_Restart_Tip:String = "重新开始游戏会损失一次挑战次数，是否确定？(还剩余{0}次)";
      
      public static const Td_Str_DaiylTD_Restart_NoTimes:String = "你的挑战次数为0，重新开始将无法继续";
      
      public static const TD_Str_Failed:String = "僵尸侵入了你的领地！";
      
      public static const Td_Str_DailyTD_Failed:String = "僵尸侵入了你的领地！你可以再次挑战(剩余挑战次数：{0})";
      
      public static const Td_Str_DailyTD_Failed_NoTime:String = "僵尸侵入了你的领地！你的挑战次数已用尽";
      
      public static const TD_Str_DailyTD_NO_PASS:String = "时光之旅需要通关塔防第一章才能开启.";
      
      public static const TD_Str_EndlessTD_congratulatePassAll:String = "恭喜你，无尽塔防已全部通关！";
      
      public static const TD_Str_EndlessTD_failPopupWindowDesc:String = "僵尸侵入了你的领地！";
      
      public static const TD_Str_YetiTD_Exit_Tip:String = "退出游戏会损失一次挑战次数，是否确定？";
      
      public static const TD_Str_YetiTD_Restart_Tip:String = "重新开始游戏会损失一次挑战次数，是否确定？";
      
      public static const CAN_TAKE:String = "可领取";
      
      public static const HAS_TAKE:String = "已领取";
      
      public static const NOT_TAKE:String = "不可领取";
      
      public static const TD_Btn_Shovel:String = "铲子";
      
      public static const Main_PlayOldTDGame:String = "是否想体验戴夫的教学关卡？";
      
      public static const TD_Movie:String = "是否观看剧情动画？";
      
      public static const Main_LoginoutServer:String = "服务器维护中，请稍后再试。";
      
      public static const Main_Offline:String = "与服务器连接不稳定，请稍后再试。";
      
      public static const Main_Reconnect_Error:String = "您已与服务器断开连接，请稍后尝试。";
      
      public static const EMBATTLE_SAME_PLANT:String = "同名植物出现在同一阵型中的数量最多为1个!";
      
      public static const EMBATTLE_NO_PLANT:String = "阵容不能没有植物上阵!";
      
      public static const EMBATTLE_MAX_PLANT:String = "当前等级最多只能上阵{0}植物";
      
      public static const EMBATTLE_AUTO_FIX_HP_TIP:String = "防守部队被攻击后自动恢复：<br>* 生命：低于100%时自动使用金币补满<br>* 健康度：低于所设置阀值时自动使用绷带补满<br>注意：系统不会自动购买道具，请预备充足的金币和绷带以便使用。不论在线或者离线，自动恢复均可生效";
      
      public static const EMBLATT_DEFEND_NOT_OUT:String = "驻防中的队伍不能出征!请选择其他未驻防的队伍!";
      
      public static const Quest_State_Unfinished:String = "未完成";
      
      public static const Quest_State_Receive:String = "可领取";
      
      public static const Quest_Main_Type:String = "[主线]";
      
      public static const Quest_Branch_Type:String = "[支线]";
      
      public static const Quest_Daily_Type:String = "[每日]";
      
      public static const Quest_Act_Type:String = "[活动]";
      
      public static const Quest_Main_Type_Easy:String = "[主]";
      
      public static const Quest_Branch_Type_Easy:String = "[支]";
      
      public static const Quest_Daily_Type_Easy:String = "[每]";
      
      public static const Quest_Act_Type_Easy:String = "[活]";
      
      public static const Quest_Receive_Tip:String = "[{0}]任务达成";
      
      public static const Addict_UnRegister_Tip:String = "您的身份信息不完整，将会自动受到防沉迷系统监督，若想消除该系统影响，请您登陆<font color=\'#76bdf9\'><u><a href=\'http://jkyx.qq.com\' target=\'_blank\'>jkyx.qq.com</a></u></font>补充填写完整，防沉迷系统对年满18岁以上玩家无限制。";
      
      public static const Addict_Not_Adult:String = "您的身份信息显示您未满18岁，属于防沉迷系统限制范畴。请合理安排您的游戏时间，适度游戏，及时休息。如需修改实名认证信息请前往<font color=\'#76bdf9\'><u><a href=\'http://jkyx.qq.com\'  target=\'_blank\'>jkyx.qq.com</a></u></font>";
      
      public static const Addict_disappearLeftTime_Tip:String = "{0}秒后自动关闭";
      
      public static const Addict_1_Hour_Tip:String = "您累计在线时间已满1小时";
      
      public static const Addict_2_Hour_Tip:String = "您累计在线时间已满2小时";
      
      public static const Addict_3_Hour_Tip:String = "您累计在线时间已满3小时，收益将减半。请您下线休息，做适当身体活动";
      
      public static const Addict_4_Hour_Tip:String = "您已经进入疲劳游戏时间，您的游戏收益将降为正常值的 50％，为了您的健康，请尽快下线休息，做适当身体活动，合理安排学习生活。";
      
      public static const Addict_5_Hour_Tip:String = "您已进入不健康游戏时间，为了您的健康，请您立即下线休息。 如不下线，您的身体将受到损害，您的收益已降为零，直到您的累计下线时间满 5 小时后，才能恢复正常。";
      
      public static const Addict_Player_Tip:String = "抵制不良游戏，拒绝盗版游戏。注意自我保护，谨防受骗上当。适度游戏益脑，沉迷游戏伤身。合理安排时间，享受健康游戏。";
      
      public static const LS_PLAY_PASSED_LEVEL_TIP:String = "挑战已满星的关卡不会获得奖励\n是否确定要再次挑战？";
      
      public static const LS_UNLOCK_GATE_TIP:String = "当前钥匙数量不足，冒险模式首次通关会获得钥匙。是否前往冒险模式？";
      
      public static const RecruitCard_NotEnoughClip:String = "<font color=\'#ff0000\'>当前碎片不足</font>，无法合成\n(可拆解卡牌获得碎片)";
      
      public static const RecruitCard_EnoughClip:String = "消耗<font color=\'#c4ff49\'>{0}</font>个碎片招募当前卡牌";
      
      public static const RecruitCard_ClipTip:String = "\"万能碎片\"可以通过拆解卡牌获得，\n可用来招募卡牌";
      
      public static const RecruitCard_Success_Tip:String = "恭喜你成功招募<font color=\'#c4ff49\'>{0}</font>,快去卡牌库看看吧！";
      
      public static const LS_StageUnlock_Tooltip:String = "第{0}章";
      
      public static const LS_StageLock_Tooltip:String = "达到{0}级解锁第{1}章";
      
      public static const LS_StageLock_Tooltip_2:String = "打通上一章解锁本章";
      
      public static const LS_STAGE_INHERIT_TOOLTIP:String = "可以继承上周积分，积分时间按继承操作计算\n上周积分：{0}\n消耗：{1}x{2}";
      
      public static const City_BuildingTip:String = "{0}\n<font color=\'#ff0000\'>小镇等级达到{1}开启。</font>";
      
      public static const CITY_DURABILITY_TIP:String = "小镇耐久度：{0}/{1}\n每天恢复10\n迁城后3倍恢复";
      
      public static const CARD_BUY_ONE:String = "买一个";
      
      public static const CARD_BUY_TEN:String = "买十个";
      
      public static const CARD_EXCHANGE:String = "兑换";
      
      public static const CARD_FREE:String = "免费领取";
      
      public static const CARD_PACKAGE_ONE_TIP:String = "{0}后免费";
      
      public static const CARD_PACKAGE_TEN_TIP_NO_CD:String = "幸运草：<font color=\'#00FF00\'>{0}/10</font> 集满必得<font color=\'#C739C0\'>稀有植物</font>";
      
      public static const CARD_PACKAGE_FRIENDPOINT_TIP:String = "今日免费次数：<font color=\'#00FF00\'>{0}/{1}</font>";
      
      public static const CARD_PACKAGE_FRIENDPOINT_NO_TIMES:String = "今日免费次数已用完";
      
      public static const CARD_PACKAGE_ONE_FIRST_DESC:String = "首次购买必得<font color=\'#0078FF\'>杨桃(3星)</font>";
      
      public static const CARD_PACKAGE_ONE_DESC:String = "再买 <font color=\'#00FF00\'>{0}</font> 个经验豆必得<font color=\'#00FF00\'>3星植物</font>";
      
      public static const CARD_PACKAGE_TEN_DESC:String = "买十个必送3星植物，概率获得<font color=\'#C739C0\'>稀有植物</font>";
      
      public static const CARD_PACKAGE_FRIENDPOINT_FIRST_DESC:String = "首次兑换必定获得一个植物";
      
      public static const CARD_PACKAGE_FRIENDPOINT_DESC:String = "友情点兑换奖励，必定获得随机植物碎片";
      
      public static const CARD_PACKAGE_ONE_BUY_INFO:String = "买一个经验豆";
      
      public static const CARD_PACKAGE_TEN_BUY_INFO:String = "买十个经验豆";
      
      public static const CARD_PACKAGE_FRIENDPOINT_BUY_ERROR_INFO:String = "您需要更多[{0}]才能兑换友情奖励！";
      
      public static const CARD_PACKAGE_TEN_TOOLTIP:String = "每次【买十个】经验豆即可激活一棵幸运草，当获得<font color=\'#C739C0\'>稀有植物</font>时幸运草清零。累积9棵幸运草后，再次【买十个】必得一个<font color=\'#C739C0\'>稀有植物</font>";
      
      public static const CARD_BATTLE_CARD_MARKET_TITLE:String = "戴夫的小酒吧";
      
      public static const CARD_BUYBEAN_TIP:String = "买经验豆\t送卡牌植物";
      
      public static const CARD_FRIENDPOINT_TIP:String = "友情奖励";
      
      public static const CARD_USE_DRAWCARDTICKET_TIP:String = "本次将消耗 {0}x{1}，是否确定使用？";
      
      public static const CARD_USE_DRAWCARDTICKET_INUSE:String = "{0}使用成功";
      
      public static const CARD_FORGE_STAR_ERROR:String = "叶绿素星级过低，无法使用";
      
      public static const Union_MyInvite:String = "我的邀请";
      
      public static const Union_Donate_Tip:String = "小镇等级低于<font color=\'#00FF00\'>{0}</font>级，捐献上限<font color=\'#FFF668\'>{1}</font>\n小镇等级高于<font color=\'#00FF00\'>{0}</font>级，捐献上限<font color=\'#FFF668\'>{2}</font>";
      
      public static const Union_WattingCD:String = "（{0}冷却结束）";
      
      public static const Union_Create_NameLenTip:String = "请输入8字以内";
      
      public static const Union_Create_LevelLimit:String = "等级{0}";
      
      public static const Union_Create_Success:String = "联盟创建成功";
      
      public static const Union_Create_PleaseInputName:String = "请输入联盟名称！";
      
      public static const Union_Create_Name_Syntax_Error:String = "联盟名称必须为字母数字或者中文";
      
      public static const Union_Create_Need_Higher_Level:String = "创建联盟需要{0}级";
      
      public static const Union_Create_Need_Coin:String = "创建联盟需要{0} x {1}";
      
      public static const Union_Apple_Fail_NotPlaces:String = "该联盟人数已满，可以试试其他联盟哦";
      
      public static const Union_Info_LevelInfo:String = "{0}级";
      
      public static const Union_Bidding_Success:String = "联盟竞价成功！";
      
      public static const Union_Bidding_Rule:String = "1.根据出价每天排名，排名靠前的联盟更容易被申请\n2.排名每天0点刷新，刷新会清空上一次的出价和排名\n3.每天刷新前可继续加价，只有盟主可以进行竞价\n4.竞价需要消耗联盟经验，每次出价最低消耗1经验\n";
      
      public static const Union_Declaration_Empty:String = "联盟竞价宣言不能为空！";
      
      public static const Union_Bidding_Exp_Empty:String = "联盟竞价的经验不能为0！";
      
      public static const Union_Bidding_Input_Exp_Error:String = "联盟竞价的经验不能大于联盟经验！";
      
      public static const Union_Donate_Coin_Error:String = "联盟捐献金币不能为0";
      
      public static const Union_Donate_Coin_insufficient:String = "金币不足";
      
      public static const Union_Apply_Reach_Limit:String = "同时最多可申请加入{0}个联盟";
      
      public static const Union_Announcement_Empty:String = "联盟公告宣言不能为空！";
      
      public static const Union_Announcement_Edit_Success:String = "联盟公告更新成功！";
      
      public static const Union_Levelup_Success:String = "联盟升级成功！";
      
      public static const Union_Levelup_inCD:String = "联盟升级冷却中，还需要{0}天{1}小时{2}分钟";
      
      public static const Union_Donate_Success:String = "联盟捐献成功！";
      
      public static const Union_Change_QQGroup_Success:String = "修改QQ群成功！";
      
      public static const Union_QQGroup_Err:String = "请输入要修改的联盟QQ群号";
      
      public static const Union_Change_Union_Flag_Success:String = "修改联盟旗帜！";
      
      public static const Union_Invite_Success:String = "邀请成功";
      
      public static const Union_Garden_Log_Format:String = "{0} <font color=\'#00FF00\'>{1}</font>使用了{2},联盟经验+{3},个人贡献+{4}\n";
      
      public static const Union_Member_Info:String = "{0} / {1}人";
      
      public static const Union_Announcement_Default:String = "这个盟主很懒，什么都没写...";
      
      public static const Union_Quit_Success:String = "你已经成功退出联盟！";
      
      public static const Union_Kick_Confirm:String = "确认要将{0}踢出联盟？";
      
      public static const Union_Kick_Success:String = "踢出联盟成员成功！";
      
      public static const Union_Garden_Muck_Consume:String = "使用{0},消耗{1}";
      
      public static const Union_Dissolve_Error:String = "联盟中还有其他盟员，盟主无法退出联盟";
      
      public static const Union_Dissolve_Tip:String = "退盟后您的联盟将解散，您确定要退盟吗？";
      
      public static const Union_Quit_Tip:String = "退出联盟后冷却时间内不可加入其他联盟，确认要退盟吗?\n<font color=\'#FF0000\'>加入其它联盟冷却时间为8小时</font>\n<font color=\'#FF0000\'>加入原联盟冷却时间为{0}小时</font>";
      
      public static const Union_Temple_Rule_Tip:String = "1,每天20:30~21:00为植物大作战活动时间，期间不能领取奖励\n2,游乐场、马戏团被占领该据点累计时间最长的盟夺取\n3,奖励内容在每天植物大作战结束后更新\n4,奖励每天每人可领取1次\n5,奖励总份数为联盟等级对应的上限人数\n6,大战期间游乐场每5分钟会发放游乐场礼包给当前占领联盟";
      
      public static const Unoin_Temple_Bonus_Error_HasTake:String = "已领取过奖励";
      
      public static const Unoin_Temple_Bonus_Error_NoTemple:String = "植物大作战期间不能领取奖励";
      
      public static const Unoin_Temple_Bonus_Error_NotEnough:String = "没有可领取的奖励";
      
      public static const Union_SearchID_Error:String = "搜索的联盟ID错误，请重新输入";
      
      public static const Union_SearchID_Not_Find:String = "搜索的联盟未找到";
      
      public static const Union_Start_Delate_Success:String = "盟主弹劾成功，48小时后盟主将移交给您，盟主上线可取消该弹劾";
      
      public static const Union_Appoint_Success:String = "操作成功";
      
      public static const Union_Start_Deliver_Success:String = "盟主将于48小时后转移成功，您可在48小时内再次点击该盟员取消转移";
      
      public static const Union_Cancel_Deliver_Success:String = "取消移交";
      
      public static const Union_Authorization_Tip1:String = "需盟主才可操作";
      
      public static const Union_Delater_In_Process:String = "盟主弹劾已启动，弹劾时间{0}";
      
      public static const Union_Temple_Reward_Tip:String = "植物大作战奖励\n";
      
      public static const Union_Temple_Type_1_Reward:String = "游乐场奖励：{0} x {1}";
      
      public static const Union_Temple_Type_2_Reward:String = "马戏团奖励：{0} x {1}";
      
      public static const Union_Temple_Capture_Reward:String = "攻占奖励：{0} x {1}";
      
      public static const Union_Postion_Leader:String = "盟主";
      
      public static const Union_Postion_DeputyLeader:String = "副盟主";
      
      public static const Union_Postion_Elite:String = "精英";
      
      public static const Union_Postion_Member:String = "成员";
      
      public static const Union_MemberState_Online:String = "在线";
      
      public static const Union_Offline_1_Day:String = "1天以内";
      
      public static const Union_Offline_2_Day:String = "2天以内";
      
      public static const Union_Offline_3_Day:String = "3天以内";
      
      public static const Union_Offline_4_Day:String = "超过3天";
      
      public static const Union_Offline_5_Day:String = "超过4天";
      
      public static const Union_Offline_6_Day:String = "超过5天";
      
      public static const Union_Offline_7_Day:String = "超过6天";
      
      public static const Union_Offline_8_Day:String = "1周以上";
      
      public static const Union_Offline_14_Day:String = "2周以上";
      
      public static const Union_Offline_1_Month:String = "1月以上";
      
      public static const Union_Not_Access:String = "暂未开放，尽请期待";
      
      public static const Union_NoEnough_LeftTime:String = "今日施肥次数已用完";
      
      public static const Union_Garden_UseDiamond_Tip:String = "购买{0}";
      
      public static const Union_HonorTile_Tip:String = "联盟成员： {0} / {1}";
      
      public static const Union_NPC_Tooltip_HonorManager:String = "点击进入联盟商店";
      
      public static const Union_NPC_Tooltip_TradeManager:String = "点击进入寻宝大作战";
      
      public static const Union_SET_ONE_KEY_INFO_SUCCESS:String = "联盟准入条件设置成功";
      
      public static const UNION_SKILL_UNLOCK:String = "小镇{0}级解锁";
      
      public static const UNION_SKILL_COST:String = "消耗个人贡献：{0}";
      
      public static const UNION_SKILL_PROPERTY:String = "全体上阵植物{0} + {1}";
      
      public static const UNION_SKILL_NEED_LEVEL:String = "小镇等级：{0}";
      
      public static const UNION_SKILL_NEED_DONATE:String = "个人贡献：{0}";
      
      public static const UNION_SKILL_NOT_ENOUGH_LEVEL:String = "（等级不足）";
      
      public static const UNION_SKILL_NOT_ENOUGH_DONATE:String = "（个人贡献不足）";
      
      public static const UNION_SKILL_LEVEL_MAX:String = "已达等级上限";
      
      public static const UNION_SKILL_LEVEL_ZERO:String = "未升级";
      
      public static const OFFLINE_ACTIVITY_TIP:String = "当日完成{0}个任务可领取";
      
      public static const OFFLINE_LOGIN_TIP:String = "累计登录{0}天领取";
      
      public static const Union_Event_1:String = "{0} <a href=\"event:uin#{1}\"><font color=\"#00ff00\">{2}</font></a> 加入联盟";
      
      public static const Union_Event_2:String = "{0} <a href=\"event:uin#{1}\"><font color=\"#ff0000\">{2}</font></a> 退出联盟";
      
      public static const Union_Event_3:String = "{0} 您的联盟在上次植物大作战中夺取了 <font color=\"#00ff00\">{1}个游乐场和 {2}个马戏团</font>";
      
      public static const Union_Event_4:String = "{0} <a href=\"event:uin#{1}\"><font color=\"#00ff00\">{2}</font></a> 的小镇被 <a href=\"event:uin#{3}\"><font color=\"#ff0000\">{4}</font></a> 攻破了";
      
      public static const Union_Event_5:String = "{0} <a href=\"event:uin#{1}\"><font color=\"#ff0000\">{2}</font></a> 攻破了 <a href=\"event:uin#{3}\"><font color=\"#00ff00\">{4}</font></a> 的小镇";
      
      public static const Union_Event_6:String = "{0} 联盟升级为 <font color=\"#00ff00\">{1}</font>";
      
      public static const Union_Event_7:String = "{0} 原盟主 <a href=\"event:uin#{1}\"><font color=\"#00ff00\">{2}</font></a> 被弹劾，现盟主为 <a href=\"event:uin#{3}\"><font color=\"#00ff00\">{4}</font></a>";
      
      public static const Union_Event_8:String = "{0} 原盟主 <a href=\"event:uin#{1}\"><font color=\"#00ff00\">{2}</font></a> 将盟主移交给 <a href=\"event:uin#{3}\"><font color=\"#00ff00\">{4}</font></a>";
      
      public static const Union_Event_9:String = "{0} <a href=\"event:uin#{1}\"><font color=\"#00ff00\">{2}</font></a> 从 <font color=\"#ff0000\">{3}</font> 变为 <font color=\"#00ff00\">{4}</font></a> ";
      
      public static const Union_Event_10:String = "{0} <a href=\"event:uin#{1}\"><font color=\"#00ff00\">{2}</font></a> 开启了联盟副本第{3}章节 ";
      
      public static const Union_Event_11:String = "{0} {1} <font color=\"#00ff00\">{2}</font> 调整了联盟准入条件 ";
      
      public static const Union_Event_12:String = "{0} <a href=\"event:uin#{1}\"><font color=\"#00ff00\">{2}</font></a> 领取了联盟争霸赛盟主奖励";
      
      public static const ATTRIBUTE_1:String = "攻击";
      
      public static const ATTRIBUTE_2:String = "防御";
      
      public static const ATTRIBUTE_3:String = "生命";
      
      public static const ATTRIBUTE_4:String = "护盾";
      
      public static const ATTRIBUTE_5:String = "技力";
      
      public static const ATTRIBUTE_6:String = "命中";
      
      public static const ATTRIBUTE_7:String = "闪避";
      
      public static const ATTRIBUTE_8:String = "暴击";
      
      public static const ATTRIBUTE_9:String = "韧性";
      
      public static const ATTRIBUTE_10:String = "免疫";
      
      public static const ATTRIBUTE_SPEED:String = "先攻";
      
      public static const BAG_TAB_EQUIP:String = "装备";
      
      public static const BAG_TAB_USE:String = "使用";
      
      public static const BAG_TAB_BATCH_USE:String = "批量使用";
      
      public static const BAG_TAB_SHOW:String = "展示";
      
      public static const BAG_TAB_SELL:String = "出售";
      
      public static const BAG_TAB_COMPOUND:String = "合成";
      
      public static const BAG_TAB_DECCOMPOSITION:String = "拆解";
      
      public static const BAG_USE_ERROE_1:String = "等级不足,还不能使用该物品!";
      
      public static const FRIEND_ICON_TIP_BATTLE:String = "好友切磋";
      
      public static const FRIEND_ICON_TIP_GIFT:String = "赠送体力";
      
      public static const FRIEND_ICON_TIP_BALANCE:String = "天平切磋";
      
      public static const FRIEND_ICON_TIP_SEAL:String = "偷菜";
      
      public static const FRIEND_ICON_TIP_QQ:String = "QQ好友";
      
      public static const FRIEND_ICON_TIP_TD:String = "塔防通关{0}";
      
      public static const FRIEND_NO_UNION:String = "您还没有加入联盟。";
      
      public static const FRIEND_APPLY_SUCCEED:String = "好友申请发送成功";
      
      public static const FRIEND_GIFT_ENERGY_COUNT:String = "今日还可赠送{0}次";
      
      public static const FRIEND_TAKE_ENERGY_COUNT:String = "今日还可领取{0}次体力";
      
      public static const FRIEND_FIGHT_COUNT:String = "今日好友切磋奖励还有{0}次";
      
      public static const FRIEND_FIGHT_LIMIT_TIP:String = "今日好友切磋奖励次数已达上限";
      
      public static const FRIEND_BALANCE_ERROR:String = "只有同服好友才能挑战";
      
      public static const FRIEND_ENERGY_NOTES:String = "1.游戏好友与盟友间可以相互赠送体力。每次可以赠送5点体力，并获得10友情点<br>2.每人每天至多向好友赠送体力20次，以及收取体力10次<br>3.对同一好友每天只能赠送一次体力，无论是否领取隔日都可以再次赠送<br>4.收取体力至多保留最新的50条记录，同一好友赠送的体力只保留最新的一次";
      
      public static const MAP_VIEW_INFO:String = "点击查看";
      
      public static const MAP_CHANGE_CD:String = "功能冷却中....\n剩余时间：{0}天";
      
      public static const MAP_MINE_BUFF:String = "矿场金币加成：{0}%";
      
      public static const MAP_TEMPLE_BUFF:String = "占领{0}奖励";
      
      public static const MAP_CHANGE_CONFIRM:String = "确定要迁城吗？";
      
      public static const MAP_FRIEND_LOGIN_TIP:String = "该好友最近一次登录是在{0}，暂时无法查看地图信息。";
      
      public static const MAP_SPEED:String = "使用【{0}】后当前行军时间将减少{1}%";
      
      public static const MAP_SPEED_SUCCESS:String = "加速成功";
      
      public static const MINE_SELF_MINE:String = "我的矿区：{0}/{1}";
      
      public static const MINE_REWARD_COIN:String = "收获成功，获得金币{0}";
      
      public static const MINE_RECELL_SUCCESS:String = "部队撤回成功";
      
      public static const MINE_SETOUT_SUCCESS:String = "部队出征成功";
      
      public static const MINE_TIP_VIEW_TEAM:String = "查看驻防部队";
      
      public static const MINE_NO_IDLE_CAR:String = "没有空闲的矿车，不能开始采集";
      
      public static const VIP_SPEED_L_1:String = "已是正常游戏速度，无法再降低";
      
      public static const VIP_SPEED_R_1:String = "点击开启2倍加速功能";
      
      public static const VIP_SPEED_L_2:String = "恢复正常速度";
      
      public static const VIP_SPEED_R_2:String = "VIP或小镇等级大于{0} 开启4倍加速";
      
      public static const VIP_SPEED_R_2_VIP:String = "点击开启4倍加速功能";
      
      public static const VIP_SPEED_L_3:String = "点击后恢复为2倍加速";
      
      public static const VIP_SPEED_R_3:String = "已是最大加速";
      
      public static const VIP_PHYSICAL_FULL:String = "当前体力满满，正是冒险好时节，快去冒险吧！";
      
      public static const VIP_PHYSICAL_BUY:String = "开通包月";
      
      public static const VIP_PHYSICAL_CLOSE:String = "关闭";
      
      public static const VIP_HAS_LEVEL_UP:String = "已有更高档VIP生效，无法使用，请于现有VIP到期后再使用。";
      
      public static const VIP_HAS_LEVEL_LOW:String = "使用成功后，现有VIP会立即到期后消失。请确认是否继续使用？";
      
      public static const VIP_SWEEP_ALL:String = "{0}及以上时可使用连续扫荡功能";
      
      public static const VIP_PHYSICAL_GET:String = "‘{0}’每日可领取{1}体力";
      
      public static const VIP_TICKET_GET:String = "‘{0}’每日可领取{1}钻石";
      
      public static const PHYSICAL_BUY_NO_TICKET:String = "购买体力需要{0}个钻石，您当前钻石数量不足哦";
      
      public static const PHYSICAL_BUY:String = "购买{0}点体力";
      
      public static const HPYSICAL_BUY_NEW:String = "花费<font color=\'#00FF00\'>{0}钻石</font>，补充{1}体力<br>（今天还可购买{2}次）";
      
      public static const VIP_TIP:String = "当前未处于VIP状态\n想了解VIP详情请点击图标";
      
      public static const VIP_TIP_NO_OPEN:String = "未激活";
      
      public static const VIP_TIP_OPEN:String = "{0}天";
      
      public static const VIP_TIP_LEFT_DAY:String = "VIP剩余: {0}天{1}时\nVIP类型为‘{2}’,详情点击图标查看";
      
      public static const LEVEL_UP_REWARD:String = "{0}级可领取以下奖励";
      
      public static const VIP_CONVENIENT:String = "<font color=\'#92ff87\'>【更加便捷】</font>";
      
      public static const VIP_DAILY_REWARD:String = "<font color=\'#8de8ff\'>【更多奖励】</font>";
      
      public static const VIP_DAILY_PRIVILEGE:String = "<font color=\'#df93ff\'>【更多特权】</font>";
      
      public static const VIP_BATTLE_ATTR:String = "<font color=\'#ff9921\'>【VIP专属属性】</font>";
      
      public static const VIP_PRIILEGE_TIP:String = "激活VIP 即可在{0}天享受以下多项福利:";
      
      public static const VIP_NO_ADD_ENGERY:String = "\n激活VIP可增加体力上限";
      
      public static const VIP_ADD_ENGERY:String = "\n{0}增加体力上限:{1}";
      
      public static const VIP_NO_V3_TIPS:String = "激活<font color=\'#FEF834\'>VIP3</font>赠送<font color=\'#57D6E9\'>3600</font>钻石";
      
      public static const SIGNIN_REWARD_TIP:String = "<font color=\'#00FF00\'>本月第{0}次签到可领取此奖励</font>";
      
      public static const SIGNIN_REMAIN_TIP_FREE:String = "本次补签需要使用0张补签卡。\nVIP每月前{0}次补签免费。";
      
      public static const SIGNIN_REMAIN_TIP_WITH_ITEM:String = "本次补签需要使用1张补签卡。\n本月免费补签次数已用完。";
      
      public static const SIGNIN_REMAIN_CONFIRM:String = "本月免费补签次数已用完。是否使用1张补签卡进行补签？";
      
      public static const SIGNIN_REMAIN_ALERT_TITLE:String = "补签提示";
      
      public static const SIGNIN_NORMAL_SUCCESS:String = "签到成功";
      
      public static const SIGNIN_VIP_SUCCESS:String = "恭喜！您本次签到获得了VIP{0}双倍奖励！";
      
      public static const SIGNIN_BUY_VIP:String = "本次签到可领取单份奖励。\n升级至VIP{0}可领取双倍奖励，是否购买VIP{0}或继续签到？";
      
      public static const SIGNIN_BUY_REMAIN_CARD:String = "购买补签卡";
      
      public static const ALLY_AT_HOME:String = "我盟的 [{0}] 驻扎在我家 ， {1} 后返回";
      
      public static const BANK_ERROR_TIP:String = "你的矿区中没有矿车在开采";
      
      public static const BANK_ERROR_TITLE:String = "金库提示";
      
      public static const BANK_GET_GOLD:String = "收获金币{0}";
      
      public static const PREVIEW_POINT_TIP:String = "{0}\nX坐标：{1}\nY坐标：{2}";
      
      public static const PREVIEW_TEMPLE_TIP:String = "{0}\nX坐标：{1}\nY坐标：{2}\n{3}";
      
      public static const PREVIEW_NO_UNION:String = "<font color=\'#00CC00\'>未有联盟占领</font>";
      
      public static const PREVIEW_UNION_NAME:String = "联盟<font color=\'#0099FF\'>{0}</font>占领";
      
      public static const MOVE_CITY_IS_OUT:String = "当前有队伍在出征中。不能进行迁城。";
      
      public static const EMBATTLE_PLANT_MAX:String = "提高小镇等级可以增加上阵植物数量！\n小镇{0}级可上阵{1}个植物";
      
      public static const EMBATTLE_PLANT_MAXII:String = "最多上阵6个自己植物，第7个阵为好友植物";
      
      public static const WORLD_BOSS_GW_SUC:String = "鼓舞成功！\n今日世界BOSS战斗中攻击提升{0}！";
      
      public static const WORLD_BOSS_HDGZ_DESC:String = "1.参与条件：小镇等级≥16级；\n2.活动期间，BOSS被击杀15分钟后会重新复活，直到活动结束；\n3.每个BOSS当天只可进攻一次，每次进攻可通过“复活”继续挑战5次；\n4.对单个BOSS累计达到30万伤害的镇长可获得参与奖励。进入伤害前500名可额外获得排名奖励。对BOSS造成最后一击的镇长可获得击杀奖励；\n5.若BOSS未死亡，参加该场BOSS战斗的镇长将无法获得伤害排名奖励；\n6.如果BOSS当天被击杀≥5次，隔天就会升级，击杀次数越多，提升等级也越高；如果被击杀≤2次，隔天会降低1级";
      
      public static const WORLD_BOSS_GIFT_TIPS:String = "每天对任意世界BOSS造成≥30万伤害后可领取";
      
      public static const WORLD_BOSS_GIFT_TIPS2:String = "每天对任意世界BOSS造成≥30万伤害即可领取参与奖励！";
      
      public static const EXCHANGE_STORE_REFRESH_MAX:String = "今日刷新已达上限!";
      
      public static const EXCHANGE_STORE_REFRESH_NEED:String = "你是否愿意消耗 {0}*{1} 刷新兑换列表？";
      
      public static const EXCHANGE_STORE_REFRESH_TIP:String = "消耗{0}*{1} 刷新兑换列表";
      
      public static const BUILD_NOTICE_MARKET:String = "可以兑换";
      
      public static const BUILD_NOTICE_BANK:String = "金矿已满";
      
      public static const BUY_COIN_TIP:String = "您的金币不够哦。是否使用钻石进行金币兑换？";
      
      public static const BUY_ENERGY_TIP:String = "您的体力不足。是否使用钻石购买体力？";
      
      public static const BUY_ENERGY_TIP_VIP:String = "您是<font color=\'#00FF00\'>{0}</font>，每天可购买体力<font color=\'#00FF00\'>{1}</font>次，今天还剩余<font color=\'#00FF00\'>{2}</font>次";
      
      public static const BUY_ENERGY_TIP_VIP_MAX:String = "体力不足，体力每过{0}分钟会自然恢复{1}点。";
      
      public static const ZOMBIE_ISLAND_REFRESH_COUNT:String = "今日剩余次数:{0}";
      
      public static const ZOMBIE_ISLANDE_RESET_CONFIRM:String = "是否确定重置僵尸岛?";
      
      public static const ZOMBIE_ISLAND_TIP_HELP:String = "游戏说明";
      
      public static const ZOMBIE_ISLAND_TIP_EXCHANGE:String = "兑换商店";
      
      public static const ZOMBIE_ISLAND_TIP_TAKEALL:String = "一键领取";
      
      public static const ZOMBIE_ISLAND_DIED_MAX:String = "出战植物死光光了，不能继续（需要策划提供更准确的提示）";
      
      public static const ZOMBIE_ISLAND:String = "僵尸岛:";
      
      public static const ZOMBIE_ISLAND_PREPARE_MIN_ERROR:String = "您的出战植物数量未满，不能出战";
      
      public static const ZOMBIE_ISLAND_PREPARE_MAX_ERROR:String = "上阵植物已满";
      
      public static const ZOMBIE_ISLAND_PREPARE_NOT_FULL:String = "您的出战植物未满{0}个，是否开始出战";
      
      public static const ZOMBIE_ISLAND_PREPARE_NOT_SAVE:String = "还未完成布阵，是否确认退出布阵";
      
      public static const SHOP_CONFIRM_BUY:String = "购买{0}x{1}";
      
      public static const SHOP_BUY_OK:String = "成功购买{0}个{1}";
      
      public static const SHOP_BUY_DESC:String = "  {0}需要消耗<font color=\'#00FF00\'>{1}{2}</font>{3}，是否确定购买？";
      
      public static const SHOP_BUY_LIMIT_COUNT:String = "该道具已经被抢购完了哦!";
      
      public static const SHOP_BUY_LIMIT_TIME_OUT:String = "限时抢购已结束.请期待下一次抢购活动!";
      
      public static const SHOP_BUY_BUY_TOMORROW:String = "该道具今日已经被抢购完!";
      
      public static const SHOP_BUY_BLUEVIP_TIP:String = "<font color=\'#00FF00\'>蓝钻贵族尊享充值8折</font>";
      
      public static const CARD_UPGRADE_BUTTON_TIP:String = "植物星级越高，技能及免伤能力越强";
      
      public static const CARD_ENHANCE_BUTTON_TIP:String = "使用叶绿素强化植物，提升属性";
      
      public static const CARD_PUZZLE_BUTTON_TIP:String = "完成拼图可以提升植物品质";
      
      public static const CARD_SWAP_BUTTON_TIP:String = "植物属性交换";
      
      public static const CARD_AWAKE_BUTTON_TIP:String = "觉醒植物获得大量属性和酷炫特效";
      
      public static const CARD_FRUIT_BUTTON_TIP:String = "催熟植物果实，快速提高战力";
      
      public static const CARD_DNA_BUTTON_TIP:String = "改良植物基因，获得额外能力";
      
      public static const CARD_PLANTARMOR_BUTTON_TIP:String = "选好装甲专精，让战斗事半功倍";
      
      public static const CARD_PLANTENVOLUTION_BUTTON_TIP:String = "植物进化，强化植物战力！";
      
      public static const CARD_PUZZLE_PIECE_TOOLTIP:String = "名字：{0}\n增加属性：{1}\n拥有数量：{2}\n需求数量：{3}";
      
      public static const CARD_PUZZLE_DOUBLE_CLICK:String = "双击可拼入";
      
      public static const CARD_PUZZLE_HAS_FILL:String = "(已完成)";
      
      public static const CARD_PUZZLE_SWEEP_TIP:String = "VIP或副本三星可扫荡";
      
      public static const CARD_PUZZLE_NO_POINT:String = "拼图点不足";
      
      public static const CARD_PUZZLE_NEED_CARD_LEVEL:String = "需要植物等级达到{0}级，才能购买";
      
      public static const CARD_PUZZLE_POINT_BUY_TIP:String = "花费相应的拼图点，填补指定的拼图块";
      
      public static const RECHARGE_REBATE_TIP:String = "仅在活动期间内充值满指定金额金钻才可获得对应奖励";
      
      public static const TREASRE_SNATCH_SUC:String = "夺宝成功,可以从战报列表中查看战斗过程.";
      
      public static const TREASRE_SNATCH_FAIL:String = "抢夺失败,请再接再厉.可以从战报列表中查看战斗过程.";
      
      public static const TREASURE_INTR_TIP:String = "1. 寻宝活动每天10:00开启，小镇20级即可参与<br>2. 每人每天可以寻宝3次，以及夺宝3次<br>3. 寻宝需要两人合作进行，持宝图即可参与。当联盟>=3级时可以选择限定与盟友合作<br>4. 夺宝需要击败寻宝双方才能成功，并且只能抢夺其他联盟（寻宝双方至少有一人未加入联盟或属于其他联盟）<br>5. 奖励内容：寻宝成功可获得全部奖励，失败获得一半奖励；夺宝成功可获得一半奖励，失败没有奖励<br> 一星宝图：金币*20000，一星叶绿素*2<br> 二星宝图：金币*30000，一星叶绿素*4，洗炼药水*10<br> 三星宝图：金币*40000，一星叶绿素*6，洗炼药水*10<br> 四星宝图：金币*50000，一星叶绿素*8，洗炼药水*20<br> 五星宝图：金币*60000，一星叶绿素*10，洗炼药水*30";
      
      public static const TREASRE_FIGHT_REPORT_TIP:String = "战报";
      
      public static const TREASRE_NOT_IN_TIMER:String = "当前时间不在活动时间范围内.不能进行寻宝。";
      
      public static const TREASRE_SITE_END_TIME:String = "距离活动结束时间不到5分钟，不能寻宝。";
      
      public static const TREASRE_SNATCH_COUNT_MAX:String = "今日夺宝次数达到上限。不能夺宝。";
      
      public static const TREASRE_SNATCH_CD:String = "夺宝尚处在冷却中,请稍后再试.";
      
      public static const Online_WeeklyReward_Tip:String = "1、累计在线时间达到指定时长<br>即可积累对应一档每周在线奖励<br><br>2、每周一至周日期间可一次性<br>领取上周累计的所有奖励<br><br>3、每一周的累计奖励单独计算<br>，不能叠加，请记得及时领取哦";
      
      public static const Online_WeeklyReward_NotReward:String = "暂无奖励";
      
      public static const Online_WeeklyReward_hasTaken:String = "奖励已领取";
      
      public static const NUTRITION_PLANT_NAME_1:String = "初级营养师";
      
      public static const NUTRITION_PLANT_NAME_2:String = "中级营养师";
      
      public static const NUTRITION_PLANT_NAME_3:String = "高级营养师";
      
      public static const NUTRITION_PLANT_NAME_4:String = "特级营养师";
      
      public static const NUTRITION_PLANT_NAME_5:String = "顶级营养师";
      
      public static const NUTRITION_PLANT_NAME_6:String = "传说中的营养师";
      
      public static const NUTRITION_PLANT_TIP:String = "{0}\n费用<font color=\'{3}\'>{1}</font>金币{2}\n点击和营养师交易，有概率获得试剂\n营养师等级越高，获得的试剂品质更高";
      
      public static const NUTRITION_PLANT_NOT_ACTIVE:String = "点击和营养师交易，有概率获得试剂\n营养师等级越高，获得的试剂品质更高\n（未激活）";
      
      public static const NUTRITION_NEED_EXP:String = "升级药粉:";
      
      public static const NUTRITION_INIT_EXP:String = "初试药粉:";
      
      public static const NUTRITION_POS_EXIST_REAGENT:String = "不能同时放入两个相同类型的药剂，请放入其他类型的药剂！";
      
      public static const NUTRITION_ALL_TO_EXP_NO_REAGENT:String = "当前背包中没有任何药剂,可以点击获取试剂进入获取界面.";
      
      public static const NUTRITION_ALL_TO_EXP_CONFIRM:String = "是否确认将所有药剂分解成药粉?";
      
      public static const NUTRITION_MERGE_EXP:String = "{0}将吞噬{1}，获得{2}药粉。";
      
      public static const NUTRITION_TO_EXP_CONFIRM:String = "是否将{0}药剂分解成药粉?";
      
      public static const NUTRITION_BOTTLE_EXPT_TIPS:String = "将试剂拖入经验瓶中可以凝聚为经验";
      
      public static const NUTRITION_UPGRADE_NEDD_EXP:String = "药剂药粉不足，请选择可以提升的等级。";
      
      public static const NUTRITION_SP_CALL_TIP:String = "花费{0}钻石可以直接召唤顶级营养师\n可以获得紫色/橙色试剂\n同时额外可以获得黄金原液\n更有机会召唤传说中的营养师！";
      
      public static const NUTRITION_TRADE_TITLE:String = "{0}超级交易结束";
      
      public static const NUTRITION_EXCHANGE_COUNT:String = "兑换所需黄金原液不足.不能兑换";
      
      public static const NUTRITION_REAGENT_SLOT:String = "{0}级解锁";
      
      public static const NUTRITION_EXP_TOOL_TIP:String = "分解药剂获得，可用于药剂升级，提高药剂属性";
      
      public static const NUTRITION_RESOLVE_TIP:String = "自动分解所有紫色以下品质药剂，获得药粉";
      
      public static const NUTRITION_PICK_ALL_TIP:String = "拾取所有非灰色药剂";
      
      public static const NUTRITION_SUPER_TRADE_TIP:String = "按照需求自动配置药剂，点击进行设置";
      
      public static const NUTRITION_NORMAL_TRADE_TIP:String = "自动配置药剂";
      
      public static const NUTRITION_GOLD_REAGENT_TIP:String = "【召唤】高级营养师获得，可兑换高端药剂";
      
      public static const NUTRITION_PICK_TIP:String = "拾取药剂";
      
      public static const NUTRITION_RESOLVE_ALL_TIP:String = "分解背包内所有药剂，获得药粉";
      
      public static const NUTIRTION_RESOLVE_ONE_TIP:String = "选择指定药剂分解，获得药粉";
      
      public static const NUTRITION_EXCHANGE_TIP:String = "使用黄金原液兑换高级药剂";
      
      public static const NUTRITION_USE_TICKET:String = "使用营养师证书召唤成功";
      
      public static const NUTRITION_ATTRIBUTE_ADD:String = "{0}增加：<font color=\'#00FF00\'>{1}</font>";
      
      public static const EXIT_GAME_TIPS:String = "【未完成事件】\n{0}";
      
      public static const EXIT_GAME_ENERGY:String = "您还剩余{0}点体力，";
      
      public static const EXIT_GAME_GIFT:String = "在线奖励未领取,";
      
      public static const EXIT_GAME_GIFT_TIME:String = "{0}后可领取奖励,";
      
      public static const UPGRADE_3366_LEVEL:String = "<u>马上去升级</u>";
      
      public static const MAIL_ALL_UNION_MEMBER:String = "全体盟友";
      
      public static const MAIL_UNION_DISABLE:String = "只有盟主或者副盟主才能操作";
      
      public static const MAIL_DEL_TIP:String = "确定要删除该邮件吗？";
      
      public static const MAIL_HAS_ATTACHMENT_TIP:String = "有附件尚未领取，请领取后再删除邮件";
      
      public static const LS_ICON_Achievements_TOOLTIP:String = "成就——塔防模式取得，用于解锁精英关卡";
      
      public static const LS_ICON_KEY_TOOLTIP:String = "钥匙——冒险模式产出，用于解锁主线关卡";
      
      public static const FIRST_CHARGE_TIP:String = "1. 通过充值购买任意数量金钻或VIP（团购、免费植物、塔防特权除外）即可领取首充好礼\n2. 完成首次充值后，请到首充好礼面板领取奖励\n3. 每个大区角色可参与首充活动一次";
      
      public static const CARD_REACH_MAXLEVEL_TIP:String = "当前等级已达上限，提高小镇，可以提高植物等级上限";
      
      public static const CARD_NOT_ENOUGH_BEAN_TIP:String = "经验豆不足";
      
      public static const CARD_FAST_LEVEL_UP:String = "点击后自动使用适当数量的经验豆，升至下一级";
      
      public static const CARD_ForgeLevel:String = "强化等级";
      
      public static const CARD_RANK:String = "品质";
      
      public static const CARD_Forge_MAX_Tip:String = "已到强化最大等级，无法继续强化";
      
      public static const CARD_AVATER_LOCK_TIP:String = "请通过“拼图”提升该植物品质才能解锁新形象";
      
      public static const CARD_AVATER_Forge_Forbid:String = "该植物形象不可强化";
      
      public static const CARD_AVATER_BUY_TIP1:String = "当前没有{0}，本次购买将消耗{1}钻石";
      
      public static const CARD_AVATER_BUY_TIP2:String = "当前拥有<font color=\'#FF00F00\'>{0} x {1}</font>，本次购买将消耗{0} x {2}，{0}不足，<font color=\'#FF00F00\'>将额外消耗{3}钻石</font>";
      
      public static const CARD_AVATER_BUY_TIP3:String = "当前拥有<font color=\'#00FF00\'>{0} x {1}</font>，本次购买将消耗{0} x {2}，<font color=\'#00FF00\'>不消耗钻石</font>";
      
      public static const CARD_AVATER_BUY_TIP4:String = "当前拥有<font color=\'#FF00F00\'>{0} x {1}</font>，本次兑换将消耗{0} x {2}，{0}不足";
      
      public static const CARD_AVATER_FORGE_TIP1:String = "当前没有时装水晶，本次强化将消耗{0}钻石";
      
      public static const CARD_AVATER_FORGE_TIP2:String = "当前拥有{0} x {1}，本次强化将消耗{0} x {2}，{0}不足，将额外消耗{3}钻石";
      
      public static const CARD_AVATER_FORGE_TIP3:String = "当前拥有{0} x {1}，本次强化将消耗{0} x {2}，不消耗钻石";
      
      public static const MARKET_ITEM_NOT_ENOUGH:String = "兑换物品不足";
      
      public static const MARKET_ITEM_HAS_EXCHANGED:String = "已经兑换";
      
      public static const EVERY_DAY_BUY_COMFIRM:String = "是否确定花费{0}点券兑换{1}?";
      
      public static const EVERY_DAY_BUY_TICKET_ERR:String = "点券不足，通过免费植物活动可获取点券哦！";
      
      public static const EVERY_DAY_TICKET_TIP:String = "点券:\n用于在免费植物活动中兑换强力植物或其他奖励.";
      
      public static const SINGLES_DAY_DESC:String = "1.活动时间：{0}月{1}日-{2}月{3}日\n2.每天可签到1次，不可补签，每签到1次可领取1个累计成长宝箱，点击宝箱开启。\n3.{4}月{5}日可额外领取双十二特别好礼，仅限当日领取。";
      
      public static const SINGLES_DAY_TIP:String = "仅限{0}月{1}日当天领取";
      
      public static const BUFF_GOLD_EXCHANGE:String = "<font color=\'#FF0000\'>额外2倍暴击!</font>";
      
      public static const FUBEN_ALL_STAR_OPEN_BOX:String = "满星能够打开宝箱领取丰富奖励";
      
      public static const FUBEN_NEXT_CHAPTER_NULL_TIP:String = "下一章尚未开放，敬请期待!";
      
      public static const RANK_NO_INDEX:String = "未上榜";
      
      public static const RANK_TRIAL:String = "第{0}关";
      
      public static const RANK_VIEW_TEAM:String = "查看";
      
      public static const ENDLESS_UPGRADE_NO_RAIN:String = "强化所需强化点不足.";
      
      public static const ENDLESS_RANK_GOOD:String = "赞美：点赞玩家获得{0}金币";
      
      public static const ENDLESS_RANK_BAD:String = "鄙视：需消耗{0}金币";
      
      public static const ENDLESS_RANK_GOOD_ME:String = "不能对自己进行赞美和鄙视.";
      
      public static const ENDLESS_LEVEL_NO_PASS:String = "角色等级达到{0}级开启无尽塔防.";
      
      public static const ENDLESS_RANK_BAD_TIPS:String = "鄙视需要花费{0}金币";
      
      public static const ENDLESS_RECHALLENGE_MAX:String = "今日无尽塔防挑战次数已达上限.请明日再来 .";
      
      public static const ENDLESS_BOX_GIFT:String = "打开宝箱领取无尽塔防奖励.";
      
      public static const ENDLESS_UPGRADE_MAX:String = "强化等级达到上限.";
      
      public static const ENDLESS_REWARD_NO:String = "当前无可领取奖品.\n挑战无尽塔防可获得丰富奖品.";
      
      public static const ENDLESS_RAIN_COUNT:String = "雨露数量：<font color=\'#00FF00\'>{0}</font>";
      
      public static const ENDLESS_CURRENT_SCORE:String = "当前分数：<font color=\'#00FF00\'>{0}</font>";
      
      public static const ENDLESS_LEVEL_NAME:String = "<font color=\'#00FF00\'>第{0}轮关卡</font>";
      
      public static const ENDLESS_PLANT_COUNT:String = "{0}x<font color=\'#00FF00\'>{1}</font>";
      
      public static const ENDLESS_PLANT_TITLE_OLD:String = "旧存档信息：";
      
      public static const ENDLESS_PLANT_TITLE_NEW:String = "新存档信息：";
      
      public static const ENDLESS_NO_PLANT:String = "尚未选择出战植物！\n好的选择，好的开始！";
      
      public static const ENDLESS_SAVE_SUCCESS:String = "存档成功，请继续你的挑战~";
      
      public static const ENDLESS_SAVE_MUST_PAY:String = "此功能须在“首次任意充值”后才能免费使用";
      
      public static const CARD_HEALTH_FULL:String = "植物健康度低于{0}时会降低植物属性";
      
      public static const CARD_HEALTH_NOT_FULL:String = "健康度低于{0}的植物部分属性-{1}%\n请及时恢复健康度";
      
      public static const CARD_HEALTH_DESC:String = "1.每次进行出征或者防御，根据战斗双方的实力决定参与战斗的植物的健康度损耗程度\n" + "2.单个植物的健康度减少到80以下之后，该植物的全部自身属性（基础属性，强化属性）按照一定的百分比削减\n" + "3.单个植物的健康度每30分钟回复6点";
      
      public static const CARD_HEALTH_OUT:String = "该植物未在小镇内或健康度已满，不能恢复健康度";
      
      public static const CARD_HEALTH_RECOVER:String = "消耗1个绷带可完全恢复该植物健康度";
      
      public static const SHELLING_TIP:String = "1. 椰子炮之战，使用大炮、小炮消灭僵尸可获得随机数量积分。\n小炮 获得至少30积分，一定几率暴击获得35或40积分\n大炮 获得至少220积分，一定几率暴击获得240或360积分\n2. 积分用于在积分兑换商店中兑换各种奖励，活动过期后清零，请记得及时使用！\n3、活动时间：{0}~{1}\n4、兑换截止时间：{2}";
      
      public static const THANKS_GIVING_GET:String = "获得{0}";
      
      public static const THANKS_GIVING_TIMES_OVER:String = "抽奖次数已用完，请明日再来!";
      
      public static const THANSK_GIVING_QQ_DOLL:String = "恭喜获得QQ公仔一枚.工作人员会尽快与您取得联系!";
      
      public static const THANSK_GIVING_QQ:String = "恭喜获得 {0}Q币.当日获得Q币将于下一个工作日统一发放,请注意查收!";
      
      public static const THANKS_GIVING_NO_REWARD:String = "你当前没有获得任何奖励,抽奖可获得丰厚奖励哦!";
      
      public static const THANKS_GIVING_MAX:String = "最多显示最近的5条礼品记录";
      
      public static const EXPED_AREA_POS_1:String = "初级 {0},{1}";
      
      public static const EXPED_AREA_POS_2:String = "中级 {0},{1}";
      
      public static const EXPED_NOT_GO:String = "无法跨地图";
      
      public static const EXPED_ENEMY_STATE_1:String = "正常";
      
      public static const EXPED_ENEMY_STATE_2:String = "免战中";
      
      public static const EXPED_ENEMY_STATE_3:String = "宣战中";
      
      public static const EXPED_ENEMY_STATE_4:String = "交战中";
      
      public static const EXPED_REBUILD_TIP:String = "可使用或购买小镇重建令将小镇耐久度恢复到100";
      
      public static const EXPED_REBUILD_NEED_BUY:String = "可消耗{0}钻石购买小镇重建令将小镇耐久度恢复到100";
      
      public static const EXPED_REBUILD_USE_SUCCESS:String = "成功使用小镇重建令，将小镇耐久度恢复到{0}";
      
      public static const EXPED_RULE_TIP:String = "<font color=\'#00FF00\'>讨伐玩家：</font>战胜后可掠夺对方小镇金库的部分金币，并降低对方小镇耐久度。每天可免费出征5次。\n" + "<font color=\'#00FF00\'>讨伐矿区：</font>战胜后可掠夺对方矿区的全部金币。每天至多可出征矿区20次。\n" + "<font color=\'#00FF00\'>讨伐马戏团/游乐场：</font>参与每天20:30-21:00的植物大作战，打败守军后可占据游乐场/马戏团，使联盟成员获得大量奖励。\n" + "<font color=\'#00FF00\'>注意：</font>只允许出征与自己在同一地图上的目标；可通过世界地图选择迁移到其他地图。";
      
      public static const ACTIVITY_FOR_TIMES_LIMIT:String = "活动时间:";
      
      public static const MAPTROOP_INF:String = "<font color=\'{0}\'>{1}</font>  {2}  {3}";
      
      public static const SERVER_ACTIVITY_RULE_TIP:String = "1. 开服活动自新服开启当日起开始，截止到开服第7天结束时结算镇长成绩和排行\n2. 成绩和排行结算完成后，开服活动将继续展示7天。在此期间，镇长的成绩和排行不再更新，但能领取已获得的奖品\n3. 冲级、充值活动和世界树培养礼中达到指定档次后可即时领取对应奖励\n4. 战力排行、成就排行活动须在截止日期结算后方能领取排名奖励\n5. 请各位镇长在活动结束前及时领取活动奖励，避免不必要的损失\n";
      
      public static const BATTLE_LINE_SWEEP_TIP:String = "VIP用户1星 2星可以扫荡\n非VIP用户三星可以扫荡";
      
      public static const BATTLE_FIGHT_COUNT_MAX:String = "已达到挑战次数上限，请明日再来。";
      
      public static const BATTLE_SPEED_UP_TIP:String = "{0}级开启加速,开启VIP立即享受4倍加速，立即开启";
      
      public static const SWEEP_TIME_LIMIT:String = "扫荡次数已达上限";
      
      public static const TRIAL_RESET_CONFIRM:String = "本次重置将消耗{0}，确认重置？";
      
      public static const TRIAL_RESET_MAX:String = "重置次数已达上限";
      
      public static const TRIAL_LEFT_BATTLE_TIMES_TIP:String = "每当挑战新关卡失败时扣除一次<br>如果剩余次数为零，则无法继续挑战新关卡";
      
      public static const TRIAL_RESET_TIP:String = "每天都有<font color=\'#00FF00\'>1</font>次免费重置次数，记得用哦\n{0}可以花费钻石额外重置<font color=\'#00FF00\'>{1}</font>次\n（剩余付费次数<font color=\'#00FF00\'>{2}</font>）";
      
      public static const NUTRITION_SUPER_TRADE_BUFF_TIP:String = "消耗相同的金币将获得更多的药粉噢";
      
      public static const RANK_ARENA_CHALLENGE_TIME_REMAIN:String = "今日免费挑战次数: {0}/{1}";
      
      public static const RANK_ARENA_PAY_CHALLENGE_TIME_REMAIN:String = "今日付费挑战次数: {0}/{1}";
      
      public static const ACT_PINBALL_ALL_DEAD:String = "所有坚果已被击碎，请重置后再来。";
      
      public static const ACT_PINBALL_TIPS:String = "1、活动期间，每日可以获得三次免费弹珠的机会。第二天重置。\n" + "2、使用弹珠弹中坚果即可获得坚果上对应的积分，累积达到指定积分即可领取奖励。\n" + "3、使用一个弹珠，每次可以弹中一个坚果；使用一包弹珠，每次可以弹中屏幕中的所有坚果。\n";
      
      public static const YETI_TD_RULE_DESC:String = "1.参与条件：小镇等级到达28级" + "\n2.参加限制：每天免费1次，额外付费1次" + "\n3.选择适合自己的挑战难度后，许愿自己所希望得到的奖励物品，即可进入暴走雪人出没的关卡。击杀它并通过关卡就可以获得宝箱钥匙。" + "\n4.难度越高奖励越好" + "\n5.参加次数会在每天24:00重置，23:45——24:00之间无法进入关卡";
      
      public static const YETI_TD_RESLUT_TIP:String = "点击打开箱子,每次消耗一把钥匙";
      
      public static const PRIVILEGE_YELLOW_DIAMOND:String = "黄钻特权";
      
      public static const PRIVILEGE_BLUE_DIAMOND:String = "蓝钻贵族可以尊享以下特权：\n1.每日特权礼包\n2.蓝钻新手礼包\n3.蓝钻尊贵标识\n4.蓝钻升级奖励\n5.蓝钻年费礼包\n6.钻石充值8折";
      
      public static const PRIVILEGE_3366:String = "3366特权";
      
      public static const PRIVILEGE_IWAN:String = "爱玩特权";
      
      public static const STRENGTHEN_LEVEL_CONDITION:String = "小镇{0}级开启";
      
      public static const STRENGTHEN_TIME_CONDITION:String = "开服{0}天开启";
      
      public static const STRENGTHEN_TD_CONDITION:String = "塔防通关第一章开启";
      
      public static const STRENGTHEN_UNION_CONDITION:String = "您还未加入联盟";
      
      public static const STRENGTHEN_VIP_NULL:String = "未激活VIP";
      
      public static const STRENGTHEN_NOT_OPEN:String = "未激活";
      
      public static const STRENGTHEN_UNION_LV5:String = "联盟等级需要5";
      
      public static const STRENGTHEN_ACT_NOT_OPEN:String = "活动未开启";
      
      public static const GUIDE_SKIP_TIP:String = "点此按钮将跳过相关的一系列引导";
      
      public static const GARDEN_FIELD_UNLOCK_NEED_VIP:String = "\n提前解锁要求：VIP{0}";
      
      public static const GARDEN_UNLOCK_FIELD:String = "是否花费{0}钻石提前解锁此地块";
      
      public static const GARDEN_BUY_POT:String = "是否花费{0}金币购买花盆";
      
      public static const GARDEN_EXP_BAR_TIP:String = "卡牌经验{0}\n卡牌经验超过10000点时，可以转化为一颗小经验豆。点击小经验豆可以进行提取。";
      
      public static const GARDEN_EXP_BAR_TIP_WITH_EXP_PLUS:String = "卡牌经验{0}\n<font color=\'#35B0DF\'>{1}</font>\n卡牌经验超过10000点时，可以转化为一颗小经验豆。点击小经验豆可以进行提取。";
      
      public static const GARDEN_BUY_PET_ALERT_EXP:String = "是否消耗<font color=\'#00FF00\'>{0}钻石</font>试用24小时此宠物，购买后自动使用此宠物，并清空其他宠物的试用时间。";
      
      public static const GARDEN_BUY_PET_ALERT_FOREVER:String = "是否消耗<font color=\'#00FF00\'>{0}钻石</font>永久购买此宠物，购买后自动使用此宠物，并清空其他宠物的试用时间。";
      
      public static const GARDEN_USE_PET_ALERT:String = "是否使用当前宠物，使用后将清空其他宠物的试用时间。";
      
      public static const GARDEN_TAKE_PET_ALERT:String = "是否领取当前宠物，领取后将清空其他宠物的试用时间。";
      
      public static const GARDEN_HINT_PLANT:String = "点击可打开种子栏，选择种子可进行种植";
      
      public static const GARDEN_HINT_FERTILIZER:String = "植物需要施肥，请点击进行施肥。施肥后植物可持续产出经验，持续4小时。";
      
      public static const GARDEN_POT_TIP_BUY:String = "请点击购买花盆";
      
      public static const GARDEN_POT_TIP_NORMAL_PART1:String = "{0}级花盆\n当前经验产量为{1}%,\n";
      
      public static const GARDEN_POT_TIP_NORMAL_PART2:String = "小镇等级达到{0}级可升至下一级";
      
      public static const GARDEN_EXP_TIP_DESC:String = "<font color=\'#FFFF00\'>注：以上产量是基于每20秒连续拾取经验球的情况下计算的平均产量，可能与实际有少许出入。使用宠物是保证连续拾取的方法。</font>";
      
      public static const GARDEN_BASE_EXP_BUFF:String = "植物基础产量：{0}";
      
      public static const GARDEN_PET_CRIT_BUFF:String = "宠物暴击增益：{0}";
      
      public static const GARDEN_POT_LEVEL_BUFF:String = "花盆等级增益：{0}";
      
      public static const GARDEN_ACTIVITY_BUFF:String = "阳光房收获季：{0}";
      
      public static const GARDEN_FERTILIER_BUFF:String = "使用化肥增益：<font color=\'{1}\'>{0}</font>";
      
      public static const GARDEN_PET_EXP_BUFF:String = "宠物额外经验：{0}";
      
      public static const GARDEN_NOT_OPEN:String = "未激活";
      
      public static const GARDEN_NO_ACTIVITY:String = "活动未开启";
      
      public static const GARDEN_NEED_FERTILIZER_NOW:String = "<font color=\'#FF0000\'>需要施肥</font>";
      
      public static const GARDEN_NEED_FERTILIZER_TIME:String = "<font color=\'#70FCFB\'>{0}</font>后需再次施肥";
      
      public static const GARDEN_EXP_PER_HOUR:String = " + {0}经验/时";
      
      public static const GARDEN_EXP_PLANT_CONTENT:String = "<font color=\'{1}\'>{0}经验/时</font>";
      
      public static const GARDEN_EXP_BUFF_PERCENT:String = " x {0}%";
      
      public static const GARDEN_NO_FERTILIZER_BUFF:String = "<font color=\'#FF0000\'>（尚未施肥，不能收获）</font>";
      
      public static const GARDEN_TOTAL_EXP:String = "<font color=\'#FFFF00\'>产量：</font><font color=\'{2}\'>{0}</font>{1}";
      
      public static const GARDEN_EXPRESSION_TIP:String = "计算公式：植物基础 * 花盆等级增益 * 化肥增益 * 宠物暴击增益 + 宠物额外经验。\n其中：";
      
      public static const GARDEN_DIG_PLANT:String = "确定要铲除植物吗？";
      
      public static const GARDEN_SHOVEL_TIP:String = "点击铲除已种植植物";
      
      public static const GARDEN_BUY_FERTILIZER:String = "点击购买化肥";
      
      public static const GARDEN_NO_KETTLE:String = "没有金水壶，请先购买";
      
      public static const GARDEN_USE_KETTLE_TIP:String = "对经验类植物（向日葵）使用，可以直接获得4小时经验产量\n对道具类植物使用，可以减少4小时的成熟等待时间。\n每日可以使用{1}次金水壶。\n<font color=\'#FFFF00\'>金水壶使用方法：</font>点击花盆右上方的“金水壶”完成使用\n当日已用次数：{0}/{1}";
      
      public static const GARDEN_POT_TIP:String = "<font color=\'#00FF00\'>{0}</font>级花盆\n当前由花盆提供的经验产量增益为<font color=\'#FFFF00\'>{1}%</font>\n{2}";
      
      public static const GARDEN_POT_UPGRADE_CONDITION:String = "小镇等级达到<font color=\'{1}\'>{0}</font>级可升至下一级";
      
      public static const GARDEN_POT_MAX:String = "<font color=\'#FF0000\'>该花盆已达最高等级</font>";
      
      public static const GARDEN_NO_FERTILIZER:String = "请购买化肥";
      
      public static const GARDEN_EXP_SEED_TIP:String = "{0}\n<font color=\'#FFFF00\'>使用金水壶可加速获得经验</font>";
      
      public static const GARDEN_ITEM_SEED_TIP:String = "{0}\n<font color=\'#FFFF00\'>使用金水壶或消耗钻石可加快成熟</font>\n{1}";
      
      public static const GARDEN_ITEM_WAIT_REWARD:String = "预计<font color=\'#70FCFB\'>{0}</font>后成熟";
      
      public static const GARDEN_ITEM_HAS_REWARD:String = "已成熟";
      
      public static const GARDEN_PET_TIP:String = "{0}\n{1}\n工作期间可以自动收集产出的经验球";
      
      public static const GARDEN_PET_WORK_TIME:String = "<font color=\'#FF0000\'>工作至{0}后休息</font>\n<font color=\'#FFFF00\'>休息时需要点击唤醒以继续工作</font>";
      
      public static const GARDEN_PET_WORK_FOREVER:String = "永久工作";
      
      public static const GARDEN_PET_SLEEP:String = "{0}\n睡觉中";
      
      public static const GARDEN_PET_FREE:String = "鼠标点击可使宠物进行工作，持续10小时";
      
      public static const GARDEN_ALL_EXP:String = "+{0}经验/时";
      
      public static const GARDEN_FERTILIZER_RULE_TIP:String = "1、化肥使用方法：单击选择有存量的化肥待用，点击花盆右上方的“化肥”完成使用。" + "\n2、某种化肥不足时，不可被选择待用，请先购买。" + "\n3、对植物使用化肥时，使用的是已选择待用的化肥。每次对向日葵施肥后，其效果持续4小时，时效结束后须再次使用化肥才能每20秒产出经验球。经验球需要捡取后才会再次产出经验球，建议使用宠物来自动捡取。" + "\n4、使用“自动施肥”后，会自动对已种植的向日葵使用已选择待用的化肥进行施肥，即使离线也会自动施肥。当已选择待用的化肥不足时，自动施肥功能将停止。" + "\n5、高级宠物可以收获更多经验。";
      
      public static const GARDEN_PET_RULE_TIP:String = "1. 宠物屋中有4种宠物可以培养，它们有不同的技能，为阳光房的植物经验产出提供加成<br>2. 宠物好感度：通过花费钻石购买一天和永久购买可以提高宠物好感度，1钻石=1好感度，当好感度累积达到指定数量时可解锁对应宠物<br>        天天 — 1000好感度<br>        圆圆 — 2000好感度<br>        甜甜 — 10000好感度<br>        壮壮 — 20000好感度<br>3. 永久购买可以直接解锁宠物，并且减少永久购买其他宠物的花费<br>4. 宠物每20秒就会收取一次经验球，在使用期间，即使离线，宠物也会一直工作";
      
      public static const WORLD_TREE_SOIL_TIP:String = "在阳光房中种植坚果种子（在线奖励获得）可以获得土壤";
      
      public static const ZOMBIE_ISLAND_TIP:String = "当前你非VIP2及以上玩家，不能开启每关第三个宝箱，将自动为您开启其余宝箱。";
      
      public static const SCRATCH_RULE:String = "活动规则：" + "\n1.每日奖池初始金额为1000钻石。" + "\n2.玩家每充值50钻石，奖池增加50钻石。";
      
      public static const SCRATCH_DIAMOND_INFO:String = "{0}钻石";
      
      public static const FRIEND_SET_FRIENDPLANT_TIP:String = "设置友情植物可以让好友在塔防中借用哦！";
      
      public static const UNION_FUBEN_EMBATTLE_ONE:String = "战斗时2个部队会依次挑战，请确认部队配置是否完备？";
      
      public static const UNION_FUBEN_EMBATTLE_CONTINUE:String = "开始战斗";
      
      public static const UNION_FUBEN_PASS_TIP:String = "必须通关上一章节才能开启当前章节。";
      
      public static const UNION_FUBEN_OPEN_NEED:String = "开启联盟副本章节需要消耗{0}凝聚力,是否确定开启?";
      
      public static const UNION_FUBEN_RESET_NEED:String = "重置联盟副本章节需要消耗{0}凝聚力,是否确定重置?";
      
      public static const UNION_FUBEN_COHESION_SMALL:String = "凝聚力不足.";
      
      public static const UNION_FUBEN_COHESION_UNION_TIP:String = " 盟主或副盟主可使用联盟凝聚力重置联盟副本。 ";
      
      public static const UNION_FUBEN_COHESION_ME_TIP:String = " 联盟成员每消耗1点体力，联盟获得1点联盟凝聚力。 ";
      
      public static const UNION_FUBEN_OPERATE_TIP:String = "只有联盟盟主以及副盟主才能开启或重置联盟副本";
      
      public static const UNION_FUBEN_NO_UNION:String = "您当前没有加入任何联盟，加入联盟才能参与联盟副本";
      
      public static const UNION_FUBEN_TIMES_OVER:String = "今日联盟副本次数已用尽,请明日再来!";
      
      public static const UNION_FUBEN_EVERY_DAY_REWARD:String = "联盟副本每日奖励:{0}\n当前挑战次数: {1}";
      
      public static const UNION_FUBEN_INTR_DESC:String = "1. 联盟副本系统在新区开服{0}天后解锁，由盟主（或副盟主）开启指定章节的联盟副本，并由所有小镇等级达到指定要求的盟员参与挑战<br>2. 联盟副本系统解锁后，盟员在游戏中每消耗1点体力将为联盟增加1点联盟凝聚力，每人每天至多1000点。如果是新进成员，需要从加入联盟第二日0点开始计算。联盟凝聚力将用于开启或重置联盟副本<br>3. 个人贡献的凝聚力将按10:1换算为联盟勋章奖励<br>4. 挑战联盟副本需要布置2个植物阵型，每次挑战所造成伤害为2个阵型输出伤害的总和<br>5. 个人挑战所造成的伤害将换算为金币奖励；如果造成当前关卡的最终击杀还将获得联盟勋章奖励<br>6. 每一章联盟副本通关后，所有参战盟员将获得通关奖励和总伤害排名奖励";
      
      public static const UNION_FUBEN_CHPATER_TIP_SYSJ:String = "剩余时间:{0}";
      
      public static const UNION_FUBEN_PASS_REWARD:String = "<font color=\'#FFF668\'>通关本章节后可在邮件领取</font>\n{0}";
      
      public static const EQUIPMENT_TYPE_1:String = "武器";
      
      public static const EQUIPMENT_TYPE_2:String = "帽子";
      
      public static const EQUIPMENT_TYPE_3:String = "衣服";
      
      public static const EQUIPMENT_TYPE_4:String = "护符";
      
      public static const EQUIPMENT_TYPE_5:String = "吊坠";
      
      public static const EQUIPMENT_TYPE_6:String = "信物";
      
      public static const EQUIPMENT_CLEAR_CLONE:String = "点击后可自动删除背包内所有克隆装备";
      
      public static const EQUIPMENT_RULE_TIP:String = "<font color=\'#00FF00\'>【装备】</font>\n    ●点击装备框边上的[+]，可以消耗材料合成基础白色装备。\n    ●点击装备框，可以对装备进行脱换操作。\n    ●进入装备界面，可以对装备进行升级、进阶、克隆等操作。\n" + "\n<font color=\'#00FF00\'>【装备培养】</font>\n    ●装备升级可以强化装备属性。\n    ●装备进阶可以改变装备外形、提升装备属性，消耗特殊材料和能量。\n    ●装备克隆可以让你快速复制现有装备，并给其他植物使用，有一定条件限制。\n" + "\n<font color=\'#00FF00\'>【能量池/附件】</font>\n    ●装备升级、进阶需要消耗能量。\n    ●能量池会随时间恢复能量，也可使用能量珠补充能量。\n    ●装备进阶、升级会让能量池累积经验升级，能量池升级后恢复速度/容量增加。\n    ●附件可以每日产生能量珠。\n    ●附件升级时可获得大量能量珠。附件等级越高，每日产量越高。";
      
      public static const EQUIPMENT_PART_DAILY_GET_TIP:String = "领取今天产生的免费能量珠";
      
      public static const EQUIPMENT_PART_TIP:String = "每日免费产生能量珠的先进装置\n升级后产量提高";
      
      public static const EQUIPMENT_PART_BEAD_COUNT_TIP:String = "到达上限后，无法领取每日免费能量珠";
      
      public static const EQUIPMENT_POOL_BEAD_TIP:String = "能量珠：使用后可恢复一定能量";
      
      public static const EQUIPMENT_POOL_USE_BEAD_TIP:String = "使用一颗能量珠，恢复能量";
      
      public static const EQUIPMENT_POOL_AUTO_USE_TIP:String = "装备升级进阶中能量不足时，自动使用能量珠";
      
      public static const EQUIPMENT_POOL_NAME_TIP:String = "{0}\n随时间恢复并储存能量\n用于装备的升级和进阶";
      
      public static const EQUIPMENT_POOL_EXP_BAR_TIP:String = "当前经验：{0}/{1}\n能量池经验：使用能量都会增长经验，攒满后能量池升级，恢复速度、容量增加。";
      
      public static const EQUIPMENT_POOL_CAPACITY_TIP:String = "能量池容量：能量达到上限后不再随时间增长，使用能量珠可突破上限，能量池升级后容量增加。";
      
      public static const EQUIPMENT_POOL_RECOVERY_TIP:String = "恢复速度：随时间自动恢复能量，能量池升级后恢复速度增加。";
      
      public static const EQUIPMENT_ENTRY_TIP:String = "升级、进阶、克隆装备";
      
      public static const EQUIPMENT_ENTRY_ERROR_TIP:String = "小镇20级开启";
      
      public static const EQUIPMENT_POSITION_TIP:String = "<font size=\'15\' color=\'#00FF00\'><b>{0}</b></font>\n点击选择装备穿戴";
      
      public static const EQUIPMENT_POSITION_UNLOCK_TIP:String = "小镇{0}级开启";
      
      public static const EQUIPMENT_BUY_BEAD_TIP:String = "<font color=\'#FFFF00\'>点击购买能量珠</font>\n能量珠*6  {0}钻石\n今天剩余次数：{1}/{2}";
      
      public static const EQUIPMENT_BUY_BEAD_LIMIT_TIP:String = "已达购买上限";
      
      public static const EQUIPMENT_CLONE_TIP:String = "克隆符合条件的装备，轻松培养植物大军";
      
      public static const EQUIPMENT_CLONE_ERROR_TIP:String = "<font color=\'#FF0000\'>总装备分不足{0}分，克隆功能未开启</font>\n<font color=\'#FFFF00\'>（现有装备共{1}分）</font>";
      
      public static const EQUIPMENT_LEVEL_TIP:String = "消耗能量加强装备，提升装备属性";
      
      public static const EQUIPMENT_LEVEL_LIST_TIP:String = " 1.【松木】     18.【钻石】     35.【栖梧】\n" + " 2.【桦木】     19.【夜光】     36.【飞瀚】\n" + " 3.【铁木】     20.【五彩】     37.【惊涛】\n" + " 4.【黑铁】     21.【疾风】     38.【冥河】\n" + " 5.【玄铁】     22.【烈火】     39.【摇光】\n" + " 6.【青铜】     23.【暴雨】     40.【逐月】\n" + " 7.【紫铜】     24.【大地】     41.【玄霆】\n" + " 8.【白银】     25.【黑暗】     42.【翠微】\n" + " 9.【秘银】     26.【光明】     43.【纵横】\n" + "10.【黄金】     27.【不死】     44.【神锥】\n" + "11.【白金】     28.【神圣】     45.【紫薇】\n" + "12.【精金】     29.【传奇】     46.【破军】\n" + "13.【冰玉】     30.【史诗】     47.【七杀】\n" + "14.【碧玉】     31.【初云】     48.【横行】\n" + "15.【翡翠】     32.【雄风】     49.【霸道】\n" + "16.【玛瑙】     33.【神霸】     50.【通天】\n" + "17.【猫眼】     34.【落霞】\n";
      
      public static const EQUIPMENT_RANK_TIP:String = "消耗材料与能量提升一格进度，进度满后进阶成功";
      
      public static const EQUIPMENT_WAIT_TIP:String = "敬请期待";
      
      public static const EQUIPMENT_RANK_NEED_TIP:String = "需要{0}个，当前拥有{1}";
      
      public static const EQUIPMENT_CREATE_TIP:String = "合成【{0}】\n需要：{1} {2}个\n现有：{3}个";
      
      public static const EQUIPMENT_PART_FIRST_REWARD_TIP:String = "附件升级赠送的能量珠\n点击领取";
      
      public static const EQUIPMENT_CLONE_SCORE_TIP:String = "【可克隆装备分】=最高的24件装备的总分/24";
      
      public static const EQUIPMENT_SCORE_TIP:String = "装备的评分（按照装备种类、等级、品阶计算得出）\n当目标【装备分】高于【可克隆装备分】，无法克隆";
      
      public static const EQUIPMENT_RANK_BAR_TIP:String = "进度满后装备品阶提升";
      
      public static const EQUIPMENT_LEVEL_BAR_TIP:String = "进度满后装备等级提升";
      
      public static const EQUIPMENT_ARROW_TIP:String = "有新鲜能量珠可领取，点击进入";
      
      public static const EQUIPMENT_PART_UPGRADE_TIP:String = "<font color=\'#FFFF00\' size=\'13\'><b>消耗特殊材料/钻石升级</b></font>\n<font color=\'#00FF00\'>升级后立刻获赠大量能量珠\n每日免费能量珠增加</font>\n\n[{0}] <font color=\'{3}\'>{1}</font>/{2}{4}{5}";
      
      public static const EQUIPMENT_PART_COST_DIAMOND:String = "\n{0}钻石 （材料不足）";
      
      public static const EQUIPMENT_PART_NEED_VIP:String = "\n消耗钻石补足零件<font color=\'{1}\'>需要VIP{0}</font>";
      
      public static const EQUIPMENT_CLONE_ERROR_LIMIT:String = "背包内克隆装备过多（超过25件），无法克隆";
      
      public static const EQUIPMENT_LEVEL_BUTTON_TIP:String = "耗能量进行一次升级操作，增加升级进度";
      
      public static const EQUIPMENT_LEVEL_ONE_KEY_BUTTON_TIP:String = "连续升级，直到装备等级提升";
      
      public static const EQUIPMENT_RANK_BUTTON_TIP:String = "消耗材料与能量提升一格进度，进度满后进阶成功";
      
      public static const EQUIPMENT_CLONE_BUTTON_TIP:String = "复制一件指定装备，指定装备的装备分不能高于【可克隆装备分】";
      
      public static const EQUIPMENT_CLONE_RULE_TIP:String = "●克隆可以免费复制装备，用于组建更多植物大军！\n" + "●每件装备会有一个装备分。 （按照等级、品阶、洗炼、特技等计算出）\n" + "●当玩家总装备分达到一定标准后便开启克隆功能\n" + "●克隆功能有限制，只能复制不高于【可克隆装备分】的装备\n" + "●【可克隆装备分】= 最高的24件装备的总分/24\n" + "●克隆品不可进行升级进阶等操作\n" + "●可以通过卖出来丢弃你不需要的克隆品，但是不给钱哦";
      
      public static const EQUIPMENT_POOL_UPGRADE_TIP:String = "<font color=\'1\'>{0}</font> >> <font color=\'{3}\'>{2}</font>\n（能量上限 <font color=\'#00FF00\'>+{4}</font>）\n（恢复速度 <font color=\'#00FF00\'>+{5}</font>）\n<font color=\'{7}\'>需要{6}</font>";
      
      public static const EQUIPMENT_POOL_MAX:String = "能量池已满级";
      
      public static const EQUIPMENT_POOL_ADD_CAPABILITY:String = "（升级 上限+{0}）";
      
      public static const EQUIPMENT_POOL_ADD_RECOVERY:String = "（升级 恢复+{0}）";
      
      public static const EQUIPMENT_FIND_NULL:String = "没有合适的装备可使用或克隆";
      
      public static const EQUIPMENT_CLONE_LIMIT_AND_CLEAR:String = "您背包内的克隆装备达到25件，是否清理背包内的克隆装备？";
      
      public static const BATTLE_LINEUP_TICKET_TIPS:String = "使用该植物需消耗{0}钻石";
      
      public static const SPRING_DAY_TIP:String = "仅限{0}月{1}日当天领取";
      
      public static const SPRING_RULE:String = "1：活动时间：{0}月{1}日-{2}月{3}日\n2、活动期间每天可签到1次，累计签到达到指定天数可打开对应宝箱\n3、在特定日期登录可额外领取好礼，仅限当天领取，逾期将无法补领";
      
      public static const PLANT_EXPLORE_NO_ROUTE:String = "请先选择一个地点开始探险，系统将根据推荐路线一键完成";
      
      public static const PLANT_EXPLORE_ONE_KEY_CONFIRM:String = "系统将自动使用{0}刷新地图，是否确认一键探险【路线{1}】?";
      
      public static const PLANT_EXPLORE_ONE_KEY_STOP:String = "由于{0}不足，探险终止！前往购买?";
      
      public static const PLANT_EXPLORE_ONE_KEY_REWARD:String = "你一键探险【路线{0}】,共刷新地图{1}次,是否继续?";
      
      public static const PLANT_EXPLORE_NO_ITEM:String = "当前{0}不足!是否前往商城购买?";
      
      public static const PLANT_EXPLORE_REFRESH_CONFIRM:String = "是否确定使用{0}*1刷新地图?";
      
      public static const PLANT_EXPLORE_INTR:String = "1. 每次探险可随机获得地点奖励；按照推荐路线连续进行3次探险，即可获得相应的路线额外奖励\n" + "2. 每天前3次探险免费，继续探险将消耗“探险火炬”；每天前3次刷新地图免费，继续刷新将消耗“望远镜”\n" + "3. 使用【一键探险】可自动消耗已有的火炬和望远镜，根据当前推荐路线进行探险\n" + "4. 活动期间，镇长每天可通过探险火炬进行最多{0}次探险(不包含3次免费探险)，探险次数与免费次数每天0点重置，刷新地图次数不限";
      
      public static const PLANT_EXPLORE_TITLE:String = "探险任意地点均可获得随机奖励哦！";
      
      public static const PLANT_EXPLORE_TITLE_NO_FREE:String = "今日剩余探险 {0} 次";
      
      public static const ACTIVITY_CHALLENGE_LIMIT_TIME_RULE:String = "1. 极限挑战—天梯竞斗场奖励根据本周日21:00天梯竞斗场的结算排名进行发放，最终进入本服指定名次前的镇长获得领奖资格<br>2. 每位镇长限领取当前排名所对应最高档次的奖励，并且只能领取一次。未及时领取的奖励将在次日0点后通过邮件发放";
      
      public static const ACTIVITY_CHALLENGE_LIMIT_TIME_RULE_2:String = "1. 每天\"植物大乱斗\"结束后，系统根据镇长当天的最高连胜场数计算奖励\n2. 最高连胜场数达到指定档次，即可在活动面板上领取对应一档的极限挑战大奖\n3. 未及时领取的奖励将在次日0时后通过邮件发放";
      
      public static const ACTIVITY_CHALLENGE_LIMIT_TIME_RULE_3:String = "1. 活动期间，镇长每天挑战僵尸岛通过指定关数即可领取对应一档的限时通关大奖（注：每天至多领取一档奖励）\n2. 各位镇长可延续上一次僵尸岛的进度继续挑战，挑战成功可计入当日成绩，失败则不计算\n3. 未及时领取的奖励将在镇长隔日登录后通过邮件发放\n";
      
      public static const WT_FREE_OVER:String = "世界树免费培养已用完!";
      
      public static const WT_NORMAL_TIP:String = "消耗土壤进行培养\n土壤可以在“阳光房” 种植坚果种子获得";
      
      public static const WT_ADV_TIP:String = "消耗钻石进行培养\n每日前5次半价\n高级培养有概率获得大暴击，额外5倍经验";
      
      public static const EXPED_ERROR_FREE_FULL_COUNT:String = "请先消耗已有次数，以免浪费";
      
      public static const EXPED_ERRO_PAY_FULL_COUNT:String = "当日可购买次数已经用完";
      
      public static const ACT_DF_51_DESC:String = "<font size=\'18\' color=\'#FFF668\'>除虫剂在哪里？</font>\n" + "1、活跃度的每个宝箱都会掉落1个除虫剂\n" + "2、每次购买体力也会赠送不定量的除虫剂\n" + "<font size=\'18\' color=\'#FFF668\'>戴夫怎么发奖励？</font>\n" + "1、每日集满<font color=\'#46f022\'>{0}</font>个除虫剂即可向戴夫领取一袋阳光房种子。\n" + "2、活动期间帮助戴夫收集到一定数量的除虫剂即可获得戴夫赠送的丰富奖励哦\n" + "<font size=\'18\' color=\'#FFF668\'>活动时间：</font>\n" + "<font size=\'15\' color=\'#46f022\'/>{1}</font>";
      
      public static const ACT_DF_51_TODAY_DESC:String = "今日收集满<font color=\'#46f022\'> {0} </font>个除虫剂即可额外领取";
      
      public static const CHILDREN_DAY_HISTORY_SCORE:String = "历史最高积分{0}";
      
      public static const CHILDREN_DAY_RULE:String = "活动时间：{0}月{1}日-{2}月{3}日，每日00:00更新，请及时领取奖励。\n游戏规则：镇长可以在30秒内通过操控豌豆射手攻击太空中的僵尸，注意避开红色的僵尸，击毁TA们会扣除爱心。当剩余爱心或剩余时间减少到0时本轮游戏结束。\n游戏结束后可领取当天最高成绩包含的所有礼包，每种礼包每天限领一次。";
      
      public static const BAG_RequireLevelTip:String = "\n\n<font color=\'#FF0000\'>需求等级{0}以上</font>";
      
      public static const TD_PRIVILEGE_RULE_DESC:String = "塔防特权价值100Q点，特权内容包括：\n1.拥有额外卡牌槽一个！\n2.开启自动拾取阳光功能！\n3.获取强力植物提前解锁的资格！";
      
      public static const TD_PRIVILEGE_EXTERN_CARD_TIPS:String = "开启塔防特权，额外获得卡牌槽，点击查看详情";
      
      public static const TD_PRIVILEGE_ENTRY_ICON_TIPS:String = "开启塔防特权，点击查看详情";
      
      public static const TD_PRIVILEGE_AUTO_COLLECT_SUN_TIPS:String = "开启塔防特权，获得自动拾取阳光功能，点击查看详情";
      
      public static const TD_PRIVILEGE_BUY_SUN_ALERT:String = "购买<font color=\'#ffcc00\'>{0}阳光</font>";
      
      public static const TD_PRIVILEGE_BUY_BEAN_ALERT:String = "购买<font color=\'#00ff00\'>能量豆</font>";
      
      public static const TD_PRIVILEGE_BUY_TOYCAR_ALERT:String = "购买<font color=\'#00ffff\'>小推车</font>";
      
      public static const CARD_BAR_DESC:String = "必出<font color=\'#FFFD5D\'>热点植物</font>或<font color=\'#FFFD5D\'>热点植物碎片</font>";
      
      public static const CARD_BAR_LUCK_RULE:String = "幸运值集满后必得热点植物";
      
      public static const CARD_BAR_NEED_VIP:String = "需要{0}才能购买，是否前去开通？";
      
      public static const CARD_BAR_RULE_TIP:String = "1. 每次购买神秘卡包可获得5项奖励，包括诱人经验豆×1，随机道具3项，以及当前热点植物×1或热点植物碎片2-4个\n2. 当幸运值未满时，每次抽卡获得热点植物的概率因植物稀有度而不同：<br>   史诗植物 2.5% <br>   传奇植物 5.0%<br>   稀有植物 8.8%<br>3. 每次购买神秘卡包可获得500幸运值，集满幸运值时100%获得当前热点植物\n4. 每当获得热点植物时，幸运值重置从零开始。祝大家好运哟！\n5. 热点植物每天零点自动更新，也可以通过【换一个】进行手动刷新（鼠标指向神秘卡包可查看刷新植物范围）";
      
      public static const CASTLE_DICE_CNT_TIP:String = "剩余{0}次免费掷骰机会";
      
      public static const CASTLE_RULE:String = "1. 期待已久的皇陵大门终于开启，各位镇长可前往皇陵1-3层进行探索，挑战新手、老手和高手3种难度共9个关卡\n2. 每层皇陵地图中分布有10个宝箱，集齐全部90个宝箱，你将能够开启最终的皇陵秘宝！\n3. 进入皇陵后，你需要通过掷出骰子（2-6点）来获得行动步数，选择行动路线并将沿途经过的宝箱奖励收入囊中。当到达地图的终点后，你可以选择进入下一关继续挑战\n4. 活动开启时，你将拥有{0}次免费掷骰机会来完成皇陵迷踪的起步，记得及时使用哦~";
      
      public static const CASTLE_BOX_TIP:String = "<font color=\'#ffff00\'>打开皇陵神秘宝箱</font>\n{0}";
      
      public static const ActRechargeRebate_Rule:String = "1.活动期间将记录消费的金钻，当消费金钻数量达到指定档位可以领取对应的奖励<br>2.消费金钻为累计金钻数量，例如：消费100金钻可领取第一档奖励，此时再消费100金钻即可领取下一档奖励<br>3.奖励只能在活动期间领取，请镇长们注意，避免不必要的损失";
      
      public static const LOGIN_ACTIVITY_WEEKLY_DESC:String = "<font color=\'{4}\'>{0}月{1}日-{2}月{3}日</font>礼包";
      
      public static const LOGIN_ACTIVITY_RULE:String = "感谢镇长一路陪伴！活动期间每天可以领取一个礼包，打开获得双份随机奖励；每周还可领取一份好礼，不要忘记来领哦！";
      
      public static const UNION_COMPETITION_NEXT_FIGHT:String = "下一轮比赛将于{0}开启请参赛联盟成员参战";
      
      public static const UNION_COMPETITION_FIGHT_OVER:String = "当前赛季比赛全部完成, 期待下一期的到来吧 .";
      
      public static const UNION_COMPETITION_FIGHTING:String = "当前正在进行比赛，参赛联盟玩家可观看自己联盟的比赛.";
      
      public static const UNION_COMPETITION_FINALIST_TIP:String = "·赛季分为”海选赛”和”淘汰赛”阶段 \n" + "·联盟战斗力榜排名前8位的联盟直接晋级淘汰赛，排名9至24位联盟参加海选赛以争夺8个晋级名额。 \n" + "·参赛的24个联盟在本赛季结束前不允许解散联盟。 \n" + "·赛季开启后新进的联盟成员无法参加本赛季比赛。 \n" + "·每人至多配置2支队伍，两支队伍按序号先后上场战斗。 \n" + "·海选赛比赛前，参赛联盟成员需点击“报名”按钮完成报名，才能在海选赛中代表联盟自动出战。\n" + "·海选赛比赛时，16个联盟进行15轮自动战斗的循环积分赛，决出海选赛8强以晋级淘汰赛。 \n" + "·历史最高战力低的成员其队伍先上场。战斗后的残余部队与对方的下个队伍战斗。 \n" + "·联盟交锋第一场战斗，以联盟总战力低的一方先出手；随后，战败一方的后续成员先出手。\n" + "·队伍战败不复活，当幸存的玩家只归属一个联盟时，则该联盟取得胜利。 ";
      
      public static const UNION_COMPETITION_KNOCK_TIP:String = "·淘汰赛分为4轮：1/8决赛，1/4决赛，半决赛，决赛。 \n·1/8决赛的对阵关系由系统自动生成，在淘汰赛界面通过“对阵图”展示进程。 \n·淘汰赛比赛前，参赛联盟成员需“加入战线”以完成报名，才能在淘汰赛中代表联盟自动出战。 \n·在“参战设置”界面点击任意一路战线（共3路战线）可以查看该路战线的参战详情。 \n·开战前允许盟主按战线整体切换战线上的联盟成员。 \n·淘汰赛比赛时，可点击对阵图中的“放大镜”以查看比赛的实时战况。 \n·各战线历史最高战力低的成员其队伍先上场。各战线中战斗后的残余部队与对方的下个队伍战斗。 \n·队伍连胜后，其植物的治疗技能、护盾技能收益随连胜次数的增加而递减。 \n·如果同一战线上，双方参战人数都为0，以赛季启动时的联盟部队总战力较低的一方在该战线获胜。 \n<font color=\'#f9f860\'>·若在2路以上的战线获得胜利，则联盟获得该场比赛的胜利和晋级。 </font>";
      
      public static const UNION_COMPETITION_STRAGETY_RULE_TIP:String = "·成员在战前任意时间给两支队伍设置相同的战略，选择“石头”、“剪子”、“布”中的任意一个。\n·在队伍触发战斗时，其“石头剪子布”战略生效。\n·“石头”胜“剪子”、“剪子”胜“布”、“布”胜“石头”。负者的队伍，其全部植物损失当前血量的10%。平局时，双方全部植物损失当前血量的5%。\n·建议观察联盟的实时战斗，以便在战前根据对方当前已设战略而为自己设置克制对方的战略。";
      
      public static const UNION_COMPETITION_8:String = "1/8决赛";
      
      public static const UNION_COMPETITION_4:String = "1/4决赛";
      
      public static const UNION_COMPETITION_2:String = "半决赛";
      
      public static const UNION_COMPETITION_1:String = "决赛";
      
      public static const UNION_COMPETITION_AUDITION_TIME:String = "海选赛将于{0}开始";
      
      public static const UNION_COMPETITION_BET_INTR:String = "1. 每场淘汰赛开始前，镇长可以在联盟对阵图中使用金币下注，竞猜获胜者\n2. 竞猜正确，可以获得双倍的下注金币作为返奖；竞猜失误，仍然可以得到一半的下注金币返还\n3. 在决赛结束后，累计猜对全部15场比赛的镇长可以额外获得30万金币奖励，猜对14场获得20万金币，猜对10-13场获得10万金币\n4. 比赛结束后，请记得及时领取竞猜奖励哟~";
      
      public static const ActNightclub_AcitivityTime:String = "活动时间:{0}月{1}日{2}时{3}分-{4}月{5}日{6}时{7}分";
      
      public static const DAILY_VOW_POOL_LEVEL:String = "许愿池 Lv{0}";
      
      public static const DAILY_VOW_NEED_LEVEL:String = "需要小镇等级：{0}";
      
      public static const DAILY_VOW_NEED_VIP:String = "需要VIP{0}";
      
      public static const DAILY_VOW_LIMIT:String = "已达今日上限";
      
      public static const DAILY_VOW_REWARD:String = "{0}x<font color=\'#00FF00\'>{1}</font>";
      
      public static const DAILY_VOW_BIG_WISH:String = "快捷购买上述所有资源";
      
      public static const DAILY_VOW_CRIT:String = "许愿{0}倍暴击";
      
      public static const WORLD_TREE_FREE_TRAIN:String = "免费随心培养，获得<font color=\'#00FF00\'>{0}</font>点世界树经验<br>每次培养有15%几率五倍暴击<br>每天免费5次<br>阳光VIP1及以上可使用";
      
      public static const WORLD_TREE_NORMAL_TRAIN:String = "消耗土壤进行培养，获得<font color=\'#00FF00\'>{0}</font>点世界树经验<br>每次培养有15%几率五倍暴击<br>土壤可在【阳光房】种植坚果种子获得";
      
      public static const WORLD_TREE_ADV_TRAIN:String = "消耗钻石进行培养，获得<font color=\'#FFFF00\'>{0}</font>点世界树经验<br>每次培养有15%几率五倍暴击<br>每天前5次半价<br>";
      
      public static const WORLD_TREE_ONE_KEY_OPEN:String = "世界树{0}级可开放一键升级功能";
      
      public static const WORLD_TREE_ONE_KEY_COST:String = "提升世界树等级1级消耗 {0} 金钻";
      
      public static const ActFlipcard_BuyFlipTimesTip:String = "翻牌次数不足,购买";
      
      public static const ActFlipcard_Close_Tip:String = "活动已结束";
      
      public static const ActFlipcard_FlipTimesPriceTip:String = "本次购买翻牌次数花费<font color=\'#00FF00\'>{0}金钻</font>，剩余<font color=\'#00FF00\'>{1}</font>次";
      
      public static const ActFlipcard_NoTimes:String = "剩余购买翻牌次数为<font color=\'#FF0000\'>0</font>次";
      
      public static const ActFlipcard_LuckyValueTip:String = "当前幸运值为{0}";
      
      public static const ActFlipcard_Rule:String = "1.每次翻牌可获得牌面奖励，包括随机游戏道具和超级翻牌专属“幸运”。积攒幸运达到一定值后，每次均能多倍领取奖励<br>2.当集满幸运达到5倍奖励后，‘幸运’将不再出现于牌面上<br>3、使用‘开始翻牌’后可选择翻开一张牌面获得奖励，使用“卡牌全开”可直接获得三张牌面全部奖励<br>4、活动开始时赠送{0}次免费翻牌次数，用完后可使用金钻继续购买翻牌次数<br>5、翻牌次数不足时，使用“开始翻牌”或“卡牌全开”将自动购买翻牌次数";
      
      public static const Union_Competition_Dis_Rule:String = "只有盟主可执行分配。盟主分配后，礼包直接进入玩家包裹。<br>同奖励领取时效，从奖励生成开始，截止到下赛季开启。<br>只有参加本赛季淘汰赛且留在本联盟的玩家，才可获得分配。<br>同一个玩家在同一个赛季内至多获得1次分配。";
      
      public static const Union_Competition_GiftBox_Detail_Top1:String = "联盟冠军礼包x10份，包含：<br>碎片-阿开木x30<br>土壤x3000";
      
      public static const Union_Competition_GiftBox_Detail_Top2:String = "联盟亚军礼包x8份，包含：<br>碎片-阿开木x20<br>土壤x2000";
      
      public static const Union_Competition_GiftBox_Detail_Top4:String = "联盟四强礼包x5份，包含：<br>碎片-阿开木x10<br>土壤x1000";
      
      public static const Rename_Realname_Tip:String = "<font color=\'#ffa200\'><u><a href=\'http://jkyx.qq.com/\'  target=\'_blank\'>实名认证</a></u></font>";
      
      public static const Rename_UserRule_Tip:String = "<font color=\'#00FF00\'>同意:</font><font color=\'#ffa200\'><u><a href=\'http://app.opensns.qq.com/app_useragreement?appid=1101214027\'  target=\'_blank\'>应用用户协议</a></u></font> <font color=\'#00FF00\'>以及</font>";
      
      public static const Rename_More_Tip:String = "<font color=\'#ffa200\'>更多</font>";
      
      public static const Rename_NoSelected_Tip:String = "请勾选同意应用用户协议";
      
      public static const Rename_Rule_Tip:String = "本应用获取我的昵称、头像、好友关系等相关信息；<br>在我的其他相关腾讯服务中自动同步添加本应用及数据；<br>本应用和腾讯使用我添加，操作应用的信息（包括昵称、头像等）。";
      
      public static const TD_BUY_CHALLENGE_TIMES:String = "购买一次挑战机会";
      
      public static const TD_CHALLENGE_TIMES_USED:String = "今日次数已用完";
      
      public static const ACT_WISHING_RULE:String = "1.每使用一朵金盏花，三叶草都会吹风一次，100%获得1个“愿望石”，同时必定随机掉落一项列表中所示的奖励，获得的奖励会直接加到背包中<br>2.在活动期间的愿望石商店兑换奖励<br>3.活动结束后，愿望石数目将被清空，各位镇长请及时兑换奖励";
      
      public static const ACT_WISHING_DESC:String = "<font color=\'#eef708\'>使用 1 朵<font color=\'#ff76ff\'>[金盏花]</font>，<font color=\'#2fc55a\'>[三叶草]</font>即可吹风一次!</font>";
      
      public static const ACT_WISHING_BUY_FLOWER_TIP:String = "购买金盏花";
      
      public static const AWAKE_ERROR_TIPS:String = "小镇{0}级以上玩家可以进行植物觉醒（开服{1}天后开启）";
      
      public static const PLANT_TEST_FREE_RESET_COUNT:String = "今日免费重置次数：{0}/{1}";
      
      public static const PLANT_TEST_PAY_RESET_COUNT:String = "今日付费重置次数：{0}/{1}";
      
      public static const PLANT_TEST_DAILY_REMAIN_COUNT:String = "该组剩余挑战机会：{0}/{1}";
      
      public static const PLANT_TEST_PAY_RESET_CONFIRM:String = "重置后将回到{1}年级的第1关，是否要消耗<font color=\'#00FF00\'>{0}金钻</font>重置？";
      
      public static const PLANT_TEST_FREE_RESET_CONFIRM:String = "重置后将回到{0}年级的第1关，是否要<font color=\'#00FF00\'>免费</font>重置？";
      
      public static const PLANT_TEST_HISTORY_TIP:String = "本次在{0}年级累计获得奖励如下：\n";
      
      public static const PLANT_TEST_NO_REWARD:String = "暂未获得任何奖励";
      
      public static const PLANT_TEST_STAGE_HISTORY_PASSED_CHAPTER:String = "最高纪录{0}关";
      
      public static const PLANT_TEST_OPEN_TIP:String = "开启条件：\n{0}";
      
      public static const PLANT_TEST_FREE:String = "免费";
      
      public static const PLANT_TEST_NOT_NEED_RESET:String = "您还在第一关，不需要重置哦~";
      
      public static const PLANT_TEST_RULE_TIP:String = "1.植物测验分5个年级，均以植物为战斗对象，需依次解锁。\n2.各年级测验对应产出1~5级星魂。\n3.每天可对已解锁的任意年级关卡免费重置1次，重置后将回到该年级的第1关。\n4.挑战无消耗，失败时减少剩余挑战次数，重置年级时恢复挑战次数。挑战胜利后即时获得奖励。\n5.守关阵容将借用天梯竞斗场前110名镇长的防守植物阵形，但属性不同，并冠以镇长随从的名称出现。各年级最后10关固定为前10名镇长。\n6.每周一凌晨，系统统一为所有人重置1次各年级的关卡，各年级的最高纪录归零，同时重置守关阵容。特殊地，周一凌晨天梯竞斗场排名前{0}名玩家，保留各年级的最高纪录。";
      
      public static const PLANT_TEST_RESET_TIP:String = "作用：重置当前所在年级，回到第一关";
      
      public static const PLANT_TEST_CHAPTER_TIP:String = "<font color=\'#FFFF00\'>第{0}关</font>\n<font color=\'#FFFF00\'>建议战斗力：</font>{1}\n<font color=\'#FFFF00\'>随机掉落奖励：</font>\n{2}";
      
      public static const PLANT_TEST_SWEEP_TIP:String = "扫荡将省略挑战至该年级最高纪录关卡的所有过程，直接获取奖励\n各年级的最高纪录每周一归零";
      
      public static const PLANT_TEST_FIGHT_TIP:String = "挑战无消耗\n挑战失败时减少剩余挑战次数\n重置年级时恢复挑战次数";
      
      public static const DAILY_DIAMOND_CARD_DESC:String = "每天额外领取{1}钻石，剩余可领取{0}次";
      
      public static const PAY_DAILY_CARD_TIP:String = "礼包剩余领取次数≤27时可提前续费";
      
      public static const CHLOROPHYLL_COMPOSE_TIP:String = "5个{0}可以合成1个{1}";
      
      public static const VIDEO_NO_SEE:String = "抱歉，你还没有观看视频，请点击“立刻观看”按钮观看再来领取";
      
      public static const VIDEO_DRAW_OVER:String = "你已领取过该礼包了哦！";
      
      public static const DEBRIS_RARITY:String = "碎片稀有度{0}";
      
      public static const DEBRIS_STAR_HAS:String = "已有{0}星植物";
      
      public static const DEBRIS_STAR_NULL:String = "未拥有该植物";
      
      public static const HALLOWEEN_NUT_HAMMER_ERROR:String = "哦，坚果锤不够了！每天通过消耗体力可以获得最多{0}个坚果锤哟~";
      
      public static const HALLOWEEN_RULE_TIP:String = "活动规则：\n1、活动期间，每累计消耗{0}点体力可领取坚果锤x1，每天最多获得{1}个\n2、使用坚果锤或榴莲锤均可对南瓜壳造成伤害，将南瓜壳砸破后即可打开糖果罐领取奖励\n3、当打开全部七个糖果罐后，坚果绅士将额外赠送一份神秘奖品\n4、当所有奖励领完，如果还想再玩一次的话就选择消费{2}金钻进行重置，每天可以重置{3}次\n5、当全服累计砸破的南瓜壳数达到指定数量，所有镇长可领取金、银南瓜灯。根据个人消灭的南瓜壳数量多少，可至多领取5倍奖励！";
      
      public static const HALLOWEEN_PUMPKIN_HP_TIP:String = "当前血量：{0}/{1}";
      
      public static const HALLOWEEN_PUMPKIN_TIP:String = "打开礼物可获得：\n";
      
      public static const HALLOWEEN_SERVER_REWARD_TIP:String = "全服累计砸破{0}个南瓜后\n可领取：\n";
      
      public static const HALLOWEEN_SERVER_REWARD_STATE:String = "已领取{0}个，剩余可领取{1}个";
      
      public static const HALLOWEEN_SERVER_REWARD_NOT_ACTIVE:String = "<font color=\'#FF00000\'>尚未达成领奖条件</font>";
      
      public static const HALLOWEEN_DAMAGE_TIP:String = "<font color=\'#FFFF00\'>{0}%</font>造成<font color=\'#00FF00\'>{1}</font>伤害";
      
      public static const HALLOWEEN_FINAL_REWARD_TIP:String = "{0}\n你要哪个？";
      
      public static const Card_Rarity_info:String = "{0} (<font color=\'#00ff00\'>{1}%</font> <font color=\'#00ff00\'>{2}%</font>)";
      
      public static const Card_Rarity_Tooltip:String = "技能伤害/治疗加成 <font color=\'#00ff00\'>{0}%</font><br>受到的技能伤害减少 <font color=\'#00ff00\'>{1}%</font>";
      
      public static const Card_Rarity_Tooltip2:String = "下一星级：<br>技能伤害/治疗加成比例提升至 {0}<br>受到技能伤害减少比例提升至 {1}";
      
      public static const ExchangeSunTip:String = "塔防天赋改版后，阳光将不再产出和使用，您先前囤积的全部阳光已兑换为<font color=\'#00ff00\'>{0}金币</font>直接存入，请注意查收哦！";
      
      public static const Not_Enough_Item_Tip:String = "{0}不足，现在是否去购买？";
      
      public static const AVATER_ITEM_NOT_ENOUGH:String = "需求道具不足，可前往商城购买，或在\'免费植物\'活动中进行兑换";
      
      public static const SECKILL_RECORD:String = "{0}月{1}日 {2}:{3}  <font color=\'#00FF00\'>{4}</font>成功秒杀，获得<font color=\'#FFFF00\'>{5}</font>\n";
      
      public static const SECKILL_TIP:String = "1、活动分为2个阶段：展示期、抢购期。\n2、展示期间，提示离开始时间倒计时，能看见活动物品但无法进行抢购。\n3、抢购期间，提示离结束时间倒计时，能看见活动物品并能进行抢购。\n4、每种活动物品的购买，受限于个人限购数量，同时受限于每个服务器全服限购数量。";
      
      public static const EQUIPMENT_NUM_LIMIT_CRATE:String = "最多拥有装备{0}个<font color=\'#00FF00\'>(现在拥有{1}个)</font>，无法制造装备";
      
      public static const EQUIPMENT_NUM_LIMIT_CLONE:String = "最多拥有装备{0}个<font color=\'#00FF00\'>(现在拥有{1}个)</font>，无法克隆装备";
      
      public static const BALANCE_RULE_TIP:String = "<font color=\'#FFFF00\'>植物星级：</font>统一按5星计算\n<font color=\'#FFFF00\'>强化等级：</font>统一按强化5级计算\n<font color=\'#FFFF00\'>觉醒等级：</font>统一按觉醒0级计算\n<font color=\'#FFFF00\'>植物等级：</font>150级\n<font color=\'#FFFF00\'>套牌：</font>按实际阵型中的套牌计算\t\n<font color=\'#FFFF00\'>天平属性：</font>根据植物类型附加固定属性值";
      
      public static const CARD_DECOMPOSE_TIP:String = "小镇{0}级开启拆解功能：<br>* 经验豆、拼图碎片与时装水晶/精华100%返还；<br>* 植物当前星级强化花费的金币100%返还；<br>* 植物果实与觉醒花费的材料100%返还；<br>* 基因进化与强化花费的材料100%返还；<br>* 基因改良成功花费的材料100%返还(不算改良失败)；<br>* 其他材料将会损失，请谨慎操作！";
      
      public static const FUND_NOT_BUY:String = "你还没有购买{0},是否购买？";
      
      public static const BAPTIZE_ENTRY_TIP:String = "植物洗炼增加额外属性和大量先攻";
      
      public static const BAPTIZE_LUCKY_TIP:String = "放弃高级洗炼结果时增加幸运点，幸运洗炼100%不减少属性";
      
      public static const BAPTIZE_NO_CONDITION:String = "未勾选自动保存条件";
      
      public static const BAPTIZE_FULL:String = "属性已满，不需要洗炼";
      
      public static const BAPTIZE_RULE_TIP:String = "1. 小镇等级{0}级开放植物洗炼<br>2. 洗炼属性上限由植物星级和觉醒等级决定，满值后不能继续增加<br>3. 根据洗炼属性的战力，植物将获得额外先攻加成<br>4. 普通和高级洗炼均有几率出现负属性，幸运洗炼必定提高属性<br>5. 洗炼属性需要保存才能生效，否则将被放弃（无论关闭界面或者掉线）；放弃洗炼结果将获得返还幸运点<br>   普通洗炼 - 每次返还幸运点 x 1<br>   高级洗炼 - 每次返还幸运点 x 10";
      
      public static const BRAIN_PREPARE:String = "点击开始按钮进行答题吧";
      
      public static const BRAIN_REWARD_TIP:String = "恭喜获得以下奖励：";
      
      public static const BRAIN_COUNT_REWARD_TIP:String = "恭喜你答对{0}题，获得以下奖励：";
      
      public static const BRAIN_CANCEL_CONFIRM:String = "你将放弃继续挑战下一题的机会，并前往领取当前累计获得奖励，是否确认放弃？";
      
      public static const BRAIN_RANK_RULE:String = "各位镇长答题数越多排名越高，答题数相同时答题时间越早排名越前";
      
      public static const BRAIN_CLOSE_ALERT:String = "你的题目尚未提交答案，是否确定离开？";
      
      public static const BRAIN_OVER_TIP:String = "噢~挑战结束了，快去领奖吧！";
      
      public static const BRAIN_RULE_TIP:String = "【热身准备】\n1. 每日答题前十题为热身准备，答对答错均有奖励，且答错不失去挑战机会\n2. 前十题答对获得当前题目全部奖励，答错获得一半奖励\n【一站到底】\n1. 答完前十题后进入“一站到底”环节，挑战升级，奖励升级！\n2. 在一站到底中，只有答对题目方可继续挑战，答题越多，奖励越好\n3. 答错题目则将受到惩罚，除失去继续挑战的机会外，还将从累计获得奖励中扣除当前题目奖励\n4. 选择放弃将获得已有奖励，有时候，见好就收不失为明智的选择！";
      
      public static const HOLE_RULE_TIP:String = "<font color=\'#FFFF00\'>●背景</font>\n戴夫在一次对雪人塔防建筑进行整修的过程中，偶然地发现了伸手不见五指的地下密道。\n一股神秘的力量在引导着大家，似乎有许多神秘的宝藏在其深处……\n<font color=\'#FFFF00\'>●守护玩法</font>\n秘藏守护玩法在玩家达到25级且服务器开服30天后开启。\n每个人根据小镇等级，逐个解锁开放神秘宝藏，至多4个。\n秘藏的产出内容和生产时长由镇长自己选择，额外可得少量钻石。\n守护秘藏的部队，必须有自己的1支部队，可邀请2支盟友部队协防。\n镇长派遣守护秘藏的部队战力决定该秘藏的生产效率。\n<font color=\'#00FF00\'>友情提示：提升植物的战力既能阻挡敌人，又能提高生产效率</font>\n<font color=\'#FFFF00\'>●掠夺玩法</font>\n每次可消耗金币刷新1个秘藏进行掠夺，每次掠夺战斗都需消耗若干便携光源。\n便携光源随时间回复，也可有限次地购买。\n战胜秘藏中所有敌人才算“掠夺成功”，并获得守护者们的一部分奖励。\n从第一次战斗开始，3分钟内未成功掠夺，即算失败，无任何奖励。\n<font color=\'#FFFF00\'>●战斗模式</font>\n由于神秘力量的诅咒，装备、实验室、营养室、世界树的力量无法传达给秘藏部队。\n这些力量在整个秘藏玩法中，均无效化。\n在一次掠夺战中，战斗采用车轮战模式，进攻方可依次派出自己的植物部队进攻秘藏的守护部队\n胜方植物的血量不回复；下次战斗的初始血量就是上一次战斗的剩余血量，阵亡植物不可再次出战。\n";
      
      public static const ITEM_LIST_STR:String = "{0}×{1}";
       
      
      public function FontNormal()
      {
         super();
      }
      
      public static function getItemNameAndNumStr(param1:int, param2:int) : String
      {
         var _loc3_:String = ItemTemplateFactory.instance.getBagItemName(param1);
         return StringUtil.substitute(ITEM_LIST_STR,_loc3_,param2);
      }
   }
}
