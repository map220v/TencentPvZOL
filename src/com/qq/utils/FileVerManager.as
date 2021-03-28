package com.qq.utils
{
   import org.as3commons.logging.api.getLogger;
   
   public class FileVerManager
   {
      
      private static var _instance:FileVerManager;
       
      
      private var _fileList:Array;
      
      public function FileVerManager()
      {
         super();
      }
      
      public static function getInstance() : FileVerManager
      {
         if(_instance == null)
         {
            _instance = new FileVerManager();
         }
         return _instance;
      }
      
      public function load(param1:XML) : void
      {
         var _loc5_:XML = null;
         if(param1 == null)
         {
            getLogger().debug("文件号配置文件为空");
            return;
         }
         var _loc2_:XMLList = param1.file;
         var _loc3_:int = _loc2_.length();
         this._fileList = new Array();
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            _loc5_ = _loc2_[_loc4_];
            this._fileList[_loc5_.@name] = _loc5_.@ver.toString();
            _loc4_++;
         }
      }
      
      public function getVer(param1:String) : String
      {
         var _loc2_:RegExp = /\//g;
         var _loc3_:String = param1.replace(_loc2_,"\\");
         var _loc4_:String;
         if((_loc4_ = this._fileList[_loc3_]) == null)
         {
            return "";
         }
         return _loc4_;
      }
   }
}
