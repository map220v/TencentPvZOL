package com.qq.modules.levelselect.view.maps
{
   import asgui.controls.Alert;
   import asgui.core.IDisposable;
   import asgui.events.CloseEvent;
   import asgui.managers.ToolTipManager;
   import asgui.resources.AssetManager;
   import asgui.utils.DisplayUtil;
   import com.qq.GameGloble;
   import com.qq.data.DataCacheManager;
   import com.qq.display.QAlert;
   import com.qq.managers.FilterManager;
   import com.qq.modules.basic.event.CommonEvent;
   import com.qq.modules.levelselect.LSGlobals;
   import com.qq.modules.levelselect.command.LSViewCmd;
   import com.qq.modules.levelselect.model.LSProxy;
   import com.qq.modules.levelselect.model.templates.LSLevelTemplate;
   import com.qq.modules.levelselect.model.templates.LSLevelTemplateFactory;
   import com.qq.modules.levelselect.model.vo.LSLevelInfoVO;
   import com.qq.modules.td.data.game.unit.TDPlantBaseStaticInfo;
   import com.qq.templates.font.FontNormal;
   import com.qq.utils.AnimateManager;
   import com.qq.utils.CommandDispatcher;
   import com.qq.utils.UrlManager;
   import com.qq.utils.db.ClientDBTableName;
   import flash.display.DisplayObject;
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import flash.utils.setTimeout;
   
   public class LSMapLevelIcon implements IDisposable
   {
       
      
      private var mc:MovieClip;
      
      private var challengeEffect:MovieClip;
      
      private var stageId:int;
      
      private var levelId:int;
      
      private var subLevelId:int;
      
      private var plant:LSMapLevelPlant;
      
      private var roleHead:LSMapLevelRole;
      
      private var levelSuspend:LSMapLevelSuspend;
      
      public var vo:LSLevelInfoVO;
      
      private var originalScale:Number = 1;
      
      private var initX:Number;
      
      private var initY:Number;
      
      private var _hasDisposed:Boolean;
      
      public function LSMapLevelIcon(param1:MovieClip, param2:int, param3:int, param4:int)
      {
         super();
         this.stageId = param2;
         this.subLevelId = param4;
         this.levelId = param3;
         this.mc = param1;
         var _loc5_:MovieClip = param1["icon"];
         this.initX = _loc5_.x;
         this.initY = _loc5_.y;
         var _loc6_:MovieClip;
         (_loc6_ = param1["tipLast"]).visible = false;
         _loc6_.mouseChildren = _loc6_.mouseEnabled = false;
         param1.buttonMode = true;
         var _loc7_:MovieClip;
         (_loc7_ = _loc6_["movie"]).stop();
         this.challengeEffect = param1["mcChallengeEffect"];
         this.challengeEffect.visible = false;
         this.challengeEffect.stop();
         this.challengeEffect.mouseChildren = this.challengeEffect.mouseEnabled = false;
         DisplayUtil.StopMovieClip(param1);
         param1.addEventListener(MouseEvent.CLICK,this.clickHandler);
         _loc5_.addEventListener(MouseEvent.ROLL_OVER,this.overHandler);
         _loc5_.addEventListener(MouseEvent.ROLL_OUT,this.outHandler);
         param1.visible = false;
         ToolTipManager.RegisterToolTip(param1,param2 + "_" + param3 + "_" + param4,LSMapLevelToolTip);
         if(param4 == 1)
         {
            _loc5_.gotoAndStop(2);
         }
         CommandDispatcher._dispatcher.addEventListener(LSGlobals.LS_ROLL_OVER_CHALLENGE_LEVEL,this.onRollOverChallengeLevel);
      }
      
      public function get hasDisposed() : Boolean
      {
         return this._hasDisposed;
      }
      
      public function Dispose() : void
      {
         var _loc1_:MovieClip = null;
         var _loc2_:MovieClip = null;
         var _loc3_:MovieClip = null;
         var _loc4_:MovieClip = null;
         this.vo = null;
         if(this.mc)
         {
            ToolTipManager.RegisterToolTip(this.mc,null);
            _loc1_ = this.mc["icon"];
            _loc2_ = this.mc["plant"];
            _loc3_ = this.mc["stars"];
            _loc4_ = this.mc["tipLast"];
            while(_loc2_.numChildren > 0)
            {
               (_loc2_.removeChildAt(0) as IDisposable).Dispose();
            }
            while(_loc3_.numChildren > 0)
            {
               _loc3_.removeChildAt(0);
            }
            CommandDispatcher._dispatcher.removeEventListener(LSGlobals.LS_ROLL_OVER_CHALLENGE_LEVEL,this.onRollOverChallengeLevel);
            this.mc.removeEventListener(MouseEvent.CLICK,this.clickHandler);
            _loc1_.removeEventListener(MouseEvent.ROLL_OVER,this.overHandler);
            _loc1_.removeEventListener(MouseEvent.ROLL_OUT,this.outHandler);
            this.mc = null;
         }
         if(this.plant)
         {
            this.plant.Dispose();
            this.plant = null;
         }
         if(this.roleHead)
         {
            this.roleHead.Dispose();
            this.roleHead = null;
         }
         this._hasDisposed = true;
      }
      
      public function setLast(param1:Boolean) : void
      {
         var _loc2_:MovieClip = this.mc["tipLast"];
         var _loc3_:MovieClip = _loc2_["movie"];
         if(this.vo.challengeLevelId == 0)
         {
            _loc2_.visible = param1 && this.vo.template.bonusPlant == 0;
         }
         if(param1)
         {
            if(this.vo.template.bonusPlant == 0 && this.vo.template.subLevelId == 1)
            {
               _loc3_.addChild(AssetManager.GetNewClass("LS_Fight_Movie") as DisplayObject);
            }
            else
            {
               while(_loc3_.numChildren > 0)
               {
                  _loc3_.removeChildAt(0);
               }
            }
         }
         else
         {
            while(_loc3_.numChildren > 0)
            {
               _loc3_.removeChildAt(0);
            }
         }
      }
      
      protected function outHandler(param1:MouseEvent) : void
      {
         if(this.mc.isPlaying)
         {
            return;
         }
         var _loc2_:MovieClip = this.mc["icon"];
         _loc2_.filters = [];
         _loc2_.scaleX = _loc2_.scaleY = this.originalScale;
         _loc2_.x = this.initX;
         _loc2_.y = this.initY;
      }
      
      protected function overHandler(param1:MouseEvent) : void
      {
         if(this.mc.isPlaying)
         {
            return;
         }
         var _loc2_:MovieClip = this.mc["icon"];
         this.originalScale = _loc2_.scaleX;
         _loc2_.filters = [FilterManager.getGlowLine()];
         _loc2_.scaleX = _loc2_.scaleY = this.originalScale * 1.1;
         _loc2_.x = this.initX - 2;
         _loc2_.y = this.initY - 2;
         if(this.levelSuspend)
         {
            if(!this.mc.parent.contains(this.levelSuspend))
            {
               this.mc.parent.addChild(this.levelSuspend);
            }
            this.levelSuspend.visible = true;
            this.levelSuspend.x = this.mc.x - this.levelSuspend.width * 0.25;
            this.levelSuspend.y = this.mc.y - this.levelSuspend.height * 0.35 - 68.75;
            this.levelSuspend.addEventListener(MouseEvent.ROLL_OUT,this.onLevelSuspendOut);
            this.levelSuspend.afterAnimInit();
            CommandDispatcher.send(LSGlobals.LS_ROLL_OVER_CHALLENGE_LEVEL,this);
         }
      }
      
      protected function onLevelSuspendOver(param1:MouseEvent) : void
      {
         this.levelSuspend.visible = true;
      }
      
      protected function onLevelSuspendOut(param1:MouseEvent) : void
      {
         this.levelSuspend.visible = false;
      }
      
      private function onRollOverChallengeLevel(param1:CommonEvent) : void
      {
         if(this != param1.param)
         {
            if(this.levelSuspend)
            {
               this.levelSuspend.animPlayed = false;
            }
         }
      }
      
      public function callVisible() : void
      {
         if(this.mc == null)
         {
            this.Dispose();
            return;
         }
         this.mc.visible = true;
         if(this.mc.currentLabel != "open")
         {
            this.mc.gotoAndPlay("open");
         }
      }
      
      public function callWin(param1:int = 0) : void
      {
         var _loc2_:int = 0;
         var _loc5_:LSMapLevelIconStar = null;
         this.mc.visible = true;
         var _loc3_:MovieClip = this.mc["stars"];
         if(this.mc.currentLabel != "win")
         {
            this.mc.gotoAndPlay("win");
         }
         var _loc4_:Vector.<LSMapLevelIconStar> = new Vector.<LSMapLevelIconStar>();
         if(param1 > 0 && this.vo.challengeLevelId == 0)
         {
            _loc2_ = _loc3_.numChildren - 1;
            while(_loc2_ >= 0)
            {
               if((_loc5_ = _loc3_.getChildAt(_loc2_) as LSMapLevelIconStar).enable)
               {
                  _loc5_.setEnable(false);
                  _loc4_.push(_loc5_);
                  if(--param1 <= 0)
                  {
                     break;
                  }
               }
               _loc2_--;
            }
         }
         while(_loc4_.length > 0)
         {
            setTimeout((_loc4_.shift() as LSMapLevelIconStar).setEnable,1000 * _loc4_.length,true,true);
         }
      }
      
      public function setWaitingUnlock() : void
      {
         this.mc.visible = false;
         this.mc.gotoAndStop(1);
      }
      
      public function loadVO(param1:LSLevelInfoVO) : void
      {
         var _loc4_:TDPlantBaseStaticInfo = null;
         var _loc5_:LSLevelTemplate = null;
         var _loc6_:LSLevelInfoVO = null;
         var _loc7_:LSMapLevelIconStar = null;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc10_:int = 0;
         this.vo = param1;
         this.mc.visible = true;
         if(param1.passed)
         {
            this.mc.gotoAndStop("win_ok");
         }
         else if(param1.unlocked)
         {
            if(this.mc.currentLabel != "open")
            {
               this.mc.gotoAndPlay("open");
            }
         }
         else
         {
            this.mc.visible = false;
         }
         var _loc2_:MovieClip = this.mc["plant"];
         var _loc3_:MovieClip = this.mc["stars"];
         if(this.plant)
         {
            this.plant.Dispose();
            _loc2_.removeChild(this.plant);
            this.plant = null;
         }
         if(this.roleHead)
         {
            this.roleHead.Dispose();
            _loc2_.removeChild(this.roleHead);
            this.roleHead = null;
         }
         if(_loc2_.numChildren == 0 && param1.template.bonusPlant > 0)
         {
            if(_loc4_ = DataCacheManager.getInstance().getTemplateDataById(ClientDBTableName.Table_PlantTypeInfo,param1.template.bonusPlant,TDPlantBaseStaticInfo))
            {
               this.plant = new LSMapLevelPlant(param1.template.bonusPlant,!param1.passed);
               this.plant.x = -this.plant.width / 2;
               this.plant.y = -this.plant.height;
               _loc2_.addChild(this.plant);
            }
         }
         else if((_loc5_ = LSLevelTemplateFactory.instance.getTemplateByChallengeId(this.vo.stageId,this.vo.levelId,this.vo.subLevelId,1)) && _loc5_.challengeLevelId > 0)
         {
            this.roleHead = new LSMapLevelRole();
            this.roleHead.scaleX = this.roleHead.scaleY = 0.75;
            this.roleHead.x = -this.roleHead.width * 0.375;
            this.roleHead.y = -this.roleHead.height * 0.75;
            _loc2_.addChild(this.roleHead);
            this.roleHead.setOuterFrame(1);
            if(param1.championInfo)
            {
               this.roleHead.setRoleInfo(param1.championInfo.roleId,param1.championInfo.qQFaceUrl,param1.championInfo.faceId);
            }
            this.roleHead.addEventListener(MouseEvent.CLICK,this.onRoleHeadClick);
            if(GameGloble.injector.hasMapping(LSProxy))
            {
               param1 = (GameGloble.injector.getInstance(LSProxy) as LSProxy).getChallengeLevelInfo(param1.levelId,param1.subLevelId,param1.challengeLevelId);
               _loc6_ = (GameGloble.injector.getInstance(LSProxy) as LSProxy).getLevelInfo(param1.levelId,param1.subLevelId);
            }
            this.levelSuspend = new LSMapLevelSuspend(this.vo.stageId,this.vo.levelId,this.vo.subLevelId,_loc5_.challengeLevelId,_loc6_);
            if(param1.championInfo)
            {
               this.levelSuspend.setRoleInfo(param1.championInfo.roleId,param1.championInfo.qQFaceUrl,param1.championInfo.faceId);
            }
            this.challengeEffect.visible = true;
            this.challengeEffect.play();
         }
         if(param1.challengeLevelId == 0)
         {
            _loc8_ = !!param1.achievementList ? int(param1.achievementList.length) : 0;
            _loc10_ = 80 / (param1.template.achievementList.length + 1);
            while(_loc3_.numChildren < param1.template.achievementList.length)
            {
               (_loc7_ = new LSMapLevelIconStar()).x = (1 + _loc3_.numChildren) * _loc10_ - 25;
               _loc3_.addChild(_loc7_);
            }
            _loc9_ = 0;
            while(_loc9_ < _loc3_.numChildren)
            {
               _loc7_ = _loc3_.getChildAt(_loc9_) as LSMapLevelIconStar;
               if(_loc9_ < _loc8_)
               {
                  _loc7_.setEnable(true);
               }
               else
               {
                  _loc7_.setEnable(false);
               }
               _loc9_++;
            }
         }
      }
      
      protected function onRoleHeadClick(param1:MouseEvent) : void
      {
         param1.stopImmediatePropagation();
         LSViewCmd.showLevelChallengeEnterWd(this.levelId,this.subLevelId);
      }
      
      protected function clickHandler(param1:MouseEvent) : void
      {
         var levelTemp:LSLevelTemplate = null;
         var e:MouseEvent = param1;
         levelTemp = LSLevelTemplateFactory.instance.getTemplateByStageIdAndLevelId(this.stageId,this.levelId,this.subLevelId);
         if(levelTemp)
         {
            if(levelTemp.movie != null && levelTemp.movie != "")
            {
               QAlert.Show(FontNormal.TD_Movie,"",Alert.OK | Alert.CANCEL,null,function(param1:CloseEvent):void
               {
                  var _loc2_:String = null;
                  if(param1.detail == Alert.OK)
                  {
                     _loc2_ = UrlManager.getUrl(UrlManager.Url_TDRes,"movie/" + levelTemp.movie);
                     AnimateManager.playFullScreenMovie(_loc2_,true,onMovieEnd);
                  }
                  else
                  {
                     LSViewCmd.showLevelWd(levelId,subLevelId);
                  }
               });
            }
            else
            {
               LSViewCmd.showLevelWd(this.levelId,this.subLevelId);
            }
         }
         else
         {
            LSViewCmd.showLevelWd(this.levelId,this.subLevelId);
         }
      }
      
      private function onMovieEnd() : void
      {
         LSViewCmd.showLevelWd(this.levelId,this.subLevelId);
      }
      
      public function get location() : Point
      {
         return new Point(this.mc.x,this.mc.y);
      }
   }
}
