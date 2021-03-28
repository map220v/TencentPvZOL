package com.qq.modules.td.logic.trigger.triggerNode
{
   import com.qq.CommandName;
   import com.qq.GameGloble;
   import com.qq.modules.basic.event.CommonEvent;
   import com.qq.modules.main.command.CommonCmd;
   import com.qq.modules.main.logic.flytext.FlyTextType;
   import com.qq.modules.main.model.SettingsModel;
   import com.qq.modules.main.model.settings.achievement.ce.TDAchievementInfoTemplate;
   import com.qq.modules.td.logic.trigger.TDTriggerManager;
   import com.qq.modules.td.logic.trigger.events.TriggerEvent;
   import com.qq.modules.td.model.TDGameInfo;
   import com.qq.modules.td.model.TDStageInfo;
   import com.qq.modules.td.view.ui.TDAchievementCt;
   import com.qq.templates.font.FontHKHB;
   import com.qq.utils.CommandDispatcher;
   import flash.geom.Point;
   import tencent.tools.trigger.TriggerBase;
   
   public class TrigPvz extends TriggerBase
   {
       
      
      [Inject]
      public var settingsModel:SettingsModel;
      
      protected var result:int = 0;
      
      protected var ui:TDAchievementCt;
      
      protected var des:String;
      
      private var offsetX:int;
      
      private var offsetY:int;
      
      private var hasResult:Boolean = false;
      
      public function TrigPvz()
      {
         super();
      }
      
      override public function dispose() : void
      {
         CommandDispatcher._dispatcher.removeEventListener(CommandName.TD_PauseTDGame,this.pauseHandler);
         CommandDispatcher._dispatcher.removeEventListener(CommandName.TD_ResumeTDGame,this.resumeHandler);
      }
      
      override public function setData(param1:int, param2:Array) : void
      {
         this.ui = new TDAchievementCt();
         var _loc3_:TDAchievementInfoTemplate = this.settingsModel.plantAchievementSettings.getAchievementInfoById(param1);
         this.des = _loc3_.getDesc(TDStageInfo.getInstance().achievementList);
         this.ui.setData(param1,this.des);
         super.setData(param1,param2);
         CommandDispatcher._dispatcher.dispatchEvent(new TriggerEvent("",[this.ui],false,TriggerEvent.TRIGGER_CREATE));
         if(this.ui.parent.getChildIndex(this.ui) == 0)
         {
            this.offsetX = 100;
            this.offsetY = 100;
         }
         else
         {
            this.offsetX = this.ui.localToGlobal(new Point(this.ui.x,this.ui.y)).x;
            this.offsetY = 150;
         }
         CommandDispatcher._dispatcher.addEventListener(CommandName.TD_PauseTDGame,this.pauseHandler);
         CommandDispatcher._dispatcher.addEventListener(CommandName.TD_ResumeTDGame,this.resumeHandler);
      }
      
      protected function resumeHandler(param1:CommonEvent) : void
      {
      }
      
      protected function pauseHandler(param1:CommonEvent) : void
      {
      }
      
      override public function initialize() : void
      {
         super.initialize();
         var _loc1_:int = TDGameInfo.getInstance().achievementList.length;
         var _loc2_:int = 0;
         while(_loc2_ < _loc1_)
         {
            if(TDGameInfo.getInstance().achievementList[_loc2_] == triggerID)
            {
               this.setResultUI(true);
               _loc2_ = _loc1_;
            }
            _loc2_++;
         }
      }
      
      override public function notify(param1:String, param2:Array) : void
      {
      }
      
      override public function execute() : Boolean
      {
         return false;
      }
      
      protected function setResult(param1:Boolean) : void
      {
         if(this.hasResult)
         {
            return;
         }
         this.hasResult = true;
         if(param1)
         {
            CommonCmd.txtFly("成就达成：" + this.des,this.offsetX,GameGloble.stage.stageHeight - this.offsetY,FlyTextType.FLY_TYPE_TRIGLE_SUCCESS);
            TDGameInfo.getInstance().addNewAchievement(this._triggerID);
         }
         else
         {
            CommonCmd.txtFly("成就失败：" + this.des,this.offsetX,GameGloble.stage.stageHeight - this.offsetY,FlyTextType.FLY_TYPE_TRIGLE_FAILED);
         }
         this.setResultUI(param1);
      }
      
      private function setResultUI(param1:Boolean) : void
      {
         this.result = !!param1 ? 1 : -1;
         if(param1)
         {
            this.ui.txt.text = FontHKHB.SUCCESS;
         }
         else
         {
            this.ui.txt.text = FontHKHB.FAILD;
            this.ui.txt.SetStyle("color","#ff0000");
         }
         TDTriggerManager.instance.removeTrigger(this);
      }
   }
}
