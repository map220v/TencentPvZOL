package com.qq.modules.battle.planMachine.plan
{
   import asgui.controls.Label;
   import asgui.core.Application;
   import com.greensock.TweenLite;
   import com.qq.GameGloble;
   import com.qq.IMyApplication;
   import com.qq.modules.battle.constant.BattleConst;
   import com.qq.modules.battle.model.BattleUnitModel;
   import com.qq.modules.battle.view.unit.UnitBase;
   import com.qq.modules.main.model.SettingsModel;
   import com.qq.modules.main.model.settings.battle.BattleLineupCardSkillTemplate;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.geom.Point;
   import tencent.tools.planMachine.ICallBack;
   
   public class LeaderSkillPlan extends BattleBasePlan
   {
       
      
      private var tween:TweenLite;
      
      private var bt:Bitmap;
      
      private var _isLeaderSkill:Boolean;
      
      public function LeaderSkillPlan()
      {
         super();
         this._isLeaderSkill = false;
      }
      
      override protected function dispose() : void
      {
         if(this.tween)
         {
            BattleUnitModel.getInstance().battleTimer.removeTweenLite(this.tween);
            this.tween.kill();
         }
         if(this.bt)
         {
            (Application.application as IMyApplication).topEffectLayer.removeChild(this.bt);
            this.bt = null;
         }
         super.dispose();
      }
      
      override public function setDynamicParams(param1:Array) : void
      {
         super.setDynamicParams(param1);
         if(param1 != null && param1.length > 0)
         {
            this._isLeaderSkill = param1[0] == 0;
         }
      }
      
      override public function doPlan(param1:ICallBack) : void
      {
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         super.doPlan(param1);
         var _loc2_:UnitBase = BattleUnitModel.getInstance().getUnitByPosIndex(actor.actorIndex) as UnitBase;
         var _loc3_:Point = _loc2_.getGlobolPoint();
         var _loc4_:BitmapData;
         if((_loc4_ = this.getSKillName()) != null)
         {
            this.bt = new Bitmap(_loc4_);
            (Application.application as IMyApplication).topEffectLayer.addChild(this.bt);
            this.bt.alpha = 0;
            this.bt.x = GameGloble.stage.stageWidth * 0.5 + (!!BattleConst.isLeft(actor.actorIndex) ? -(this.bt.width + 30) : 50);
            this.bt.y = 150;
            _loc5_ = this.bt.x;
            _loc6_ = this.bt.y;
            this.bt.y += 50;
            TweenLite.to(this.bt,0.3,{"alpha":1});
            TweenLite.to(this.bt,0.3,{"y":_loc6_});
            this.tween = TweenLite.to(this.bt,1,{
               "delay":1,
               "alpha":0,
               "y":_loc6_ - 50,
               "onComplete":this.playCompleteHandler
            });
         }
         else
         {
            setComplete();
         }
      }
      
      public function playCompleteHandler() : void
      {
         setComplete();
      }
      
      private function getSKillName() : BitmapData
      {
         var _loc1_:Label = new Label();
         var _loc2_:BattleLineupCardSkillTemplate = SettingsModel.instance.battleCardSkillSetting.getBattleLineupCardSkillTemplateById(actor.skillId);
         if(_loc2_ == null)
         {
            return null;
         }
         if(this._isLeaderSkill)
         {
            _loc1_.styleName = ".TXT_HKHB_13_Yellow";
            _loc1_.SetStyle("fontSize","30");
            _loc1_.SetStyle("textAlign","center");
            _loc1_.text = "队长技：" + _loc2_.name;
         }
         else
         {
            _loc1_.styleName = ".TXT_HKHB_13_Green_Black";
            _loc1_.SetStyle("fontSize","30");
            _loc1_.SetStyle("textAlign","center");
            _loc1_.text = _loc2_.name;
         }
         _loc1_.width = 400;
         _loc1_.height = 45;
         _loc1_.ValidateProperties();
         _loc1_.ValidateSize();
         _loc1_.ValidateSkin();
         _loc1_.ValidateDisplayList();
         var _loc3_:BitmapData = new BitmapData(_loc1_.width,_loc1_.height,true,16711680);
         _loc3_.draw(_loc1_);
         _loc1_.Dispose();
         return _loc3_;
      }
   }
}
