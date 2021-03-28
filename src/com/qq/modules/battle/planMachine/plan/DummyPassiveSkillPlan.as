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
   
   public class DummyPassiveSkillPlan extends BattleBasePlan
   {
       
      
      private var tween:TweenLite;
      
      private var bt:Bitmap;
      
      private var showPosType:int = 0;
      
      public function DummyPassiveSkillPlan()
      {
         super();
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
            this.bt.x = GameGloble.stage.stageWidth * (!!BattleConst.isLeft(actor.actorIndex) ? 0.45 : 0.55) - this.bt.width * 0.5;
            this.bt.y = 150;
            _loc5_ = this.bt.x;
            _loc6_ = this.bt.y;
            this.bt.y += 50;
            TweenLite.to(this.bt,0.6,{
               "y":_loc6_,
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
         var _loc2_:String = null;
         var _loc1_:Label = new Label();
         _loc1_.styleName = ".TXT_Garden_Crit";
         _loc1_.SetStyle("fontSize","20");
         var _loc3_:BattleLineupCardSkillTemplate = SettingsModel.instance.battleCardSkillSetting.getBattleLineupCardSkillTemplateById(actor.skillId);
         if(_loc3_ != null)
         {
            _loc2_ = "傀儡技：" + _loc3_.name;
         }
         else
         {
            _loc2_ = "";
         }
         _loc1_.text = _loc2_;
         _loc1_.width = 400;
         _loc1_.height = 45;
         _loc1_.ValidateProperties();
         _loc1_.ValidateSize();
         _loc1_.ValidateSkin();
         _loc1_.ValidateDisplayList();
         var _loc4_:BitmapData;
         (_loc4_ = new BitmapData(_loc1_.width,_loc1_.height,true,16711680)).draw(_loc1_);
         _loc1_.Dispose();
         return _loc4_;
      }
   }
}
