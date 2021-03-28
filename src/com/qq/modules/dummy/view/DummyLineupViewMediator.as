package com.qq.modules.dummy.view
{
   import PVZ.Cmd.Dto_PuppetInfo;
   import com.qq.display.EmbattlePlant;
   import com.qq.modules.basic.view.BasicScreenMediator;
   import com.qq.modules.dummy.DummyConst;
   import com.qq.modules.dummy.DummyGlobel;
   import com.qq.modules.dummy.command.DummyViewCmd;
   import com.qq.modules.dummy.model.DummyDataFactory;
   import com.qq.modules.dummy.model.DummyProxy;
   import com.qq.modules.dummy.model.DummyZombieTemplate;
   import com.qq.modules.embattle.command.EmbattleCmd;
   import com.qq.modules.embattle.constant.EmbattleConst;
   import com.qq.modules.embattle.model.EmbattleModel;
   import flash.events.Event;
   import flash.events.MouseEvent;
   
   public class DummyLineupViewMediator extends BasicScreenMediator
   {
       
      
      [Inject]
      public var view:DummyLineupView;
      
      [Inject]
      public var proxy:DummyProxy;
      
      private var _dummyInfoList:Array;
      
      public function DummyLineupViewMediator()
      {
         super();
      }
      
      override protected function initialized() : void
      {
         super.initialized();
         this.refresh();
      }
      
      override protected function initListener() : void
      {
         super.initListener();
         if(this.view.isSelf)
         {
            addComponentListener(this.view.dummyView,MouseEvent.CLICK,this.onClickDummy);
            addComponentListener(this.view.dummyBaseView,MouseEvent.CLICK,this.onClickDummy);
         }
         addContextListener(DummyConst.DummyEvent_Update_Lineup,this.onLineupUpdate);
      }
      
      override public function reset(param1:Object = null) : void
      {
         super.reset(param1);
         this._dummyInfoList = param1 as Array;
         this.refresh();
      }
      
      private function onLineupUpdate(param1:Event) : void
      {
         if(this.view.isSelf)
         {
            this.refresh();
            if(EmbattleModel.getInstance().embattleMode == EmbattleConst.MODE_EXPEDITION)
            {
               return;
            }
            EmbattleCmd.updateCurFormation();
         }
      }
      
      private function refresh() : void
      {
         if(this.view.isSelf)
         {
            this._dummyInfoList = this.proxy.model.getLineupList();
         }
         this.refreshDummy();
      }
      
      private function refreshDummy() : void
      {
         if(this._dummyInfoList == null)
         {
            return;
         }
         this.setDummyEmbattleView(this.view.dummyView,this.view.dummyBaseView,this._dummyInfoList);
      }
      
      private function setDummyEmbattleView(param1:EmbattlePlant, param2:EmbattlePlant, param3:Array) : void
      {
         var _loc4_:int = 0;
         var _loc8_:Dto_PuppetInfo = null;
         var _loc9_:DummyZombieTemplate = null;
         var _loc5_:int = param3.length;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         while(_loc7_ < _loc5_)
         {
            if((_loc8_ = param3[_loc7_]) != null && _loc8_.baseId != 0)
            {
               if(_loc7_ == 0)
               {
                  _loc4_ = _loc8_.baseId;
               }
               _loc6_++;
            }
            _loc7_++;
         }
         if(_loc6_ <= 0)
         {
            param1.visible = false;
            param1.toolTip = null;
            param2.visible = false;
         }
         else
         {
            param2.visible = true;
            param1.visible = true;
            param1.toolTip = DummyGlobel.getDummyTeamToolTip(param3);
            _loc9_ = DummyDataFactory.getInstance().getDummyZombieInfoByID(_loc4_);
            param1.setDummyAssetUrl(_loc9_);
         }
      }
      
      private function onClickDummy(param1:Event) : void
      {
         DummyViewCmd.openWindow();
      }
   }
}
