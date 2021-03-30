package
{
   import PVZ.Cmd.Cmd_TD_ReportLevelResult_SC;
   import asgui.managers.LoaderManager;
   import com.qq.constant.ls.LSConstant;
   import com.qq.modules.basic.BaseModule;
   import com.qq.modules.levelselect.command.LSProxyCommand;
   import com.qq.modules.levelselect.command.LSViewCmd;
   import com.qq.modules.levelselect.command.LSViewCommand;
   import com.qq.modules.levelselect.model.LSInitCmdType;
   import com.qq.modules.levelselect.view.components.LevelSelectMainCt;
   import com.qq.modules.sound.command.TDLevelSelectCommand;
   import flash.events.Event;
   import flash.events.IEventDispatcher;
   import org.as3commons.logging.api.getLogger;
   import org.robotlegs.extend.command.StrongRobotlegCommandEvent;
   
   public class ModuleLS extends BaseModule
   {
       
      
      private var ct:LevelSelectMainCt;
      
      public function ModuleLS()
      {
         super(true);
      }
      
      override public function Unload() : void
      {
         this.ct = null;
         super.Unload();
      }
      
      override protected function init() : void
      {
         super.init();
         this.left = 0;
         this.right = 0;
         this.top = 0;
         this.bottom = 0;
         registerCommandList("LSProxyCommand",LSProxyCommand,StrongRobotlegCommandEvent);
         registerCommandList("LSViewCommand",LSViewCommand,StrongRobotlegCommandEvent);
         registerCommandList("TDLevelSelectCommand",TDLevelSelectCommand,StrongRobotlegCommandEvent);
         this.id = "moduleLS";
      }
      
      override protected function initUI() : void
      {
         super.initUI();
         this.ct = new LevelSelectMainCt();
         this.ct.setFullSize();
         this.ct.id = "levelSelectMainCt";
         this.addChild(this.ct);
      }
      
      override public function set data(param1:Object) : void
      {
         super.data = param1;
         if(param1 == null)
         {
            return;
         }
         var _loc2_:Array = param1 as Array;
         var _loc3_:int = _loc2_[0];
         var _loc4_:Cmd_TD_ReportLevelResult_SC = param1[1];
         var _loc5_:int = _loc2_[2];
         var _loc6_:int = _loc2_[3];
         this.ct.reset(_loc3_);
         if(_loc4_ && _loc3_ == _loc4_.stageId)
         {
            if(_loc4_.expReward > 0)
            {
               LSViewCmd.addInitCmd(LSInitCmdType.ADD_EXP,[_loc4_.stageId,_loc4_.levelId,_loc4_.subLevelId],_loc4_.expReward);
            }
            if(_loc4_.firstPassCoinReward > 0)
            {
               LSViewCmd.addInitCmd(LSInitCmdType.ADD_MONEY,[_loc4_.stageId,_loc4_.levelId,_loc4_.subLevelId],_loc4_.firstPassCoinReward);
            }
            LSViewCmd.addInitCmd(LSInitCmdType.NEW_UNLOCK_LEVEL,[_loc4_.stageId,_loc4_.levelId,_loc4_.subLevelId]);
            LSViewCmd.addInitCmd(LSInitCmdType.CAMERA_TO,[_loc4_.stageId,_loc4_.levelId,_loc4_.subLevelId]);
         }
         else
         {
            LSConstant.LS_Goto_Chapter_ID = _loc3_;
            LSConstant.LS_Goto_Level_ID = _loc5_;
            LSConstant.LS_Goto_Sub_Level_ID = _loc6_;
         }
         LoaderManager.AddCompleteCallback(this.onComplete);
      }
      
      private function onComplete(param1:Event = null) : void
      {
         if(param1)
         {
            (param1.currentTarget as IEventDispatcher).removeEventListener(Event.CLOSE,this.onComplete);
         }
         getLogger().debug("Registration of the level selection module is completed, and the level information is requested.");
      }
   }
}
