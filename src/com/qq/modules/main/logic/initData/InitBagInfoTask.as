package com.qq.modules.main.logic.initData
{
   import com.qq.GameGloble;
   import com.qq.modules.bag.model.BagService;
   import com.qq.modules.main.logic.initData.basic.BasicInitDataTask;
   import org.as3commons.logging.api.getLogger;
   
   public class InitBagInfoTask extends BasicInitDataTask
   {
       
      
      public function InitBagInfoTask(param1:Boolean = true)
      {
         super(InitDataManager.Init_BagItemInfo,param1);
      }
      
      override public function start() : void
      {
         super.start();
         getLogger("loading").debug("Loading Player Bag Information");
         var _loc1_:BagService = GameGloble.injector.getInstance(BagService);
         _loc1_.init();
         _loc1_.getBagItemInfo();
      }
   }
}
