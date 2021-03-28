package com.qq.modules.expedition
{
   import asgui.utils.StringUtil;
   import com.qq.modules.basic.model.templates.ServerConfigTemplateFactory;
   import com.qq.modules.basic.model.templates.ce.EntryTemplateCE;
   import com.qq.utils.UtilsManager;
   import org.allencuilib.util.TimeUtils;
   
   public class ExpeditionConst
   {
      
      public static const Event_MainWindow_InitData_Ready:String = "Event_MainWindow_InitData_Ready";
      
      public static const Event_SignUpDetail_Data_Ready:String = "Event_SignUpDetail_Data_Ready";
      
      public static const Event_Battle_Data_Init:String = "Event_Battle_Data_Init";
      
      public static const Event_Battle_Log_Update:String = "Event_Battle_Log_Update";
      
      public static const Event_Battle_DefenceBuiding_Detail_Data_Ready:String = "Event_Battle_DefenceBuiding_Detail_Data_Ready";
      
      public static const Event_Battle_DefenceBuiding_Detail_Data_Change:String = "Event_Battle_DefenceBuiding_Detail_Data_Change";
      
      public static const Event_Battle_Anounce:String = "Event_Battle_Anounce";
      
      public static const Event_Battle_Score_Data_Update:String = "Event_Battle_Score_Data_Update";
      
      public static const Event_Battle_Gather_Target_Change:String = "Event_Battle_Gather_Target_Change";
      
      public static const Event_Battle_Action_State_Change:String = "Event_Battle_Action_State_Change";
      
      public static const Event_Battle_Running_State_Change:String = "Event_Battle_Running_State_Change";
      
      public static const Event_Battle_Detect_Data_Ready:String = "Event_Battle_Detect_Data_Ready";
      
      public static const Event_Battle_MoveToFront_Success:String = "Event_Battle_MoveToFront_Success";
      
      public static const Event_Battle_BuildingInfo_Update:String = "Event_Battle_BuildingInfo_Update";
      
      public static const Event_Battle_Show_Fight_Effect:String = "Event_Battle_Show_Fight_Effect";
      
      public static const Event_Battle_FightCleanCDCoolDown_Update:String = "Event_Battle_FightCleanCDCoolDown_Update";
      
      public static const Event_Battle_RetryRobCmd:String = "Event_Battle_RetryRobCmd";
      
      public static const Event_Battle_NPCBuildingInfo_Update:String = "Event_Battle_NPCBuildingInfo_Update";
      
      public static const Event_Battle_AddBuff:String = "Event_Battle_AddBuff";
      
      public static const Event_Battle_RemoveBuff:String = "Event_Battle_RemoveBuff";
      
      public static const Event_Battle_Update_Next_Action:String = "Event_Battle_Update_Next_Action";
      
      public static const LINK_TYPE_BATTLE:String = "fight";
      
      public static const ITEMID_SpeicalItem:int = 1030;
      
      public static const State_SignUp_Yet:int = 0;
      
      public static const State_SignUp_Complete:int = 1;
      
      public static const Battle_ScoreRank_Type_SelfCamp:int = 1;
      
      public static const Battle_ScroeRank_Type_AllCamp:int = 2;
      
      public static const Show_Fight_Effect_Time:int = 10;
      
      public static const BossState_WaitNextBoss:int = 0;
      
      public static const BossState_FightBoss:int = 1;
      
      public static const BossState_NoBoss:int = 2;
      
      public static const BossState_Close:int = 3;
      
      public static const BattleState_Wait:int = 0;
      
      public static const BattleState_Revival:int = 1;
      
      public static const BattleState_Return:int = 2;
      
      public static const BattleState_Defence:int = 3;
      
      public static const Txt_SignUp_Rule:String = "战力前{0}名最终将参加比赛";
      
      public static const Txt_Battle_NeedScore:String = "累计夺取{0}积分，可查看更多信息";
      
      public static const Txt_Revival:String = "战败死亡 {0}秒后 复活";
      
      public static const Txt_Return:String = "完成掠夺 {0}秒后 可返回";
      
      public static const Txt_Defence:String = "完成驻防 {0}秒后 可行动";
      
      public static const Txt_Switch_Defence_Tip:String = "切换驻防据点成功,目前驻防在 {0}";
      
      public static const Txt_Change_Attack_Target:String = "战场指挥官 {0} 指定 {1} 为进攻目标";
      
      public static const Txt_Change_Defence_Target:String = "战场指挥官 {0} 指定 {1} 为防守目标";
      
      public static const Txt_Rule:String = "1. 跨服远征将在小镇{0}级时开放<br>2. 参战服务器将会分为三方阵营，参战玩家将以各自所属阵营身份参战<br>3. 每周{1}12:00开始报名，周{2}{4}点截止报名<br>4. 每周{2}、周{3}各进行一场战斗，每场战斗胜负单独计算<br>5. 开战时间为每周{2}、周{3}的 {7}-{8}<br>6. 战斗中每次行动都是0行军时间<br>7. 战斗中每次行动完毕 或 死亡 都会进入冷却状态<br>8. 该冷却状态可使用金钻消除，每日有次数限制<br>9. 战斗中个人需要夺得{5}积分才能看到本阵营据点驻防信息<br>10. 战斗可使用蓝钻查看敌方指定据点的驻防信息<br>11. 战斗中也能使用出阵指令移动到驻防队列的第一位<br>开战时每个阵营资源会按700、650、650方式分配在其主城、一镇、二镇上<br>13. 每击败一个敌方成员，则可夺取该成员所在据点资源的{6}%，并获得相应的个人积分；单次掠夺最多可击败{9}人<br>14. 战斗时间完结后，将按三方阵营最终资源数从高到低获得冠军、亚军、季军<br>15. 远征结束后三方阵营将按照胜负顺序获得对应的奖励，同阵营玩家将按战斗中累计夺得积分从高到低顺序获得奖励<br>16.远征Boss将定时刷新，当刷新时间到达时，如果场上还有存活的远征Boss则不刷新<br>17.各势力获得的Boss资源将不能被其他势力夺取<br>18.个人攻击远征Boss，将根据单次进攻造成的总伤害给予金币、资源奖励<br>19.最终击杀远征Boss的玩家，该玩家所在势力将获得特殊效果加成（掠夺资源加成50%，损失资源减少50%，伤害增加10%）";
      
      public static const Txt_Rob_Result:String = "掠夺{0},发生战斗{1}次，共获得{2}积分";
      
      public static const Txt_Rule_SignUp:String = "周{0}中午12点开始报名,周{1}{2}点结束报名";
      
      public static const Txt_Rule_FightTime:String = "周{0}和周{1}{2}-{3}开战";
      
      public static const Txt_Recover:String = "每6秒恢复{0}{1}";
      
      public static const Txt_Detec_Tip:String = "侦查需要{0}{1}";
      
      public static const Txt_BuyCDTime_Tip:String = "消除CD功能冷却中，需要{0}秒后才能使用";
      
      public static const Txt_CampDetail_Tip:String = "本届跨服远征阵营划分：<br><br><font color=\'#FFFF00\'>{0}</font><br>{1}<br><br><font color=\'#FFFF00\'>{2}</font><br>{3}<br><br><font color=\'#FFFF00\'>{4}</font><br>{5}";
      
      public static const Txt_NPC_Next_Refresh_Tip:String = "下次刷新时间：{0}秒";
      
      public static const Txt_NPC_Next_ShowTime_Tip:String = "BOSS将在{0}刷新，请提早准备";
      
      public static const Txt_TotalScore_Format:String = "(+{0})";
      
      public static const Txt_KillBoss_Desc:String = "{0} <font color=\'{3}\'>{1}[{2}]</font> 击杀了BOSS,<font color=\'{3}\'>{2}</font>将获得Buff奖励";
      
      public static const BuildingType_City1:int = 1;
      
      public static const BuildingType_City2:int = 2;
      
      public static const BuildingType_City3:int = 3;
      
      public static const BuildingNpc:int = 4;
      
      public static const Battle_Action_None:int = 0;
      
      public static const Battle_Action_Attack:int = 1;
      
      public static const Battle_Action_Defence:int = 2;
      
      public static const totalCampNum:int = 3;
      
      public static const State_Battle_Wait:int = 0;
      
      public static const State_Battle_SignUp:int = 1;
      
      public static const State_Battle_Ready:int = 2;
      
      public static const State_Battle_Fight:int = 3;
      
      public static const State_Battle_ReadyToClose:int = 4;
      
      private static var _ruleStr:String;
      
      private static var _ruleSignUp:String;
      
      private static var _ruleFightTime:String;
       
      
      public function ExpeditionConst()
      {
         super();
      }
      
      private static function initRuleStr() : void
      {
         var _loc1_:EntryTemplateCE = ServerConfigTemplateFactory.instance.getEntryTemplateExpedition();
         var _loc2_:int = _loc1_.needLevel;
         var _loc3_:String = UtilsManager.num2Chinese(ServerConfigTemplateFactory.instance.iExpeditionFightOpenWeek,true);
         var _loc4_:Date;
         (_loc4_ = new Date()).hours = 12;
         _loc4_.minutes = 0;
         _loc4_.seconds = 0;
         _loc4_.milliseconds = 0;
         while(_loc4_.day != ServerConfigTemplateFactory.instance.iExpeditionFightOpenWeek)
         {
            _loc4_.time += 3600 * 24 * 1000;
         }
         var _loc5_:Number = _loc4_.time;
         _loc4_.time += ServerConfigTemplateFactory.instance.iExpeditionFightStageSignUpEndTime * 1000;
         var _loc6_:int = _loc4_.day;
         var _loc7_:String = UtilsManager.num2Chinese(_loc6_,true);
         var _loc8_:String = _loc4_.hours.toString();
         _loc4_.hours = 0;
         _loc4_.minutes = 0;
         _loc4_.time += ServerConfigTemplateFactory.instance.iExpeditionFightBeginTime * 1000;
         var _loc9_:String = TimeUtils.formatSecondToStr(_loc4_.time * 0.001,TimeUtils.HH_MM);
         _loc4_.hours = 0;
         _loc4_.minutes = 0;
         _loc4_.time += ServerConfigTemplateFactory.instance.iExpeditionFightEndTime * 1000;
         var _loc10_:String = TimeUtils.formatSecondToStr(_loc4_.time * 0.001,TimeUtils.HH_MM);
         var _loc11_:String = UtilsManager.num2Chinese(_loc4_.day,true);
         var _loc12_:String = UtilsManager.num2Chinese(_loc4_.day + 1,true);
         _ruleStr = StringUtil.substitute(ExpeditionConst.Txt_Rule,_loc2_,_loc3_,_loc11_,_loc12_,_loc8_,ServerConfigTemplateFactory.instance.iExpeditionFightSeeDetailScore,ServerConfigTemplateFactory.instance.iExpeditionFightRobScoreRate,_loc9_,_loc10_,ServerConfigTemplateFactory.instance.iExpeditionFightRobRoleCount);
         _ruleSignUp = StringUtil.substitute(ExpeditionConst.Txt_Rule_SignUp,_loc3_,_loc7_,_loc8_);
         _ruleFightTime = StringUtil.substitute(ExpeditionConst.Txt_Rule_FightTime,_loc11_,_loc12_,_loc9_,_loc10_);
      }
      
      public static function getRuleStr() : String
      {
         if(_ruleStr == null)
         {
            initRuleStr();
         }
         return _ruleStr;
      }
      
      public static function getRuleSignUp() : String
      {
         if(_ruleSignUp == null)
         {
            initRuleStr();
         }
         return _ruleSignUp;
      }
      
      public static function getRuleFightTime() : String
      {
         if(_ruleStr == null)
         {
            initRuleStr();
         }
         return _ruleFightTime;
      }
   }
}
