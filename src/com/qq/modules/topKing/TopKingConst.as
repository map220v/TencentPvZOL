package com.qq.modules.topKing
{
   import PVZ.Cmd.Dto_TopFightReportInfo;
   import asgui.controls.Label;
   import com.qq.GameGloble;
   import com.qq.modules.topKing.model.TopKingDataFactory;
   import com.qq.templates.font.FontHKHB;
   import com.tencent.protobuf.Int64;
   import tencent.base.utils.StringUtil;
   
   public class TopKingConst
   {
      
      public static const TopKing_Info_update:String = "TopKing_Info_update";
      
      public static const TopKing_BattleInfo_Ready:String = "TopKing_BattleInfo_Ready";
      
      public static const TopKing_RoleInfo_Ready:String = "TopKing_RoleInfo_Ready";
      
      public static const TopKing_MyScoreInfo_Ready:String = "TopKing_MyScoreInfo_Ready";
      
      public static const TopKing_CandiatePlayerInfo_Ready:String = "TopKing_CandiatePlayerInfo_Ready";
      
      public static const TopKing_RankInfo_Ready:String = "TopKing_RankInfo_Ready";
      
      public static const TopKing_Bet_Success:String = "TopKing_Bet_Success";
      
      public static const TopKing_MyBetInfo_Ready:String = "TopKing_MyBetInfo_Ready";
      
      public static const TopKing_Take_Bet_Reward_Success:String = "TopKing_Take_Bet_Reward_Success";
      
      public static const TopKing_Request_Update_Main_Info:String = "TopKing_Request_Update_Main_Info";
      
      public static var TotalPlayer:int = 32;
      
      public static var TotalBattle:int = 30;
      
      public static const Prev_Champion:String = "上届王者";
      
      public static const This_Champion:String = "本届王者";
      
      public static const Rule:String = "1.大赛当周周二21:00“天梯竞斗场”前{0}强将自动成为巅峰王者候选\n2.每届“巅峰王者”将进行为期1周的争夺\n3.赛制采取2进1方式逐步淘汰，直到产生王者\n4.服务器会定时拉取玩家最新数据，玩家也可以通过我的布阵“保存”按钮更新自己的数据\n5.玩家对部队的调整将在下一场战斗生效\n6.直到王者大战结束产生王者后，各阶段强者才能领取自己对应的宝箱(下届比赛开启时所有奖励清空，奖励会不定期调整)";
      
      public static const NextSeasonTip:String = "{0}开启新一轮王者大战！";
      
      public static const EmptyName:String = "????";
      
      public static const Unknow:String = "????";
      
      public static const BET_TIP1:String = "可下注蓝钻";
      
      public static const BET_RULE:String = "1.16强选拔战将开启金币下注功能，4强选拔战开始可选用钻石下注<br>2.小镇达到{0}级或激活VIP的玩家可使用金币进行押注<br>3.小镇达到{1}级或激活VIP的玩家可使用钻石进行押注<br>4.VIP等级越高，钻石下注额度越高<br>5.每轮比赛总计4次押注机会，每次只能押注1个人<br>6.赔率以双方发生战斗前最终赔率为准<br>7.押注失败后返还一半下注额<br>8.押注后不可撤销";
      
      public static var championRoleID:Int64;
      
      private static const _Battle_Result_Win:String = "<u><a href=\'event:topKingBattleId#{0}\'><font color=\'#00FF00\'>[{1}]</font></a></u>";
      
      private static const _Battle_Result_Fail:String = "<u><a href=\'event:topKingBattleId#{0}\'><font color=\'#FF0000\'>[{1}]</font></a></u>";
      
      private static const _Battle_Result_Not_Start:String = "<font color=\'#cccccc\'>[{0}]</font>";
      
      private static const Battle_State_Win:int = 1;
      
      private static const Battle_State_Lose:int = 2;
      
      private static const Battle_Not_Start:int = 3;
       
      
      public function TopKingConst()
      {
         super();
      }
      
      public static function getStageIndexByBattleID(param1:int) : int
      {
         var _loc2_:int = 0;
         if(param1 <= 15)
         {
            _loc2_ = 4;
         }
         else if(param1 <= 23)
         {
            _loc2_ = 5;
         }
         else if(param1 <= 27)
         {
            _loc2_ = 6;
         }
         else if(param1 <= 29)
         {
            _loc2_ = 7;
         }
         else
         {
            _loc2_ = 8;
         }
         return _loc2_;
      }
      
      public static function getStageIDByBattleID(param1:int) : int
      {
         var _loc2_:int = getStageIndexByBattleID(param1);
         return int(TopKingDataFactory.getInstance().stageIndex2ID(_loc2_));
      }
      
      public static function getBattleIndexByBattleID(param1:int) : int
      {
         var _loc2_:int = 0;
         if(param1 < 16)
         {
            _loc2_ = param1;
         }
         else if(param1 < 24)
         {
            _loc2_ = param1 - 16;
         }
         else if(param1 < 28)
         {
            _loc2_ = param1 - 24;
         }
         else if(param1 < 30)
         {
            _loc2_ = param1 - 28;
         }
         else
         {
            _loc2_ = param1 - 30;
         }
         return _loc2_;
      }

      //Used Another Decompiler here
      public static function getBattleResultStr(param1:Array, param2:int = -1, param3:Boolean = true) : String
      {
         var _loc_4:String = null;
         var _loc_5:int = 0;
         var _loc_7:Dto_TopFightReportInfo = null;
         var _loc_8:String = null;
         var _loc_9:int = 0;
         if (param1.length == 0)
         {
            return FontHKHB.TopKing_No_Fight_Result;
         }
         if (param2 != -1)
         {
            _loc_5 = param2;
         }
         else
         {
            _loc_5 = param1.length;
         }
         var _loc_6:int = 0;
         while (_loc_6 < _loc_5)
         {

            _loc_7 = null;
            if (_loc_6 < param1.length)
            {
               _loc_7 = param1[_loc_6];
            }
            if (_loc_7 == null)
            {
               _loc_9 = Battle_Not_Start;
            }
            else if (param3)
            {
               _loc_9 = _loc_7.win ? (Battle_State_Win) : (Battle_State_Lose);
            }
            else
            {
               _loc_9 = !_loc_7.win ? (Battle_State_Win) : (Battle_State_Lose);
            }
            if (_loc_7 == null || _loc_7.reportId == null)
            {
               _loc_8 = StringUtil.substitute(_Battle_Result_Not_Start, (_loc_6 + 1));
            }
            else
            {
               switch(_loc_9)
               {
                  case Battle_Not_Start:
                  {
                     _loc_8 = StringUtil.substitute(_Battle_Result_Not_Start, (_loc_6 + 1));
                     break;
                  }
                  case Battle_State_Win:
                  {
                     _loc_8 = StringUtil.substitute(_Battle_Result_Win, _loc_7.reportId, (_loc_6 + 1));
                     break;
                  }
                  case Battle_State_Lose:
                  {
                     _loc_8 = StringUtil.substitute(_Battle_Result_Fail, _loc_7.reportId, (_loc_6 + 1));
                     break;
                  }
                  default:
                  {
                     break;
                  }
               }
            }
            if (_loc_4 == null)
            {
               _loc_4 = "";
            }
            else
            {
               _loc_4 = _loc_4.concat(" ");
            }
            _loc_4 = _loc_4.concat(_loc_8);
            _loc_6++;
         }
         return _loc_4;
      }
      
      public static function setNameLabelColor(param1:Label, param2:Int64) : void
      {
         if(param1 == null || param2 == null)
         {
            return;
         }
         var _loc3_:String = "#00FF00";
         if(championRoleID != null && championRoleID.compare(param2))
         {
            _loc3_ = "#ffa11e";
         }
         else if(GameGloble.actorModel.roleId.compare(param2))
         {
            _loc3_ = "#FFFFFF";
         }
         param1.SetStyle("color",_loc3_);
      }
      
      public static function betOddsConvert(param1:Number) : String
      {
         return "1.0 : " + param1.toFixed(1);
      }
   }
}
