package com.qq.modules.td.logic.process
{
   import com.qq.modules.td.model.TDGameInfo;
   import tencent.tools.behaviourTrees.BehaviourTreeCenter;
   
   public class TDBehaviourTreeProcess extends TDBasicProcess implements IProcess
   {
      
      public static var ID:uint = 7;
       
      
      public function TDBehaviourTreeProcess()
      {
         super();
         updateDuration = int(1000 / 30);
      }
      
      override public function doProcess() : void
      {
         super.doProcess();
         if(TDGameInfo.getInstance().isRunningGame)
         {
            BehaviourTreeCenter.instance.runAIAll();
         }
      }
   }
}
