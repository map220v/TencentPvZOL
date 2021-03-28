package com.qq.modules.mergeServer.command
{
   import asgui.managers.PopUpManager;
   import com.qq.modules.main.model.ActorModel;
   import com.qq.modules.mergeServer.view.components.MergeServerTipPanel;
   import org.robotlegs.extend.command.StrongRobotlegCommand;
   
   public class MergeServerCommand extends StrongRobotlegCommand
   {
      
      public static const NAME:String = "MergeServerCommand";
       
      
      [Inject]
      public var actorModel:ActorModel;
      
      public function MergeServerCommand()
      {
         super();
      }
      
      public function showMergeFlag() : void
      {
         var _loc1_:MergeServerTipPanel = null;
         if(this.actorModel.mergeServerFlag)
         {
            _loc1_ = new MergeServerTipPanel();
            _loc1_.reset(this.actorModel.mergeServerFlag);
            PopUpManager.AddPopUp(_loc1_,null,false);
            this.actorModel.mergeServerFlag = null;
         }
      }
   }
}
