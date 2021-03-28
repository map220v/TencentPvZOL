package com.qq.modules.plantTalent.command
{
   import PVZ.Cmd.Cmd_Talent_GetList_CS;
   import PVZ.Cmd.Cmd_Talent_Study_CS;
   import asgui.managers.PopUpManager;
   import com.qq.GameGloble;
   import com.qq.modules.main.server.PvzSocketService;
   import com.qq.modules.plantTalent.model.PlantTalentModel;
   import com.qq.modules.plantTalent.service.PlantTalentService;
   import com.qq.modules.plantTalent.service.linkGuide.ILinkGuide;
   import com.qq.modules.plantTalent.service.linkGuide.LinkGuide_1;
   import com.qq.modules.plantTalent.service.linkGuide.LinkGuide_10;
   import com.qq.modules.plantTalent.service.linkGuide.LinkGuide_11;
   import com.qq.modules.plantTalent.service.linkGuide.LinkGuide_12;
   import com.qq.modules.plantTalent.service.linkGuide.LinkGuide_13;
   import com.qq.modules.plantTalent.service.linkGuide.LinkGuide_14;
   import com.qq.modules.plantTalent.service.linkGuide.LinkGuide_15;
   import com.qq.modules.plantTalent.service.linkGuide.LinkGuide_16;
   import com.qq.modules.plantTalent.service.linkGuide.LinkGuide_17;
   import com.qq.modules.plantTalent.service.linkGuide.LinkGuide_18;
   import com.qq.modules.plantTalent.service.linkGuide.LinkGuide_19;
   import com.qq.modules.plantTalent.service.linkGuide.LinkGuide_2;
   import com.qq.modules.plantTalent.service.linkGuide.LinkGuide_20;
   import com.qq.modules.plantTalent.service.linkGuide.LinkGuide_21;
   import com.qq.modules.plantTalent.service.linkGuide.LinkGuide_22;
   import com.qq.modules.plantTalent.service.linkGuide.LinkGuide_23;
   import com.qq.modules.plantTalent.service.linkGuide.LinkGuide_3;
   import com.qq.modules.plantTalent.service.linkGuide.LinkGuide_4;
   import com.qq.modules.plantTalent.service.linkGuide.LinkGuide_5;
   import com.qq.modules.plantTalent.service.linkGuide.LinkGuide_6;
   import com.qq.modules.plantTalent.service.linkGuide.LinkGuide_7;
   import com.qq.modules.plantTalent.service.linkGuide.LinkGuide_8;
   import com.qq.modules.plantTalent.service.linkGuide.LinkGuide_9;
   import com.qq.modules.sound.command.UISoundCmd;
   import com.qq.modules.td.view.components.TalentAdvancedWindow;
   import flash.utils.Dictionary;
   import org.robotlegs.extend.command.StrongRobotlegCommand;
   
   public class PlantTalentCommand extends StrongRobotlegCommand
   {
       
      
      [Inject]
      public var ptModel:PlantTalentModel;
      
      [Inject]
      public var pvzServer:PvzSocketService;
      
      [Inject]
      public var plantTalentServer:PlantTalentService;
      
      private const LINK_GUIDE_LIST:Array = [LinkGuide_1,LinkGuide_2,LinkGuide_3,LinkGuide_4,LinkGuide_5,LinkGuide_6,LinkGuide_7,LinkGuide_8,LinkGuide_9,LinkGuide_10,LinkGuide_11,LinkGuide_12,LinkGuide_13,LinkGuide_14,LinkGuide_15,LinkGuide_16,LinkGuide_17,LinkGuide_18,LinkGuide_19,LinkGuide_20,LinkGuide_21,LinkGuide_22,LinkGuide_23];
      
      private var linkGuideDic:Dictionary;
      
      public function PlantTalentCommand()
      {
         this.linkGuideDic = new Dictionary();
         super();
      }
      
      public function getTalentList(param1:int) : void
      {
         this.plantTalentServer.init();
         var _loc2_:Cmd_Talent_GetList_CS = new Cmd_Talent_GetList_CS();
         _loc2_.stageId = param1;
         this.pvzServer.sendMessage(_loc2_);
      }
      
      public function studyTalent(param1:int) : void
      {
         var _loc2_:Cmd_Talent_Study_CS = new Cmd_Talent_Study_CS();
         _loc2_.talentId = param1;
         this.pvzServer.sendMessage(_loc2_);
         UISoundCmd.plant_lab_gift_learn();
      }
      
      public function openPlantAdvancedWindow(param1:int) : void
      {
         var _loc2_:TalentAdvancedWindow = new TalentAdvancedWindow();
         PopUpManager.AddPopUp(_loc2_,null,true);
         _loc2_.reset(param1);
      }
      
      public function addLinkGuide(param1:int, param2:Array = null) : void
      {
         var _loc3_:ILinkGuide = null;
         var _loc4_:Class = null;
         if(this.linkGuideDic[param1 - 1] == null)
         {
            _loc3_ = new (_loc4_ = this.LINK_GUIDE_LIST[param1 - 1] as Class)() as ILinkGuide;
            this.linkGuideDic[param1 - 1] = _loc3_;
            GameGloble.injector.injectInto(_loc3_);
         }
         else
         {
            _loc3_ = this.linkGuideDic[param1 - 1];
         }
         _loc3_.setParam(param2);
         _loc3_.linkTo();
      }
   }
}
