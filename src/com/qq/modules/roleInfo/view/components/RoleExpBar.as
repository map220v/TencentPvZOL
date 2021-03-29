package com.qq.modules.roleInfo.view.components
{
   import asgui.controls.Image;
   import asgui.controls.ProgressBar;
   import asgui.controls.progresses.ProgressBarMode;
   import asgui.resources.AssetManager;
   import asgui.utils.StringUtil;
   import com.qq.templates.font.FontHKHB;
   import com.qq.templates.font.FontNormal;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   import flash.utils.getTimer;
   
   public class RoleExpBar extends BasicRoleBar
   {
       
      
      public var pg:ProgressBar;
      
      public function RoleExpBar()
      {
         super();
      }
      
      override public function InitializeComponent() : void
      {
         super.InitializeComponent();
         this.pg = new ProgressBar();
         this.pg.styleName = ".ProgressBar_Level";
         this.pg.label = "%1%";
         this.pg.width = 64;
         this.pg.height = 26;
         this.pg.mode = ProgressBarMode.MANUAL;
         this.pg.SetProgress(0,100);
         this.pg.x = 32;
         this.pg.y = 10;
         addChild(this.pg);
         bg = new Image();
         bg.source = AssetManager.instance.GetClass("ModuleRoleInfo_ExpBar");
         bg.name = "Role_expBar";
         addChild(bg);
      }
      
      public function setExp(param1:int, param2:int, param3:int, param4:Boolean = false) : void
      {
         param2 = Math.max(param2,0);
         this.pg.SetProgress(param2,param3);
         this.pg.label = param1 + FontHKHB.ROLE_LEVEL;
         if(param4 && preValue < param2)
         {
            if(timer == null)
            {
               timer = new Timer(100);
               timer.addEventListener(TimerEvent.TIMER,this.timerHandler);
               timer.start();
            }
            timeout = getTimer() + 2000;
         }
         preValue = param2;
         this.toolTip = StringUtil.substitute(FontNormal.RoleInfo_Tooltip_Exp,param1,param2,param3);
      }
      
      override protected function timerHandler(param1:TimerEvent) : void
      {
         if(getTimer() > timeout)
         {
            if(timer)
            {
               timer.removeEventListener(TimerEvent.TIMER,this.timerHandler);
               timer.stop();
               timer = null;
            }
            this.pg.SetStyle("color","#FFFFFF");
            return;
         }
         ++counter;
         this.pg.SetStyle("color",counter % 2 == 1 ? "#00ff00" : "#FFFFFF");
      }
   }
}
