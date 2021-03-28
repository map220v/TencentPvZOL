package com.qq.modules.main.logic.initData
{
   import asgui.managers.LoaderCollection;
   import asgui.managers.LoaderManager;
   import com.qq.GameGloble;
   import com.qq.modules.main.logic.initData.basic.BasicInitDataTask;
   import com.qq.utils.UrlManager;
   import com.qq.utils.db.ClientDB;
   import flash.display.Loader;
   import flash.display.LoaderInfo;
   import flash.events.Event;
   import flash.net.URLRequest;
   import flash.utils.ByteArray;
   import org.as3commons.logging.api.getLogger;
   
   public class InitClientDBDataTask extends BasicInitDataTask
   {
       
      
      private var _clientDBUrl:String;
      
      public function InitClientDBDataTask(param1:Boolean = true)
      {
         super(InitDataManager.Init_ClientDB,param1);
      }
      
      override public function start() : void
      {
         var _loc1_:Boolean = true;
         var _loc2_:Loader = null;
         super.start();
         getLogger("loading").debug("Loading clientDB");
         if(_loc1_)
         {
            this._clientDBUrl = "clientDB.txt";
            this._clientDBUrl = UrlManager.getInstance().getUrl(UrlManager.Url_ClientDB,this._clientDBUrl);
            LoaderManager.impl.addEventListener(Event.CLOSE,this.onCompleteLoadClientDB);
            LoaderManager.GetLoaderCollection(this._clientDBUrl);
         }
         else
         {
            this._clientDBUrl = "ModuleClientDBRes.swf";
            this._clientDBUrl = UrlManager.getInstance().getUrl(UrlManager.Url_ClientDB,this._clientDBUrl);
            _loc2_ = new Loader();
            _loc2_.contentLoaderInfo.addEventListener(Event.COMPLETE,this.onCompleteLoadClientDBRes);
            _loc2_.load(new URLRequest(this._clientDBUrl));
         }
      }
      
      private function onCompleteLoadClientDB(param1:Event) : void
      {
         LoaderManager.impl.removeEventListener(Event.CLOSE,this.onCompleteLoadClientDB);
         var _loc2_:LoaderCollection = LoaderManager.GetLoaderCollection(this._clientDBUrl);
         var _loc3_:ByteArray = _loc2_.data;
         this.clientDBParser(_loc3_);
         this.loadAvatarConfig();
      }

      private function onCompleteLoadClientDBRes(param1:Event) : void
      {
         var _loc2_:LoaderInfo = param1.currentTarget as LoaderInfo;
         _loc2_.removeEventListener(Event.COMPLETE,this.onCompleteLoadClientDBRes);
         var _loc3_:Class = _loc2_.applicationDomain.getDefinition("ModuleClientDBRes_clientDBRes") as Class;
         var _loc4_:ByteArray = new _loc3_() as ByteArray;
         _loc4_.uncompress()
         this.clientDBParser(_loc4_);
         this.loadAvatarConfig();
      }
      
      private function loadAvatarConfig() : void
      {
         this._clientDBUrl = "ModuleAvatarConfig.swf";
         this._clientDBUrl = UrlManager.getInstance().getUrl(UrlManager.Url_ClientDB,this._clientDBUrl);
         var _loc1_:Loader = new Loader();
         _loc1_.contentLoaderInfo.addEventListener(Event.COMPLETE,this.onCompleteLoadAvatarConfig);
         _loc1_.load(new URLRequest(this._clientDBUrl));
      }
      
      private function onCompleteLoadAvatarConfig(param1:Event) : void
      {
         var _loc2_:LoaderInfo = param1.currentTarget as LoaderInfo;
         _loc2_.removeEventListener(Event.COMPLETE,this.onCompleteLoadAvatarConfig);
         var _loc3_:Class = _loc2_.applicationDomain.getDefinition("ModuleAvatarConfig_avatarConfig") as Class;
         var _loc4_:ByteArray = new _loc3_() as ByteArray;
         this.cardAvatarParser(_loc4_);
         InitDataManager.getInstance().finishTask(id);
      }
      
      private function clientDBParser(param1:ByteArray) : void
      {
         ClientDB.getInstance().load(param1);
      }
      
      private function cardAvatarParser(param1:ByteArray) : void
      {
         var _loc2_:XML = XML(param1.readUTFBytes(param1.bytesAvailable));
         GameGloble.avatarConfigXml = _loc2_;
      }
   }
}
