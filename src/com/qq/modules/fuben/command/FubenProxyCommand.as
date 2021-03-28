package com.qq.modules.fuben.command
{
   import PVZ.Cmd.BattleTargetType;
   import PVZ.Cmd.Cmd_Battle_Fight_CS;
   import PVZ.Cmd.Cmd_Fuben_GetChapterInfo_CS;
   import PVZ.Cmd.Cmd_Fuben_GetStageInfo_CS;
   import PVZ.Cmd.Cmd_Fuben_RequestRewardBox_CS;
   import PVZ.Cmd.Cmd_Fuben_Sweep_CS;
   import PVZ.Cmd.Dto_BattleTarget;
   import com.qq.GameGloble;
   import com.qq.display.QAlert;
   import com.qq.modules.battleLineup.command.BattleLineupCmd;
   import com.qq.modules.commEmbattle.command.CommEmbattleCmd;
   import com.qq.modules.embattle.constant.EmbattleConst;
   import com.qq.modules.fuben.FubenGlobals;
   import com.qq.modules.fuben.model.FubenProxy;
   import com.qq.modules.fuben.model.templates.FubenTemplate;
   import com.qq.modules.fuben.model.templates.FubenTemplateFactory;
   import com.qq.modules.fuben.model.vo.FubenStageVO;
   import com.qq.modules.main.command.CommonCmd;
   import com.qq.modules.main.constant.PrivilegeConst;
   import com.qq.modules.main.server.PvzSocketService;
   import com.qq.modules.main.service.PrivilegeProxy;
   import com.qq.modules.unionFuben.UnionFubenRankConst;
   import com.qq.modules.unionFuben.command.UnionFubenProxyCmd;
   import com.qq.modules.unionFuben.command.UnionFubenRankViewCmd;
   import com.qq.modules.unionFuben.model.UnionFubenProxy;
   import com.qq.templates.font.FontHKHB;
   import com.qq.templates.font.FontNormal;
   import org.robotlegs.extend.command.StrongRobotlegCommand;
   
   public class FubenProxyCommand extends StrongRobotlegCommand
   {
       
      
      [Inject]
      public var server:PvzSocketService;
      
      [Inject]
      public var proxy:FubenProxy;
      
      [Inject]
      public var privilegeProxy:PrivilegeProxy;
      
      [Inject]
      public var unionFubenProxy:UnionFubenProxy;
      
      public function FubenProxyCommand()
      {
         super();
      }
      
      public function requestMapInfo() : void
      {
         var _loc1_:Cmd_Fuben_GetChapterInfo_CS = new Cmd_Fuben_GetChapterInfo_CS();
         this.server.sendMessage(_loc1_);
      }
      
      public function requestChapterInfo(param1:int, param2:int) : void
      {
         var _loc3_:Cmd_Fuben_GetStageInfo_CS = new Cmd_Fuben_GetStageInfo_CS();
         _loc3_.chapterid = param1;
         _loc3_.modeid = param2;
         this.server.sendMessage(_loc3_);
      }
      
      public function requestRewardBox(param1:int, param2:int) : void
      {
         var _loc3_:Cmd_Fuben_RequestRewardBox_CS = new Cmd_Fuben_RequestRewardBox_CS();
         _loc3_.chapterid = param1;
         _loc3_.mode = param2;
         this.server.sendMessage(_loc3_);
      }
      
      public function fightStage(param1:int, param2:int, param3:int) : void
      {
         var _loc4_:Dto_BattleTarget = null;
         var _loc5_:int = 0;
         var _loc6_:Vector.<FubenTemplate> = null;
         var _loc7_:FubenTemplate = null;
         FubenGlobals.LAST_FIGHT_CHAPTER = param1;
         FubenGlobals.LAST_FIGHT_MODE = param3;
         this.proxy.curStage = this.proxy.data.getFubenStageVo(param1,param2,param3);
         if(param3 == FubenGlobals.FUBEN_MODE_UNION)
         {
            if(this.proxy.curStage.star == 0)
            {
               if(this.unionFubenProxy.getChapterVo(param1).times > 0)
               {
                  (_loc4_ = new Dto_BattleTarget()).type = BattleTargetType.BattleTargetType_GuildFuben;
                  _loc4_.fubenChapterId = param1;
                  _loc4_.fubenStageId = param2;
                  _loc4_.fubenModeId = FubenGlobals.FUBEN_MODE_UNION;
                  CommEmbattleCmd.openEmbattle(EmbattleConst.MODE_UNION_FUBEN,_loc4_,FubenProxyCmd.startUnionFubenFight);
               }
               else
               {
                  QAlert.Show(FontNormal.UNION_FUBEN_TIMES_OVER);
               }
            }
            else
            {
               _loc6_ = FubenTemplateFactory.instance.getFubenTemplatesByChapterId(param1);
               for each(_loc7_ in _loc6_)
               {
                  if(_loc7_.stageId == param2 && _loc7_.id % 10 == 3)
                  {
                     _loc5_ = uint(_loc7_.id);
                     break;
                  }
               }
               UnionFubenRankViewCmd.openRankWindow(UnionFubenRankConst.RANK_TYPE_MISSION,1,_loc5_);
            }
         }
         else
         {
            if(this.proxy.curStage.template.energyCost > GameGloble.actorModel.currEnergy)
            {
               CommonCmd.showBuyPhysicalPanel();
               return;
            }
            if(this.proxy.curStage.hasLimit && this.proxy.curStage.times <= 0)
            {
               if(!this.privilegeProxy.hasPrivilege(PrivilegeConst.PRIVILEGE_FUBEN_SWEEP_TIME))
               {
                  CommonCmd.showVipConfirm(FontHKHB.BATTLE_FIGHT_COUNT_MAX);
               }
               else
               {
                  QAlert.Show(FontNormal.BATTLE_FIGHT_COUNT_MAX);
               }
               return;
            }
            BattleLineupCmd.preFight_PVE(this.proxy.curStage.template.chapterId,this.proxy.curStage.template.mode,this.proxy.curStage.template.stageId,0,0,this.proxy.curStage.canSigleSweep,this.proxy.curStage.canMultSweep,this.proxy.curStage.multSweeptimes,this.startFight);
         }
      }
      
      public function startFight() : void
      {
         var _loc1_:Cmd_Battle_Fight_CS = new Cmd_Battle_Fight_CS();
         _loc1_.target = new Dto_BattleTarget();
         _loc1_.target.type = BattleTargetType.BattleTargetType_Fuben;
         _loc1_.isTryAgain = false;
         _loc1_.target.fubenChapterId = this.proxy.curStage.template.chapterId;
         _loc1_.target.fubenModeId = this.proxy.curStage.template.mode;
         _loc1_.target.fubenStageId = this.proxy.curStage.template.stageId;
         FubenGlobals.IS_AGAIN_FIGHT = true;
         this.server.sendMessage(_loc1_);
      }
      
      public function startUnionFubenFight() : void
      {
         UnionFubenProxyCmd.startUnionFubenFight(this.proxy.curStage.template.chapterId,this.proxy.curStage.template.stageId);
      }
      
      public function againStartFight() : void
      {
         var _loc1_:Cmd_Battle_Fight_CS = new Cmd_Battle_Fight_CS();
         _loc1_.target = new Dto_BattleTarget();
         _loc1_.target.type = BattleTargetType.BattleTargetType_Fuben;
         _loc1_.isTryAgain = true;
         _loc1_.target.fubenChapterId = this.proxy.curStage.template.chapterId;
         _loc1_.target.fubenModeId = this.proxy.curStage.template.mode;
         _loc1_.target.fubenStageId = this.proxy.curStage.template.stageId;
         this.server.sendMessage(_loc1_);
      }
      
      public function fightStage_sweep(param1:int, param2:int, param3:int, param4:int, param5:Boolean) : void
      {
         var _loc6_:FubenStageVO;
         if((_loc6_ = this.proxy.data.getFubenStageVo(param1,param2,param3)).template.energyCost > GameGloble.actorModel.currEnergy)
         {
            CommonCmd.showBuyPhysicalPanel();
            return;
         }
         if(_loc6_.hasLimit && _loc6_.times <= 0)
         {
            if(!this.privilegeProxy.hasPrivilege(PrivilegeConst.PRIVILEGE_FUBEN_SWEEP_TIME))
            {
               CommonCmd.showVipConfirm(FontHKHB.BATTLE_FIGHT_COUNT_MAX);
            }
            return;
         }
         var _loc7_:Cmd_Fuben_Sweep_CS;
         (_loc7_ = new Cmd_Fuben_Sweep_CS()).chapterid = param1;
         _loc7_.modeid = param3;
         _loc7_.stageid = param2;
         _loc7_.multiSweep = param5;
         _loc7_.times = param4;
         this.server.sendMessage(_loc7_);
      }
      
      public function fightStageSweepAgain(param1:int) : void
      {
         this.fightStage_sweep(this.proxy.sweepChapterId,this.proxy.sweepStageId,this.proxy.sweepModelId,param1,param1 > 1);
      }
      
      public function popMsgCacheList() : void
      {
         this.proxy.popMsgCacheList();
      }
   }
}
