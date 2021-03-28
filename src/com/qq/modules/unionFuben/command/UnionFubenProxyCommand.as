package com.qq.modules.unionFuben.command
{
   import PVZ.Cmd.Cmd_GuildFuben_GetChapterInfo_CS;
   import PVZ.Cmd.Cmd_GuildFuben_GetFormation_CS;
   import PVZ.Cmd.Cmd_GuildFuben_GetStageInfo_CS;
   import PVZ.Cmd.Cmd_GuildFuben_NewDayReward_GetInfo_CS;
   import PVZ.Cmd.Cmd_GuildFuben_NewDayReward_Get_CS;
   import PVZ.Cmd.Cmd_GuildFuben_OpenChapter_CS;
   import PVZ.Cmd.Cmd_GuildFuben_StartFight_CS;
   import com.qq.constant.union.UnionConstant;
   import com.qq.modules.main.server.PvzSocketService;
   import com.qq.modules.union.model.UnionModel;
   import com.qq.modules.unionFuben.model.UnionFubenProxy;
   import org.robotlegs.extend.command.StrongRobotlegCommand;
   
   public class UnionFubenProxyCommand extends StrongRobotlegCommand
   {
       
      
      [Inject]
      public var pvzService:PvzSocketService;
      
      [Inject]
      public var unionFubenProxy:UnionFubenProxy;
      
      [Inject]
      public var unionModel:UnionModel;
      
      public function UnionFubenProxyCommand()
      {
         super();
      }
      
      public function getUnionFubenChapter() : void
      {
         var _loc1_:Cmd_GuildFuben_GetChapterInfo_CS = null;
         if(this.unionModel.getPlayerUnionState() == UnionConstant.PlayerState_In_Union)
         {
            _loc1_ = new Cmd_GuildFuben_GetChapterInfo_CS();
            this.pvzService.sendMessage(_loc1_);
         }
      }
      
      public function getUnionFubenStage(param1:uint) : void
      {
         var _loc2_:Cmd_GuildFuben_GetStageInfo_CS = null;
         if(this.unionModel.getPlayerUnionState() == UnionConstant.PlayerState_In_Union)
         {
            _loc2_ = new Cmd_GuildFuben_GetStageInfo_CS();
            _loc2_.chapterId = param1;
            this.pvzService.sendMessage(_loc2_);
         }
      }
      
      public function openChapter(param1:uint) : void
      {
         var _loc2_:Cmd_GuildFuben_OpenChapter_CS = new Cmd_GuildFuben_OpenChapter_CS();
         _loc2_.chapterId = param1;
         this.pvzService.sendMessage(_loc2_);
      }
      
      public function resetChapter(param1:uint) : void
      {
         var _loc2_:Cmd_GuildFuben_OpenChapter_CS = new Cmd_GuildFuben_OpenChapter_CS();
         _loc2_.chapterId = param1;
         this.pvzService.sendMessage(_loc2_);
      }
      
      public function getUnionFubenFormation() : void
      {
         var _loc1_:Cmd_GuildFuben_GetFormation_CS = null;
         if(this.unionModel.playerUnionInfo && this.unionModel.playerUnionInfo.id)
         {
            _loc1_ = new Cmd_GuildFuben_GetFormation_CS();
            this.pvzService.sendMessage(_loc1_);
         }
      }
      
      public function startUnionFubenFight(param1:uint, param2:uint) : void
      {
         var _loc3_:Cmd_GuildFuben_StartFight_CS = new Cmd_GuildFuben_StartFight_CS();
         this.unionFubenProxy.curChapterId = param1;
         this.unionFubenProxy.curStageId = param2;
         _loc3_.chapterId = param1;
         _loc3_.stageId = param2;
         this.pvzService.sendMessage(_loc3_);
      }
      
      public function getEveryDayRewardInf() : void
      {
         var _loc1_:Cmd_GuildFuben_NewDayReward_GetInfo_CS = new Cmd_GuildFuben_NewDayReward_GetInfo_CS();
         this.pvzService.sendMessage(_loc1_);
      }
      
      public function getEveryDayReward() : void
      {
         var _loc1_:Cmd_GuildFuben_NewDayReward_Get_CS = new Cmd_GuildFuben_NewDayReward_Get_CS();
         this.pvzService.sendMessage(_loc1_);
      }
   }
}
