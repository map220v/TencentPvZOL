package asgui.managers
{
   import asgui.managers.shares.SharedObjectBmpd;
   import flash.net.SharedObject;
   
   public class ShareManager
   {
      
      private static var _impl:ShareManager;
       
      
      public var skinDataShare:SharedObjectBmpd;
      
      public var blitDataShare:SharedObjectBmpd;
      
      public var paramShare:SharedObject;
      
      public function ShareManager()
      {
         super();
         var _loc1_:SharedObject = SharedObject.getLocal("Sound_SoundP");
      }
      
      public static function get impl() : ShareManager
      {
         if(_impl == null)
         {
            _impl = new ShareManager();
         }
         return _impl;
      }
      
      public function SetSkinDataShareInit(param1:String, param2:int = 0) : void
      {
      }
      
      public function SetBlitDataShareInit(param1:String, param2:int = 0) : void
      {
      }
      
      public function SetShareInit(param1:String) : void
      {
      }
   }
}
