package com.qq.modules.guide.command
{
   import PVZ.Cmd.Cmd_Guide_GetKeys_CS;
   import PVZ.Cmd.Cmd_Guide_SetFinish_CS;
   import PVZ.Cmd.Cmd_Guide_SetKey_CS;
   import PVZ.Cmd.Cmd_Guide_SkipSome_CS;
   import PVZ.Cmd.Dto_Guide_Key;
   import asgui.containers.Window;
   import asgui.controls.Button;
   import asgui.core.Application;
   import asgui.managers.PopUpManager;
   import asgui.managers.SystemManager;
   import com.qq.CommandName;
   import com.qq.GameGloble;
   import com.qq.IMyApplication;
   import com.qq.SceneCenter;
   import com.qq.constant.SceneName;
   import com.qq.modules.basic.event.CommonEvent;
   import com.qq.modules.guide.GuideGlobals;
   import com.qq.modules.guide.model.GuideProxy;
   import com.qq.modules.guide.model.GuideUIData;
   import com.qq.modules.guide.model.templates.GuideProcessTemplate;
   import com.qq.modules.guide.model.templates.GuideTemplateFactory;
   import com.qq.modules.guide.model.templates.ce.OpenButtonInfoTemplateCE;
   import com.qq.modules.guide.model.vo.GuideDialogueVO;
   import com.qq.modules.guide.view.GuideChooseGameTypeWindow;
   import com.qq.modules.guide.view.GuideDaveTalkCt;
   import com.qq.modules.guide.view.GuideDaveTalkCtMediator;
   import com.qq.modules.guide.view.GuideDebugWd;
   import com.qq.modules.guide.view.GuideDialogue;
   import com.qq.modules.guide.view.GuideDialogueMediator;
   import com.qq.modules.guide.view.tips.GuideArea;
   import com.qq.modules.guide.view.tips.GuideArrow;
   import com.qq.modules.guide.view.tips.GuideTip;
   import com.qq.modules.main.server.PvzSocketService;
   import com.qq.modules.sound.command.UISoundCmd;
   import com.qq.modules.td.command.TDItemCmd;
   import com.qq.modules.td.command.game.TDGameFlowCmd;
   import com.qq.templates.font.FontHKHB;
   import com.qq.utils.CommandDispatcher;
   import com.qq.utils.QDisplayUtil;
   import flash.display.DisplayObject;
   import flash.display.DisplayObjectContainer;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import org.as3commons.logging.api.getLogger;
   import org.robotlegs.extend.command.StrongRobotlegCommand;
   
   public class GuideCommand extends StrongRobotlegCommand
   {
      
      private static var _checkPanelList:Array;
       
      
      [Inject]
      public var proxy:GuideProxy;
      
      [Inject]
      public var server:PvzSocketService;
      
      public function GuideCommand()
      {
         super();
      }
      
      public function registerGuide(param1:String, param2:Object) : void
      {
         this.proxy.data.objs[param1] = param2;
      }
      
      public function unregisterGuidesWithoutInitcode() : void
      {
         var _loc1_:* = undefined;
         this.proxy.data.objs = [];
         for(_loc1_ in this.proxy.data.initObjs)
         {
            this.proxy.data.objs[_loc1_] = this.proxy.data.initObjs[_loc1_];
         }
      }
      
      public function checkBeforeToScene(param1:String) : void
      {
         this.clearGuideDetermineToScene(param1);
         this.clearArrows();
      }
      
      public function checkProgressGuide(param1:String) : void
      {
         var _loc4_:String = null;
         var _loc5_:String = null;
         var _loc6_:Object = null;
         var _loc2_:GuideDialogue = GuideDialogue.instance;
         var _loc3_:GuideProcessTemplate = GuideTemplateFactory.instance.getGuideProcessTemplateByOrderID(this.proxy.data.orderID);
         if(_loc3_ && this.checkScene(param1,_loc3_.scene))
         {
            if(this.checkScene(SceneName.City,_loc3_.scene) && GuideGlobals.FULL_SCREEN_COUNT > 0)
            {
               return;
            }
            if(_loc2_)
            {
               if(this.checkTitle(_loc2_.obj.title,_loc3_.id))
               {
                  return;
               }
               _loc2_.Close();
            }
            _loc4_ = this.getProgressFullName(_loc3_.id);
            _loc5_ = this.proxy.data.getKeyValue(_loc4_);
            if(_loc6_ = this.proxy.data.getObjByName(_loc4_))
            {
               this.showGuide(_loc6_,_loc5_);
            }
            else
            {
               getLogger().warn("GuideCmd.checkProgressGuide -> 找不到引导：" + _loc3_.id);
            }
         }
      }
      
      public function showBattleLineupGuide(param1:int, param2:int) : void
      {
         this.dispatch(new CommonEvent(CommandName.Guide_Battle_Lineup,{
            "from":param1,
            "to":param2
         }));
      }
      
      private function getProgressFullName(param1:int) : String
      {
         return "progress_" + param1;
      }
      
      private function checkScene(param1:String, param2:String) : Boolean
      {
         if(param1 && param2)
         {
            return param1.toLowerCase() == param2.toLowerCase();
         }
         return false;
      }
      
      private function checkTitle(param1:String, param2:int) : Boolean
      {
         return param1 == "progress_" + param2;
      }
      
      public function clearArrows() : void
      {
         if(GuideArrow.instance != null)
         {
            GuideArrow.instance.Dispose();
         }
      }
      
      public function clearArea() : void
      {
         GuideArea.Clear();
      }
      
      public function clearGuide() : void
      {
         if(GuideDialogue.instance != null)
         {
            GuideDialogue.instance.Close();
         }
         this.clearArea();
         this.clearArrows();
      }
      
      private function clearGuideDetermineToScene(param1:String) : void
      {
         var _loc2_:GuideDialogue = null;
         var _loc3_:GuideDialogueMediator = null;
         if(GuideDialogue.instance != null)
         {
            _loc2_ = GuideDialogue.instance;
            _loc3_ = _loc2_.getMediator() as GuideDialogueMediator;
            if(_loc3_.sentence == null || param1 != _loc3_.sentence.noDisposeToScene)
            {
               _loc2_.Close();
            }
         }
      }
      
      public function checkPrevSaveIfInGuide() : void
      {
         var _loc1_:GuideDialogue = null;
         var _loc2_:String = null;
         var _loc3_:GuideDialogueMediator = null;
         if(GuideDialogue.instance != null)
         {
            _loc1_ = GuideDialogue.instance;
            _loc2_ = this.proxy.data.getKeyValue(_loc1_.obj.title);
            if(_loc2_ != null)
            {
               _loc3_ = _loc1_.getMediator() as GuideDialogueMediator;
               _loc3_.gotoAndPlay(_loc2_);
            }
         }
      }
      
      public function killGuide() : void
      {
         var _loc1_:Cmd_Guide_SetFinish_CS = new Cmd_Guide_SetFinish_CS();
         this.server.sendMessage(_loc1_);
      }
      
      public function tryLsLevelGuide(param1:int, param2:int, param3:int) : void
      {
         var _loc4_:Object;
         if((_loc4_ = this.proxy.data.getObjByType("ls","passlevel",param1,param2,param3)) != null)
         {
            this.showGuide(_loc4_);
         }
      }
      
      public function tryGuide(param1:String) : void
      {
         var _loc2_:Object = this.proxy.data.getObjByName(param1);
         if(_loc2_ != null)
         {
            this.showGuide(_loc2_);
         }
      }
      
      public function tryFirstEntryGuide(param1:String) : void
      {
         param1 += "_first_entry";
         var _loc2_:Object = this.proxy.data.getObjByName(param1);
         var _loc3_:String = this.proxy.data.getKeyValue(param1);
         if(_loc2_ != null && _loc3_ == null)
         {
            this.showGuide(_loc2_);
            this.setKey(param1,"1");
         }
      }
      
      public function showDebugWd() : void
      {
         var _loc1_:Window = new GuideDebugWd();
         PopUpManager.AddPopUp(_loc1_,null,false,false);
      }
      
      public function showGuide(param1:Object, param2:String = null) : void
      {
         var _loc3_:GuideDialogue = new GuideDialogue(new GuideDialogueVO(param1,param2));
         _loc3_.dragable = false;
         _loc3_.width = Application.application.minWidth;
         _loc3_.height = Application.application.minHeight;
         _loc3_.show();
      }
      
      public function exitGuide() : void
      {
         dispatch(new Event(GuideGlobals.GuideDialogueMediator_Close));
         TDGameFlowCmd.reviewStageMapWhenNotRunning();
      }
      
      public function showDaveTalkByText(param1:String, param2:DisplayObjectContainer = null) : void
      {
         var _loc3_:int = 2500;
         var _loc4_:int = 2300;
         var _loc5_:String = "DaveEnterAction";
         var _loc6_:String = "DaveBlahblahAction";
         var _loc7_:String = "DaveLeaveAction";
         var _loc8_:Object = {
            "title":"showGuideByText",
            "t1":{
               "name":"t1",
               "actor":_loc4_,
               "move":_loc5_,
               "talk":param1,
               "next":"t9"
            },
            "t9":{
               "name":"t9",
               "actor":_loc4_,
               "move":_loc7_,
               "next":"t10"
            }
         };
         var _loc9_:GuideDaveTalkCt = new GuideDaveTalkCt(new GuideDialogueVO(_loc8_),GuideDaveTalkCtMediator);
         PopUpManager.AddPopUp(_loc9_,param2,false,false);
         _loc9_.x = 0;
         _loc9_.y = 0;
      }
      
      public function addLightArea(param1:int, param2:int, param3:int, param4:int) : void
      {
         CommandDispatcher.send(CommandName.TDEffectCommand_LightArea,{
            "row":param1,
            "column":param2,
            "tileW":param3,
            "tileH":param4
         });
      }
      
      public function addArrow(param1:*, param2:String = null, param3:* = null, param4:int = 0, param5:int = 0, param6:Boolean = true, param7:Boolean = false, param8:Number = NaN, param9:Number = NaN) : void
      {
         var _loc10_:Object = null;
         var _loc11_:GuideArrow = null;
         if(param1 is String)
         {
            _loc10_ = QDisplayUtil.CodeToDisplay(param1,true);
         }
         else
         {
            _loc10_ = param1;
         }
         if(this.checkExcludeTarget(_loc10_))
         {
            if((_loc11_ = GuideArrow.instance) == null)
            {
               _loc11_ = new GuideArrow();
            }
            if(_loc10_.hasOwnProperty("root") && _loc10_.root is DisplayObjectContainer)
            {
               PopUpManager.AddPopUp(_loc11_,_loc10_.root,false,false);
            }
            else
            {
               PopUpManager.AddPopUp(_loc11_,null,false,false);
            }
            _loc11_.init(_loc10_,param4,param5,param2,param3,param6,param7,param8,param9);
         }
         else
         {
            getLogger("guide").warn("引导找不对象：" + param1 + ",  " + _loc10_);
         }
         UISoundCmd.play_tutorial_hint();
      }
      
      public function addTip(param1:*, param2:String = null, param3:String = null, param4:Array = null) : void
      {
         var _loc5_:Sprite = null;
         if(param1 is Sprite)
         {
            _loc5_ = param1;
         }
         else if(param1 is String)
         {
            _loc5_ = QDisplayUtil.CodeToDisplay(param1) as Sprite;
         }
         var _loc6_:GuideTip;
         (_loc6_ = new GuideTip(_loc5_,param3,param4)).text = param2;
         PopUpManager.AddPopUp(_loc6_,null,false,false);
         _loc6_.resetLocation();
      }
      
      public function requestKeys() : void
      {
         var _loc1_:Cmd_Guide_GetKeys_CS = new Cmd_Guide_GetKeys_CS();
         this.server.sendMessage(_loc1_);
      }
      
      public function setKey(param1:String, param2:String) : void
      {
         var _loc3_:Dto_Guide_Key = new Dto_Guide_Key();
         _loc3_.key = param1;
         _loc3_.value = param2;
         var _loc4_:Cmd_Guide_SetKey_CS;
         (_loc4_ = new Cmd_Guide_SetKey_CS()).key = _loc3_;
         this.server.sendMessage(_loc4_);
      }
      
      private function initCheckPanelList() : void
      {
         var _loc1_:Vector.<OpenButtonInfoTemplateCE> = null;
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:OpenButtonInfoTemplateCE = null;
         var _loc5_:String = null;
         var _loc6_:int = 0;
         if(_checkPanelList == null)
         {
            _checkPanelList = new Array();
            _loc1_ = GuideTemplateFactory.instance.cacheOpenButtonInfoTemplate;
            _loc2_ = _loc1_.length;
            _loc3_ = 0;
            while(_loc3_ < _loc2_)
            {
               _loc4_ = _loc1_[_loc3_];
               _loc5_ = String(_loc4_.checkPanelName).toLocaleLowerCase();
               if((_loc6_ = _checkPanelList.indexOf(_loc5_)) == -1)
               {
                  _checkPanelList.push(_loc5_);
               }
               _loc3_++;
            }
         }
      }
      
      public function checkBtnVisible(param1:Object) : void
      {
         var _loc4_:Vector.<OpenButtonInfoTemplateCE> = null;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:OpenButtonInfoTemplateCE = null;
         var _loc8_:String = null;
         var _loc9_:int = 0;
         var _loc10_:String = null;
         var _loc11_:int = 0;
         var _loc12_:Boolean = false;
         var _loc13_:DisplayObject = null;
         var _loc14_:String = null;
         if(param1 == null)
         {
            return;
         }
         this.initCheckPanelList();
         var _loc2_:String = String(param1.name);
         var _loc3_:int = _checkPanelList.indexOf(_loc2_.toLocaleLowerCase());
         if(_loc3_ != -1)
         {
            _loc5_ = (_loc4_ = GuideTemplateFactory.instance.cacheOpenButtonInfoTemplate).length;
            _loc6_ = 0;
            for(; _loc6_ < _loc5_; _loc6_++)
            {
               _loc7_ = _loc4_[_loc6_];
               _loc8_ = String(_loc7_.id);
               _loc9_ = int(_loc7_.openLv);
               _loc10_ = _loc7_.buttonName;
               _loc11_ = int(_loc7_.operateType);
               if(!(_loc12_ = GameGloble.actorModel.checkIfOpenDaySatisfied(_loc7_.openDays,_loc9_)))
               {
                  continue;
               }
               switch(_loc11_)
               {
                  case 1:
                     if(GuideUIData.getInstance().isLock(_loc8_))
                     {
                        _loc14_ = String(_loc7_.addCommand);
                        CommandDispatcher.send(_loc14_,{"id":_loc8_});
                     }
                     break;
                  default:
                     if((_loc13_ = (param1 as DisplayObjectContainer).getChildByName(_loc10_)) != null)
                     {
                        _loc13_.visible = _loc12_;
                     }
                     break;
               }
            }
         }
      }
      
      public function checkAllBtnVisible() : void
      {
         var _loc4_:OpenButtonInfoTemplateCE = null;
         var _loc5_:String = null;
         var _loc6_:int = 0;
         var _loc7_:String = null;
         var _loc8_:int = 0;
         var _loc9_:DisplayObject = null;
         var _loc10_:Boolean = false;
         var _loc11_:String = null;
         var _loc1_:Vector.<OpenButtonInfoTemplateCE> = GuideTemplateFactory.instance.cacheOpenButtonInfoTemplate;
         var _loc2_:int = _loc1_.length;
         var _loc3_:int = 0;
         for(; _loc3_ < _loc2_; _loc3_++)
         {
            _loc4_ = _loc1_[_loc3_];
            _loc5_ = String(_loc4_.id);
            _loc6_ = int(_loc4_.openLv);
            _loc7_ = _loc4_.buttonName;
            _loc8_ = int(_loc4_.operateType);
            _loc9_ = QDisplayUtil.CodeToDisplay(_loc7_,false);
            _loc10_= GameGloble.actorModel.checkIfOpenDaySatisfied(_loc4_.openDays,_loc6_);
            if(!_loc10_)
            {
               continue;
            }
            if(!GuideUIData.getInstance().isLock(_loc5_))
            {
               continue;
            }
            switch(_loc8_)
            {
               case 1:
                  if(_loc9_ == null)
                  {
                     _loc11_ = String(_loc4_.addCommand);
                     CommandDispatcher.send(_loc11_,{"id":_loc5_});
                  }
                  break;
               default:
                  if(_loc9_ != null)
                  {
                     _loc9_.visible = _loc10_;
                  }
                  GuideUIData.getInstance().unlock(_loc5_);
                  break;
            }
         }
      }
      
      public function chooseGameType() : void
      {
         var _loc1_:GuideChooseGameTypeWindow = new GuideChooseGameTypeWindow();
         PopUpManager.AddPopUp(_loc1_,null,true);
      }
      
      public function showFirstSkip() : void
      {
         var button:Button = null;
         var onStageResize:Function = null;
         var onSkipClick:Function = null;
         var layoutButton:Function = function():void
         {
            button.x = SystemManager.instance.stage.stageWidth - button.width - 5;
            button.y = SystemManager.instance.stage.stageHeight - button.height - 35;
         };
         onStageResize = function(param1:Event):void
         {
            layoutButton();
         };
         onSkipClick = function(param1:MouseEvent):void
         {
            button.removeEventListener(MouseEvent.CLICK,onSkipClick);
            SystemManager.instance.popUpLayer.removeChild(button);
            SystemManager.instance.stage.removeEventListener(Event.RESIZE,onStageResize);
            TDGameFlowCmd.passGuideTD();
         };
         button = new Button();
         button.width = 100;
         button.styleName = ".GreenButton_Bigger";
         button.label = FontHKHB.TXT_Skip;
         SystemManager.instance.popUpLayer.addChild(button);
         SystemManager.instance.stage.addEventListener(Event.RESIZE,onStageResize,false,0,false);
         button.addEventListener(MouseEvent.CLICK,onSkipClick,false,0,true);
         layoutButton();
      }
      
      public function autoGotoCityScene() : void
      {
         SceneCenter.getInstance().isAutoGotoCity = true;
      }
      
      private function checkExcludeTarget(param1:Object) : Boolean
      {
         if((Application.application as IMyApplication).checkRootLayer(param1))
         {
            return false;
         }
         if(QDisplayUtil.checkRootLayer(param1))
         {
            return false;
         }
         return true;
      }
      
      public function checkButtonComplete(param1:String) : void
      {
         CommandDispatcher.send(CommandName.Guide_Check_CityButton,param1);
      }
      
      public function checkBuildingLoadComplete(param1:int) : void
      {
         CommandDispatcher.send(CommandName.Guide_Check_Building,param1);
      }
      
      public function showDaveEndDialog(param1:String) : void
      {
         var text:String = param1;
         var NPCType_DAVE:int = 2300;
         var DaveEnterAction:String = "DaveEnterAction";
         var DaveStageEndAction:String = "DaveStageEndAction";
         var obj:Object = {
            "title":"showStageEndGuideByText",
            "t1":{
               "name":"t1",
               "actor":NPCType_DAVE,
               "move":DaveEnterAction,
               "talk":text,
               "next":"t9"
            },
            "t9":{
               "name":"t9",
               "actor":NPCType_DAVE,
               "act":function():void
               {
                  TDItemCmd.lootItemEndGame();
               },
               "talk":text,
               "next":"t10"
            }
         };
         var wd:GuideDaveTalkCt = new GuideDaveTalkCt(new GuideDialogueVO(obj),GuideDaveTalkCtMediator);
         PopUpManager.AddPopUp(wd,null,false,false);
         wd.x = 0;
         wd.y = 0;
      }
      
      public function skipSome() : void
      {
         var _loc1_:Cmd_Guide_SkipSome_CS = new Cmd_Guide_SkipSome_CS();
         this.server.sendMessage(_loc1_);
      }
   }
}
