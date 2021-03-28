package com.qq.modules.mapinfo.view.components
{
   import com.qq.modules.basic.view.BasicScreenMediator;
   import com.qq.modules.guidePlus.GuideContext;
   import com.qq.modules.guidePlus.command.GuideViewCmd;
   
   public class MapInfoSwitchChapterWndMediator extends BasicScreenMediator
   {
       
      
      [Inject]
      public var view:MapInfoSwitchChapterWnd;
      
      public function MapInfoSwitchChapterWndMediator()
      {
         super();
      }
      
      override protected function init() : void
      {
         super.init();
      }
      
      override protected function initialized() : void
      {
         super.initialized();
         GuideViewCmd.changeContext(GuideContext.WORLD_SWITCH);
      }
      
      override protected function initListener() : void
      {
         super.initListener();
      }
      
      override public function dispose() : void
      {
         GuideViewCmd.changeContext(GuideContext.lastContext);
         super.dispose();
      }
   }
}
