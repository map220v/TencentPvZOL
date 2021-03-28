package asgui.core
{
   import asgui.managers.ISystemManager;
   
   public class Application extends LayoutContainer implements ITopContainer
   {
      
      public static var _application:Application;
       
      
      private var _systemManager:ISystemManager;
      
      public function Application(param1:ISystemManager)
      {
         this._systemManager = param1;
         _application = this;
         super();
      }
      
      public static function get application() : Application
      {
         return _application;
      }
      
      public function get systemManager() : ISystemManager
      {
         return this._systemManager;
      }
   }
}
