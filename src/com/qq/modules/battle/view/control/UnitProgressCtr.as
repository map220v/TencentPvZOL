package com.qq.modules.battle.view.control
{
   import asgui.containers.Canvas;
   import asgui.controls.Image;
   import asgui.resources.AssetManager;
   import com.qq.display.QProgressBar;
   import com.qq.modules.battle.constant.BattleConst;
   
   public class UnitProgressCtr extends BaseUnitControler
   {
       
      
      private var progressBarCav:Canvas;
      
      private var hpBar:QProgressBar;
      
      private var armorBar:QProgressBar;
      
      private var rageBar:QProgressBar;
      
      public var hasShield:Boolean = false;
      
      public var tweenTime:Number = 1;
      
      public var rageMax:uint;
      
      public var baseRage:uint;
      
      public function UnitProgressCtr()
      {
         super();
      }
      
      override public function get ctrType() : String
      {
         return BaseUnitControler.TYPE_PROGRESS;
      }
      
      override public function dispose() : void
      {
         if(this.hpBar)
         {
            this.hpBar.Dispose();
            this.hpBar = null;
         }
         if(this.armorBar)
         {
            this.armorBar.Dispose();
            this.armorBar = null;
         }
         if(this.rageBar)
         {
            this.rageBar.Dispose();
            this.rageBar = null;
         }
         super.dispose();
      }
      
      override protected function initlize() : void
      {
         this.progressBarCav = new Canvas();
         this.progressBarCav.scrollRectEnabled = false;
         this.progressBarCav.y = -(_unit.display.height - BattleConst.GRID_HEIGHT);
         _unitLayer.addChild(this.progressBarCav);
         this.hpBar = new QProgressBar();
         this.hpBar.setSkin("battle_ui_progressBar_bj","battle_ui_progressBar2","battle_ui_progressBar_tween","");
         this.progressBarCav.addChild(this.hpBar);
         this.hpBar.x = (BattleConst.GRID_WIDTH - this.hpBar.width) * 0.5;
         this.hpBar.tweenTime = this.tweenTime;
         if(this.hasShield)
         {
            this.armorBar = new QProgressBar();
            this.armorBar.setSkin("","battle_ui_progressBar1","battle_ui_progressBar_tween","");
            this.progressBarCav.addChild(this.armorBar);
            this.armorBar.x = this.hpBar.x;
            this.armorBar.y = this.hpBar.y;
            this.armorBar.tweenTime = this.tweenTime;
         }
         this.rageBar = new QProgressBar();
         this.rageBar.setSkin("battle_ui_progressBar_bj","","battle_ui_progressBar_tween","");
         this.progressBarCav.addChild(this.rageBar);
         this.rageBar.x = this.hpBar.x;
         this.rageBar.y = this.hpBar.y + this.rageBar.height - 2;
         this.rageBar.tweenTime = this.tweenTime;
         this.changeRageMax(this.rageMax);
         this.changeRage(this.baseRage / this.rageMax);
      }
      
      public function addShield() : void
      {
         if(!this.armorBar)
         {
            this.armorBar = new QProgressBar();
            this.armorBar.setSkin("","battle_ui_progressBar1","battle_ui_progressBar_tween","");
            this.progressBarCav.addChild(this.armorBar);
            this.armorBar.x = this.hpBar.x;
            this.armorBar.y = this.hpBar.y;
            this.armorBar.tweenTime = this.tweenTime;
         }
      }
      
      public function changeRageMax(param1:int) : void
      {
         var _loc4_:Image = null;
         if(param1 == 1)
         {
            return;
         }
         var _loc2_:int = this.rageBar.width / param1;
         var _loc3_:int = 0;
         while(_loc3_ < param1 - 1)
         {
            (_loc4_ = new Image()).source = AssetManager.GetClass("battle_ui_littleLine");
            this.rageBar.addChild(_loc4_);
            _loc4_.y = 2;
            _loc4_.x = _loc2_ * (_loc3_ + 1);
            _loc3_++;
         }
      }
      
      public function changeHP(param1:Number) : void
      {
         if(this.hpBar)
         {
            this.hpBar.setPercent(param1);
         }
      }
      
      public function changeArmor(param1:Number, param2:Boolean = true) : void
      {
         if(this.armorBar)
         {
            this.armorBar.setPercent(param1,param2);
         }
      }
      
      public function changeRage(param1:Number) : void
      {
         if(this.rageBar)
         {
            this.rageBar.setPercent(param1);
         }
      }
      
      public function setVisible(param1:Boolean) : void
      {
         if(this.hpBar)
         {
            this.hpBar.visible = param1;
         }
         if(this.armorBar)
         {
            this.armorBar.visible = param1;
         }
         if(this.rageBar)
         {
            this.rageBar.visible = param1;
         }
      }
   }
}
