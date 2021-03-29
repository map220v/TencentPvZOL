package com.qq.modules.levelselect.command
{
   import PVZ.Cmd.Cmd_TD_ReportLevelResult_SC;
   import asgui.managers.PopUpManager;
   import com.qq.modules.basic.event.CommonEvent;
   import com.qq.modules.levelselect.LSGlobals;
   import com.qq.modules.levelselect.model.LSProxy;
   import com.qq.modules.levelselect.model.templates.LSLevelTemplate;
   import com.qq.modules.levelselect.model.templates.LSLevelTemplateFactory;
   import com.qq.modules.levelselect.view.components.LSChallengeBonusWindow;
   import com.qq.modules.levelselect.view.components.LSChallengeRankWd;
   import com.qq.modules.levelselect.view.components.LSLevelChallengeEnterWd;
   import com.qq.modules.levelselect.view.components.LSLevelChallengeWd;
   import com.qq.modules.levelselect.view.components.LSLevelWd;
   import com.qq.modules.levelselect.view.components.LSPromotionRewardWd;
   import com.qq.modules.levelselect.view.components.LSScoreRewardWindow;
   import com.qq.modules.sound.command.TDLevelSelectCmd;
   import org.robotlegs.extend.command.StrongRobotlegCommand;
   
   public class LSViewCommand extends StrongRobotlegCommand
   {
       
      
      [Inject]
      public var proxy:LSProxy;
      
      public function LSViewCommand()
      {
         super();
      }
      
      public function enterStage(param1:int) : void
      {
         TDLevelSelectCmd.playBGSound(param1);
         this.dispatch(new CommonEvent(LSGlobals.LS_DO_ENTER_STAGE,param1));
      }
      
      public function showLevelWd(param1:int, param2:int = 1) : void
      {
         var _loc4_:LSLevelWd = null;
         var _loc3_:LSLevelTemplate = LSLevelTemplateFactory.instance.getTemplateByChallengeId(this.proxy.data.stageId,param1,param2,1);
         if(_loc3_ && _loc3_.challengeLevelId > 0)
         {
            this.showLevelChallengeWd(param1,param2);
         }
         else
         {
            _loc4_ = new LSLevelWd(this.proxy.data.stageId,param1,param2);
            PopUpManager.AddPopUp(_loc4_,null,true);
         }
      }
      
      public function showLevelChallengeWd(param1:int, param2:int = 1) : void
      {
         var _loc3_:LSLevelChallengeWd = new LSLevelChallengeWd(this.proxy.data.stageId,param1,param2);
         PopUpManager.AddPopUp(_loc3_,null,true);
      }
      
      public function showLevelChallengeEnterWd(param1:int, param2:int = 1) : void
      {
         var _loc3_:LSLevelChallengeEnterWd = new LSLevelChallengeEnterWd(this.proxy.data.stageId,param1,param2);
         PopUpManager.AddPopUp(_loc3_,null,true);
      }
      
      public function showPromotionWd(param1:int, param2:int, param3:Array) : void
      {
         var _loc4_:LSPromotionRewardWd = new LSPromotionRewardWd();
         PopUpManager.AddPopUp(_loc4_,null,true);
         _loc4_.data = {
            "preRank":param1,
            "curRank":param2,
            "rewardList":param3
         };
      }
      
      public function showChallengeRankWd(param1:int, param2:int, param3:int = 1, param4:int = 1) : void
      {
         var _loc5_:LSChallengeRankWd = new LSChallengeRankWd(param1,param2,param3,param4);
         PopUpManager.AddPopUp(_loc5_,null,true);
      }
      
      public function showChallengeBonusWd(param1:int = 1) : void
      {
         var _loc2_:LSChallengeBonusWindow = new LSChallengeBonusWindow();
         PopUpManager.AddPopUp(_loc2_,null,true);
         _loc2_.reset(param1);
      }
      
      public function addInitCmd(param1:int, param2:Object, param3:Object = null) : void
      {
         this.proxy.initData.addCmd(param1,param2,param3);
      }
      
      public function showScoreWindow() : void
      {
         var _loc2_:LSScoreRewardWindow = null;
         var _loc1_:Cmd_TD_ReportLevelResult_SC = this.proxy.getLastReportOnce();
         if(_loc1_ && _loc1_.toScore > _loc1_.fromScore)
         {
            _loc2_ = new LSScoreRewardWindow();
            _loc2_.reset(_loc1_);
            PopUpManager.AddPopUp(_loc2_,null,true);
         }
      }
   }
}
