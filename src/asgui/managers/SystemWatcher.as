package asgui.managers
{
   import asgui.events.SystemWatcherEvent;
   import asgui.resources.IAssetManager;
   import asgui.styles.IStyleManagerImpl;
   import asgui.utils.DisplayUtil;
   import flash.display.DisplayObject;
   import flash.events.EventDispatcher;
   import flash.events.MouseEvent;
   
   public class SystemWatcher extends EventDispatcher
   {
       
      
      private var systemManager:SystemManager;
      
      public function SystemWatcher(param1:SystemManager)
      {
         super();
         this.systemManager = param1;
      }
      
      public function SetStyleManagerImpl(param1:IStyleManagerImpl) : void
      {
      }
      
      public function SetAssetManagerImpl(param1:IAssetManager) : void
      {
      }
      
      public function StartListenMouseDisplayObject() : void
      {
         this.systemManager.removeEventListener(MouseEvent.MOUSE_OVER,this.SystemManagerMouseOverHandler);
         this.systemManager.addEventListener(MouseEvent.MOUSE_OVER,this.SystemManagerMouseOverHandler);
      }
      
      public function StopListenMouseDisplayObject() : void
      {
         this.systemManager.removeEventListener(MouseEvent.MOUSE_OVER,this.SystemManagerMouseOverHandler);
      }
      
      private function SystemManagerMouseOverHandler(param1:MouseEvent) : void
      {
         var _loc2_:Array = DisplayUtil.GetAllParentsTo(param1.target as DisplayObject,SystemManager);
         var _loc3_:SystemWatcherEvent = new SystemWatcherEvent(SystemWatcherEvent.MOUSE_DISPLAY_OBJECT,param1.clone() as MouseEvent);
         _loc3_.displayObjectList = _loc2_;
         this.dispatchEvent(_loc3_);
      }
   }
}
