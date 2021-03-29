package com.qq.modules.levelselect.view.maps
{
   import asgui.controls.Image;
   import asgui.managers.ToolTipManager;
   import asgui.resources.AssetManager;
   import com.qq.managers.FilterManager;
   import com.qq.modules.levelselect.command.LSViewCmd;
   import com.qq.modules.levelselect.model.vo.LSLevelInfoVO;
   import com.tencent.protobuf.Int64;
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   
   public class LSMapLevelSuspend extends Sprite
   {
       
      
      public var imgBack:Image;
      
      public var mcBack:MovieClip;
      
      public var roleHead:LSMapLevelRole;
      
      public var btnNormal:SimpleButton;
      
      public var btnChallenge:SimpleButton;
      
      public var stageId:int;
      
      public var levelId:int;
      
      public var subLevelId:int;
      
      public var challengeId:int;
      
      public var vo:LSLevelInfoVO;
      
      private var _animPlayed:Boolean;
      
      public function LSMapLevelSuspend(param1:int, param2:int, param3:int, param4:int, param5:LSLevelInfoVO = null)
      {
         super();
         this.stageId = param1;
         this.levelId = param2;
         this.subLevelId = param3;
         this.challengeId = param4;
         this.vo = param5;
         this.imgBack = new Image();
         this.imgBack.width = 241;
         this.imgBack.height = 240;
         this.imgBack.source = AssetManager.instance.GetClass("LS_Challenge_Suspend");
         addChild(this.imgBack);
         this.mcBack = this.imgBack.mcHolder as MovieClip;
         this.mcBack.stop();
         this.mcBack.visible = false;
         this.mcBack["mcAnim"].mouseChildren = this.mcBack["mcAnim"].mouseEnabled = false;
         this.roleHead = new LSMapLevelRole();
         this.roleHead.setOuterFrame(1);
         this.roleHead.buttonMode = true;
         addChild(this.roleHead);
         this.roleHead.visible = false;
      }
      
      public function afterAnimInit() : void
      {
         this.mcBack.visible = true;
         this.mcBack["mcAnim"].visible = false;
         this.mcBack["mcBase"].visible = true;
         this._animPlayed = true;
         this.btnNormal = this.mcBack["mcBase"]["mcLeft"]["btnNormal"];
         this.btnChallenge = this.mcBack["mcBase"]["mcRight"]["btnChallenge"];
         this.roleHead.visible = true;
         this.roleHead.x = 79;
         this.roleHead.y = 1;
         this.btnNormal.addEventListener(MouseEvent.CLICK,this.onNormal);
         this.btnChallenge.addEventListener(MouseEvent.CLICK,this.onChallenge);
         this.roleHead.addEventListener(MouseEvent.CLICK,this.onRank);
         if(this.vo && this.vo.passed)
         {
            this.btnChallenge.addEventListener(MouseEvent.CLICK,this.onChallenge);
            this.btnChallenge.filters = [];
            ToolTipManager.impl.RegisterToolTip(this.btnChallenge,"挑战关卡");
         }
         else
         {
            this.btnChallenge.removeEventListener(MouseEvent.CLICK,this.onChallenge);
            this.btnChallenge.filters = [FilterManager.getGaryFilter()];
            ToolTipManager.impl.RegisterToolTip(this.btnChallenge,"先通过普通模式，才能进入挑战模式哦！");
         }
         ToolTipManager.impl.RegisterToolTip(this.btnNormal,"普通关卡");
         ToolTipManager.impl.RegisterToolTip(this.roleHead,"排行榜");
      }
      
      public function setRoleInfo(param1:Int64, param2:String, param3:int) : void
      {
         this.roleHead.setRoleInfo(param1,param2,param3);
      }
      
      protected function onRank(param1:MouseEvent) : void
      {
         LSViewCmd.showChallengeRankWd(this.levelId,this.subLevelId,1,2);
      }
      
      private function onNormal(param1:MouseEvent) : void
      {
         LSViewCmd.showLevelChallengeWd(this.levelId,this.subLevelId);
      }
      
      private function onChallenge(param1:MouseEvent) : void
      {
         LSViewCmd.showLevelChallengeEnterWd(this.levelId,this.subLevelId);
      }
      
      public function get animPlayed() : Boolean
      {
         return this._animPlayed;
      }
      
      public function set animPlayed(param1:Boolean) : void
      {
         this._animPlayed = param1;
      }
   }
}
