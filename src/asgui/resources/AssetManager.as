package asgui.resources
{
   public class AssetManager
   {
      
      public static var instance:IAssetManager = new AssetManagerImpl();
       
      
      public function AssetManager()
      {
         super();
      }
      
      public static function getInstance() : IAssetManager
      {
         return instance;
      }
      
      public static function GetClass(param1:String) : Class
      {
         return getInstance().GetClass(param1);
      }
      
      public static function GetNewClass(param1:String) : Object
      {
         return getInstance().GetNewClass(param1);
      }
      
      public static function GetBoolean(param1:String) : Boolean
      {
         return getInstance().GetBoolean(param1);
      }
      
      public static function GetUint(param1:String) : uint
      {
         return getInstance().GetUint(param1);
      }
      
      public static function GetInt(param1:String) : int
      {
         return getInstance().GetInt(param1);
      }
      
      public static function GetNumber(param1:String) : Number
      {
         return getInstance().GetNumber(param1);
      }
      
      public static function GetStringArray(param1:String) : Array
      {
         return getInstance().GetStringArray(param1);
      }
      
      public static function GetString(param1:String, param2:Array = null) : String
      {
         return getInstance().GetString(param1,param2);
      }
      
      public static function GetObject(param1:String) : *
      {
         return getInstance().GetObject(param1);
      }
   }
}
