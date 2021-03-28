package com.qq.modules.main.logic.initData
{
   import com.qq.modules.main.logic.initData.basic.BasicInitDataTask;
   import com.qq.utils.UrlManager;
   import flash.display.Loader;
   import flash.events.Event;
   import flash.net.URLRequest;
   
   public class InitFontTask extends BasicInitDataTask
   {
       
      
      private var m_loader:Loader;
      
      public function InitFontTask(param1:Boolean = true)
      {
         super(InitDataManager.Init_Font,param1);
      }
      
      override public function start() : void
      {
         super.start();
         this.m_loader = new Loader();
         this.m_loader.contentLoaderInfo.addEventListener(Event.COMPLETE,this.onLoadComplete);
         this.m_loader.load(new URLRequest(UrlManager.getInstance().getUrl(UrlManager.Url_Module,"ModuleFont.swf")));
      }
      
      private function onLoadComplete(param1:Event) : void
      {
         InitDataManager.getInstance().finishTask(InitDataManager.Init_Font);
      }
      
      override public function finish() : void
      {
         super.finish();
         this.m_loader.contentLoaderInfo.removeEventListener(Event.COMPLETE,this.onLoadComplete);
      }
   }
}
