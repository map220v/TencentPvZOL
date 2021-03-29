package
{
   import com.qq.constant.roleInfo.RoleInfoPanelID;
   import com.qq.modules.basic.BaseModule;
   import com.qq.modules.roleInfo.view.components.NewRoleInfoPanel;
   import com.qq.modules.roleInfo.view.components.RoleInfoPanel;
   import com.qq.utils.UtilsManager;
   import flash.events.Event;
   
   public class ModuleRoleInfo extends BaseModule
   {
       
      
      public var roleInfo:RoleInfoPanel;
      
      public var cityRoleInfo:NewRoleInfoPanel;
      
      public function ModuleRoleInfo()
      {
         super();
         id = "ModuleRoleInfo";
      }
      
      override protected function init() : void
      {
         super.init();
         addEventListener(Event.ADDED_TO_STAGE,this.onAddToStage);
      }
      
      override public function set data(param1:Object) : void
      {
         super.data = param1;
         var _loc2_:Array = param1 as Array;
         var _loc3_:int = _loc2_[0];
         var _loc4_:int;
         if((_loc4_ = _loc2_[1]) == RoleInfoPanelID.CityRolePanel)
         {
            if(this.cityRoleInfo == null)
            {
               this.cityRoleInfo = new NewRoleInfoPanel();
               this.cityRoleInfo.x = 5;
               this.cityRoleInfo.y = 5;
            }
            this.addChild(this.cityRoleInfo);
            this.cityRoleInfo.reset();
            if(this.roleInfo != null)
            {
               UtilsManager.removeFromContainer(this.roleInfo);
            }
         }
         else
         {
            if(this.roleInfo == null)
            {
               this.roleInfo = new RoleInfoPanel();
            }
            this.addChild(this.roleInfo);
            this.roleInfo.reset(_loc3_);
            if(this.cityRoleInfo != null)
            {
               UtilsManager.removeFromContainer(this.cityRoleInfo);
            }
         }
      }
      
      private function onAddToStage(param1:Event) : void
      {
         if(parent != null)
         {
            parent.addChildAt(this,0);
         }
      }
      
      override public function Unload() : void
      {
         removeEventListener(Event.ADDED_TO_STAGE,this.onAddToStage);
         this.roleInfo = null;
         this.cityRoleInfo = null;
         super.Unload();
      }
   }
}
