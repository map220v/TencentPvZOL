package com.qq.modules.td.command
{
   import asgui.core.Application;
   import com.greensock.TweenMax;
   import com.greensock.easing.Back;
   import com.qq.CommandName;
   import com.qq.IMyApplication;
   import com.qq.constant.ls.LSConstant;
   import com.qq.constant.td.TDConditionID;
   import com.qq.constant.td.TDConstant;
   import com.qq.modules.guide.command.GuideCmd;
   import com.qq.modules.levelselect.model.templates.LSLevelTemplate;
   import com.qq.modules.levelselect.model.templates.LSLevelTemplateFactory;
   import com.qq.modules.qzoneShare.command.QZoneShareCmd;
   import com.qq.modules.td.command.effects.TDEffectCmd;
   import com.qq.modules.td.command.game.TDGameCmd;
   import com.qq.modules.td.command.game.TDGameObjectCmd;
   import com.qq.modules.td.data.game.TDPlantBaseData;
   import com.qq.modules.td.logic.TDConditionTriggerManager;
   import com.qq.modules.td.model.TDGameInfo;
   import com.qq.modules.td.model.TDStageInfo;
   import com.qq.modules.td.model.vo.TDConditionTriggerVO;
   import com.qq.modules.td.view.items.loot.TDLootAchievementStarView;
   import com.qq.modules.td.view.items.loot.TDLootCardView;
   import com.qq.modules.td.view.items.loot.TDLootItemView;
   import com.qq.modules.td.view.items.loot.TDLootRewardBagView;
   import com.qq.templates.font.FontHKHB;
   import com.qq.utils.CommandDispatcher;
   import flash.display.DisplayObject;
   import flash.geom.Point;
   import flash.utils.setTimeout;
   import org.robotlegs.extend.command.StrongRobotlegCommand;
   
   public class TDItemCommand extends StrongRobotlegCommand
   {
       
      
      private var _fromX:Number;
      
      private var _fromY:Number;
      
      public function TDItemCommand()
      {
         super();
      }
      
      public function showLootItemAt(param1:int, param2:int, param3:int, param4:Array = null) : void
      {
         TDGameObjectCmd.addLootItem(param1,param2,param3,param4);
      }
      
      public function showFinalItemAt(param1:int, param2:int) : void
      {
         var _loc3_:TDLootItemView = new TDLootRewardBagView();
         _loc3_.x = Math.max(_loc3_.width,Math.min(TDGameInfo.getInstance().gameArea.right - 50,param1));
         _loc3_.y = param2;
         CommandDispatcher.send(CommandName.TDAddItemToScreen,_loc3_);
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         if(_loc3_.x > TDGameInfo.getInstance().gameArea.x + TDGameInfo.getInstance().gameArea.width * 0.5)
         {
            _loc4_ = -100;
            _loc5_ = -200;
         }
         else
         {
            _loc4_ = 100;
            _loc5_ = 200;
         }
         TweenMax.to(_loc3_,2,{
            "bezierThrough":[{
               "x":_loc3_.x + _loc4_,
               "y":_loc3_.y - 200
            },{
               "x":_loc3_.x + _loc5_,
               "y":_loc3_.y
            }],
            "onComplete":this.onCompletePop,
            "onCompleteParams":[_loc3_]
         });
      }
      
      private function onCompletePop(param1:DisplayObject) : void
      {
         if(param1["bagMc"] != null)
         {
            GuideCmd.addArrow(param1["bagMc"],"click",FontHKHB.TD_GET_FINAL_ITEM,0,0,false);
         }
      }
      
      public function showRewardItemFromBag(param1:int, param2:int) : void
      {
         this._fromX = param1;
         this._fromY = param2;
         var _loc3_:Vector.<TDConditionTriggerVO> = TDConditionTriggerManager.instance.getConditionTrigger(TDConditionID.FIRST_GUIDE_STAGE_END);
         if(_loc3_ != null && _loc3_.length > 0)
         {
            TDConditionTriggerManager.instance.addCondition(TDConditionID.FIRST_GUIDE_STAGE_END,true);
         }
         else
         {
            this.lootItemEndGame();
         }
      }
      
      public function lootItemEndGame() : void
      {
         var _loc4_:LSLevelTemplate = null;
         var _loc5_:TDLootItemView = null;
         var _loc6_:int = 0;
         var _loc7_:Boolean = false;
         var _loc8_:int = 0;
         var _loc9_:TDLootItemView = null;
         var _loc10_:Point = null;
         var _loc1_:Array = TDGameInfo.getInstance().achievementList;
         var _loc2_:Array = new Array();
         var _loc3_:Boolean = false;
         if(TDStageInfo.getInstance().stageID == 0 || !TDGameInfo.getInstance().hasAchievement(LSConstant.ACHIEVEMENT_PASS_ID))
         {
            _loc3_ = true;
         }
         if(_loc3_)
         {
            if(TDStageInfo.getInstance().rewardPlantID == 0 && TDStageInfo.getInstance().challengeLevelID == 0)
            {
               if((_loc4_ = LSLevelTemplateFactory.instance.getTemplateByStageIdAndLevelId(TDStageInfo.getInstance().stageID,TDStageInfo.getInstance().levelID,TDStageInfo.getInstance().subLevelID)) != null)
               {
                  if(_loc4_.bonusPlant != 0)
                  {
                     TDStageInfo.getInstance().rewardPlantID = _loc4_.bonusPlant;
                  }
               }
            }
            if(TDStageInfo.getInstance().rewardPlantID != 0)
            {
               (_loc5_ = new TDLootCardView()).reset(new TDPlantBaseData(TDStageInfo.getInstance().rewardPlantID));
               _loc2_.push(_loc5_);
            }
         }
         if(TDStageInfo.getInstance().challengeLevelID == 0)
         {
            if((_loc6_ = TDGameInfo.getInstance().newAchievement.length) > 3)
            {
               _loc6_ = 3;
            }
            while(_loc6_-- > 0)
            {
               _loc2_.push(new TDLootAchievementStarView());
            }
            if(_loc2_.length > 0)
            {
               _loc7_ = false;
               _loc8_ = 0;
               while(_loc8_ < _loc2_.length)
               {
                  _loc9_ = _loc2_[_loc8_];
                  (Application.application as IMyApplication).uiLayer.addChild(_loc9_);
                  _loc10_ = Point.polar(100,Math.PI + Math.PI / (_loc2_.length + 1) * (_loc8_ + 1));
                  _loc10_.x += this._fromX;
                  _loc10_.y += this._fromY;
                  TweenMax.fromTo(_loc9_,0.5,{
                     "scaleX":0.1,
                     "scaleY":0.1,
                     "x":this._fromX,
                     "y":this._fromY
                  },{
                     "scaleX":1,
                     "scaleY":1,
                     "x":_loc10_.x,
                     "y":_loc10_.y,
                     "ease":Back.easeOut
                  });
                  if(_loc9_ is TDLootCardView)
                  {
                     _loc7_ = true;
                     setTimeout(TDGameCmd.showInstrustation,1000,TDConstant.UnitCatalog_Plant,(_loc9_ as TDLootCardView).plantData.type);
                  }
                  _loc8_++;
               }
               if(!_loc7_)
               {
                  QZoneShareCmd.checkTDShareMsg(TDStageInfo.getInstance().stageID,TDStageInfo.getInstance().levelID,TDStageInfo.getInstance().subLevelID,1,null,TDEffectCmd.playRewardEndAnimation);
               }
            }
            else
            {
               QZoneShareCmd.checkTDShareMsg(TDStageInfo.getInstance().stageID,TDStageInfo.getInstance().levelID,TDStageInfo.getInstance().subLevelID,1,null,TDEffectCmd.playRewardEndAnimation);
            }
            return;
         }
         TDEffectCmd.playRewardEndAnimation();
      }
   }
}
