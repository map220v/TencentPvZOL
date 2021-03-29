package com.qq.modules.levelselect.view.maps
{
   import asgui.controls.Image;
   import asgui.resources.AssetManager;
   import com.qq.display.QCanvas;
   import com.qq.utils.IconUtil;
   import com.tencent.protobuf.Int64;
   import flash.display.MovieClip;
   import flash.events.Event;
   
   public class LSMapLevelRole extends QCanvas
   {
       
      
      public var imgDecorate:Image;
      
      public var imgHead:Image;
      
      public var headIcon:Image;
      
      public var headBG:Image;
      
      public var headMask:Image;
      
      public var roleId:Int64;
      
      public function LSMapLevelRole()
      {
         super();
      }
      
      override public function InitializeComponent() : void
      {
         super.InitializeComponent();
         this.height = 89;
         this.headBG = new Image();
         this.headBG.x = 3;
         this.headBG.y = 27;
         addChild(this.headBG);
         this.headBG.source = AssetManager.GetClass("LS_RoleInfo_HeadBG");
         this.headIcon = new Image();
         this.headIcon.loadTimeout = 5000;
         this.headIcon.useLoaderManager = false;
         this.headIcon.width = this.headIcon.height = 50;
         this.headIcon.scaleContent = true;
         this.headIcon.addEventListener(Event.COMPLETE,this.onLoadHeadComplete);
         addChild(this.headIcon);
         this.headMask = new Image();
         this.headMask.x = 0;
         this.headMask.width = 66;
         this.headMask.height = 89;
         addChild(this.headMask);
         this.headMask.source = AssetManager.GetClass("LS_RoleInfo_HeadMask");
      }
      
      public function setOuterFrame(param1:int) : void
      {
         var _loc2_:int = 0;
         switch(param1)
         {
            case 1:
               _loc2_ = 2;
               break;
            case 2:
               _loc2_ = 3;
               break;
            case 3:
               _loc2_ = 4;
               break;
            default:
               _loc2_ = 1;
         }
         (this.headMask.mcHolder as MovieClip).gotoAndStop(_loc2_);
      }
      
      public function setRoleInfo(param1:Int64, param2:String, param3:int) : void
      {
         this.headIcon.source = IconUtil.getFaceIcon(this.headIcon,param3,param2);
         this.headBG.mcHolder["mcBlank"].visible = false;
      }
      
      private function onLoadHeadComplete(param1:Event) : void
      {
         this.headIcon.removeEventListener(Event.COMPLETE,this.onLoadHeadComplete);
         this.headIcon.x = (this.headBG.width - this.headIcon.width) * 0.5 + 5;
         this.headIcon.y = (this.headBG.height - this.headIcon.height) * 0.5 + 28;
      }
   }
}
