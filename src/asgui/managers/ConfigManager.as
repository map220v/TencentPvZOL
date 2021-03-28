package asgui.managers
{
   public class ConfigManager
   {
      
      private static var _impl:ConfigManagerImpl;
       
      
      public function ConfigManager()
      {
         super();
      }
      
      public static function get impl() : ConfigManagerImpl
      {
         if(!_impl)
         {
            _impl = new ConfigManagerImpl();
         }
         return _impl;
      }
      
      public static function GetConfig(param1:String) : String
      {
         return impl.GetConfig(param1);
      }
      
      public static function GetConfigByType(param1:String) : Array
      {
         return impl.GetConfigByType(param1);
      }
      
      public static function get loadingLabel() : String
      {
         return impl.loadingLabel;
      }
      
      public static function AddXml(param1:String, param2:Object, param3:int = -1) : void
      {
         impl.AddXml(param1,param2,param3);
      }
      
      public static function GetXml(param1:String) : XML
      {
         return impl.GetXml(param1);
      }
      
      public static function get configModuleXmlInfos() : Vector.<ConfigModuleXmlInfo>
      {
         return impl.configModuleXmlInfos;
      }
   }
}
