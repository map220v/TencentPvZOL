package com.qq.modules.roleInfo.view.components
{
   import asgui.controls.Image;
   import com.qq.modules.arena.model.templates.ArenaGroupSetting;
   import com.qq.modules.arena.model.templates.ArenaSettingFactory;
   import com.qq.utils.UrlManager;
   
   public class RoleArenaIcon extends RoleBuffIcon
   {
       
      
      private var img:Image;
      
      private var _currentStatus:int;
      
      public function RoleArenaIcon()
      {
         super();
      }
      
      override public function InitializeComponent() : void
      {
         super.InitializeComponent();
         this.img = new Image();
         this.addChild(this.img);
      }
      
      public function get currentStatus() : int
      {
         return this._currentStatus;
      }
      
      public function set currentStatus(param1:int) : void
      {
         var _loc2_:ArenaGroupSetting = null;
         this._currentStatus = param1;
         if(param1 == 0)
         {
            _loc2_ = ArenaSettingFactory.instance.getGroupSettingById(1);
            this.toolTip = "没有竞技场等级";
         }
         else
         {
            _loc2_ = ArenaSettingFactory.instance.getGroupSettingById(param1);
            this.toolTip = _loc2_.name + "\n" + _loc2_.des;
         }
         this.img.source = UrlManager.getUrl(UrlManager.Url_Arena,"s" + _loc2_.icon + ".png");
      }
      
      override public function Dispose() : void
      {
         super.Dispose();
      }
   }
}
