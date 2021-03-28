package com.qq.modules.main.logic.initData
{
   import com.qq.GameGloble;
   import com.qq.modules.main.logic.initData.basic.BasicInitDataTask;
   import com.qq.modules.union.command.UnionServiceCmd;
   import com.qq.modules.union.model.UnionService;
   import org.as3commons.logging.api.getLogger;
   
   public class InitUnionInfoTask extends BasicInitDataTask
   {
       
      
      public function InitUnionInfoTask(param1:Boolean = true)
      {
         super(InitDataManager.Init_UnionInfo,param1);
      }
      
      override public function start() : void
      {
         super.start();
         getLogger("loading").debug("Loading Player Union Information");
         var _loc1_:UnionService = GameGloble.injector.getInstance(UnionService);
         _loc1_.init();
         UnionServiceCmd.getMyUnionInfo();
      }
   }
}
