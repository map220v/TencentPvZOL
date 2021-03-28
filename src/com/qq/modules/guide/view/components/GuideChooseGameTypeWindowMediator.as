package com.qq.modules.guide.view.components
{
   import asgui.managers.PopUpManager;
   import com.qq.GameGloble;
   import com.qq.constant.city.CityButtonConstant;
   import com.qq.modules.basic.view.BasicScreenMediator;
   import com.qq.modules.city.model.vo.CityData;
   import com.qq.modules.guide.command.GuideCmd;
   import com.qq.modules.guide.model.GuideUIData;
   import com.qq.modules.guide.view.GuideChooseGameTypeWindow;
   import com.qq.modules.guidePlus.GuideConst;
   import com.qq.modules.main.command.GameFlowCmd;
   import flash.events.Event;
   import flash.events.MouseEvent;
   
   public class GuideChooseGameTypeWindowMediator extends BasicScreenMediator
   {
       
      
      [Inject]
      public var view:GuideChooseGameTypeWindow;
      
      [Inject]
      public var cityData:CityData;
      
      public function GuideChooseGameTypeWindowMediator()
      {
         super();
      }
      
      override protected function init() : void
      {
         super.init();
      }
      
      override protected function initListener() : void
      {
         super.initListener();
         addComponentListener(this.view.button_td,MouseEvent.CLICK,this.onClickTD);
         addComponentListener(this.view.button_rpg,MouseEvent.CLICK,this.onClickRpg);
         addContextListener(GuideConst.SKIP_SOME,this.onSkipSome);
      }
      
      private function onSkipSome(param1:Event) : void
      {
         PopUpManager.RemovePopUp(this.view);
         GameGloble.isCloseAddBuildingEffect = false;
         GuideUIData.getInstance().unlock("1");
         GuideUIData.getInstance().unlock("2");
         GuideUIData.getInstance().unlock("3");
         this.cityData.addButton(CityButtonConstant.Name_Quest);
         this.cityData.addButton(CityButtonConstant.Name_Fuben);
         GameFlowCmd.gotoFuben();
      }
      
      private function onClickTD(param1:MouseEvent) : void
      {
         PopUpManager.RemovePopUp(this.view);
         GameFlowCmd.gotoGuideTD();
      }
      
      private function onClickRpg(param1:MouseEvent) : void
      {
         GameGloble.isCloseAddBuildingEffect = true;
         GuideCmd.skipSome();
      }
      
      override public function dispose() : void
      {
         super.dispose();
      }
   }
}
