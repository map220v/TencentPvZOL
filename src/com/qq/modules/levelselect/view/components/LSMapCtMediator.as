package com.qq.modules.levelselect.view.components
{
   import asgui.core.Application;
   import com.qq.CommandName;
   import com.qq.IMyApplication;
   import com.qq.modules.basic.event.CommonEvent;
   import com.qq.modules.basic.view.BasicScreenMediator;
   import com.qq.modules.guide.command.GuideCmd;
   import com.qq.modules.levelselect.LSGlobals;
   import com.qq.modules.levelselect.model.LSInitCmdType;
   import com.qq.modules.levelselect.model.LSProxy;
   import com.qq.modules.levelselect.model.vo.LSGateInfoVO;
   import com.qq.modules.levelselect.model.vo.LSInitCmdVO;
   import com.qq.modules.levelselect.model.vo.LSLevelInfoVO;
   import com.qq.modules.levelselect.view.maps.LSFlySun;
   import com.qq.modules.levelselect.view.maps.LSMapLevelGate;
   import com.qq.modules.levelselect.view.maps.LSMapLevelIcon;
   import com.qq.modules.levelselect.view.maps.LSMapLevelRoad;
   import com.qq.modules.main.command.GameFlowCmd;
   import com.qq.modules.roleInfo.command.RoleInfoCmd;
   import flash.geom.Point;
   import flash.utils.setTimeout;
   import org.as3commons.logging.api.getLogger;
   
   public class LSMapCtMediator extends BasicScreenMediator
   {
       
      
      [Inject]
      public var view:LSMapCt;
      
      [Inject]
      public var proxy:LSProxy;
      
      public function LSMapCtMediator()
      {
         super();
      }
      
      override protected function init() : void
      {
         super.init();
      }
      
      override protected function initListener() : void
      {
         super.initListener();
         this.addContextListener(LSGlobals.LS_LEVEL_INFOS_UPDATED,this.onLevelsUpdate);
         this.addContextListener(LSGlobals.LS_STAGE_INFO_UPDATED,this.onStageUpdate);
         this.addContextListener(LSGlobals.LS_GATE_UNLOCKED,this.onGateUnlocked);
         this.addContextListener(LSGlobals.LS_DO_ENTER_STAGE,this.onLS_DO_ENTER_STAGE);
         this.addContextListener(CommandName.LS_SWITCH_STAGE_CAMERA,this.onSwitchCamera);
      }
      
      private function onLS_DO_ENTER_STAGE(param1:CommonEvent) : void
      {
         this.view.setStage(int(param1.param));
      }
      
      private function onSwitchCamera(param1:CommonEvent) : void
      {
         var _loc2_:Array = param1.param as Array;
         this.view.cameraToLevel(_loc2_[0],_loc2_[1]);
      }
      
      private function onGateUnlocked(param1:CommonEvent) : void
      {
         var _loc2_:LSGateInfoVO = param1.param as LSGateInfoVO;
         this.onLevelsUpdate();
      }
      
      private function onStageUpdate(param1:CommonEvent = null) : void
      {
      }
      
      private function onLevelsUpdate(param1:CommonEvent = null) : void
      {
         var _loc2_:LSMapLevelIcon = null;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:LSMapLevelRoad = null;
         var _loc11_:Vector.<LSMapLevelRoad> = null;
         var _loc12_:int = 0;
         var _loc13_:int = 0;
         var _loc14_:LSLevelInfoVO = null;
         var _loc15_:LSGateInfoVO = null;
         var _loc16_:LSMapLevelGate = null;
         var _loc17_:LSInitCmdVO = null;
         var _loc18_:int = 0;
         var _loc19_:int = 0;
         var _loc20_:Array = null;
         var _loc21_:int = 0;
         var _loc22_:Array = null;
         if(this.view.icons == null)
         {
            getLogger().warn("选关swf加载未完成，数据已到");
            return;
         }
         var _loc3_:Vector.<LSLevelInfoVO> = this.proxy.levels;
         var _loc4_:Vector.<LSGateInfoVO> = this.proxy.gates;
         var _loc9_:LSLevelInfoVO = this.proxy.data.getLastMainLevel();
         _loc5_ = 0;
         while(_loc5_ < _loc3_.length)
         {
            _loc14_ = _loc3_[_loc5_];
            if(this.view.icons[_loc14_.levelId] && this.view.icons[_loc14_.levelId][_loc14_.subLevelId])
            {
               _loc2_ = this.view.icons[_loc14_.levelId][_loc14_.subLevelId];
               _loc2_.loadVO(_loc14_);
               _loc2_.setLast(!_loc14_.passed);
            }
            _loc5_++;
         }
         _loc5_ = 0;
         while(_loc5_ < _loc4_.length)
         {
            _loc15_ = _loc4_[_loc5_];
            if(this.view.gates[_loc15_.levelId] && this.view.gates[_loc15_.levelId][_loc15_.subLevelId])
            {
               (_loc16_ = this.view.gates[_loc15_.levelId][_loc15_.subLevelId]).loadVO(_loc15_);
            }
            _loc5_++;
         }
         _loc5_ = 0;
         while(_loc5_ < this.view.roads.length)
         {
            if(this.view.roads[_loc5_] == null)
            {
               this.view.roads[_loc5_] = [];
            }
            _loc6_ = 0;
            while(_loc6_ < this.view.roads[_loc5_].length)
            {
               if(this.view.roads[_loc5_][_loc6_] == null)
               {
                  this.view.roads[_loc5_][_loc6_] = [];
               }
               _loc7_ = 0;
               while(_loc7_ < this.view.roads[_loc5_][_loc6_].length)
               {
                  (_loc8_ = this.view.roads[_loc5_][_loc6_][_loc7_]).init(this.view.icons[_loc5_][_loc6_],this.view.roads[_loc5_][_loc6_][_loc7_ + 1]);
                  _loc7_++;
               }
               _loc6_++;
            }
            _loc5_++;
         }
         _loc5_ = 0;
         while(_loc5_ < this.view.roadsForGate.length)
         {
            if(this.view.roadsForGate[_loc5_] == null)
            {
               this.view.roadsForGate[_loc5_] = [];
            }
            _loc6_ = 0;
            while(_loc6_ < this.view.roadsForGate[_loc5_].length)
            {
               if(this.view.roadsForGate[_loc5_][_loc6_] == null)
               {
                  this.view.roadsForGate[_loc5_][_loc6_] = [];
               }
               _loc7_ = 0;
               while(_loc7_ < this.view.roadsForGate[_loc5_][_loc6_].length)
               {
                  (_loc8_ = this.view.roadsForGate[_loc5_][_loc6_][_loc7_]).init(this.view.gates[_loc5_][_loc6_],this.view.roadsForGate[_loc5_][_loc6_][_loc7_ + 1]);
                  _loc7_++;
               }
               _loc6_++;
            }
            _loc5_++;
         }
         var _loc10_:Vector.<LSInitCmdVO> = this.proxy.initData.cmds;
         while(_loc10_.length > 0)
         {
            _loc17_ = _loc10_.shift();
            switch(_loc17_.cmdType)
            {
               case LSInitCmdType.ADD_SUN:
                  _loc2_ = this.view.getIconByLevel(_loc17_.levelId,_loc17_.subLevelId);
                  _loc12_ = _loc13_ = Math.ceil(int(_loc17_.value) / 50);
                  RoleInfoCmd.addRoleSunDelay(_loc12_ * 50);
                  while(_loc12_ > 0)
                  {
                     _loc12_--;
                     this.popSunAt(_loc2_,LSFlySun.TYPE_SUN,50,(_loc12_ + 1) / (_loc13_ + 1),_loc12_ * 1000);
                  }
                  break;
               case LSInitCmdType.ADD_EXP:
                  _loc2_ = this.view.getIconByLevel(_loc17_.levelId,_loc17_.subLevelId);
                  if((_loc18_ = int(_loc17_.value)) > 0)
                  {
                     RoleInfoCmd.addRoleExpDelay(_loc18_);
                     _loc12_ = _loc13_ = 3;
                     _loc22_ = [int(_loc18_ / 3),int(_loc18_ / 3),_loc18_ - 2 * int(_loc18_ / 3)];
                     while(_loc12_ > 0)
                     {
                        _loc12_--;
                        this.popSunAt(_loc2_,LSFlySun.TYPE_EXP,_loc22_[_loc12_ - 1],(_loc13_ - _loc12_ + 1) / (_loc13_ + 1),_loc12_ * 1000);
                     }
                  }
                  break;
               case LSInitCmdType.ADD_MONEY:
                  _loc2_ = this.view.getIconByLevel(_loc17_.levelId,_loc17_.subLevelId);
                  if((_loc19_ = int(_loc17_.value)) > 0)
                  {
                     RoleInfoCmd.addRoleCoinDelay(_loc19_);
                     this.popSunAt(_loc2_,LSFlySun.TYPE_COIN,_loc19_,0,1000);
                  }
                  break;
               case LSInitCmdType.NEW_UNLOCK_LEVEL:
                  _loc20_ = [];
                  _loc21_ = int(_loc17_.value);
                  _loc2_ = this.view.getIconByLevel(_loc17_.levelId,_loc17_.subLevelId);
                  if(_loc2_ != null)
                  {
                     _loc2_.callWin(_loc21_);
                     if(_loc17_.subLevelId == 1)
                     {
                        _loc2_ = this.view.getIconByLevel(_loc17_.levelId + 1,_loc17_.subLevelId);
                        if(LSGlobals.isDebugging)
                        {
                           _loc20_.push(_loc2_);
                        }
                        else if(_loc2_ && !_loc2_.vo.passed)
                        {
                           _loc20_.push(_loc2_);
                        }
                     }
                     _loc2_ = this.view.getIconByLevel(_loc17_.levelId,_loc17_.subLevelId + 1);
                     _loc16_ = this.view.getGateByLevel(_loc17_.levelId,_loc17_.subLevelId + 1);
                     if(LSGlobals.isDebugging || _loc2_ && !_loc2_.vo.passed)
                     {
                        if(_loc16_ == null || _loc16_.vo.unlocked)
                        {
                           _loc20_.push(_loc2_);
                        }
                     }
                     if(_loc16_)
                     {
                        if(LSGlobals.isDebugging || _loc16_.vo.visible)
                        {
                           _loc20_.push(_loc16_);
                        }
                     }
                     _loc5_ = 0;
                     while(_loc5_ < _loc20_.length)
                     {
                        if(_loc20_[_loc5_] != null)
                        {
                           if(_loc20_[_loc5_] is LSMapLevelIcon)
                           {
                              _loc2_ = _loc20_[_loc5_];
                              _loc11_ = this.view.getRoadsByLevel(_loc2_.vo.levelId,_loc2_.vo.subLevelId);
                           }
                           else
                           {
                              _loc16_ = _loc20_[_loc5_] as LSMapLevelGate;
                              _loc11_ = this.view.getRoadsFotGateByLevel(_loc16_.vo.levelId,_loc16_.vo.subLevelId);
                           }
                           if(_loc11_)
                           {
                              _loc6_ = 0;
                              while(_loc6_ < _loc11_.length)
                              {
                                 _loc11_[_loc6_].setReadyForCall();
                                 _loc6_++;
                              }
                              if(_loc11_.length > 0)
                              {
                                 _loc11_[0].call();
                              }
                           }
                        }
                        _loc5_++;
                     }
                     GuideCmd.tryLsLevelGuide(this.proxy.data.stageId,_loc17_.levelId,_loc17_.subLevelId);
                  }
                  break;
               case LSInitCmdType.NEW_UNLOCK_GATE:
                  _loc2_ = this.view.getIconByLevel(_loc17_.levelId,_loc17_.subLevelId);
                  _loc2_.callVisible();
                  _loc16_ = this.view.getGateByLevel(_loc17_.levelId,_loc17_.subLevelId);
                  _loc11_ = this.view.getRoadsByLevel(_loc17_.levelId,_loc17_.subLevelId);
                  if(_loc16_)
                  {
                     _loc16_.setWaitingUnlock(_loc11_[0]);
                  }
                  if(_loc11_)
                  {
                     _loc6_ = 0;
                     while(_loc6_ < _loc11_.length)
                     {
                        _loc11_[_loc6_].setReadyForCall();
                        _loc6_++;
                     }
                  }
                  if(_loc16_)
                  {
                     _loc16_.callOpen();
                  }
                  break;
               case LSInitCmdType.CAMERA_TO:
                  this.view.cameraToLevel(_loc17_.levelId,_loc17_.subLevelId);
                  break;
            }
         }
         GuideCmd.tryFirstEntryGuide("ls");
      }
      
      public function popSunAt(param1:LSMapLevelIcon, param2:int, param3:int, param4:Number, param5:Number) : void
      {
         setTimeout(this.$popSunAt,param5,param1,param2,param3,param4);
      }
      
      public function $popSunAt(param1:LSMapLevelIcon, param2:int, param3:int, param4:Number) : void
      {
         if(this.view.hasDisposed)
         {
            return;
         }
         var _loc5_:LSFlySun = new LSFlySun(param2,param3);
         if(param1 == null || param1.hasDisposed)
         {
            return;
         }
         var _loc6_:Point = this.view.mc.localToGlobal(param1.location);
         _loc5_.x = _loc6_.x;
         _loc5_.y = _loc6_.y;
         (Application.application as IMyApplication).topEffectLayer.addChild(_loc5_);
         _loc5_.pop(param4);
         GameFlowCmd.lockScreen(1);
      }
      
      override public function dispose() : void
      {
         super.dispose();
      }
   }
}
